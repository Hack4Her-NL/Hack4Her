#!/bin/bash

# Build the Flutter web app
flutter build web --release --web-renderer canvaskit

# Ensure the _routes.json file exists for Cloudflare Pages to handle Flutter routing
echo '{
  "version": 1,
  "include": ["/*"],
  "exclude": []
}' > build/web/_routes.json

# Deploy to Cloudflare Pages
wrangler pages deploy build/web 