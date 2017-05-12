folder='t1_tripio'
cd -- "$(dirname "$BASH_SOURCE")"
source ~/Bash/uc.sh
hercules "rsync -e 'ssh -i ~/.ssh/tripio' -azP ~/t1_hercules/ tripio:${folder}"

source ~/Bash/uc.sh
tripio "chmod +x ${folder}/run.sh ${folder}/log_run.sh"
