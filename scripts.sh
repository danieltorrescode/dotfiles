#!/bin/bash
## enter su mode
## chmod 766 script.sh
echo "###########################################" 
echo "script.sh start" 
date +'%d/%m/%Y %I:%M:%S'
echo "###########################################" 

bash colors.sh
bash essentials.sh
bash virtualenv.sh

echo "###########################################" 
echo "script.sh end" 
date +'%d/%m/%Y %I:%M:%S'
echo "###########################################" 