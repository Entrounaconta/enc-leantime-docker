# Graph Report - enc-leantime-docker  (2026-09-22)

## Corpus Check
- 154 files · ~62,260 words
- Verdict: corpus is large enough that graph structure adds value.
- Unclassified: 33 file(s) not represented in the graph (top: (none) 12, .ini 10, .conf 3)

## Summary
- 1030 nodes · 1926 edges · 79 communities (38 shown, 41 thin omitted)
- Extraction: 99% EXTRACTED · 1% INFERRED · 0% AMBIGUOUS · INFERRED: 22 edges (avg confidence: 0.84)
- Token cost: 0 input · 0 output

## Graph Freshness
- Built from commit: `b3ab0e66`
- Run `git rev-parse HEAD` and compare to check if the graph is stale.
- Run `graphify update .` after code changes (no API cost).

## Community Hubs (Navigation)
- ProjectOverviewActionHandler
- project-overview.js
- TimeTable
- Leantime\Core\Configuration\Environment
- Leantime\Domain\Tickets\Models\Tickets
- OmniSearch/composer.json
- ApiDataRepository
- ProjectOverview/composer.json
- TicketTemplate/composer.json
- TimeTable/composer.json
- Leantime\Core\Db\Db
- CopyTicketLink/composer.json
- TimeTable
- Whiteboards
- TicketTemplateRepository
- Carbon\CarbonInterface
- Leantime\Domain\Auth\Models\Roles
- DeletedRequestParameters
- APIData/composer.json
- SchemaRepository
- API
- Changelog
- Controllers/TimeTable.php
- plugins_setup.sh
- Whiteboards/composer.json
- WhiteboardRepository
- Leantime\Core\Controller\Controller
- Leantime\Core\UI\Template
- APIData
- TaskOrganiser/composer.json
- copy-ticket-link.js
- Symfony\Component\HttpFoundation\Response
- AGENTS.md
- Data API Plugin
- RequestParameters
- Leantime Application Service
- CopyTicketLink
- TimeTable Plugin
- OmniSearch Plugin
- Project Overview Plugin
- Docker Buildx Multi-Platform Build
- Copy Ticket Link Plugin
- projectOverviewTable.blade.php
- projectOverview.blade.php
- Ticket Template Plugin
- Whiteboard
- Excalidraw Whiteboard Editor
- Official Leantime Docker Image
- deploy
- create-release
- showAll.blade.php
- start.sh
- Leantime GitHub Sponsor
- OmniSearch Taskfile
- Project Overview Taskfile
- TimeTable Taskfile

## God Nodes (most connected - your core abstractions)
1. `BaseSortModule` - 34 edges
2. `Whiteboards` - 30 edges
3. `TimeTable` - 27 edges
4. `APIData` - 26 edges
5. `ProjectOverviewActionHandler` - 26 edges
6. `SchemaRepository` - 23 edges
7. `TicketTemplateRepository` - 23 edges
8. `ProjectOverview` - 20 edges
9. `SortingService` - 20 edges
10. `TimeTable` - 20 edges

## Surprising Connections (you probably didn't know these)
- `OmniSearch Plugin` --semantically_similar_to--> `Fuzzy Search`  [INFERRED] [semantically similar]
  plugins/OmniSearch/README.md → plugins/OmniSearch/CHANGELOG.md
- `API` --references--> `APIData`  [EXTRACTED]
  plugins/APIData/Controllers/API.php → plugins/APIData/Services/APIData.php
- `RequestParameters` --mixes_in--> `CoercesRequestInput`  [EXTRACTED]
  plugins/APIData/Model/RequestParameters.php → plugins/APIData/Model/CoercesRequestInput.php
- `APIData` --references--> `ApiDataRepository`  [EXTRACTED]
  plugins/APIData/Services/APIData.php → plugins/APIData/Repositories/ApiDataRepository.php
- `APIData` --references--> `SchemaRepository`  [EXTRACTED]
  plugins/APIData/Services/APIData.php → plugins/APIData/Repositories/SchemaRepository.php

## Import Cycles
- None detected.

