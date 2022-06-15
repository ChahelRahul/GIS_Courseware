#!/usr/bin/env python
# coding: utf-8

# # Assessment- 1 GG5569/70 
# ## Using Arcpy for Advance Map Algebra Application
# ### By: Rahul Chahel                         Student Id: 52100749
# ### Data Used: MYD11A2, MOD11A2        
# ### Time Period: January 2018 to December 2020
# ### Study Area: France

# ## Function to Reset Kernal- incase toolbar isn't present

# In[ ]:



#import IPython

#IPython.Application.instance().kernel.do_shutdown(True)


# # Imports and Attributes

# In[1]:


import os
import shutil
import numpy
import warnings
import arcpy
from arcpy import env
from arcpy.sa import *
arcpy.env.overwriteOutput=True   # Function to enable overwriting of data, it helps in prevention of error incase any part of program is run again and it try to create a file


# In[2]:


parent_directory=os.getcwd()
parent_directory


# ## Task 1: Download Aqua and Terra Datasets

# In[3]:


#wget_address='C:\Users\rahul\Desktop\GIS\69\P4\wget\bin\wget.exe'
#wget_address=wget_address.replace('\\','/')
#os.system(wget_address -P parent_directory+'/Terra/HDF' --USER "RahulChahel" --password "*******" -i parent_directory+'/5730169341download.txt')
#os.system(wget_address -P parent_directory+'/Aqua/HDF' --USER "RahulChahel" --password "*******" -i parent_directory+'/5730169341download1.txt')


# # Task 2: Extraction of subdataset for DayTime and NightTime from both Aqua and Terra .HDF files in . TIF format.

# In[4]:


#Creating a funtion to convert .HDF files to .TIF in an organised structure.
def hdf2tif(HDF_Folder,TIF_Folder,SubDataset,parent_directory):
    if not os.path.exists(HDF_Folder): #Function to check is there is need to create a new folder for destination or not
        os.makedirs(HDF_Folder)
    if not os.path.exists(TIF_Folder):
        os.makedirs(TIF_Folder)
    arcpy.env.overwriteOutput=True
    inputPath = HDF_Folder+"/" 
    outputPath = TIF_Folder+"/"
    inputPath=inputPath.replace('\\','/') # Function to replace all \ to / in the variable as Arcpy operates with '/' while os operated with '\'
    outputPath=outputPath.replace('\\','/')
    os.chdir(inputPath)
    HDF_Arr=numpy.array(os.listdir(path=os.getcwd())) #Function to create an array with name of all the files present in the current directory
    env.workspace=inputPath
    arcpy.env.scratchWorkspace=inputPath
    hdfList=os.listdir(os.getcwd())
    x=HDF_Arr.size
    y=0
    while x:
            x=x-1
            try:
                arcpy.ExtractSubDataset_management(inputPath+HDF_Arr[x],outputPath+HDF_Arr[x][8:-29]+".tif",SubDataset )
            except:
                y=y+1
    print('File ignored count: '+str(y))
    TIF_Folder=TIF_Folder.replace('\\','/')
    return TIF_Folder
    os.chdir(parent_directory)


# In[5]:


#Calling HDF to TIF conversion fuction for required directories and Creating list of folders containing tif files for future use.
tif_folder_list=numpy.array([])
tif_folder_list=numpy.append(tif_folder_list,hdf2tif(parent_directory+'/Aqua/HDF',parent_directory+'/Aqua/TIF/Aqua_D','0',parent_directory))
tif_folder_list=numpy.append(tif_folder_list,hdf2tif(parent_directory+'/Aqua/HDF',parent_directory+'/Aqua/TIF/Aqua_N','4',parent_directory))
tif_folder_list=numpy.append(tif_folder_list,hdf2tif(parent_directory+'/Terra/HDF',parent_directory+'/Terra/TIF/Terra_D','0',parent_directory))
tif_folder_list=numpy.append(tif_folder_list,hdf2tif(parent_directory+'/Terra/HDF',parent_directory+'/Terra/TIF/Terra_N','4',parent_directory))


# In[6]:


