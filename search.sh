#!/bin/bash

# Prerequisite check: Ensure Perl is installed
if ! command -v perl &> /dev/null; then
    echo "::error title=Missing Dependency::Perl is not installed on this runner. The hidden-characters action requires Perl to run."
    exit 1
fi

# Get the path from the GitHub Action input, defaulting to current directory
SEARCH_PATH="${1:-.}"

echo "Scanning $SEARCH_PATH for hidden characters..."

# Find all files (ignoring directories like .git) and run perl against them
# The perl script exits with 1 (fails) if it matches the hidden character regex
find "$SEARCH_PATH" -type f -not -path "*/\.git/*" -exec perl -e '
    $found = 0;
    while (<>) {
        if (/[^\t\n\r[:print:]]/) {
            print "Hidden character found in $ARGV at line $.\n";
            $found = 1;
        }
    }
    exit 1 if $found;
' {} +

# Capture the exit code of the find/perl command
if [ $? -eq 0 ]; then
    echo "Success: No hidden characters found."
    exit 0
else
    echo "Error: Hidden characters detected. Please remove them."
    exit 1
fi
