#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=<database_name> -t --no-align -c"

echo "$($PSQL= "SELECT * FROM elements INNER JOIN properties USING (atomic_number) INNER JOIN types USING (type_id)")" | while read ATOMIC_NUMBER BAR NAME BAR SYMBOL BAR TYPE BAR ATOMIC_MASS BAR MELT_POINT BAR BOIL_POINT
do 
  # commands here
done