cd -- "$(dirname "$BASH_SOURCE")"
rsync -azP --exclude-from 'rsync_exclude.txt' ../t1/ negebauer@hercules.ing.puc.cl:t1
