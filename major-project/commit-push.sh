#!/usr/bin/env bash
set -e
#asks user for a commit message
MSG=$(osascript <<EOF || true
tell application "System Events"
    activate
    display dialog "Enter Git commit message (optional):" default answer ""
end tell
text returned of result
EOF
)

git add -A
if git diff --cached --quiet; then
  echo "Nothing to commit"
  exit 0
fi

# Commit: allow empty message
git commit --allow-empty-message -m "$MSG"

git push
osascript -e 'display notification "Commit pushed successfully" with title "Git"'