#Creating a function to apply Scale factors on tif files while preserving the original files
def Apply_Scale_Factor(TIF_Folder,Scale_Factor):
    TIF_Folder=TIF_Folder.replace('\\','/')
    os.chdir(TIF_Folder)
    rasterList=arcpy.ListRasters("*","TIF")
    if not os.path.exists(TIF_Folder+'/Original'):
        os.makedirs(TIF_Folder+'/Original')
    source_dir = TIF_Folder
    target_dir = TIF_Folder+'/Original'
    file_names = os.listdir(source_dir)
    for rasterList in file_names:
        source_dir=source_dir.replace('/','\\')
        target_dir=target_dir.replace('/','\\')
        shutil.move(os.path.join(source_dir, rasterList), target_dir)
    os.chdir(TIF_Folder+'/Original')
    y=0
    for rasterList in file_names:
        try:
            output_raster=arcpy.sa.Raster(rasterList)*Scale_Factor
            output_raster.save(source_dir+"/"+rasterList)
        except:
            y=y+1
    print('Files Ignored: '+str(y))


# In[7]:


#Calling Scale factor application function and appling on all the desired tif files
x=tif_folder_list.size
while x:
    try:
        Apply_Scale_Factor(tif_folder_list[x-1],0.02)
    except:
        Apply_Scale_Factor(tif_folder_list[x-1],0.02)
        print(tif_folder_list[x-1])
    x=x-1


# In[15]:


tif_folder_list  #Path list of all folder containing TIF files with applied scale factor


# ## Task 3: Create Mean of daily Daytime and Nighttime observations seprately for Aqua and Terra observations.

# In[16]:


def Raster_Mean(TIF_Folder,Mean_Folder,Output_Raster_Name):
    try:
        arcpy.CheckOutExtension("Spatial")
        arcpy.CheckOutExtension("ImageAnalyst")
    except:
        return "Necessary License not available"
    if not os.path.exists(Mean_Folder):
        os.makedirs(Mean_Folder)
    x=0
    Sum_Raster=0
    os.chdir(TIF_Folder)
    for file in os.listdir(TIF_Folder):
        if file.endswith(".tif"):
            x=x+1
            Sum_Raster=Sum_Raster+arcpy.Raster(file)
    Mean_Raster=Sum_Raster/x
    Mean_Raster.save(Mean_Folder+'/'+Output_Raster_Name+'.tif')


# In[17]:


x=tif_folder_list.size
while x:
    if not os.path.exists(tif_folder_list[x-1]+'/Mean'):
        os.makedirs(tif_folder_list[x-1]+'/Mean')
    name=tif_folder_list[0]+'/'
    Raster_Mean(tif_folder_list[x-1],tif_folder_list[x-1]+'/Mean',name[-7:-1]+'_mean')
    x=x-1


# ## Task 5: Conversion of all the Rasters form Kelvin to Celsius scale

# In[18]:


def Kelvin2Celsius(Input_Raster_Folder,Output_Folder):
    try:
        arcpy.CheckOutExtension("Spatial")
        arcpy.CheckOutExtension("ImageAnalyst")
    except:
        return "Necessary License not available"
    if not os.path.exists(Output_Folder):
        os.makedirs(Output_Folder)
    tif_file_list=numpy.array([])
    x=0
    Current_Raster=0
    os.chdir(Input_Raster_Folder)
    for file in os.listdir(Input_Raster_Folder):
        if file.endswith(".tif"):
            x=x+1
            Current_Raster=arcpy.Raster(file)
            Celsius_Raster=Current_Raster-273.1
            Celsius_Raster.save(Output_Folder+'/'+file+'_Celsius.tif')
    


# In[19]:


x=tif_folder_list.size
while x:
    if not os.path.exists(tif_folder_list[x-1]+'/CelsiusRaster'):
        os.makedirs(tif_folder_list[x-1]+'/CelsiusRaster')
    Kelvin2Celsius(tif_folder_list[x-1],tif_folder_list[x-1]+'/CelsiusRaster')
    x=x-1


# In[20]:


os.getcwd() #Function to check current working directory


# ## Task 4: Create Daily land surface Temperature using all four layers extracted

# In[21]:


