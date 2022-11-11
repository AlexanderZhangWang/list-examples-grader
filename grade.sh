# Create your grading script here

set -e

rm -rf student-submission
git clone $1 student-submission
cp TestListExamples.java student-submission
cd student-submission
if[[ -e "ListExamples.java" ]]
then 
    javac ListExamples.java
    if[[ $? -eq 0 ]]
    then
        echo "ListExamples.java cannot be compiled"
        exit
    fi
    javac -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar TestListExamples.java
    java TestListExamples.java 2> err-output.txt
    if[[ $? -eq 0 ]]
    then
        echo "2/2"
        exit
    fi
    echo grep -c "Error" err-output.txt "/2"
else 
    echo "ListExamples.java not found"
    exit
fi



