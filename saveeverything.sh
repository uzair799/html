#!/bin/bash

# Get current timestamp for commit message
timestamp=$(date '+%Y-%m-%d %H:%M:%S')

# Stage all changes
git add -A

# Commit with timestamp
git commit -m "Auto-commit: $timestamp"

# Push to remote
git push origin main