# Logger and Settings Module
- **File**: `scripts/logger.sh`
- **Functionality**: Logs water intake, sets goal, interval (hours/minutes), and message.
- **Implementation**: Writes to `data/water_log.txt` (format: `date,amount`). Updates `data/settings.conf` with `sed`. Shows random messages from `data/messages.txt` using `shuf`.
- **Usage**: `./logger.sh [--log | --set-goal | --set-interval | --set-message]`
