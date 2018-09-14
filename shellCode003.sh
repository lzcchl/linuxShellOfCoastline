#此脚本使用mv指令移动L1文件到OBC文件夹中
#算是另辟蹊径的方法，可以再研究研究软连接
#使用时，将此文件放在OBC文件夹，改为.sh格式
#使用终端运行即可

workdir=$(cd $(dirname $0); pwd)
#echo $workdir

dirL1=${workdir:0:14}
#echo $dirL1
Year=${workdir:end-14:5}
#echo $Year
YearMoonDay=${workdir:end-9:9}
#echo $YearMoonDay
A_Dir=$dirL1"/ASCEND"$Year$YearMoonDay
#echo $A_Dir
D_Dir=$dirL1"/DESCEND"$Year$YearMoonDay
#echo $D_Dir


obclist=`ls $workdir"/"`
#echo $obclist

for obc in $obclist
do 
  if [[ ${obc:end-12:12} = "OBCXX_MS.HDF" ]]
  then
    #echo $obc
    if [[ ${obc:9:1} = "D" ]]
    then
        echo $obc
        filemark1=${obc:0:33}
        #echo $filemark1
        filename1=$filemark1"010KM_MS.HDF"
        #echo $filename1
        path1=$D_Dir"/"$filename1
        #echo $path1
        mv $path1 $workdir
        newfile1_1=$filemark1"010KM_MS1.HDF"
        newfile1_2=$filemark1"010KM_MS2.HDF"

        ../../../coastline20180912Old ./$filename1 ../../../"gshhs_std.std" ./$newfile1_1
        ../../../MWRI_Correct ./$newfile1_1 $obc
        ioe1=$filemark1"010KM_MS_IOE.dat"
        ../../../IOEGPS_F3C_Linux ./$filename1 ./$ioe1 MWRI
        ../../../MWRIPGPS_F3C_Linux ./$filename1 $obc ./$ioe1
        ../../../coastline20180912New ./$filename1 ../../../"gshhs_std.std" ./$newfile1_2
    elif [[ ${obc:9:1} = "A" ]]
    then
        echo $obc
        filemark2=${obc:0:33}
        #echo $filemark2
        filename2=$filemark2"010KM_MS.HDF"
        #echo $filename2
        path2=$A_Dir"/"$filename2
        #echo $path2
        mv $path2 $workdir
        newfile2_1=$filemark2"010KM_MS1.HDF"
        newfile2_2=$filemark2"010KM_MS2.HDF"

        ../../../coastline20180912Old ./$filename2 ../../../"gshhs_std.std" ./$newfile2_1
        ../../../MWRI_Correct ./$newfile2_1 $obc
        ioe2=$filemark2"010KM_MS_IOE.dat"
        ../../../IOEGPS_F3C_Linux ./$filename2 ./$ioe2 MWRI
        ../../../MWRIPGPS_F3C_Linux ./$filename2 $obc ./$ioe2
        ../../../coastline20180912New ./$filename2 ../../../"gshhs_std.std" ./$newfile2_2
    fi
  fi
done