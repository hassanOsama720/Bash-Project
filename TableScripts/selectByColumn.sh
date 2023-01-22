#!/bin/bash

echo $tableName
tableData="$currDB/$tableName.data"
tableFormat="$currDB/.$tableName.meta"

columns=();
dataTypes=();

# get column names and its dataType
read -d '\n' -r -a linesFormat < "$tableFormat"
for line in "${!linesFormat[@]}" # each line of the format table
do
  IFS=':' read -r -a column <<< "${linesFormat[line]}";

  name=${column[0]};
  dataType=${column[1]};

  columns+=($name)
  dataTypes+=($dataType);
done

clear -x;
echo "***********************************************";
echo "****** Columns in the $tableName table ********";

# show columnNames as options
while [ true ]; do
    select column in ${columns[@]};
    do
    	if [[ $REPLY > ${#columns[@]} ]]; then
		continue 2;
	fi
	let colIndex=($REPLY)
	selectedCol="${columns[$((colIndex-1))]}"
	selectedColDataType="${dataTypes[$((colIndex-1))]}"
	break 2;
    done    
done


clear -x;
echo "************************";
echo "Column: $selectedCol Data Type: $selectedColDataType"
        
        
# get the operator to compare with
operatorOptions=("==" "<" ">");
selectedOperator="";
while [ true ]; do
    select option in "${operatorOptions[@]}"
    do
    	if [[ $REPLY > ${#operatorOptions[@]} ]]; then
		continue 2;
	fi
    	selectedOperator=$option;
    	break 2;
            	
    done
done

clear -x;


#read new value from user
read -rp "Enter $selectedCol: " value;

# validate the new value type
if [[ $selectedColDataType == "number" ]]; then
    while ! [[ $value =~ ^[0-9]+$ ]]; do
    	echo "";
    	clear -x;
        echo "$selectedCol must be a number.";
        echo ""
        read -rp "Enter $selectedCol: " value;
    done
elif [[ $colDataType == "string" ]]; then
    while ! [[ $value =~ ^[a-zA-Z]+$ ]]; do
    	clear -x;
    	echo "";
        echo "$selectedCol must be a string.";
        echo ""
        read -rp "Enter $selectedCol: " value;
    done
fi
	 

clear -x;
echo "************ Result of $selectedCol $selectedOperator $value ************"; # display the rows that have the 

if [[ $selectedOperator = "==" ]]; then
awk -v i="$colIndex" -v v=$value -F':' '{if ($i == v) print $0;}' $tableData;

elif [[ $selectedOperator = "<" && $selectedColDataType = "number" ]]; then
awk -v i="$colIndex" -v v=$value -F':' '{if ($i < v) print $0;}' $tableData;

elif [[ $selectedOperator = ">" && $selectedColDataType = "number" ]]; then
awk -v i="$colIndex" -v v=$value -F':' '{if ($i > v) print $0;}' $tableData;

elif [[ $selectedOperator = "<" && $selectedColDataType = "string" ]]; then
echo "You cant use < operator with field with dataType string";

elif [[ $selectedOperator = ">" && $selectedColDataType = "string" ]]; then
echo "You cant use > operator with field with dataType string";

fi


echo "";
echo "";
echo "************************";
options=("Return To The Select Menu");

select option in "${options[@]}"
do
    case $option in
        "Return To The Select Menu") ./TableScripts/select.sh;;
        *) echo "No Such option $REPLY";;
    esac
done
