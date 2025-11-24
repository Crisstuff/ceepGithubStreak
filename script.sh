#!/bin/sh
# macOS + Linux compatible

README="README.md"
MESSAGE="This is a massage"
TODAY=$(date +"%d.%m.%Y") # Get today's date

# Get yesterday's date 
if date -v-1d +"%d.%m.%Y" >/dev/null 2>&1; then
    YESTERDAY=$(date -v-1d +"%d.%m.%Y")
else
    YESTERDAY=$(date -d "yesterday" +"%d.%m.%Y")
fi

# Extract fields from README
highest=$(grep "<b> Highest held streak:" "$README" | sed 's/[^0-9]*//g')
last_updated=$(grep "<b> Last updated:" "$README" | sed 's/.*: //g' | sed 's/<.*//')
total=$(grep -o "This is a massage" "$README" | wc -l | tr -d ' ')

# Daily reset check
if [ "$last_updated" != "$TODAY" ] && [ "$last_updated" != "$YESTERDAY" ]; then
    total=0

    # Wipe list after "List of prints:"
    awk '
    /^List of prints:/ { print; skip=1; next }
    skip && NF==0 { skip=0; next } 
    !skip
    ' "$README" > tmp && mv tmp "$README"
fi

# Add new message
total=$((total + 1))

# Insert message under "List of prints"
awk -v msg="$MESSAGE" '
{
    print $0
    if ($0 ~ /^List of prints:/) {
        inlist=1
        next
    }
    if (inlist && NF==0) {
        print msg
        inlist=0
    }
}
END {
    if (inlist == 1) {
        # List of prints was at end of file, append message
        print msg
    }
}
' "$README" > tmp && mv tmp "$README"

# Update highest streak
if [ "$total" -gt "$highest" ]; then
    highest=$total
fi

# Update README.md values
awk -v h="$highest" -v t="$total" -v d="$TODAY" '
{
    if ($0 ~ /<b> Highest held streak:/) {
        print "<b> Highest held streak: " h " days </b>"
    } else if ($0 ~ /<b> Total count now:/) {
        print "<b> Total count now: " t " </b>"
    } else if ($0 ~ /<b> Last updated:/) {
        print "<b> Last updated: " d " </b>"
    } else {
        print $0
    }
}
' "$README" > tmp && mv tmp "$README"

# Auto commit & push to GitHub
git add README.md
git commit -m "Auto-update streak on $TODAY" >/dev/null 2>&1
git push >/dev/null 2>&1
