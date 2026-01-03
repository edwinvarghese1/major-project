#!/usr/bin/env bash
set -e

# Go to your project repo (replace with your actual repo path)
cd ~/major-project || { notify-send "Git" "Repo not found"; exit 1; }

# Ask for commit message via Zenity GUI
MSG=$(zenity --entry \
    --title="Git Commit" \
    --text="Enter Git commit message (optional):" 2>/dev/null)

# If user presses Cancel
[ $? -ne 0 ] && exit 0

# Stage all changes
git add -A

# Commit, allow empty commits if nothing changed
git commit --allow-empty -m "$MSG"

# Push to the default remote and branch
git push

# Notify user
notify-send "Git" "Commit pushed successfully"
