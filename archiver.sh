#!/bin/bash

# Adapt this to your specific case
cd /your/root/folder/with/many/files

# Every archive has 1000 files. Change this accordingly to your needs.

find . -type f | split -l 10000 - files_part_

for part in files_part_*; do
    tar -czf "archive_${part}.tar.gz" -T "$part" --preserve-permissions
done

rm files_part_*
