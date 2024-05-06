#!/bin/sh

# SQLite database file path
DB_FILE="your_database.db"

# Database connection
SQLITE_CMD="sqlite3"

# SQL scripts
TABLE_SCRIPT="Table_scripts_mysql_rxn.sql"
LOAD_SCRIPT="Load_scripts_sqlite_rxn.sql"

# Log file
LOG_FILE="sqlite.log"

# Initialize ef
ef=0

# Clear log file
> "$LOG_FILE"

echo "See $LOG_FILE for output"

echo "----------------------------------------" >> "$LOG_FILE" 2>&1
echo "Starting ... $(date)" >> "$LOG_FILE" 2>&1
echo "----------------------------------------" >> "$LOG_FILE" 2>&1
echo "DB_FILE= $DB_FILE" >> "$LOG_FILE" 2>&1

echo "    Create and load tables ... $(date)" >> "$LOG_FILE" 2>&1
$SQLITE_CMD "$DB_FILE" < "$TABLE_SCRIPT" >> "$LOG_FILE" 2>&1
if [ $? -ne 0 ]; then
    ef=1
fi

if [ "$ef" -ne 1 ]; then
    echo "    Load Data ... $(date)" >> "$LOG_FILE" 2>&1
    $SQLITE_CMD "$DB_FILE" < "$LOAD_SCRIPT" >> "$LOG_FILE" 2>&1
    if [ $? -ne 0 ]; then
        ef=1
    fi
fi

echo "----------------------------------------" >> "$LOG_FILE" 2>&1
if [ "$ef" -eq 1 ]; then
    echo "There were one or more errors. Please reference the $LOG_FILE file for details." >> "$LOG_FILE" 2>&1
else
    echo "Completed without errors." >> "$LOG_FILE" 2>&1
fi
echo "Finished ... $(date)" >> "$LOG_FILE" 2>&1
echo "----------------------------------------" >> "$LOG_FILE" 2>&1
