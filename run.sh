# Clear previous compiled
rm secuential
rm parallel

# Compile
make

# Image and param to use
if [[ -z $1 ]]; then img_in='test/img_in/lena.png'; else img_in=$1; fi
if [[ -z $2 ]]; then kernel='test/kernel/blur.txt'; else kernel=$2; fi
if [[ -z $3 ]]; then img_out='test/img_out/lena_blur.txt'; else img_out=$3; fi

# Run stuff
print() {
  echo "--- $1 ---"
}
print 'Running secuential'
time ./secuential $img_in $kernel $img_out
print 'Done secuential'
echo ''
print 'Running parallel'
time ./parallel $img_in $kernel $img_out
print 'Done parallel'
echo ''

echo 'Done!'
