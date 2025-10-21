# Copilot Instructions for cosmic-energy2

## Project Overview
- This is a Laravel-based web application with a clear separation between admin and user functionality.
- Major components are organized under `app/Http/Controllers/Admin` and `app/Http/Controllers/User`.
- Models are in `app/Models/` and migrations in `database/migrations/`.
- Routing is handled in `routes/web.php` (main), with clear route grouping for `admin` and `user` prefixes.

## Key Patterns & Conventions
- **Admin and User Separation:**
  - Admin routes use `admin.` prefix and are protected by `AdminAuthenticated` middleware.
  - User routes use `user.` prefix and are protected by `auth:user` middleware where needed.
- **Permissions:**
  - Admin actions are guarded by `CheckPermission` middleware with permission strings (e.g., `view_admins`).
- **CRUD Operations:**
  - Standard CRUD patterns for resources (users, roles, blogs, categories, etc.)
  - Example: `Route::resource('permissions', PermissionController::class)`
- **Controllers:**
  - Each resource has a dedicated controller (e.g., `AdminController`, `BlogController`).
  - User-facing controllers are under `User` namespace.
- **Views:**
  - Blade templates are in `resources/views/`.
- **Migrations/Seeders:**
  - All schema changes are in `database/migrations/`.
  - Factories and seeders are in their respective folders.

## Developer Workflows
- **Install dependencies:**
  - PHP: `composer install`
  - JS/CSS: `npm install`
- **Run the app locally:**
  - `php artisan serve` (Laravel dev server)
- **Build frontend assets:**
  - `npm run dev` (for Vite)
- **Run tests:**
  - `php artisan test` or `vendor/bin/pest`
- **Migrate database:**
  - `php artisan migrate`

## Integration Points
- **Frontend assets:** Managed via Vite (`vite.config.js`).
- **Authentication:**
  - Admin and user have separate login flows and middleware.
- **External dependencies:**
  - Managed via Composer (PHP) and npm (JS/CSS).

## Project-Specific Notes
- Use route names (e.g., `admin.dashboard`, `user.home`) for redirects and links.
- Follow the existing middleware and permission structure for new features.
- For new resources, follow the CRUD and controller patterns in `routes/web.php` and `app/Http/Controllers/`.

## Example: Adding a New Admin Resource
1. Create a model and migration in `app/Models` and `database/migrations`.
2. Create a controller in `app/Http/Controllers/Admin`.
3. Add routes under the `admin` group in `routes/web.php`.
4. Protect routes with `AdminAuthenticated` and `CheckPermission` as needed.
5. Create Blade views in `resources/views/admin/pages/`.

---
If any conventions or workflows are unclear, please ask for clarification or check the latest code in the relevant directory.
