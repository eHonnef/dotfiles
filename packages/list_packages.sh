#!/bin/bash
# List the installed packages and save to packages.txt

if [ -f ./packages.txt ]; then
  echo "packages.txt exists, remove before continuing."
  exit
else
  touch packages.txt

  for pkg in `comm -23 <(apt-mark showmanual | sort -u) \
              <(gzip -dc /var/log/installer/initial-status.gz \
              | sed -n 's/^Package: //p' | sort -u)`
  do
    echo "$pkg" >> ./packages.txt
  done
fi