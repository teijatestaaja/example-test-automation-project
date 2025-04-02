#!/bin/bash

# Configuration 
LOGS="../logs"               # Logs folder containing RF logs (not in the repository)
TEST_RUNS="../test_runs"     # Test runs folder in the repository

# Create the test_runs folder if it doesn't exist.
if [ ! -d "$TEST_RUNS" ]; then 
    mkdir "$TEST_RUNS"
    echo  Created test runs folder.
fi 


# Remove the 'source' attribute from <suite> tag in output.xml, and move the sanitized test result output 
# from logs folder to the test_runs folder with a timestamp.
if [ -f "$LOGS/output.xml" ] ; then
    sed -E -e 's/ source="[^"]*"//g' "$LOGS/output.xml" > "$LOGS/sanitized_output.xml"
    timestamp=$(date +"%Y%m%d_%H%M%S")
    new_filename="output_"$timestamp
    mv "$LOGS/sanitized_output.xml" "$TEST_RUNS/$new_filename.xml"
    rm "$LOGS/output.xml"
fi

# Check if old database file exists locally and delete it first.
if [ -f "$TEST_RUNS/robot_results.db" ] ; then
    rm "$TEST_RUNS/robot_results.db"
    echo Deleted old robot_results.db
fi

# Add all output files to the local database and create test report "Testiraportti".
robotdashboard -d $TEST_RUNS/robot_results.db -f ./$TEST_RUNS -t "Testiraportti" -n $TEST_RUNS/test_runs_dashboard.html