def Daily_Mean_4(OriginLayer,Layer1,Layer2,Layer3):
    try:
        arcpy.CheckOutExtension("Spatial")
        arcpy.CheckOutExtension("ImageAnalyst")
    except:
        return "Necessary License not available"
    Daily_Mean_Folder=parent_directory+'/DailyMean'
    if not os.path.exists(Daily_Mean_Folder):
        os.makedirs(Daily_Mean_Folder)
    x=0
    tif_file_list=numpy.array([])
    os.chdir(OriginLayer)
    for file in os.listdir(OriginLayer):
        if file.endswith(".tif"):
            x=x+1
            tif_file_list=numpy.append(tif_file_list,file)
        x=tif_file_list.size
        y=0
        while x:
            y=y+1
            Raster1=arcpy.Raster(OriginLayer+'/'+tif_file_list[x-1])
            Raster2=arcpy.Raster(Layer1+'/'+tif_file_list[x-1])
            Raster3=arcpy.Raster(Layer2+'/'+tif_file_list[x-1])
            Raster4=arcpy.Raster(Layer3+'/'+tif_file_list[x-1])
            Mean = CellStatistics([Raster1, Raster2, Raster3, Raster4], "MEAN")
            Mean.save(Daily_Mean_Folder+'/'+tif_file_list[x-1]+'_Mean.tif')
            x=x-1


# In[22]:


Daily_Mean_4(tif_folder_list[1],tif_folder_list[1],tif_folder_list[2],tif_folder_list[3])


# ## Task 6: Apply Different Statistics using Cell Statistics.
#  Operations used:
#  <ol>
#     <br><li>Maximum: Raster Representing highest temprature in Region of interest(ROI) during time period January 2018 to December 2020
#     <br><li>Minimum: Raster Representing Lowest temprature in ROI during time period January 2018 to December 2020
#     <br><li>Range: Range Raster Represent the temperature variation in ROI during time period January 2018 to December 2020
#     <br><li>Majority: Majority temperaturea Raster gives a rough idea about the most occuring temperature in the region.
#     <br><li>Minority:Majority temperaturea Raster gives a rough idea about the least occuring(but still present) temperature in the region.

# In[23]:


Task6Directory=parent_directory+'/Task6'
if not os.path.exists(Task6Directory):
        os.makedirs(Task6Directory)


# In[48]:


def SerialAccess(FolderList):
    AllFileList=numpy.array([])
    x=FolderList.size
    y=0
    while x:
        os.chdir(FolderList[x-1])
        for file in os.listdir(FolderList[x-1]):
            if file.endswith(".tif"):
                AllFileList=numpy.append(AllFileList,FolderList[x-1]+'/'+file)
                y=y+1
        x=x-1
    print('Total TIF Files: '+ str(y))
    return AllFileList.tolist()


# In[49]:


MaximumTemperatureRaster=CellStatistics(SerialAccess(tif_folder_list),"MAXIMUM")
MaximumTemperatureRaster.save(Task6Directory+'/'+'MaximumTemperatureRaster.tif')


# In[51]:


MinimumTemperatureRaster=CellStatistics(SerialAccess(tif_folder_list),"MINIMUM")
MinimumTemperatureRaster.save(Task6Directory+'/'+'MinimumTemperatureRaster.tif')


# In[52]:


#TemperatureVariationRaster=CellStatistics(SerialAccess(tif_folder_list),"RANGE")
TemperatureVariationRaster=CellStatistics([MaximumTemperatureRaster,MinimumTemperatureRaster],"RANGE")
TemperatureVariationRaster.save(Task6Directory+'/'+'TemperatureVariationRaster.tif')


# In[53]:


MostCommonTemperatureRaster=CellStatistics(SerialAccess(tif_folder_list),"MAJORITY")
MostCommonTemperatureRaster.save(Task6Directory+'/'+'MostCommonTemperatureRaster.tif')


# In[54]:


LeastCommonTemperatureRaster=CellStatistics(SerialAccess(tif_folder_list),"MINORITY")
LeastCommonTemperatureRaster.save(Task6Directory+'/'+'LeastCommonTemperatureRaster.tif')

