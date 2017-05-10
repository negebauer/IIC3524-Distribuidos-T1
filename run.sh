# Clear previous compiled
rm secuential
rm parallel

# Compile
make

# Image and param to use
img_def='lena'
kernel_def='blur'
if [[ -z $1 ]]; then img_in="test/img_in/${img_def}.png"; else img_in=$1; fi
if [[ -z $2 ]]; then kernel="test/kernel/${kernel_def}.txt"; else kernel=$2; fi
if [[ -z $3 ]]; then img_out="test/img_out/${img_def}_${kernel_def}.png"; else img_out=$3; fi

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
