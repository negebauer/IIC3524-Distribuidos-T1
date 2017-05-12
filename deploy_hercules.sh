cd -- "$(dirname "$BASH_SOURCE")"
rsync -e "ssh -i ~/.ssh/hercules" -azP --exclude-from 'exclude_hercules.txt' ../t1/ negebauer@hercules.ing.puc.cl:t1_hercules

source ~/Bash/uc.sh
hercules "chmod +x deploy_tripio.sh"
