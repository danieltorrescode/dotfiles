#!/bin/bash
## enter su mode
## chmod 766 -R /home/daniel/Documentos/bash/
# #   rwx
# 0   000
# 1   001
# 2   010
# 3   011
# 4   100
# 5   101
# 6   110
# 7   111
echo "###########################################" 
echo "script.sh start" 
date +'%d/%m/%Y %I:%M:%S'
echo "###########################################" 

bash essentials.sh
bash dotfiles.sh
bash st.sh
bash pip.sh

echo "###########################################" 
echo "script.sh end" 
date +'%d/%m/%Y %I:%M:%S'
echo "###########################################" 
