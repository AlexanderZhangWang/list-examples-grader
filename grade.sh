# Create your grading script here


rm -rf student-submission
git clone $1 student-submission
cp TestListExamples.java student-submission
cp lib/hamcrest-core-1.3.jar student-submission
cp lib/junit-4.13.2.jar student-submission
cd student-submission
CPATH=".:hamcrest-core-1.3.jar:junit-4.13.2.jar"
if [ -f "ListExamples.java" ]
then
    echo ""
else 
    echo "ListExamples.java not found!!! 0/2"
    exit
fi
javac ListExamples.java 2> err-output.txt > out.txt 
if [ $? -eq 0 ]
then
    javac -cp $CPATH TestListExamples.java 2> err-output.txt > out.txt
else
    echo "ListExamples.java cannot be compiled!!! 0/2"
    exit
fi

java -cp $CPATH org.junit.runner.JUnitCore TestListExamples 2> err-output2.txt > out.txt
if [ $? -eq 0 ]
then
    echo "2/2!!!"
    exit
else
    grep -c "error:" err-output2.txt > result.txt
    cat result.txt
    echo "/2"
    exit
fi


