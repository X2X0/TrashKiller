#!/bin/bash

set -e

echo "This script will permanently delete trash, temporary, and log files."
read -p "Are you sure you want to continue? (y/N): " confirm
if [[ "$confirm" != "y" && "$confirm" != "Y" ]]; then
    echo "Aborted by user."
    exit 1
fi

# Define arrays of paths/patterns
TRASH_PATHS=(
    "$HOME/.local/share/Trash/*"
    "$HOME/.local/share/Trash/files/*"
    "$HOME/.local/share/Trash/info/*"
    "$HOME/.Trash/*"
    "$HOME/.Trash/files/*"
    "$HOME/.Trash/info/*"
    "/root/.local/share/Trash/*"
    "/root/.local/share/Trash/files/*"
    "/root/.local/share/Trash/info/*"
    "/root/.Trash/*"
    "/root/.Trash/files/*"
    "/root/.Trash/info/*"
)

TEMP_PATHS=(
    "/tmp/*"
    "/var/tmp/*"
)

LOG_PATHS=(
    "/var/log/*"
    "/var/log/apt/*"
    "/var/log/dpkg.log*"
    "/var/log/syslog*"
    "/var/log/auth.log*"
    "/var/log/kern.log*"
    "/var/log/boot.log*"
    "/var/log/messages*"
    "/var/log/user.log*"
    "/var/log/wtmp*"
    "/var/log/btmp*"
    "/var/log/lastlog*"
    "/var/log/faillog*"
    "/var/log/cron.log*"
    "/var/log/mail.log*"
    "/var/log/mail.err*"
    "/var/log/mail.warn*"
    "/var/log/mail.info*"
    "/var/log/daemon.log*"
    "/var/log/debug*"
    "/var/log/Xorg.*.log*"
)

delete_paths() {
    local paths=("$@")
    for path in "${paths[@]}"; do
        if compgen -G "$path" > /dev/null; then
            echo "Removing $path"
            sudo rm -rf $path
        else
            echo "No files found for $path"
        fi
    done
}

echo "Cleaning trash..."
delete_paths "${TRASH_PATHS[@]}"

echo "Cleaning temporary files..."
delete_paths "${TEMP_PATHS[@]}"

echo "Cleaning log files..."
delete_paths "${LOG_PATHS[@]}"

echo "Trash and log files have been cleared."
echo "Temporary files have been removed."
echo "System cleanup completed successfully."
echo "You may want to run 'sudo apt autoremove' to clean up unused packages."
echo "For further cleanup, consider using tools like BleachBit or Stacer."
echo "Always ensure you have backups of important data before running cleanup scripts."
echo "Cleanup script executed successfully."
echo "Thank you for using trashkiller!"
