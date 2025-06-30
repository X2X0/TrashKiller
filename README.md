## **TrashKiller**

**trashkiller** is a Bash script for Linux systems that permanently deletes user and root trash, temporary files, and a wide range of system log files. It helps free up disk space and keep your system clean. The script prompts for confirmation before running and provides clear progress messages.

## Features

- Deletes trash files for both user and root accounts
- Cleans temporary directories (`/tmp`, `/var/tmp`)
- Removes system log files (including rotated logs and Xorg logs)
- Confirmation prompt to prevent accidental data loss
- Progress and summary messages

## Usage

1. **Download the script:**

   ```
   wget https://github.com/X2X0/TrashKiller/raw/main/trashkiller.sh
   chmod +x trashkiller.sh
   ```

2. **Run the script:**

   ```
   ./trashkiller.sh
   ```

   You will be prompted to confirm before any files are deleted. The script will require `sudo` privileges to remove system files.

## Important Notes

- **This script will permanently delete files.** Make sure you have backups of important data before running.
- Some files may require administrative privileges to delete.
- Deleting log files may make troubleshooting system issues more difficult.
- Use at your own risk.

## Further Cleanup

After running this script, you may also want to:

- Run `sudo apt autoremove` to clean up unused packages.
- Use tools like [BleachBit](https://www.bleachbit.org/) or [Stacer](https://github.com/oguzhaninan/Stacer) for additional system cleaning.

## License

MIT License

---

**Disclaimer:**  
This script is provided as-is. X2X0 is not responsible for any data loss or system issues caused by its use. Always review scripts and ensure you understand their actions before running them on your system.
