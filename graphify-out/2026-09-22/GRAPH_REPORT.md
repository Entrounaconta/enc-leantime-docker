# Graph Report - enc-leantime-docker  (2026-09-22)

## Corpus Check
- 158 files · ~61,527 words
- Verdict: corpus is large enough that graph structure adds value.
- Unclassified: 33 file(s) not represented in the graph (top: (none) 12, .ini 10, .conf 3)

## Summary
- 1022 nodes · 1920 edges · 82 communities (40 shown, 42 thin omitted)
- Extraction: 99% EXTRACTED · 1% INFERRED · 0% AMBIGUOUS · INFERRED: 22 edges (avg confidence: 0.84)
- Token cost: 0 input · 0 output

## Community Hubs (Navigation)
- Project Overview Data Model
- Plugin Filter Controls
- Leantime Ticket Repositories
- Core Runtime Services
- Plugin Settings Integration
- OmniSearch Composer Metadata
- API Data Repository
- ProjectOverview Composer Metadata
- TicketTemplate Composer Metadata
- TimeTable Composer Metadata
- Leantime Controller Integration
- CopyTicketLink Composer Metadata
- TimeTable Interface
- API Data Endpoints
- Ticket Template Services
- Deleted Data Tracking
- Core Exceptions and Auth
- Request Validation
- APIData Composer Metadata
- Database Schema Migrations
- Deleted Data API
- Task Sorting Integrations
- OmniSearch Controller Integration
- Custom Fields Sorting
- Whiteboards Composer Metadata
- Whiteboard Repository
- Ticket Template Controller
- Plugin Settings UI
- APIData Initialization
- TaskOrganiser Composer Metadata
- Ticket Link Copying
- Project Overview Service
- Plugin Settings Controller
- TimeTable Ticket Actions
- API Data Documentation
- Request Parameters
- Docker Compose Topology
- Strategy Sorting
- Copy Ticket Link Plugin
- TimeTable Documentation
- OmniSearch Documentation
- Project Overview Documentation
- Docker Image Publishing
- Ticket Link Semantics
- Project Overview Table Templates
- Project Overview View Templates
- Ticket Template Documentation
- Whiteboard Model
- Whiteboards Documentation
- Leantime Docker Setup
- Deploy Scripts
- Release Scripts
- Whiteboard Card Template
- Container Startup Script
- GitHub Sponsorship
- OmniSearch Task Commands
- ProjectOverview Task Commands
- TimeTable Task Commands

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

## Communities (82 total, 42 thin omitted)

### Community 0 - "Project Overview Data Model"
Cohesion: 0.06
Nodes (13): Illuminate\Contracts\Container\BindingResolutionException, ProjectOverviewDTO, ProjectOverviewFiltersDataDTO, SharedViewLookupResult, self, UserViewDTO, ViewDTO, DateTypeEnum (+5 more)

### Community 1 - "Plugin Filter Controls"
Cohesion: 0.06
Nodes (63): allConcreteSelected(), applySelectMutex(), buildDropdownAdapterWithSearch(), captureFormState(), clearNewViewFiltersStorage(), getConcreteOptionIds(), initFiltersToggle(), initProjectOverviewFilters() (+55 more)

### Community 2 - "Leantime Ticket Repositories"
Cohesion: 0.07
Nodes (9): Illuminate\Log\Logger, Leantime\Domain\Tickets\Repositories\Tickets, Leantime\Domain\Timesheets\Repositories\Timesheets, PDO, TicketContextMenuDTO, WorklogDTO, TimeTableActionHandler, TimeTable (+1 more)

### Community 3 - "Core Runtime Services"
Cohesion: 0.09
Nodes (14): Closure, Illuminate\Support\Facades\Cache, Leantime\Core\Configuration\Environment, Leantime\Core\Events\EventDispatcher, Leantime\Core\Http\IncomingRequest, Leantime\Core\Language, GetLanguageAssets, GetLanguageAssets (+6 more)

### Community 4 - "Plugin Settings Integration"
Cohesion: 0.09
Nodes (12): Leantime\Domain\Tickets\Models\Tickets, Leantime\Plugins\PgmPro\Repositories\Programs, BaseSortModule, ClientSortModule, CreatedWithinSortModule, DueDateSortModule, EffortSortModule, PrioritySortModule (+4 more)

### Community 5 - "OmniSearch Composer Metadata"
Cohesion: 0.05
Nodes (39): dealerdirect/phpcodesniffer-composer-installer, ergebnis/composer-normalize, metasyntactical/composer-plugin-license-check, php-http/discovery, _comment, ignore, authors, content (+31 more)

### Community 6 - "API Data Repository"
Cohesion: 0.10
Nodes (7): Carbon\CarbonImmutable, Illuminate\Database\Query\Builder, Illuminate\Support\Facades\DB, ApiDataRepository, OmniSearch, OmniSearch, TimeTableHelper

