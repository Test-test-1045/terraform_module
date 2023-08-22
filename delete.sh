    #!/bin/bash
    
    tarBranch=$(git branch -r --no-merged | grep -v main | grep -v feature | sed 's/origin\///')
    for branch in $tarBranch
    do
     echo $branch
     lastDate=$(git show -s --format=%ci origin/$branch)
     echo last date=$lastDate
     convertDate=$(echo $lastDate | cut -d' ' -f 1)
     echo  convertDate=$convertDate
     Todate=$(date -d "$convertDate" +'%s') #%s converts the date to seconds till date
     echo  Todate=$Todate
     current=$(date +'%s')
     echo current=$current
     day=$(( ( $current - $Todate )/60/60/24 ))
     echo "last commit on $branch branch was $day days ago"
     if [ "$day" -gt 20 ]; then
        echo "delete the old branch $branch"
     fi
     echo -----------------------------------------------------------------------
    done