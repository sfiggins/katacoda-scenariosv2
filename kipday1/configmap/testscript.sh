FILE=trigger
while [ ! -f "$FILE" ]
do
  sleep 1
  echo "Not here"
done


echo "HERE"
