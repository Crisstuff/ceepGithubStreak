#!/bin/sh

# Find and set directory Path
REPO_DIR="$(cd "$(dirname "$0")" && pwd)" # Finds the repo directory where THIS script lives
cd "$REPO_DIR" || exit 1 # IMPORTANT: This is the file path to (move into the git repo)

README="README.md"
TODAY=$(/bin/date +"%d.%m.%Y")
NOW=$(/bin/date +"%H:%M:%S")

# Create message
MESSAGE="This is a message - $TODAY $NOW" # Unique message every run (prevents duplicates)
/bin/echo "$MESSAGE" >> "$README" # Append message to README (always a change)

# Update / insert last updated line
if /usr/bin/grep -q "<b> Last updated:" "$README"; then
    /usr/bin/sed -i.bak "s|<b> Last updated:.*|<b> Last updated: $TODAY </b>|" "$README"
else
    /bin/echo "<b> Last updated: $TODAY </b>" >> "$README"
fi

/bin/rm -f "$README.bak" # Remove sed backup (macOS)

# Git commands — Commits ONLY README.md
/usr/bin/git add README.md
/usr/bin/git commit -m "Keep README streak alive: $TODAY $NOW" >/dev/null 2>&1
/usr/bin/git push >/dev/null 2>&1