## Hyperedges (group relationships)
- **Shared Docker-Based Plugin Development and Coding Standards Tasks** — plugins_omnisearch_taskfile_taskfile, plugins_projectoverview_taskfile_taskfile, plugins_timetable_taskfile_taskfile [INFERRED 0.95]

## Communities (79 total, 41 thin omitted)

### Community 0 - "ProjectOverviewActionHandler"
Cohesion: 0.06
Nodes (12): ProjectOverviewDTO, ProjectOverviewFiltersDataDTO, SharedViewLookupResult, self, UserViewDTO, ViewDTO, DateTypeEnum, ProjectOverviewActionHandler (+4 more)

### Community 1 - "project-overview.js"
Cohesion: 0.06
Nodes (64): allConcreteSelected(), applySelectMutex(), buildDropdownAdapterWithSearch(), captureFormState(), clearNewViewFiltersStorage(), getConcreteOptionIds(), initFiltersToggle(), initProjectOverviewFilters() (+56 more)

### Community 2 - "TimeTable"
Cohesion: 0.05
Nodes (11): Carbon\CarbonImmutable, Illuminate\Log\Logger, Illuminate\Support\Facades\DB, Leantime\Domain\Tickets\Repositories\Tickets, Leantime\Domain\Timesheets\Repositories\Timesheets, TicketContextMenuDTO, WorklogDTO, TimeTableActionHandler (+3 more)

### Community 3 - "Leantime\Core\Configuration\Environment"
Cohesion: 0.10
Nodes (14): Closure, Illuminate\Support\Facades\Cache, Leantime\Core\Configuration\Environment, Leantime\Core\Events\EventDispatcher, Leantime\Core\Http\IncomingRequest, Leantime\Core\Language, GetLanguageAssets, GetLanguageAssets (+6 more)

### Community 4 - "Leantime\Domain\Tickets\Models\Tickets"
Cohesion: 0.06
Nodes (25): Leantime\Domain\Projects\Services\Projects, Leantime\Domain\Tickets\Models\Tickets, Leantime\Plugins\CustomFields\Contracts\FieldTypeEnum, Leantime\Plugins\CustomFields\Repositories\CustomFields, Leantime\Plugins\CustomFields\Services\CustomFields, Leantime\Plugins\PgmPro\Repositories\Programs, Leantime\Plugins\StrategyPro\Repositories\StrategyPro, Leantime\Plugins\TaskOrganiser\Services\SortModules\Common\BaseSortModule (+17 more)

### Community 5 - "OmniSearch/composer.json"
Cohesion: 0.05
Nodes (39): dealerdirect/phpcodesniffer-composer-installer, ergebnis/composer-normalize, metasyntactical/composer-plugin-license-check, php-http/discovery, _comment, ignore, authors, content (+31 more)

### Community 7 - "ProjectOverview/composer.json"
Cohesion: 0.05
Nodes (38): dealerdirect/phpcodesniffer-composer-installer, ergebnis/composer-normalize, metasyntactical/composer-plugin-license-check, php-http/discovery, _comment, ignore, authors, content (+30 more)

### Community 8 - "TicketTemplate/composer.json"
Cohesion: 0.05
Nodes (38): ignore, dealerdirect/phpcodesniffer-composer-installer, ergebnis/composer-normalize, metasyntactical/composer-plugin-license-check, php-http/discovery, authors, autoload, psr-4 (+30 more)

### Community 9 - "TimeTable/composer.json"
Cohesion: 0.05
Nodes (38): dealerdirect/phpcodesniffer-composer-installer, ergebnis/composer-normalize, metasyntactical/composer-plugin-license-check, php-http/discovery, _comment, ignore, authors, content (+30 more)

### Community 10 - "Leantime\Core\Db\Db"
Cohesion: 0.07
Nodes (15): Leantime\Core\Controller\HtmxController, Leantime\Core\Db\Db, Leantime\Domain\Plugins\Services\Plugins, Leantime\Domain\Setting\Services\Setting, Leantime\Domain\Tickets\Services\Tickets, PDO, SettingsController, WidgetController (+7 more)

