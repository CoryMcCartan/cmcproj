# `data-raw/`

Raw data files used in your replication and exploratory analyses, and to make package data.
Scripts in this directory should process the raw data and save it to `data/` (for package data) or `data-out/` (for replication data).
By default, processing scripts are saved to Git, but data files are not.
To save a specific file to Git, add a rule to your `.gitigore`, as described at the top of that file.

