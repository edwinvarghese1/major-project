#!/usr/bin/env bash
set -e

# Ask user for a commit message via Zenity GUI
MSG=$(zenity --entry \
    --title="Git Commit" \
    --text="Enter Git commit message (optional):" 2>/dev/null)

# If user presses Cancel, exit
if [ $? -ne 0 ]; then
    echo "Commit cancelled"
    exit 0
fi

git add -A

# Check if there is anything to commit
if git diff --cached --quiet; then
    notify-send "Git" "Nothing to commit"
    exit 0
fi

# Commit (allow empty message)
git commit --allow-empty-message -m "$MSG"

# Push changes
git push

# Notify user
notify-send "Git" "Commit pushed successfully"