### Community 11 - "CopyTicketLink/composer.json"
Cohesion: 0.06
Nodes (30): dealerdirect/phpcodesniffer-composer-installer, ergebnis/composer-normalize, metasyntactical/composer-plugin-license-check, php-http/discovery, authors, config, allow-plugins, description (+22 more)

### Community 12 - "TimeTable"
Cohesion: 0.15
Nodes (4): anchorDropdownToCell(), TimeTable, TimeTableApiHandler, ref_tom_select

### Community 13 - "Whiteboards"
Cohesion: 0.10
Nodes (5): Create, Delete, Rename, Save, Whiteboards

### Community 14 - "TicketTemplateRepository"
Cohesion: 0.15
Nodes (3): Leantime\Core\Application, TicketTemplateRepository, TicketTemplate

### Community 15 - "Carbon\CarbonInterface"
Cohesion: 0.18
Nodes (7): Carbon\CarbonInterface, DeletedData, MilestoneData, ProjectData, TicketData, TimesheetData, WorkerData

### Community 16 - "Leantime\Domain\Auth\Models\Roles"
Cohesion: 0.18
Nodes (8): Exception, Leantime\Core\Controller\Frontcontroller, Leantime\Domain\Auth\Models\Roles, Leantime\Domain\Auth\Services\Auth, CreateTemplate, Settings, UpdateTemplate, Symfony\Component\HttpFoundation\RedirectResponse

### Community 17 - "DeletedRequestParameters"
Cohesion: 0.13
Nodes (5): InvalidArgumentException, BadRequestException, CoercesRequestInput, DeletedRequestParameters, self

### Community 18 - "APIData/composer.json"
Cohesion: 0.10
Nodes (19): authors, autoload-dev, classmap, psr-4, config, description, homepage, license (+11 more)

### Community 19 - "SchemaRepository"
Cohesion: 0.08
Nodes (4): Illuminate\Database\Query\Builder, SchemaRepository, OmniSearch, OmniSearch

### Community 20 - "API"
Cohesion: 0.27
Nodes (4): API, JsonResponse, ResponseData, Symfony\Component\HttpFoundation\JsonResponse

### Community 22 - "Controllers/TimeTable.php"
Cohesion: 0.15
Nodes (7): Illuminate\Contracts\Container\BindingResolutionException, Illuminate\Http\JsonResponse, Illuminate\Support\Facades\Log, Leantime\Domain\Users\Repositories\Users, Leantime\Domain\Users\Services\Users, OmniSearch, TimeTable

### Community 24 - "Whiteboards/composer.json"
Cohesion: 0.13
Nodes (14): authors, autoload, psr-4, description, homepage, keywords, license, name (+6 more)

### Community 25 - "WhiteboardRepository"
Cohesion: 0.18
Nodes (4): ConnectionInterface, Illuminate\Database\Schema\Blueprint, Illuminate\Support\Facades\Schema, WhiteboardRepository

### Community 26 - "Leantime\Core\Controller\Controller"
Cohesion: 0.21
Nodes (4): Leantime\Core\Controller\Controller, ListTemplates, ShowAll, ShowWhiteboard

### Community 27 - "Leantime\Core\UI\Template"
Cohesion: 0.29
Nodes (4): Leantime\Core\UI\Template, Leantime\Domain\Setting\Repositories\Setting, SettingsTabContent, Settings

### Community 29 - "TaskOrganiser/composer.json"
Cohesion: 0.17
Nodes (11): authors, description, homepage, keywords, license, name, require, leantime/leantime (+3 more)

### Community 30 - "copy-ticket-link.js"
Cohesion: 0.36
Nodes (10): buildButton(), buildPlainTicketUrl(), copyToClipboard(), ensureButtonPresent(), flashFeedback(), getTicketIdFromHash(), handleHashChange(), startInjectionWatch() (+2 more)

### Community 31 - "Symfony\Component\HttpFoundation\Response"
Cohesion: 0.17
Nodes (4): ProjectOverviewService, ProjectOverview, DeleteTemplate, Symfony\Component\HttpFoundation\Response

