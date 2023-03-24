months=("January" "February" "March" "April" "May" "June" "July" "August" "September" "October" "November" "December")
declare -A birth_months

for i in {1..50}; do
  # Generate random birth month between January 1992 and December 1993
  birth_month=$(( ( RANDOM % 24 )  + 1 ))
  
  # Convert birth month to month name
  month_name=${months[(($birth_month - 1)) % 12]}
  
  # Add individual to birth month array
  if [ -z "${birth_months[$month_name]}" ]; then
    birth_months[$month_name]=$i
  else
    birth_months[$month_name]+=", $i"
  fi
done

# Print individuals with the same birth month
for month in "${!birth_months[@]}"; do
  echo "$month: ${birth_months[$month]}"
done
