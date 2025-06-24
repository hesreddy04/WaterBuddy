#!/bin/bash
# setup.sh: Initialize files and directories for WaterBuddy

# Create directories
mkdir -p data doc scripts

# Create settings.conf with defaults
cat > data/settings.conf << EOF
GOAL=8
INTERVAL=1
INTERVAL_UNIT=hours
MESSAGE="Time to drink water!"
EOF

# Create messages.txt with motivational messages
cat > data/messages.txt << EOF
Great job! Keep going!
You're staying hydrated! Keep going!
One step closer to your goal!
Keep it up, champ!
EOF

# Create empty data files
touch data/water_log.txt
touch data/reminder.log
touch data/reminder.pid

# Set permissions
chmod u+rw data/*.txt data/settings.conf

# Verify setup
if [ -f data/settings.conf ] && [ -f data/messages.txt ] && [ -f data/water_log.txt ] && [ -f data/reminder.log ]; then
    echo "Setup completed successfully!"
    echo "Run './scripts/water.sh' to start."
else
    echo "Error: Setup failed. Check data/ directory contents."
    exit 1
fi
