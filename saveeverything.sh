#!/bin/bash

# Target snippet to insert
SNIPPET='<script src="global.js"></script>'

# Loop through all HTML files in the current directory
for file in *.html; do
    # Skip if the file is index.html or if it doesn't exist/match the pattern
    if [ "$file" = "index.html" ] || [ ! -f "$file" ]; then
        continue
    fi

    # Check if the file already contains the global.js reference
    if ! grep -q 'src="global.js"' "$file"; then
        echo "Adding index button snippet to $file"
        
        # Use sed to insert the snippet right before the closing </body> tag
        # Note: This expects </body> to be lowercase.
        sed -i "s|</body>|${SNIPPET}\n</body>|g" "$file"
    fi
done

# Get current timestamp for commit message
timestamp=$(date '+%Y-%m-%d %H:%M:%S')

# Stage all changes
git add -A

# Commit with timestamp
git commit -m "Auto-commit: $timestamp"

# Push to remote
git push origin main