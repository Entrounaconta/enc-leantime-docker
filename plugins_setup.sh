#!/usr/bin/env bash
set -Eeuo pipefail

die() {
    printf 'Erro: %s\n' "$*" >&2
    exit 1
}

REPO_ROOT="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
cd "$REPO_ROOT"

[[ -f docker-compose.yml ]] || die 'Execute este script a partir do checkout que contém docker-compose.yml.'
command -v docker >/dev/null 2>&1 || die 'Docker não foi encontrado no PATH.'
docker compose version >/dev/null 2>&1 || die 'Docker Compose v2 não está disponível.'

required_assets=(
    plugins/Whiteboards/README.md
    plugins/CopyTicketLink/assets/copy-ticket-link.js
    plugins/CopyTicketLink/assets/copy-ticket-link.css
    plugins/OmniSearch/dist/js/omniSearch.js
    plugins/ProjectOverview/dist/js/project-overview.js
    plugins/ProjectOverview/dist/css/project-overview.css
    plugins/TimeTable/dist/js/timeTable.js
    plugins/TimeTable/dist/css/timeTable.css
)
for asset in "${required_assets[@]}"; do
    [[ -s "$REPO_ROOT/$asset" ]] || die "Arquivo do plugin ausente no checkout: $asset"
done

SERVICE='leantime'
printf 'Aguardando o serviço Compose %s' "$SERVICE"
attempt=0
until docker compose exec -T "$SERVICE" sh -c 'exit 0' >/dev/null 2>&1; do
    attempt=$((attempt + 1))
    if (( attempt >= 30 )); then
        printf '\n'
        docker compose ps >&2 || true
        die "O serviço $SERVICE não ficou disponível. Execute docker compose up --build -d e tente novamente."
    fi
    printf '.'
    sleep 2
done
printf ' pronto.\n'

# Os comandos Composer/npm dos READMEs servem às ferramentas de desenvolvimento.
# Os bundles JS/CSS de runtime estão nos diretórios dos plugins clonados.
# Este trecho instala os assets CDN do Whiteboards e liga os bundles locais em
# public/dist. Não habilita plugins nem executa migrações de banco.
docker compose exec -T "$SERVICE" sh -s <<'CONTAINER_SETUP'
set -eu

command -v curl >/dev/null 2>&1 || {
    printf 'Erro: curl não está disponível no container leantime.\n' >&2
    exit 1
}

whiteboard_dir='/var/www/html/public/userfiles/whiteboard'
whiteboard_version='react@18;react-dom@18;excalidraw@0.17.6'
version_file="$whiteboard_dir/.plugins_setup_versions"
needs_download=0

mkdir -p "$whiteboard_dir"
for asset in react.production.min.js react-dom.production.min.js excalidraw.min.js; do
    if [ ! -s "$whiteboard_dir/$asset" ]; then
        needs_download=1
    fi
done
if [ "$(cat "$version_file" 2>/dev/null || true)" != "$whiteboard_version" ]; then
    needs_download=1
fi

if [ "$needs_download" -eq 1 ]; then
    printf 'Baixando assets do Whiteboards para o volume public_userfiles...\n'
    temp_dir="$(mktemp -d)"
    trap 'rm -rf "$temp_dir"' EXIT

    curl -fSL --retry 3 --connect-timeout 15 --max-time 180 \
        -o "$temp_dir/react.production.min.js" \
        'https://unpkg.com/react@18/umd/react.production.min.js'
    curl -fSL --retry 3 --connect-timeout 15 --max-time 180 \
        -o "$temp_dir/react-dom.production.min.js" \
        'https://unpkg.com/react-dom@18/umd/react-dom.production.min.js'
    curl -fSL --retry 3 --connect-timeout 15 --max-time 180 \
        -o "$temp_dir/excalidraw.min.js" \
        'https://unpkg.com/@excalidraw/excalidraw@0.17.6/dist/excalidraw.production.min.js'

    for asset in react.production.min.js react-dom.production.min.js excalidraw.min.js; do
        if [ ! -s "$temp_dir/$asset" ]; then
            printf 'Erro: o download de %s retornou vazio.\n' "$asset" >&2
            exit 1
        fi
        mv -f "$temp_dir/$asset" "$whiteboard_dir/$asset"
    done
    printf '%s\n' "$whiteboard_version" > "$version_file"
else
    printf 'Assets do Whiteboards já estão instalados.\n'
fi

link_asset() {
    asset_source="$1"
    asset_target="$2"

    if [ ! -s "$asset_source" ]; then
        printf 'Erro: bundle do plugin ausente: %s\n' "$asset_source" >&2
        return 1
    fi

    mkdir -p "$(dirname "$asset_target")"
    if [ -L "$asset_target" ]; then
        current_target="$(readlink "$asset_target" || true)"
        if [ "$current_target" = "$asset_source" ]; then
            printf 'OK  %s\n' "$asset_target"
            return 0
        fi
        rm -f "$asset_target"
    elif [ -e "$asset_target" ]; then
        printf 'Erro: destino já existe e não é symlink: %s\n' "$asset_target" >&2
        return 1
    fi

    ln -s "$asset_source" "$asset_target"
    printf 'Link %s -> %s\n' "$asset_target" "$asset_source"
}

plugin_root='/var/www/html/app/Plugins'
public_root='/var/www/html/public/dist'

link_asset "$plugin_root/CopyTicketLink/assets/copy-ticket-link.js" \
    "$public_root/js/copy-ticket-link.js"
link_asset "$plugin_root/CopyTicketLink/assets/copy-ticket-link.css" \
    "$public_root/css/copy-ticket-link.css"

# OmniSearch's README names omniSearch.js, but register.php requests this versioned URL.
link_asset "$plugin_root/OmniSearch/dist/js/omniSearch.js" \
    "$public_root/js/omniSearch.v3.1.0.js"

link_asset "$plugin_root/ProjectOverview/dist/js/project-overview.js" \
    "$public_root/js/project-overview.js"
link_asset "$plugin_root/ProjectOverview/dist/css/project-overview.css" \
    "$public_root/css/project-overview.css"

# Prepare TimeTable assets too; the script does not enable the plugin.
link_asset "$plugin_root/TimeTable/dist/js/timeTable.js" \
    "$public_root/js/plugin-timeTable.js"
link_asset "$plugin_root/TimeTable/dist/css/timeTable.css" \
    "$public_root/css/plugin-timeTable.css"

for asset in react.production.min.js react-dom.production.min.js excalidraw.min.js; do
    if [ ! -s "$whiteboard_dir/$asset" ]; then
        printf 'Erro: asset do Whiteboards não foi instalado: %s\n' "$asset" >&2
        exit 1
    fi
done

printf 'Dependências de frontend dos plugins configuradas.\n'
CONTAINER_SETUP

printf 'Configuração dos assets dos plugins concluída. Ative os plugins pelo Leantime quando necessário.\n'
