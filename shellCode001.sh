#测试少量文件版本，初级版
workdir=$(cd $(dirname $0); pwd)
#echo $workdir

#mv（移动）：用来剪切和复制文件，这样即使L1和OBC不在同一路径也能运行
###path=${workdir:0:25}
####echo $path
###mv $path"FY3C_MWRIA_GBAL_L1_20180101_0516_OBCXX_MS.HDF" $workdir


filelist=`ls $workdir"/"`
for file in $filelist
do 
  if [[ ${file:end-9:9} = "KM_MS.HDF" ]]
  then
    echo $file
    newfile=${file:0:41}
    newfile1=$newfile"1.HDF"
    ./coastline20180912Old ./$file ./"gshhs_std.std" ./$newfile1
    obc=${file:0:33}
    obc1=$obc"OBCXX_MS.HDF"
    ./MWRI_Correct ./$newfile1 ./$obc1
    ioe=${file:0:41}
    ioe1=$ioe"_IOE.dat"
    newfile0=$path$file
    ./IOEGPS_F3C_Linux ./$file ./$ioe1 MWRI
    ./MWRIPGPS_F3C_Linux ./$file ./$obc1 ./$ioe1
    newfile2=$newfile"2.HDF"
    ./coastline20180912New ./$file ./"gshhs_std.std" ./$newfile2
  fi
done