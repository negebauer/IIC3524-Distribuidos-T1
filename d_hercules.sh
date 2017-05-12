folder='t1_hercules'
cd -- "$(dirname "$BASH_SOURCE")"
rsync -e "ssh -i ~/.ssh/hercules" -azP --exclude-from 'exclude.txt' ../t1/ negebauer@hercules.ing.puc.cl:${folder}

source ~/Bash/uc.sh
hercules "mv ${folder}/MakefileTripio ${folder}/Makefile"
