#!/bin/bash

# Define constant for tasks file path
TASKS="/app/tasks.txt"
BASH_HISTORY="$HOME/.bash_history"

# Check if tasks file exists
if [ ! -f "$TASKS" ]; then
    echo "$TASKS does not exist!"
    exit 1
fi

# Check if bash history file exists
if [ ! -f "$BASH_HISTORY" ]; then
    echo "$BASH_HISTORY does not exist!"
    exit 1
fi

# Initialize variables
line_count=0
unfinished_tasks=""
completed_tasks=""

# Read command history from ~/.bash_history
IFS=$'\n' history_commands=($(cat "$BASH_HISTORY"))

# Loop through tasks file
while IFS= read -r task; do
    ((line_count++))
    task=$(echo "$task" | sed 's/^\s*//;s/\s*$//')  # Remove leading/trailing whitespace

    # Check if task is in command history
    found=false
    for cmd in "${history_commands[@]}"; do
        if [[ "$cmd" == *"$task"* ]]; then
            found=true
            break
        fi
    done

    if $found; then
        completed_tasks+=" - [x] Task $line_count >$task< completed\n"
    else
        unfinished_tasks+=" - [ ] Task $line_count  open\n"
    fi
done < "$TASKS"

# Output to completed.md
echo -e "$completed_tasks"

# Output unfinished tasks
if [ -n "$unfinished_tasks" ]; then
    echo "Unfinished Tasks:"
    echo -e "$unfinished_tasks"
fi
