@echo off
setlocal EnableExtensions
goto :MAIN

# BEGIN CONTAINER SCRIPT
set -eu

command -v curl >/dev/null 2>&1 || {
    printf 'Error: curl is not available in the leantime container.\n' >&2
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
    printf 'Downloading Whiteboards assets to the public_userfiles volume...\n'
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
            printf 'Error: download returned an empty file: %s\n' "$asset" >&2
            exit 1
        fi
        mv -f "$temp_dir/$asset" "$whiteboard_dir/$asset"
    done
    printf '%s\n' "$whiteboard_version" > "$version_file"
else
    printf 'Whiteboards assets are already installed.\n'
fi

link_asset() {
    asset_source="$1"
    asset_target="$2"

    if [ ! -s "$asset_source" ]; then
        printf 'Error: plugin bundle is missing: %s\n' "$asset_source" >&2
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
        printf 'Error: destination exists and is not a symlink: %s\n' "$asset_target" >&2
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

# register.php requests the versioned OmniSearch URL.
link_asset "$plugin_root/OmniSearch/dist/js/omniSearch.js" \
    "$public_root/js/omniSearch.v3.1.0.js"

link_asset "$plugin_root/ProjectOverview/dist/js/project-overview.js" \
    "$public_root/js/project-overview.js"
link_asset "$plugin_root/ProjectOverview/dist/css/project-overview.css" \
    "$public_root/css/project-overview.css"

# Prepare TimeTable assets without enabling the plugin.
link_asset "$plugin_root/TimeTable/dist/js/timeTable.js" \
    "$public_root/js/plugin-timeTable.js"
link_asset "$plugin_root/TimeTable/dist/css/timeTable.css" \
    "$public_root/css/plugin-timeTable.css"

for asset in react.production.min.js react-dom.production.min.js excalidraw.min.js; do
    if [ ! -s "$whiteboard_dir/$asset" ]; then
        printf 'Error: Whiteboards asset was not installed: %s\n' "$asset" >&2
        exit 1
    fi
done

printf 'Plugin frontend assets configured.\n'
# END CONTAINER SCRIPT

:MAIN
cd /d "%~dp0"
if errorlevel 1 (
    echo Error: could not enter the repository folder.
    exit /b 1
)

if not exist "docker-compose.yml" (
    echo Error: run this script from a checkout containing docker-compose.yml.
    exit /b 1
)

where docker.exe >nul 2>&1
if errorlevel 1 (
    echo Error: Docker was not found in PATH.
    exit /b 1
)
docker compose version >nul 2>&1
if errorlevel 1 (
    echo Error: Docker Compose v2 is not available.
    exit /b 1
)
where powershell.exe >nul 2>&1
if errorlevel 1 (
    echo Error: Windows PowerShell is required to read the embedded container setup.
    exit /b 1
)

if not exist "plugins\Whiteboards\README.md" goto :MISSING_PLUGIN_FILES
if not exist "plugins\CopyTicketLink\assets\copy-ticket-link.js" goto :MISSING_PLUGIN_FILES
if not exist "plugins\CopyTicketLink\assets\copy-ticket-link.css" goto :MISSING_PLUGIN_FILES
if not exist "plugins\OmniSearch\dist\js\omniSearch.js" goto :MISSING_PLUGIN_FILES
if not exist "plugins\ProjectOverview\dist\js\project-overview.js" goto :MISSING_PLUGIN_FILES
if not exist "plugins\ProjectOverview\dist\css\project-overview.css" goto :MISSING_PLUGIN_FILES
if not exist "plugins\TimeTable\dist\js\timeTable.js" goto :MISSING_PLUGIN_FILES
if not exist "plugins\TimeTable\dist\css\timeTable.css" goto :MISSING_PLUGIN_FILES
goto :PLUGIN_FILES_OK

:MISSING_PLUGIN_FILES
echo Error: a required plugin file is missing from this checkout.
echo Include the plugins folder and its compiled JS/CSS bundles in the repository, then retry.
exit /b 1

:PLUGIN_FILES_OK
echo Waiting for the Compose service leantime...
for /L %%I in (1,1,30) do (
    docker compose exec -T leantime sh -c "exit 0" >nul 2>&1
    if not errorlevel 1 goto :SERVICE_READY
    timeout /t 2 /nobreak >nul
)
docker compose ps
echo Error: leantime did not become available. Run docker compose up --build -d and retry.
exit /b 1

:SERVICE_READY
set "PLUGINS_SETUP_BAT=%~f0"
set "PLUGINS_SETUP_TEMP=%TEMP%\plugins_setup_%RANDOM%_%RANDOM%.sh"
powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "$content = [IO.File]::ReadAllText($env:PLUGINS_SETUP_BAT); $match = [regex]::Match($content, '(?ms)^# BEGIN CONTAINER SCRIPT\r?\n(.*?)^# END CONTAINER SCRIPT\r?$'); if (-not $match.Success) { Write-Error 'Embedded container setup was not found'; exit 1 }; [IO.File]::WriteAllText($env:PLUGINS_SETUP_TEMP, $match.Groups[1].Value, [Text.Encoding]::ASCII)"
if errorlevel 1 (
    del /q "%PLUGINS_SETUP_TEMP%" >nul 2>&1
    echo Error: could not prepare the embedded container setup.
    exit /b 1
)

docker compose exec -T leantime sh -s < "%PLUGINS_SETUP_TEMP%"
set "SETUP_EXIT_CODE=%errorlevel%"
del /q "%PLUGINS_SETUP_TEMP%" >nul 2>&1
if not "%SETUP_EXIT_CODE%"=="0" exit /b %SETUP_EXIT_CODE%

echo Plugin asset setup completed. Activate plugins in Leantime when needed.
exit /b 0
