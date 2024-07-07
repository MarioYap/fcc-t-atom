#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"
ELEMENT_Q=$($PSQL "SELECT atomic_number, symbol, name, atomic_mass, melting_point_celsius, boiling_point_celsius, type FROM elements INNER JOIN properties USING (atomic_number) INNER JOIN types USING (type_id)")

if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
else
  echo "$ELEMENT_Q" | while IFS="|" read ATOMIC_NUMBER SYMBOL NAME ATOMIC_MASS MELT_POINT BOIL_POINT TYPE
  do
    echo "$ATOMIC_NUMBER $NAME $TYPE"
  done
fi
