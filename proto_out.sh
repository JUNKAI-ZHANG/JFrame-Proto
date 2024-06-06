cd /root/JFrame/JFrame-Proto/protocol

result=''
 
function ReadAllFileName()
{
  if [ "X$1" != 'X' ]
   then
         cd "$1"
  fi
  
  files=`ls`
for filename in $files;do
	
	if [ -d $filename ]
    	then
		#echo  "文件夹 $filename "
	        #递归	
		ReadAllFileName $filename 
			
	else
 
	if [ ${filename##*.} = 'proto' ]
	 then
		#	echo $filename
		  result=${result}" "$filename
	fi
	
	fi
done
	cd ..	
}
 
ReadAllFileName

cd /root/JFrame/src/proto
rm -rf *.pb.cc
rm -rf *.pb.h
 
cd /root/JFrame/JFrame-Proto/protocol

protoc --cpp_out=../../src/proto/ $result