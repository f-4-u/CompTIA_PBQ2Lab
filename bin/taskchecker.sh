#!/bin/bash

# Define the file paths
BASHRC_FILE="${HOME}/.bashrc"
TASKS_FILE="/app/tasks.md"
COMPLETED_FILE="/app/Completed.md"

# Check if .bashrc exists
if [ ! -f "$BASHRC_FILE" ]; then
    echo "Error: .bashrc file not found."
    exit 1
fi

# Check if tasks.md exists
if [ ! -f "$TASKS_FILE" ]; then
    echo "Error: tasks.md file not found."
    exit 1
fi

# Initialize the Completed.md file
echo "" >"$COMPLETED_FILE"

# Iterate through each line in .bashrc
while IFS= read -r line; do
    # Check if line matches the pattern
    if grep -q "$line" "$TASKS_FILE"; then
        # Get the task number
        task_number=$(grep -n "$line" "$TASKS_FILE" | cut -d':' -f1)
        # Check if the task is already marked as completed
        if grep -q "\[$task_number\] \[x\]" "$COMPLETED_FILE"; then
            echo "Task $task_number already completed."
        else
            # Mark the task as completed in Completed.md
            echo "- [x] Task $task_number $(sed -n "${task_number}p" "$TASKS_FILE") completed" >>"$COMPLETED_FILE"
        fi
    fi
done <"$BASHRC_FILE"

echo "Completed tasks:"
cat "$COMPLETED_FILE"
