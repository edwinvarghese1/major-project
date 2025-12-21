#!/usr/bin/env bash
set -e
MSG="${1:-Auto-commit: $(date -u +"%Y-%m-%d %H:%M:%S UTC")}"
git add -A
if git diff --cached --quiet; then
  echo "Nothing to commit"
  exit 0
fi
git commit -m "$MSG"
git push

