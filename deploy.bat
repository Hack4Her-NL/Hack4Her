@echo off
REM Build the Flutter web app
call flutter build web --release --web-renderer canvaskit

REM Ensure the _routes.json file exists for Cloudflare Pages to handle Flutter routing
echo {^
  "version": 1,^
  "include": ["/*"],^
  "exclude": []^
} > build\web\_routes.json

REM Deploy to Cloudflare Pages
call wrangler pages deploy build/web 