### Community 34 - "Data API Plugin"
Cohesion: 0.38
Nodes (7): Deleted Endpoint Paging and Parameter Changes, Data API Plugin, Deleted Entities Endpoint, Deletion Paging Watermark Caveat, Deleted Entity Tracking Tables and Triggers, Entity API Endpoints, Database Modification Watermark

### Community 36 - "Leantime Application Service"
Cohesion: 0.47
Nodes (6): Cloudflared Tunnel Service, MySQL Database Health Check, Leantime Application Service, Leantime MySQL Database Service, Leantime Docker Network, Local Plugins Directory Mount

### Community 39 - "TimeTable Plugin"
Cohesion: 0.40
Nodes (5): Worklog DTO Data Integrity, Custom TimeTable Repository, Manage Timetable as Another User, LocalStorage To-Do Synchronization, TimeTable Plugin

### Community 40 - "OmniSearch Plugin"
Cohesion: 0.50
Nodes (4): Fuzzy Search, User-Configurable Search Scope, OmniSearch Built Asset Symlink, OmniSearch Plugin

### Community 41 - "Project Overview Plugin"
Cohesion: 0.50
Nodes (4): Live-Share Views, Repository-Level Project Access Scoping, View-Based Filters and Sorting, Project Overview Plugin

### Community 43 - "Docker Buildx Multi-Platform Build"
Cohesion: 1.00
Nodes (3): Docker Buildx Multi-Platform Build, Docker Publish Workflow, Leantime Docker Image

### Community 44 - "Copy Ticket Link Plugin"
Cohesion: 0.67
Nodes (3): Clipboard API with Copy Fallback, Context-Free Ticket URL, Copy Ticket Link Plugin

### Community 47 - "Ticket Template Plugin"
Cohesion: 0.67
Nodes (3): Query Builder Data Access, Per-Project Ticket Templates, Ticket Template Plugin

### Community 49 - "Excalidraw Whiteboard Editor"
Cohesion: 1.00
Nodes (3): Excalidraw Whiteboard Editor, Whiteboards Plugin, Whiteboards Database Table

### Community 50 - "Official Leantime Docker Image"
Cohesion: 0.67
Nodes (3): Docker Secrets for Sensitive Configuration, Leantime Project Management System, Official Leantime Docker Image

## Knowledge Gaps
- **212 isolated node(s):** `name`, `description`, `license`, `type`, `version` (+207 more)
  These have ≤1 connection - possible missing edges or undocumented components. (Counts symbols only; 368 node(s) total have ≤1 connection when file, concept and rationale nodes are included.)
- **41 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **Why does `APIData` connect `APIData` to `TimeTable`, `ApiDataRepository`, `Carbon\CarbonInterface`, `DeletedRequestParameters`, `SchemaRepository`, `API`?**
  _High betweenness centrality (0.045) - this node is a cross-community bridge._
- **Why does `SchemaRepository` connect `SchemaRepository` to `TimeTable`, `APIData`, `Carbon\CarbonInterface`?**
  _High betweenness centrality (0.027) - this node is a cross-community bridge._
- **Why does `TimeTable` connect `Controllers/TimeTable.php` to `TimeTable`, `Leantime\Core\Configuration\Environment`, `Leantime\Core\Controller\Controller`, `Leantime\Core\UI\Template`, `Symfony\Component\HttpFoundation\Response`?**
  _High betweenness centrality (0.027) - this node is a cross-community bridge._
- **What connects `name`, `description`, `license` to the rest of the system?**
  _212 weakly-connected nodes found - possible documentation gaps or missing edges._
- **Should `ProjectOverviewActionHandler` be split into smaller, more focused modules?**
  _Cohesion score 0.058018018018018015 - nodes in this community are weakly interconnected._
- **Should `project-overview.js` be split into smaller, more focused modules?**
  _Cohesion score 0.06054054054054054 - nodes in this community are weakly interconnected._
- **Should `TimeTable` be split into smaller, more focused modules?**
  _Cohesion score 0.051587301587301584 - nodes in this community are weakly interconnected._