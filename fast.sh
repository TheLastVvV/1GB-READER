chunk_size=1024000 # read the file in 1 MB chunks 1 MB is 1024000 bytes
counter=0
start_time=$(date +%s) # Get the start time in seconds
# while loop keep going til is less 1gb
while [ $counter -lt 1000000000 ]; do
  dd if=large.txt of=/dev/null bs=$chunk_size count=1
  counter=$((counter + chunk_size))
done
# dd command to read each chunk and write it to dev/null
end_time=$(date +%s) # get the end time in seconds
elapsed_time=$((end_time - start_time)) # calculate the elapsed time

echo "Time taken to read file: $elapsed_time seconds"
