# Report and Progress Bar Module
- **File**: `scripts/report.sh`
- **Functionality**: Shows daily intake vs. goal with ASCII progress bar. Supports past dates.
- **Implementation**: Uses `grep` and `awk` to parse `data/water_log.txt`. Generates bar with `printf`.
- **Usage**: `./report.sh [--date YYYY-MM-DD]`

