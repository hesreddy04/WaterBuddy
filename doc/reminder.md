# Reminder Module
- **File**: `scripts/reminder.sh`
- **Functionality**: Logs reminder messages to `data/reminder.log`.
- **Implementation**: Runs in a background loop started by `water.sh`, triggered every `INTERVAL` (hours/minutes) from `settings.conf`.
- **Usage**: Start via `water.sh` option 7; stop via option 8.
- **Output**: Appends to `data/reminder.log` (e.g., `2025-06-24 14:47:00: Time to drink water!`).
