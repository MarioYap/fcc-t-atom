#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"
ELEMENT_Q=$($PSQL "SELECT * FROM elements INNER JOIN properties USING (atomic_number) INNER JOIN types USING (type_id)")

echo "$ELEMENT_Q" | while read ATOMIC_NUMBER BAR NAME BAR SYMBOL BAR TYPE BAR ATOMIC_MASS BAR MELT_POINT BAR BOIL_POINT
do 
  # commands here
  echo "$ATOMIC_NUMBER $NAME"
done
