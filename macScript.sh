#!/bin/sh

README="README.md"
MESSAGE="This is a massage, "

awk -v msg="$MESSAGE" '
{
    print $0
    if ($0 ~ /<b> List of prints:/) {
        print msg
    }
}
' "$README" > tmpfile && mv tmpfile "$README"
