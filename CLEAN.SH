#!/bin/bash

# Kuhu salvestada
archive_dir="./archive"

# Loo vajadusel kaust
mkdir -p "$archive_dir"

# Formaat kuupäeva jaoks
current_date=$(date +%Y%d%m)

# Faili nimi
archive_filename="archive_$current_date.tar.gz"

# Lõvi osa. Leiab praegusest kaustast kõik failid mis ei ole CLEAN.sh ja mis on vanemad kui 0 päeva. Siis teeb tariga arhiivi ja kustutab failid.
find . -maxdepth 1 -type f -mtime +0  -not -name "CLEAN.sh" -exec tar -rvf "$archive_dir/$archive_filename" {} + -exec rm {} +
echo "See on tähtis muudatus!"

