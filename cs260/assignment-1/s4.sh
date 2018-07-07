date=`date`

# Assuming the entire time format (HH:MM:SS) counts as one item 
for item in $date; do
  echo $item
done
