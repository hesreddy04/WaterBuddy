# WaterBuddy: Hydration Tracker

A shell script-based tool to track water intake, send reminders, and generate reports.

## Setup
1. Clone the repository: `git clone <repo-url>`
2. Make scripts executable: `chmod +x setup.sh scripts/*.sh`
3. Run setup: `./setup.sh`
4. Start WaterBuddy: `./scripts/waterbuddy.sh`

## Requirements
- Ubuntu (EC2 instance)
- Bash, cron, shuf, awk

## Features
- Hourly reminders (configurable interval).
- Log water intake (glasses or ml).
- Daily report with ASCII progress bar.
- Multi-day history tracking.
- Motivational messages after logging.
- Customizable goal, interval, and message via `data/settings.conf`.

## Usage
Run `./scripts/waterbuddy.sh` and select options from the menu.

## Team
- Member 1: Reminder module, cron setup.
- Member 2: Logger and settings module.
- Member 3: Report, progress bar, main menu.
