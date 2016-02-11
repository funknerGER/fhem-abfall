#!/bin/bash   
rm controls_fhemabfall.txt
find ./FHEM -type f \( ! -iname ".*" \) -print0 | while IFS= read -r -d '' f; 
  do
   out="UPD "$(stat -c %y  $f | cut -d. -f1)" "$(stat -c %s $f)" ${f}"
   echo ${out//.\//} >> controls_fhemabfall.txt
done

# CHANGED file
echo "FHEM ABFALL and more last change:" > CHANGED
echo $(date +"%Y-%m-%d") >> CHANGED
echo " - $(git log -1 --pretty=%B)" >> CHANGED






