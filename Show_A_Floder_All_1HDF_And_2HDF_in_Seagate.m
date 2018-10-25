clc;clear;close all;warning off;

path0 = pwd;
path=strcat(path0,'\');

%%
%添加.HDF文件路径
path_info1=path0(end-13:end);
path_info2=path0(1:6);
path_info3='ASCEND';
path_info4='DESCEND';

path_A_0=strcat(path_info2,path_info3);
path_A=strcat(path_A_0,path_info1);
path_D_0=strcat(path_info2,path_info4);
path_D=strcat(path_D_0,path_info1);

addpath(path_A);
addpath(path_D);

%%
%对于1.HDF
fileExt1 = '*MS1.HDF';
files1 = dir(fullfile(path0,fileExt1));
len1 = size(files1,1);

count_1A=0;
count_1D=0;
count_2A=0;
count_2D=0;
for i=1:len1
    %获得文件的字符串名
    fileName1 = strcat(path,files1(i,1).name);
    file_HDF_1_1=fileName1(end-45:end-5);
    file_HDF_1_2=fileName1(end-3:end);
    file_HDF_1=strcat(file_HDF_1_1,file_HDF_1_2);
    
    if(fileName1(34)=='A')
    count_1A=count_1A+1;
    data1A=hdf5info(fileName1);
    Cross_Tracks_1A=hdf5read(data1A.GroupHierarchy.Groups.Datasets(8));
    Along_Tracks_1A=hdf5read(data1A.GroupHierarchy.Groups.Datasets(1));
    mean_CrossTracks_1A(count_1A,:)=mean(Cross_Tracks_1A);
    mean_AlongTracks_1A(count_1A,:)=mean(Along_Tracks_1A);
    variance__CrossTracks_1A(count_1A,:)=var(Cross_Tracks_1A);
    variance__AlongTracks_1A(count_1A,:)=var(Along_Tracks_1A);
    Error_latitudes_1A=hdf5read(data1A.GroupHierarchy.Groups.Datasets(9));
    Error_longitudes_1A=hdf5read(data1A.GroupHierarchy.Groups.Datasets(10));
    mean_Error_latitudes_1A(count_1A,:)=mean(Error_latitudes_1A);
    mean_Error_longitudes_1A(count_1A,:)=mean(Error_longitudes_1A);
    
    
    %像素计算
%     RowIndex1=hdf5read(data1.GroupHierarchy.Groups.Datasets(15))+1;
%     ColumnIndex1_1=hdf5read(data1.GroupHierarchy.Groups.Datasets(2))+1;
%     ColumnIndex1=floor(ColumnIndex1_1);
%     ErrorLat1=hdf5read(data1.GroupHierarchy.Groups.Datasets(9));
%     ErrorLon1=hdf5read(data1.GroupHierarchy.Groups.Datasets(10));
%     
%     data1_HDF=hdf5info(file_HDF_1);
%     Latitude_1=double(hdf5read(data1_HDF.GroupHierarchy.Groups(2).Datasets(1)));%纬度
%     Longitude_1=double(hdf5read(data1_HDF.GroupHierarchy.Groups(2).Datasets(2)));%经度
% 
%     for j=1:size(RowIndex1,1)
%         Lat1(j,:)=Latitude_1(ColumnIndex1(j,:),RowIndex1(j,:));
%         Lat2(j,:)=Latitude_1(ColumnIndex1(j,:)+1,RowIndex1(j,:));
%         Pixels_Lat1(j,:)=abs(Lat1(j,:)-Lat2(j,:));%像素纬度长
%         Lon1(j,:)=Longitude_1(ColumnIndex1(j,:),RowIndex1(j,:));
%         Lon2(j,:)=Longitude_1(ColumnIndex1(j,:)+1,RowIndex1(j,:));
%         Pixels_Lon1(j,:)=abs(Lon1(j,:)-Lon2(j,:));%像素经度长
% 
%         Lat_Offset1(j,:)=ErrorLat1(j,:)/Pixels_Lat1(j,:);%纬度方向偏移的像素
%         Lon_Offset1(j,:)=ErrorLon1(j,:)/Pixels_Lon1(j,:);%经度方向偏移的像素
%     end

    Lat_Offset1A=hdf5read(data1A.GroupHierarchy.Groups.Datasets(24));
    Lon_Offset1A=hdf5read(data1A.GroupHierarchy.Groups.Datasets(25));
    mean_Lat_Offset_1A(count_1A,:)=mean(Lat_Offset1A);
    mean_Lon_Offset_1A(count_1A,:)=mean(Lon_Offset1A);
    end
    
    
    if(fileName1(34)=='D')
    count_1D=count_1D+1;
    data1D=hdf5info(fileName1);
    Cross_Tracks_1D=hdf5read(data1D.GroupHierarchy.Groups.Datasets(8));
    Along_Tracks_1D=hdf5read(data1D.GroupHierarchy.Groups.Datasets(1));
    mean_CrossTracks_1D(count_1D,:)=mean(Cross_Tracks_1D);
    mean_AlongTracks_1D(count_1D,:)=mean(Along_Tracks_1D);
    variance__CrossTracks_1D(count_1D,:)=var(Cross_Tracks_1D);
    variance__AlongTracks_1D(count_1D,:)=var(Along_Tracks_1D);
    Error_latitudes_1D=hdf5read(data1D.GroupHierarchy.Groups.Datasets(9));
    Error_longitudes_1D=hdf5read(data1D.GroupHierarchy.Groups.Datasets(10));
    mean_Error_latitudes_1D(count_1D,:)=mean(Error_latitudes_1D);
    mean_Error_longitudes_1D(count_1D,:)=mean(Error_longitudes_1D);

    Lat_Offset1D=hdf5read(data1D.GroupHierarchy.Groups.Datasets(24));
    Lon_Offset1D=hdf5read(data1D.GroupHierarchy.Groups.Datasets(25));

    mean_Lat_Offset_1D(count_1D,:)=mean(Lat_Offset1D);
    mean_Lon_Offset_1D(count_1D,:)=mean(Lon_Offset1D);
    end
end;

%对于2.HDF
fileExt2 = '*MS2.HDF';
files2 = dir(fullfile(path0,fileExt2));
len2 = size(files2,1);
for i=1:len2
    %获得文件的字符串名
    fileName2 = strcat(path,files2(i,1).name);
    file_HDF_2_1=fileName2(end-45:end-5);
    file_HDF_2_2=fileName2(end-3:end);
    file_HDF_2=strcat(file_HDF_2_1,file_HDF_2_2);
    
    if(fileName2(34)=='A')
    count_2A=count_2A+1;
    data2A=hdf5info(fileName2);
    Cross_Tracks_2A=hdf5read(data2A.GroupHierarchy.Groups.Datasets(8));
    Along_Tracks_2A=hdf5read(data2A.GroupHierarchy.Groups.Datasets(1));
    mean_CrossTracks_2A(count_2A,:)=mean(Cross_Tracks_2A);
    mean_AlongTracks_2A(count_2A,:)=mean(Along_Tracks_2A);
    variance__CrossTracks_2A(count_2A,:)=var(Cross_Tracks_2A);
    variance__AlongTracks_2A(count_2A,:)=var(Along_Tracks_2A);
    Error_latitudes_2A=hdf5read(data2A.GroupHierarchy.Groups.Datasets(9));
    Error_longitudes_2A=hdf5read(data2A.GroupHierarchy.Groups.Datasets(10));
    mean_Error_latitudes_2A(count_2A,:)=mean(Error_latitudes_2A);
    mean_Error_longitudes_2A(count_2A,:)=mean(Error_longitudes_2A);
    
    %像素计算
%     RowIndex2=hdf5read(data2.GroupHierarchy.Groups.Datasets(15))+1;
%     ColumnIndex2_1=hdf5read(data2.GroupHierarchy.Groups.Datasets(2))+1;
%     ColumnIndex2=floor(ColumnIndex2_1);
%     ErrorLat2=hdf5read(data2.GroupHierarchy.Groups.Datasets(9));
%     ErrorLon2=hdf5read(data2.GroupHierarchy.Groups.Datasets(10));
%     
%     data2_HDF=hdf5info(file_HDF_2);
%     Latitude_2=double(hdf5read(data2_HDF.GroupHierarchy.Groups(4).Datasets(5)));%纬度
%     Longitude_2=double(hdf5read(data2_HDF.GroupHierarchy.Groups(4).Datasets(6)));%经度
%     
%     for j=1:size(RowIndex2,1)
%         Lat3(j,:)=Latitude_2(ColumnIndex2(j,:),RowIndex2(j,:));
%         Lat4(j,:)=Latitude_2(ColumnIndex2(j,:)+1,RowIndex2(j,:));
%         Pixels_Lat2(j,:)=abs(Lat3(j,:)-Lat4(j,:));%像素纬度长
%         Lon3(j,:)=Longitude_2(ColumnIndex2(j,:),RowIndex2(j,:));
%         Lon4(j,:)=Longitude_2(ColumnIndex2(j,:)+1,RowIndex2(j,:));
%         Pixels_Lon2(j,:)=abs(Lon3(j,:)-Lon4(j,:));%像素经度长
% 
%         Lat_Offset2(j,:)=ErrorLat2(j,:)/Pixels_Lat2(j,:);%纬度方向偏移的像素
%         Lon_Offset2(j,:)=ErrorLon2(j,:)/Pixels_Lon2(j,:);%经度方向偏移的像素
%     end

    Lat_Offset2A=hdf5read(data2A.GroupHierarchy.Groups.Datasets(24));
    Lon_Offset2A=hdf5read(data2A.GroupHierarchy.Groups.Datasets(25));
    
    mean_Lat_Offset_2A(count_2A,:)=mean(Lat_Offset2A);
    mean_Lon_Offset_2A(count_2A,:)=mean(Lon_Offset2A);
    end
    
    if(fileName2(34)=='D')
    count_2D=count_2D+1;
    data2D=hdf5info(fileName2);
    Cross_Tracks_2D=hdf5read(data2D.GroupHierarchy.Groups.Datasets(8));
    Along_Tracks_2D=hdf5read(data2D.GroupHierarchy.Groups.Datasets(1));
    mean_CrossTracks_2D(count_2D,:)=mean(Cross_Tracks_2D);
    mean_AlongTracks_2D(count_2D,:)=mean(Along_Tracks_2D);
    variance__CrossTracks_2D(count_2D,:)=var(Cross_Tracks_2D);
    variance__AlongTracks_2D(count_2D,:)=var(Along_Tracks_2D);
    Error_latitudes_2D=hdf5read(data2D.GroupHierarchy.Groups.Datasets(9));
    Error_longitudes_2D=hdf5read(data2D.GroupHierarchy.Groups.Datasets(10));
    mean_Error_latitudes_2D(count_2D,:)=mean(Error_latitudes_2D);
    mean_Error_longitudes_2D(count_2D,:)=mean(Error_longitudes_2D);

    Lat_Offset2D=hdf5read(data2D.GroupHierarchy.Groups.Datasets(24));
    Lon_Offset2D=hdf5read(data2D.GroupHierarchy.Groups.Datasets(25));
    
    mean_Lat_Offset_2D(count_2D,:)=mean(Lat_Offset2D);
    mean_Lon_Offset_2D(count_2D,:)=mean(Lon_Offset2D);
    end
end;

% %对于1.HDF一整天数据的平均
% allDay_mean_CrossTracks_1=mean(mean_CrossTracks_1);
% allDay_mean_AlongTracks_1=mean(mean_AlongTracks_1);
% allDay_variance_CrossTracks_1=mean(variance__CrossTracks_1);
% allDay_variance_AlongTracks_1=mean(variance__AlongTracks_1);
% allDay_mean_Lat_Offset_1=mean(mean_Lat_Offset_1);
% allDay_mean_Lon_Offset_1=mean(mean_Lon_Offset_1);
% 
% %对于2.HDF一整天数据的平均
% allDay_mean_CrossTracks_2=mean(mean_CrossTracks_2);
% allDay_mean_AlongTracks_2=mean(mean_AlongTracks_2);
% allDay_variance_CrossTracks_2=mean(variance__CrossTracks_2);
% allDay_variance_AlongTracks_2=mean(variance__AlongTracks_2);
% allDay_mean_Lat_Offset_2=mean(mean_Lat_Offset_2);
% allDay_mean_Lon_Offset_2=mean(mean_Lon_Offset_2);
% 
% data=[allDay_mean_CrossTracks_1,allDay_mean_AlongTracks_1,...
%     allDay_variance_CrossTracks_1,allDay_variance_AlongTracks_1,...
%     allDay_mean_Lat_Offset_1,allDay_mean_Lon_Offset_1,...
%     allDay_mean_CrossTracks_2,allDay_mean_AlongTracks_2,...
%     allDay_variance_CrossTracks_2,allDay_variance_AlongTracks_2,...
%     allDay_mean_Lat_Offset_2,allDay_mean_Lon_Offset_2];
% 
% date0=path0(end-7:end);
% path_0=path0(1:15);
% date=strcat(path_0,date0);
% 
% save(date0,'data');
% save(date,'data');

%对这一天的数据做折线图
% Length=1:len1;
% time=path_info1(end-7:end);
% %交轨误差均值
% figure;plot(Length,(mean_Lon_Offset_1),'k-','linewidth',1.5);
% hold on;plot(Length,(mean_Lon_Offset_2),'b:','linewidth',1.5);
% hold on;scatter(Length,(mean_Lon_Offset_1),'k*','linewidth',1.5);
% hold on;scatter(Length,(mean_Lon_Offset_2),'bo','linewidth',1.5);
% grid on;legend('调整前误差','调整后误差');title([time '-经度方向上像素偏差']);
% minLon1=min(1.2*min([mean_Lon_Offset_1;mean_Lon_Offset_2]),min([mean_Lon_Offset_1;mean_Lon_Offset_2]));
% maxLon1=max(1.5*max([mean_Lon_Offset_1;mean_Lon_Offset_2]),max([mean_Lon_Offset_1;mean_Lon_Offset_2]));
% axis([0, length(Length)+1, minLon1, maxLon1]);
% saveas(gcf,[time '-经度方向上像素偏差.tif']);
% %沿轨误差均值
% figure;plot(Length,(mean_Lat_Offset_1),'k-','linewidth',1.5);
% hold on;plot(Length,(mean_Lat_Offset_2),'b:','linewidth',1.5);
% hold on;scatter(Length,(mean_Lat_Offset_1),'k*','linewidth',1.5);
% hold on;scatter(Length,(mean_Lat_Offset_2),'bo','linewidth',1.5);
% grid on;legend('调整前误差','调整后误差');title([time '-纬度方向上像素偏差']);
% minLat1=min(1.2*min([mean_Lat_Offset_1;mean_Lat_Offset_2]),min([mean_Lat_Offset_1;mean_Lat_Offset_2]));
% maxLat1=max(1.5*max([mean_Lat_Offset_1;mean_Lat_Offset_2]),max([mean_Lat_Offset_1;mean_Lat_Offset_2]));
% axis([0, length(Length)+1, minLat1, maxLat1]);
% saveas(gcf,[time '-纬度方向上像素偏差.tif']);


%对这一天的数据做折线图
% Length=1:len1;
% time=path_info1(end-7:end);
% %交轨误差均值
% figure;plot(Length,abs(mean_AlongTracks_1),'k-','linewidth',1.5);
% hold on;plot(Length,abs(mean_AlongTracks_2),'b:','linewidth',1.5);
% hold on;scatter(Length,abs(mean_AlongTracks_1),'k*','linewidth',1.5);
% hold on;scatter(Length,abs(mean_AlongTracks_2),'bo','linewidth',1.5);
% grid on;legend('调整前误差','调整后误差');title([time '-经度方向上像素偏差']);
% minLon1=min(1.2*min([abs(mean_AlongTracks_1);abs(mean_AlongTracks_2)]),min([abs(mean_AlongTracks_1);abs(mean_AlongTracks_2)]));
% maxLon1=max(1.5*max([abs(mean_AlongTracks_1);abs(mean_AlongTracks_2)]),max([abs(mean_AlongTracks_1);abs(mean_AlongTracks_2)]));
% axis([0, length(Length)+1, minLon1, maxLon1]);
% saveas(gcf,[time '-经度方向上像素偏差.tif']);
% %沿轨误差均值
% figure;plot(Length,abs(mean_CrossTracks_1),'k-','linewidth',1.5);
% hold on;plot(Length,abs(mean_CrossTracks_2),'b:','linewidth',1.5);
% hold on;scatter(Length,abs(mean_CrossTracks_1),'k*','linewidth',1.5);
% hold on;scatter(Length,abs(mean_CrossTracks_2),'bo','linewidth',1.5);
% grid on;legend('调整前误差','调整后误差');title([time '-纬度方向上像素偏差']);
% minLat1=min(1.2*min([abs(mean_CrossTracks_1);abs(mean_CrossTracks_2)]),min([abs(mean_CrossTracks_1);abs(mean_CrossTracks_2)]));
% maxLat1=max(1.5*max([abs(mean_CrossTracks_1);abs(mean_CrossTracks_2)]),max([abs(mean_CrossTracks_1);abs(mean_CrossTracks_2)]));
% axis([0, length(Length)+1, minLat1, maxLat1]);
% saveas(gcf,[time '-纬度方向上像素偏差.tif']);


%对这一天的数据做折线图
% Length=1:len1;
% time=path_info1(end-7:end);
%交轨误差均值
% figure;plot(Length,abs(mean_Error_latitudes_1),'k-','linewidth',1.5);
% hold on;plot(Length,abs(mean_Error_latitudes_2),'b:','linewidth',1.5);
% hold on;scatter(Length,abs(mean_Error_latitudes_1),'k*','linewidth',1.5);
% hold on;scatter(Length,abs(mean_Error_latitudes_2),'bo','linewidth',1.5);
% grid on;legend('调整前误差','调整后误差');title([time '-经度方向上像素偏差']);
% minLon1=min(1.2*min([abs(mean_Error_latitudes_1);abs(mean_Error_latitudes_2)]),min([abs(mean_Error_latitudes_1);abs(mean_Error_latitudes_2)]));
% maxLon1=max(1.5*max([abs(mean_Error_latitudes_1);abs(mean_Error_latitudes_2)]),max([abs(mean_Error_latitudes_1);abs(mean_Error_latitudes_2)]));
% axis([0, length(Length)+1, minLon1, maxLon1]);
% saveas(gcf,[time '-经度方向上像素偏差.tif']);
% %沿轨误差均值
% figure;plot(Length,abs(mean_Error_longitudes_1),'k-','linewidth',1.5);
% hold on;plot(Length,abs(mean_Error_longitudes_2),'b:','linewidth',1.5);
% hold on;scatter(Length,abs(mean_Error_longitudes_1),'k*','linewidth',1.5);
% hold on;scatter(Length,abs(mean_Error_longitudes_2),'bo','linewidth',1.5);
% grid on;legend('调整前误差','调整后误差');title([time '-纬度方向上像素偏差']);
% minLat1=min(1.2*min([abs(mean_Error_longitudes_1);abs(mean_Error_longitudes_2)]),min([abs(mean_Error_longitudes_1);abs(mean_Error_longitudes_2)]));
% maxLat1=max(1.5*max([abs(mean_Error_longitudes_1);abs(mean_Error_longitudes_2)]),max([abs(mean_Error_longitudes_1);abs(mean_Error_longitudes_2)]));
% axis([0, length(Length)+1, minLat1, maxLat1]);
% saveas(gcf,[time '-纬度方向上像素偏差.tif']);


%%
% %升轨的经度调整前后
% Length=1:count_1A;
% time=path_info1(end-7:end);
% figure;plot(Length,abs(mean_Error_longitudes_1A),'k-','linewidth',1.5);
% hold on;plot(Length,abs(mean_Error_longitudes_2A),'b:','linewidth',1.5);
% hold on;scatter(Length,abs(mean_Error_longitudes_1A),'k*','linewidth',1.5);
% hold on;scatter(Length,abs(mean_Error_longitudes_2A),'bo','linewidth',1.5);
% grid on;legend('调整前误差','调整后误差');title([time '-升轨的经度调整前后偏差']);
% minLat1=min(1.2*min([abs(mean_Error_longitudes_1A);abs(mean_Error_longitudes_2A)]),min([abs(mean_Error_longitudes_1A);abs(mean_Error_longitudes_2A)]));
% maxLat1=max(1.5*max([abs(mean_Error_longitudes_1A);abs(mean_Error_longitudes_2A)]),max([abs(mean_Error_longitudes_1A);abs(mean_Error_longitudes_2A)]));
% axis([0, length(Length)+1, minLat1, maxLat1]);
% 
% %升轨的纬度调整前后
% Length=1:count_1A;
% time=path_info1(end-7:end);
% figure;plot(Length,abs(mean_Error_latitudes_1A),'k-','linewidth',1.5);
% hold on;plot(Length,abs(mean_Error_latitudes_2A),'b:','linewidth',1.5);
% hold on;scatter(Length,abs(mean_Error_latitudes_1A),'k*','linewidth',1.5);
% hold on;scatter(Length,abs(mean_Error_latitudes_2A),'bo','linewidth',1.5);
% grid on;legend('调整前误差','调整后误差');title([time '-升轨的纬度调整前后偏差']);
% minLat1=min(1.2*min([abs(mean_Error_latitudes_1A);abs(mean_Error_latitudes_2A)]),min([abs(mean_Error_latitudes_1A);abs(mean_Error_latitudes_2A)]));
% maxLat1=max(1.5*max([abs(mean_Error_latitudes_1A);abs(mean_Error_latitudes_2A)]),max([abs(mean_Error_latitudes_1A);abs(mean_Error_latitudes_2A)]));
% axis([0, length(Length)+1, minLat1, maxLat1]);
% 
% %降轨的经度调整前后
% Length=1:count_1D;
% time=path_info1(end-7:end);
% figure;plot(Length,abs(mean_Error_longitudes_1D),'k-','linewidth',1.5);
% hold on;plot(Length,abs(mean_Error_longitudes_2D),'b:','linewidth',1.5);
% hold on;scatter(Length,abs(mean_Error_longitudes_1D),'k*','linewidth',1.5);
% hold on;scatter(Length,abs(mean_Error_longitudes_2D),'bo','linewidth',1.5);
% grid on;legend('调整前误差','调整后误差');title([time '-降轨的经度调整前后偏差']);
% minLat1=min(1.2*min([abs(mean_Error_longitudes_1D);abs(mean_Error_longitudes_2D)]),min([abs(mean_Error_longitudes_1D);abs(mean_Error_longitudes_2D)]));
% maxLat1=max(1.5*max([abs(mean_Error_longitudes_1D);abs(mean_Error_longitudes_2D)]),max([abs(mean_Error_longitudes_1D);abs(mean_Error_longitudes_2D)]));
% axis([0, length(Length)+1, minLat1, maxLat1]);
% 
% %降轨的纬度调整前后
% Length=1:count_1D;
% time=path_info1(end-7:end);
% figure;plot(Length,abs(mean_Error_latitudes_1D),'k-','linewidth',1.5);
% hold on;plot(Length,abs(mean_Error_latitudes_2D),'b:','linewidth',1.5);
% hold on;scatter(Length,abs(mean_Error_latitudes_1D),'k*','linewidth',1.5);
% hold on;scatter(Length,abs(mean_Error_latitudes_2D),'bo','linewidth',1.5);
% grid on;legend('调整前误差','调整后误差');title([time '-降轨的纬度调整前后偏差']);
% minLat1=min(1.2*min([abs(mean_Error_latitudes_1D);abs(mean_Error_latitudes_2D)]),min([abs(mean_Error_latitudes_1D);abs(mean_Error_latitudes_2D)]));
% maxLat1=max(1.5*max([abs(mean_Error_latitudes_1D);abs(mean_Error_latitudes_2D)]),max([abs(mean_Error_latitudes_1D);abs(mean_Error_latitudes_2D)]));
% axis([0, length(Length)+1, minLat1, maxLat1]);



%%
%下面是像素
%升轨的经度调整前后像素
Length=1:count_1A;
time=path_info1(end-7:end);
figure;plot(Length,abs(mean_Lon_Offset_1A),'k-','linewidth',1.5);
hold on;plot(Length,abs(mean_Lon_Offset_2A),'b:','linewidth',1.5);
hold on;scatter(Length,abs(mean_Lon_Offset_1A),'k*','linewidth',1.5);
hold on;scatter(Length,abs(mean_Lon_Offset_2A),'bo','linewidth',1.5);
grid on;legend('调整前误差','调整后误差');title([time '-升轨的经度调整前后像素偏差']);
minLat1=min(1.2*min([abs(mean_Lon_Offset_1A);abs(mean_Lon_Offset_2A)]),min([abs(mean_Lon_Offset_1A);abs(mean_Lon_Offset_2A)]));
maxLat1=max(1.5*max([abs(mean_Lon_Offset_1A);abs(mean_Lon_Offset_2A)]),max([abs(mean_Lon_Offset_1A);abs(mean_Lon_Offset_2A)]));
axis([0, length(Length)+1, minLat1, maxLat1]);

%升轨的纬度调整前后
Length=1:count_1A;
time=path_info1(end-7:end);
figure;plot(Length,abs(mean_Lat_Offset_1A),'k-','linewidth',1.5);
hold on;plot(Length,abs(mean_Lat_Offset_2A),'b:','linewidth',1.5);
hold on;scatter(Length,abs(mean_Lat_Offset_1A),'k*','linewidth',1.5);
hold on;scatter(Length,abs(mean_Lat_Offset_2A),'bo','linewidth',1.5);
grid on;legend('调整前误差','调整后误差');title([time '-升轨的纬度调整前后像素偏差']);
minLat1=min(1.2*min([abs(mean_Lat_Offset_1A);abs(mean_Lat_Offset_2A)]),min([abs(mean_Lat_Offset_1A);abs(mean_Lat_Offset_2A)]));
maxLat1=max(1.5*max([abs(mean_Lat_Offset_1A);abs(mean_Lat_Offset_2A)]),max([abs(mean_Lat_Offset_1A);abs(mean_Lat_Offset_2A)]));
axis([0, length(Length)+1, minLat1, maxLat1]);

%降轨的经度调整前后
Length=1:count_1D;
time=path_info1(end-7:end);
figure;plot(Length,abs(mean_Lon_Offset_1D),'k-','linewidth',1.5);
hold on;plot(Length,abs(mean_Lon_Offset_2D),'b:','linewidth',1.5);
hold on;scatter(Length,abs(mean_Lon_Offset_1D),'k*','linewidth',1.5);
hold on;scatter(Length,abs(mean_Lon_Offset_2D),'bo','linewidth',1.5);
grid on;legend('调整前误差','调整后误差');title([time '-降轨的经度调整前后像素偏差']);
minLat1=min(1.2*min([abs(mean_Lon_Offset_1D);abs(mean_Lon_Offset_2D)]),min([abs(mean_Lon_Offset_1D);abs(mean_Lon_Offset_2D)]));
maxLat1=max(1.5*max([abs(mean_Lon_Offset_1D);abs(mean_Lon_Offset_2D)]),max([abs(mean_Lon_Offset_1D);abs(mean_Lon_Offset_2D)]));
axis([0, length(Length)+1, minLat1, maxLat1]);

%降轨的纬度调整前后
Length=1:count_1D;
time=path_info1(end-7:end);
figure;plot(Length,abs(mean_Lat_Offset_1D),'k-','linewidth',1.5);
hold on;plot(Length,abs(mean_Lat_Offset_2D),'b:','linewidth',1.5);
hold on;scatter(Length,abs(mean_Lat_Offset_1D),'k*','linewidth',1.5);
hold on;scatter(Length,abs(mean_Lat_Offset_2D),'bo','linewidth',1.5);
grid on;legend('调整前误差','调整后误差');title([time '-降轨的纬度调整前后像素偏差']);
minLat1=min(1.2*min([abs(mean_Lat_Offset_1D);abs(mean_Lat_Offset_2D)]),min([abs(mean_Lat_Offset_1D);abs(mean_Lat_Offset_2D)]));
maxLat1=max(1.5*max([abs(mean_Lat_Offset_1D);abs(mean_Lat_Offset_2D)]),max([abs(mean_Lat_Offset_1D);abs(mean_Lat_Offset_2D)]));
axis([0, length(Length)+1, minLat1, maxLat1]);