cd -- "$(dirname "$BASH_SOURCE")"
source ~/Bash/uc.sh
hercules "rsync -e 'ssh -i ~/.ssh/tripio' -azP ~/t1_hercules/ tripio:t1"

source ~/Bash/uc.sh
tripio "chmod +x run.sh log_run.sh"
