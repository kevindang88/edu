trap 'echo Control-C; exit 1' 2
while [ 1 ] 
do
  echo infinite loop
  sleep 2
done

