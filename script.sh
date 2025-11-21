#!/bin/sh

# File name
README="README.md"

# The line to match
MATCH="<b> Total count: </b>"

# The text you want to insert below it
MESSAGE="This is a message"

# Use sed to insert the message *after* the matching line
sed -i "/$MATCH/a $MESSAGE" "$README"

