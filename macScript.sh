#!/bin/sh

README="README.md"
MESSAGE="This is a message, "
TODAY=$(date +"%d.%m.%Y")
YESTERDAY=$(date -v-1d +"%d.%m.%Y" 2>/dev/null || date -d "yesterday" +"%d.%m.%Y")

# Extract fields from README
highest=$(grep "<b> Highest held streak:" "$README" | sed 's/[^0-9]*//g')
last_updated=$(grep "<b> Last updated:" "$README" | sed 's/.*: //g' | sed 's/<.*//')
total=$(grep -o "This is a message, " "$README" | wc -l | tr -d ' ')

# ---- DAILY RESET CHECK ----
if [ "$last_updated" != "$TODAY" ] && [ "$last_updated" != "$YESTERDAY" ]; then
    total=0
    # Remove list of prints section entirely
    awk '
    /List of prints:/ {print; p=1; next}
    p && /<\/br>/ {p=0; next}
    !p' "$README" > tmp && mv tmp "$README"
fi

# ---- ADD NEW MESSAGE ----
total=$((total + 1))

# Insert message under "List of prints"
awk -v msg="$MESSAGE" '
{
    print $0
    if ($0 ~ /List of prints:/) {
        print msg
    }
}
' "$README" > tmp && mv tmp "$README"

# ---- UPDATE HIGHEST STREAK ----
if [ "$total" -gt "$highest" ]; then
    highest=$total
fi

# ---- UPDATE READ ME VALUES ----
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
