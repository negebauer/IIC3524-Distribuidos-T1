# Clear previous compiled
rm secuential
rm parallel

# Compile
make

# Run stuff
print() {
  echo "--- $1 ---"
}
print 'Running secuential'
time ./secuential
print 'Done secuential'
echo ''
print 'Running parallel'
time ./parallel
print 'Done parallel'
echo ''

echo 'Done!'
