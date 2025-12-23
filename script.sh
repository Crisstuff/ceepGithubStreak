#!/bin/sh

README="README.md"
TODAY=$(date +"%d.%m.%Y")
NOW=$(date +"%H:%M:%S")

# Unique message every run (prevents duplicates)
MESSAGE="This is a message - $TODAY $NOW"

# Append message to README (always a change)
echo "$MESSAGE" >> "$README"

# Update / insert last updated line (extra safety)
if grep -q "<b> Last updated:" "$README"; then
    sed -i.bak "s|<b> Last updated:.*|<b> Last updated: $TODAY </b>|" "$README"
else
    echo "<b> Last updated: $TODAY </b>" >> "$README"
fi

# Remove backup file if sed created one (macOS)
rm -f "$README.bak"

# Commit ONLY README
git add README.md
git commit -m "Keep README streak alive: $TODAY $NOW" >/dev/null 2>&1
git push >/dev/null 2>&1
