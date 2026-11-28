# Local workout backups

WODLog's backup service exports a UTF-8 JSON document with the format identifier
`wodlog-workout-backup`, integer version `1`, and a `tables` object. Version 1
uses the workout columns from database schema 2. The backup version and database
schema version are tracked independently. Future schema changes need an explicit
adapter that preserves reading version 1.

The `tables` object contains these seven arrays, including empty arrays.

- `workout_sessions`
- `exercises`
- `workout_blocks`
- `workout_exercises`
- `performed_sets`
- `wod_results`
- `wod_prescription_snapshots`

Rows use database column names and include every column, including explicit
nulls. Booleans are JSON booleans, quantities and timestamps retain their stored
units, and prescription payloads retain their stored JSON string. Export reads
all tables in one transaction. App preferences stay on the device.

## Restore behavior

`WorkoutBackup.validateJson` checks the document before the UI offers restore.
`restoreJson` repeats the checks and replaces all seven tables in one Drift
transaction. An empty backup clears workout data. The service reports invalid
format, unsupported version, and duplicate records separately. If SQLite
rejects a write, all deletes and inserts roll back. Importing the same backup
again preserves the same data.

For the settings integration, use a local file picker and load only the file
the user selects. Show the full-replacement warning, including the impact of an
empty backup, and require confirmation. The proposed recovery step is to offer
saving the current snapshot before applying a replacement. A saved copy must
finish writing successfully before the app reports it as available for recovery.
The service currently accepts and returns JSON strings. The settings screen
will own file selection, local writes, confirmation, and localized error text.

## Privacy and storage

A backup is unencrypted and may contain workout dates, exercise details,
performance data, and personal notes. Keep it in a storage location you trust
and manage copies yourself. WODLog's backup service does not send the data to a
server. If you save or share the file through another service, that service may
sync or retain its own copy.
