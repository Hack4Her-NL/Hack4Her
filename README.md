# Hack4Her

## Flutter Web Project for Cloudflare Pages

This project was migrated from Svelte to Flutter for web deployment on Cloudflare Pages.

## Migration Notes

This project was previously a Svelte application. It has been completely migrated to use Flutter for web.

## Development Setup

1. Install Flutter SDK from [flutter.dev](https://flutter.dev/docs/get-started/install)
2. Enable web support: `flutter config --enable-web`
3. Clone this repository and navigate to the project folder
4. Run `flutter pub get` to install dependencies
5. Run the development server: `flutter run -d chrome`

## Building for Production

```bash
flutter build web --release --web-renderer canvaskit
```

The build output will be in the `build/web` directory.

## Deploying to Cloudflare Pages

This project uses Cloudflare Pages for deployment. The build output from Flutter's web build is deployed to Cloudflare.

### Manual Deployment

```bash
# Build the project
flutter build web --release --web-renderer canvaskit

# Deploy to Cloudflare Pages
wrangler pages deploy build/web
```

### Using Deployment Scripts

For Windows:
```
deploy.bat
```

For Linux/Mac:
```
chmod +x deploy.sh
./deploy.sh
```

## Project Structure

- `lib/` - Flutter application code
  - `main.dart` - Application entry point
  - `screens/` - Application screens
  - `widgets/` - Reusable UI components
- `web/` - Web-specific assets and entry point
- `assets/` - Images, fonts, and other static assets
- `build/web/` - Production build output (deployed to Cloudflare)
