#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"
ELEMENT_Q=$($PSQL "SELECT atomic_number, symbol, name, atomic_mass, melting_point_celsius, boiling_point_celsius, type FROM elements INNER JOIN properties USING (atomic_number) INNER JOIN types USING (type_id) WHERE CAST(atomic_number AS TEXT) LIKE '$1' OR symbol = '$1' OR name = '$1' ORDER BY atomic_number")

if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
elif [[ -z $ELEMENT_Q ]]
then
  echo "I could not find that element in the database."
else
  echo "$ELEMENT_Q" | while IFS="|" read ATOMIC_NUMBER SYMBOL NAME ATOMIC_MASS MELT_POINT BOIL_POINT TYPE
  do
    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELT_POINT celsius and a boiling point of $BOIL_POINT celsius."
  done
fi
