log_file=t1.log
echo "### START ###" >> $log_file
echo "" >> $log_file
./run.sh >> $log_file 2>&1
echo "### DONE ###" >> $log_file
echo "" >> $log_file