### Community 7 - "ProjectOverview Composer Metadata"
Cohesion: 0.05
Nodes (38): dealerdirect/phpcodesniffer-composer-installer, ergebnis/composer-normalize, metasyntactical/composer-plugin-license-check, php-http/discovery, _comment, ignore, authors, content (+30 more)

### Community 8 - "TicketTemplate Composer Metadata"
Cohesion: 0.05
Nodes (38): ignore, dealerdirect/phpcodesniffer-composer-installer, ergebnis/composer-normalize, metasyntactical/composer-plugin-license-check, php-http/discovery, authors, autoload, psr-4 (+30 more)

### Community 9 - "TimeTable Composer Metadata"
Cohesion: 0.05
Nodes (38): dealerdirect/phpcodesniffer-composer-installer, ergebnis/composer-normalize, metasyntactical/composer-plugin-license-check, php-http/discovery, _comment, ignore, authors, content (+30 more)

### Community 10 - "Leantime Controller Integration"
Cohesion: 0.11
Nodes (10): Leantime\Core\Controller\HtmxController, Leantime\Core\Db\Db, Leantime\Domain\Plugins\Services\Plugins, WidgetController, CachedTaskList, SettingsIndex, SettingsModel, CacheRepository (+2 more)

### Community 11 - "CopyTicketLink Composer Metadata"
Cohesion: 0.06
Nodes (30): dealerdirect/phpcodesniffer-composer-installer, ergebnis/composer-normalize, metasyntactical/composer-plugin-license-check, php-http/discovery, authors, config, allow-plugins, description (+22 more)

### Community 12 - "TimeTable Interface"
Cohesion: 0.14
Nodes (5): anchorDropdownToCell(), TimeTable, TimeTableApiHandler, ref_flatpickr, ref_tom_select

### Community 13 - "API Data Endpoints"
Cohesion: 0.10
Nodes (5): Create, Rename, ShowAll, ShowWhiteboard, Whiteboards

### Community 14 - "Ticket Template Services"
Cohesion: 0.15
Nodes (3): Leantime\Core\Application, TicketTemplateRepository, TicketTemplate

### Community 15 - "Deleted Data Tracking"
Cohesion: 0.16
Nodes (7): Carbon\CarbonInterface, DeletedData, MilestoneData, ProjectData, TicketData, TimesheetData, WorkerData

### Community 16 - "Core Exceptions and Auth"
Cohesion: 0.16
Nodes (9): Exception, Illuminate\Support\Facades\Log, Leantime\Core\Controller\Frontcontroller, Leantime\Domain\Auth\Models\Roles, Leantime\Domain\Auth\Services\Auth, CreateTemplate, Settings, UpdateTemplate (+1 more)

### Community 17 - "Request Validation"
Cohesion: 0.13
Nodes (5): InvalidArgumentException, BadRequestException, CoercesRequestInput, DeletedRequestParameters, self

### Community 18 - "APIData Composer Metadata"
Cohesion: 0.10
Nodes (19): authors, autoload-dev, classmap, psr-4, config, description, homepage, license (+11 more)

### Community 20 - "Deleted Data API"
Cohesion: 0.27
Nodes (4): API, JsonResponse, ResponseData, Symfony\Component\HttpFoundation\JsonResponse

### Community 21 - "Task Sorting Integrations"
Cohesion: 0.25
Nodes (6): Leantime\Domain\Projects\Services\Projects, Leantime\Domain\Tickets\Services\Tickets, Leantime\Plugins\TaskOrganiser\Services\SortModules\Common\BaseSortModule, MilestoneSortModule, ProjectSortModule, StatusSortModule

### Community 22 - "OmniSearch Controller Integration"
Cohesion: 0.20
Nodes (5): Leantime\Domain\Setting\Services\Setting, Leantime\Domain\Users\Repositories\Users, Leantime\Domain\Users\Services\Users, OmniSearch, TaskOrganiser

### Community 23 - "Custom Fields Sorting"
Cohesion: 0.20
Nodes (6): Leantime\Plugins\CustomFields\Contracts\FieldTypeEnum, Leantime\Plugins\CustomFields\Repositories\CustomFields, Leantime\Plugins\CustomFields\Services\CustomFields, CustomFieldsBoolSortModule, CustomFieldsCheckboxSortModule, CustomFieldsRadioSortModule

### Community 24 - "Whiteboards Composer Metadata"
Cohesion: 0.13
Nodes (14): authors, autoload, psr-4, description, homepage, keywords, license, name (+6 more)

### Community 25 - "Whiteboard Repository"
Cohesion: 0.16
Nodes (4): ConnectionInterface, Illuminate\Database\Schema\Blueprint, Illuminate\Support\Facades\Schema, WhiteboardRepository

### Community 26 - "Ticket Template Controller"
Cohesion: 0.21
Nodes (4): Leantime\Core\Controller\Controller, ListTemplates, Delete, Save

