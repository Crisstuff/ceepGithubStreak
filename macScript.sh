#!/bin/sh

README="README.md"
MATCH="<b> Total count: </b>"
MESSAGE="This is a message"

# macOS/BSD sed syntax for appending a line
sed -i '' "/$MATCH/a\\
$MESSAGE
" "$README"