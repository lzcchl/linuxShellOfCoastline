#���ļ������Բ��������гɹ�����Ҫԭ��������ָ��Ŀ�ִ���ļ���Ҫ
#L1�ļ���OBC�ļ�ͬʱ����һ���ļ����£�Ԭ��ʦ˵�������ӿ��Խ��
#��һ��ʱ���̽�������ֲ��ᣬֻ��ʹ�ÿ����ı�������



#��������ϳ����Ӳ��
#���˽ű��ļ�����2T��Ӳ�̵�������\L1\ASCEND\2018\20180101��
#�ٽ����Ǻ�����ֵ�һ��5����ִ���ļ�����\L1Ŀ¼��
#���и��ļ�����
workdir=$(cd $(dirname $0); pwd)
#echo $workdir

dirL1=${workdir:0:14}
#echo $dirL1
dirL0=${workdir:10:4}
#echo $dirL0
AorD=${workdir:end-21:7}
#echo $AorD
Year=${workdir:end-14:5}
#echo $Year
YearMoonDay=${workdir:end-9:9}
#echo $YearMoonDay
obcDir=$dirL1"/OBC"$Year$YearMoonDay
#echo $obcDir

filelist=`ls $workdir"/"`
#echo $filelist
#:<<!
for file in $filelist
do 
  if [[ ${file:end-9:9} = "KM_MS.HDF" ]]
  then
    echo $file
    newfile=${file:0:41}
    #echo $newfile
    newfile1=$newfile"1.HDF"
    #echo $newfile1
    ../../../coastline20180912Old ./$file ../../../"gshhs_std.std" ./$newfile1
    obc=${file:0:33}
    obc1=$obcDir"/"$obc"OBCXX_MS.HDF"
    #echo $obc1
    ../../../MWRI_Correct ./$newfile1 ./$obc1
    ioe=${file:0:41}
    ioe1=$ioe"_IOE.dat"
    ../../../IOEGPS_F3C_Linux ./$file ./$ioe1 MWRI
    ../../../MWRIPGPS_F3C_Linux ./$file ./$obc1 ./$ioe1
    newfile2=$newfile"2.HDF"
    ../../../coastline20180912New ./$file ../../../"gshhs_std.std" ./$newfile2
  fi
done
#!