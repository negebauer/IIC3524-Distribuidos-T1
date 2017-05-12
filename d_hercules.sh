cd -- "$(dirname "$BASH_SOURCE")"
rsync -e "ssh -i ~/.ssh/hercules" -azP --exclude-from 'exclude.txt' ../t1/ negebauer@hercules.ing.puc.cl:t1_hercules
