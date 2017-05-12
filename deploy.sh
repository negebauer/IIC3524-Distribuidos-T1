# cd -- "$(dirname "$BASH_SOURCE")"
# cd ..
# source ~/Bash/uc.sh
# tripioupload T1

cd -- "$(dirname "$BASH_SOURCE")"
rsync -azP ../T1/ negebauer@hercules.ing.puc.cl:T1/