### Community 27 - "Plugin Settings UI"
Cohesion: 0.26
Nodes (4): Leantime\Core\UI\Template, Leantime\Domain\Setting\Repositories\Setting, SettingsTabContent, Settings

### Community 29 - "TaskOrganiser Composer Metadata"
Cohesion: 0.17
Nodes (11): authors, description, homepage, keywords, license, name, require, leantime/leantime (+3 more)

### Community 30 - "Ticket Link Copying"
Cohesion: 0.36
Nodes (10): buildButton(), buildPlainTicketUrl(), copyToClipboard(), ensureButtonPresent(), flashFeedback(), getTicketIdFromHash(), handleHashChange(), startInjectionWatch() (+2 more)

### Community 31 - "Project Overview Service"
Cohesion: 0.25
Nodes (4): ProjectOverviewService, ProjectOverview, DeleteTemplate, Symfony\Component\HttpFoundation\Response

### Community 34 - "API Data Documentation"
Cohesion: 0.38
Nodes (7): Deleted Endpoint Paging and Parameter Changes, Data API Plugin, Deleted Entities Endpoint, Deletion Paging Watermark Caveat, Deleted Entity Tracking Tables and Triggers, Entity API Endpoints, Database Modification Watermark

### Community 36 - "Docker Compose Topology"
Cohesion: 0.47
Nodes (6): Cloudflared Tunnel Service, MySQL Database Health Check, Leantime Application Service, Leantime MySQL Database Service, Leantime Docker Network, Local Plugins Directory Mount

### Community 39 - "TimeTable Documentation"
Cohesion: 0.40
Nodes (5): Worklog DTO Data Integrity, Custom TimeTable Repository, Manage Timetable as Another User, LocalStorage To-Do Synchronization, TimeTable Plugin

### Community 40 - "OmniSearch Documentation"
Cohesion: 0.50
Nodes (4): Fuzzy Search, User-Configurable Search Scope, OmniSearch Built Asset Symlink, OmniSearch Plugin

### Community 41 - "Project Overview Documentation"
Cohesion: 0.50
Nodes (4): Live-Share Views, Repository-Level Project Access Scoping, View-Based Filters and Sorting, Project Overview Plugin

### Community 43 - "Docker Image Publishing"
Cohesion: 1.00
Nodes (3): Docker Buildx Multi-Platform Build, Docker Publish Workflow, Leantime Docker Image

### Community 44 - "Ticket Link Semantics"
Cohesion: 0.67
Nodes (3): Clipboard API with Copy Fallback, Context-Free Ticket URL, Copy Ticket Link Plugin

### Community 47 - "Ticket Template Documentation"
Cohesion: 0.67
Nodes (3): Query Builder Data Access, Per-Project Ticket Templates, Ticket Template Plugin

### Community 49 - "Whiteboards Documentation"
Cohesion: 1.00
Nodes (3): Excalidraw Whiteboard Editor, Whiteboards Plugin, Whiteboards Database Table

### Community 50 - "Leantime Docker Setup"
Cohesion: 0.67
Nodes (3): Docker Secrets for Sensitive Configuration, Leantime Project Management System, Official Leantime Docker Image

## Knowledge Gaps
- **210 isolated node(s):** `name`, `description`, `license`, `type`, `version` (+205 more)
  These have ≤1 connection - possible missing edges or undocumented components. (Counts symbols only; 364 node(s) total have ≤1 connection when file, concept and rationale nodes are included.)
- **42 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **Why does `APIData` connect `APIData Initialization` to `Leantime Ticket Repositories`, `API Data Repository`, `Deleted Data Tracking`, `Request Validation`, `Database Schema Migrations`, `Deleted Data API`?**
  _High betweenness centrality (0.049) - this node is a cross-community bridge._
- **Why does `TimeTable` connect `Leantime Ticket Repositories` to `Leantime Controller Integration`?**
  _High betweenness centrality (0.028) - this node is a cross-community bridge._
- **Why does `SchemaRepository` connect `Database Schema Migrations` to `Leantime Ticket Repositories`, `APIData Initialization`, `API Data Repository`, `Deleted Data Tracking`?**
  _High betweenness centrality (0.028) - this node is a cross-community bridge._
- **What connects `name`, `description`, `license` to the rest of the system?**
  _210 weakly-connected nodes found - possible documentation gaps or missing edges._
- **Should `Project Overview Data Model` be split into smaller, more focused modules?**
  _Cohesion score 0.05719298245614035 - nodes in this community are weakly interconnected._
- **Should `Plugin Filter Controls` be split into smaller, more focused modules?**
  _Cohesion score 0.061458718992965566 - nodes in this community are weakly interconnected._
- **Should `Leantime Ticket Repositories` be split into smaller, more focused modules?**
  _Cohesion score 0.06636500754147813 - nodes in this community are weakly interconnected._