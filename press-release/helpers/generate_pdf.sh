#!/bin/bash
set -e

# generate_pdf.sh
# Simple helper to create a PDF from the press release HTML.
# Requirements: wkhtmltopdf OR Google Chrome (headless) installed on the host.

HTML_PATH="press-release/urgent-press-release.html"
OUT_PATH="press-release/press-release.pdf"

if [ ! -f "$HTML_PATH" ]; then
  echo "Error: $HTML_PATH not found. Run this script from the repository root."
  exit 2
fi

if command -v wkhtmltopdf >/dev/null 2>&1; then
  wkhtmltopdf "$HTML_PATH" "$OUT_PATH"
  echo "PDF created: $OUT_PATH"
  exit 0
fi

if command -v google-chrome >/dev/null 2>&1 || command -v google-chrome-stable >/dev/null 2>&1 || command -v chromium >/dev/null 2>&1; then
  CHROME=$(command -v google-chrome || command -v google-chrome-stable || command -v chromium)
  "$CHROME" --headless --disable-gpu --no-sandbox --print-to-pdf="$OUT_PATH" "file://$(pwd)/$HTML_PATH"
  echo "PDF created: $OUT_PATH"
  exit 0
fi

echo "Error: wkhtmltopdf or headless Chrome not found. Install one to generate PDFs."
exit 1
