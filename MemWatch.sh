#!/bin/sh

#######################################################################################
######################## Author : Vinayaka V Ladwa ####################################
######################## Email : vinayakladwa@gmail.com ###############################
#######################################################################################
export $1
if [ $# -lt 1 ];
then
	echo "Process name is missing as argument, pass the process name as argument to script"
	echo "example ${1} process, $0"
	exit 1
fi

result=`which sed`
if [ -z $result ]; then
        echo "Error: sed command seems not to be present in this OS."
        echo "System defaults are missing.Sorry, Quitting from installation"
        echo "Thank You"
        exit 1
else
   SED=$result
fi

result=`which grep`
if [ -z $result ]; then
        echo "Error: grep command seems not to be present in this OS."
        echo "System defaults are missing.Sorry, Quitting from installation"
        echo "Thank You"
        exit 1
else
   GREP=$result
fi

result=`which awk`
if [ -z $result ]; then
        echo "Error: awk command seems not to be present in this OS."
        echo "System defaults are missing.Sorry, Quitting from installation"
        echo "Thank You"
        exit 1
else
   AWK=$result
fi

result=`which ps`
if [ -z $result ]; then
        echo "Error: ps command seems not to be present in this OS."
        echo "System defaults are missing.Sorry, Quitting from installation"
        echo "Thank You"
        exit 1
else
   PS=$result
fi

result=`which tail`
if [ -z $result ]; then
        echo "Error: tail command seems not to be present in this OS."
        echo "System defaults are missing.Sorry, Quitting from installation"
        echo "Thank You"
        exit 1
else
   TAIL=$result
fi

result=`which tail`
if [ -z $result ]; then
        echo "Error: tail command seems not to be present in this OS."
        echo "System defaults are missing.Sorry, Quitting from installation"
        echo "Thank You"
        exit 1
else
   TAIL=$result
fi

result=`which top`
if [ -z $result ]; then
        echo "Error: top command seems not to be present in this OS."
        echo "System defaults are missing.Sorry, Quitting from installation"
        echo "Thank You"
        exit 1
else
   TOP=$result
fi

result=`which lsof`
if [ -z $result ]; then
        echo "Error: losf command seems not to be present in this OS."
        echo "System defaults are missing.Sorry, Quitting from installation"
        echo "Thank You"
        exit 1
else
   LSOF=$result
fi


fileName=`echo $0 |$SED s/\.sh/\.log/`
fileName=$fileName.`hostname`;


CPULOG=/tmp/$$.log

java=$($PS -u $LOGNAME -o pid,command | $GREP "$1" | $GREP -v grep | $AWK 'NR==1{print $1}')
if [ -z $java ]
then
echo "Process is not running, Please start the process :-) "
exit 1
fi

${TOP} -b -n 1 -p $java >$CPULOG

javaCpu=$(cat $CPULOG | grep $1 | awk 'NR==1{print $9}')
javaMem=$(cat $CPULOG | grep $1 | awk 'NR==1{print $10}')
javalsof=$(${LSOF} -p $java |wc -l)
/bin/rm -rf $CPULOG

#javaRMVM=$(ps -u $LOGNAME -o rss,vsz,command -ae | grep "java" | grep -v grep| grep -v safe | awk 'NR==1{print $1 "|" $2}')



### Add header and set seqNo=1 when the log file is created for the first time
if [ ! -f $fileName ]
then

   seqNo=1

   echo "SeqNo , DateTime , $1 Cpu , $1 Mem , JAVA lsof"  > $fileName

fi

seqNo=`$TAIL -1 $fileName |grep -v DateTime |$AWK '{print $1}'`
seqNo=`expr $seqNo + 1`

echo "$seqNo , $( date +'%Y-%m-%d %H:%M:%S') , $javaCpu , $javaMem , $javalsof"  >> $fileName
