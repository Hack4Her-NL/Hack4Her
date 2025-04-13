# Flutter to Svelte Migration Todo List

**Running on Windows machine**

## Why Svelte is Better for SEO than Flutter

Flutter generates JavaScript that dynamically creates the DOM at runtime, which makes it challenging for search engines to index content properly. In contrast, Svelte:

1. **Server-Side Rendering (SSR)** - Svelte with SvelteKit provides built-in SSR, delivering pre-rendered HTML to clients and search engines
2. **Static Site Generation (SSG)** - Can pre-generate HTML files at build time for even better indexing
3. **Progressive Enhancement** - Works even without JavaScript enabled
4. **Smaller JavaScript bundle** - Faster load times which improves SEO ranking
5. **Better accessibility** - Easier to implement accessible websites which also contributes to SEO

## Development Setup

- [x] Use existing svelte_app folder structure
- [x] Setup development environment
  - [x] Run `npm install` in the svelte_app directory
  - [x] Run `npm run dev -- --open` to start development server

## Technology Choices

### UI Framework
- **Svelte + SvelteKit**: Selected for its built-in SSR/SSG capabilities, small bundle size, and SEO friendliness
- **React**: Good alternative but requires additional setup for SSR (Next.js)
- **Vue**: Similar to Svelte but slightly larger bundle size
- **Angular**: Too heavyweight for this application

### Styling
- **CSS with Svelte scoped styles**: Selected for simplicity and automatic scoping
- **Tailwind CSS**: Good alternative for utility-first approach
- **SCSS/SASS**: Would require additional setup

### Routing
- **SvelteKit built-in routing**: Selected for its file-based routing that's similar to Next.js
- **svelte-navigator**: Alternative but unnecessary with SvelteKit

### Type Checking
- **TypeScript**: Selected because it's already set up in the project

## Files to Create/Migrate

- [x] Routes and Pages
  - [x] src/routes/+page.svelte (Home page)
  - [x] src/routes/+layout.svelte (Main layout)
  - [x] src/routes/about/+page.svelte (About page)
  - [x] src/routes/registration/+page.svelte (Registration page)
  - [x] src/routes/information/+page.svelte (Information page)
  - [x] src/routes/workshops/+page.svelte (Workshops page)
  - [x] src/routes/challenges/+page.svelte (Challenges page)
  - [x] src/routes/previous-events/+page.svelte (Previous Events page)

- [x] Components (to replace Flutter widgets)
  - [x] src/lib/components/Navigation.svelte
  - [x] src/lib/components/Footer.svelte
  - [x] src/lib/components/ThemeToggle.svelte

- [x] Styles and Theme
  - [x] src/lib/styles/theme.ts (to replace app_theme.dart)
  - [x] src/app.css (global styles)

- [x] Utilities
  - [x] src/lib/utils/routes.ts (navigation configuration)
  - [x] src/lib/utils/seo.ts (SEO metadata configuration)

## Files to Remove (Do Not Remove Yet - Will Do Manually After Migration)

- Flutter-specific files:
  - lib/main.dart
  - lib/screens/*.dart (all screen files)
  - lib/widgets/*.dart (all widget files)
  - lib/utils/*.dart (all util files)
  - lib/constants/*.dart (all constant files)
  - pubspec.yaml
  - pubspec.lock
  - .metadata
  - analysis_options.yaml
  - .flutter-version
  - .dart_tool/ (directory)
  - build/ (directory) 

## Migration Tasks

- [x] Setup project structure
- [x] Create navigation and layout
- [x] Implement theme system
- [x] Migrate Home page
- [x] Migrate About page
- [x] Migrate Registration page
- [x] Migrate Information page
- [x] Migrate Workshops page
- [x] Migrate Challenges page
- [x] Migrate Previous Events page
- [ ] Test all pages
- [ ] Ensure responsive design works
- [x] Verify SEO optimization

## Additional Tasks Discovered During Migration

- [x] Need to create a static folder for images (/static/images)
- [x] Add Material Icons for highlight cards
- [ ] Test to ensure dark mode toggle works correctly
- [x] Fix challenge cards in dark mode (text turns white but card background remains white)
- [x] Add SEO meta tags for better indexing
- [x] Need to add placeholder images for development (added README.txt with instructions)
- [x] Make sure that the images can be found (migrate the images used in flutter to the svelte version)
  - [x] Copy face and company images from assets/images to svelte_app/static/images
  - [x] Create placeholder images for event photos in svelte_app/static/images/gallery 
  - [x] Create placeholder images for project photos in svelte_app/static/images/projects
  - [x] Create placeholder images for event timeline in svelte_app/static/images/events
  - [x] Test all pages to ensure images are loading correctly
- [ ] Test the Timeline component in Previous Events page for responsiveness on mobile
- [ ] Add proper modal dialogs for event and project details instead of alerts
- [ ] Consider implementing pagination for photo gallery with more photos
- [ ] Test hover effects in the photo gallery on touch devices

## SEO Improvements Implemented

- [x] Added proper page titles and descriptions
- [x] Implemented Open Graph meta tags for social sharing
- [x] Added Twitter Card support
- [x] Created keyword lists for each page
- [x] Set up canonical URLs support
- [x] Used semantic HTML5 elements across the site
- [x] Server-side rendering through SvelteKit 