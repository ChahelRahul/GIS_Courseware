#!/usr/bin/env python
# coding: utf-8

# In[1]:


'''''''''''''''''''''
import IPython

IPython.Application.instance().kernel.do_shutdown(True)
'''''''''''''''''''''


# In[5]:


import os
import numpy
import arcpy
from arcpy import env
from arcpy.sa import *
import warnings
import matplotlib.pyplot as pit
import numpy.ma as ma
#import xarray as xr
#from shapely.geometry import mapping, box
#import geopandas as gpd
#import earthpy as et


# In[6]:


parent_directory=os.getcwd()
Aqua_Data=parent_directory+'\Aqua'
Terra_Data=parent_directory+'\Terra'
os.chdir(parent_directory)


# In[7]:


'''''''''''''''''
conda install -c conda-forge earthpy
conda install -c conda-forge/label/cf202003 earthpy
conda install -c conda-forge/label/cf202003 gdal
conda install -c conda-forge/label/gcc7 gdal
conda install -c conda-forge/label/broken gdal
conda install -c conda-forge/label/TEST gdal
conda install -c conda-forge rioxarray
conda install -c conda-forge/label/cf202003 rioxarray
'''''''''''''''''


# In[28]:


def hdf2tif(HDF_Folder,TIF_Folder,SubDataset):
    inputPath = HDF_Folder+"/" 
    outputPath = TIF_Folder+"/"
    inputPath=inputPath.replace('\\','/')
    outputPath=outputPath.replace('\\','/')
    os.chdir(inputPath)
    HDF_Arr=numpy.array(os.listdir(path=os.getcwd()))
    env.workspace=inputPath
    arcpy.env.scratchWorkspace=inputPath
    hdfList=os.listdir(os.getcwd())
    x=HDF_Arr.size
    y=0
    while x:
            x=x-1
            try:
                arcpy.ExtractSubDataset_management(inputPath+HDF_Arr[x],outputPath+HDF_Arr[x][8:-29]+".tif", )
            except:
                y=y+1
    print('File ignored count: '+str(y))


# In[29]:


hdf2tif('C:/Users/rahul/Desktop/GIS/69/Assessnemt1/Aqua/HDF','C:/Users/rahul/Desktop/GIS/69/Assessnemt1/Aqua/TIF','0')


# In[7]:


#import earthpy.spatial as es


# In[8]:


#import earthpy.plot as ep


# In[9]:


warnings.simplefilter('ignore')


# In[10]:


parent_folder=numpy.array(os.listdir(path=os.getcwd()))


# In[11]:


parent_folder


# In[12]:


arcpy.env.overwriteOutput = 1
arcpy.CheckOutExtension("Spatial")


# In[22]:


inPath=Aqua_Data+"/HDF/"
inPath=inPath.replace('\\','/')
os.chdir(inPath)
Aqua_HDF=numpy.array(os.listdir(path=os.getcwd()))
outPath=Aqua_Data+'/TIF/'
env.workspace=inPath
arcpy.env.scratchWorkspace=inPath
#hdfList=arcpy.ListRasters('*','HDF')
hdfList=os.listdir(os.getcwd())
x=Aqua_HDF.size
while x:
    x=x-1
    arcpy.ExtractSubDataset_management(inPath+Aqua_HDF[x],outPath+Aqua_HDF[x]+".tif", )
os.chdir(outPath)
Aqua_TIF=numpy.array(os.listdir(path=os.getcwd()))


# In[24]:


os.listdir(os.getcwd())
os.chdir(parent_directory)


# In[25]:


inPath=Terra_Data+"/HDF/"
inPath=inPath.replace('\\','/')
os.chdir(inPath)
Terra_HDF=numpy.array(os.listdir(path=os.getcwd()))
outPath=Terra_Data+'/TIF/'
env.workspace=inPath
arcpy.env.scratchWorkspace=inPath
#hdfList=arcpy.ListRasters('*','HDF')
hdfList=os.listdir(os.getcwd())
x=Terra_HDF.size
while x:
    x=x-1
    arcpy.ExtractSubDataset_management(inPath+Terra_HDF[x],outPath+Terra_HDF[x]+".tif", )
os.chdir(outPath)
Aqua_TIF=numpy.array(os.listdir(path=os.getcwd()))


# In[ ]:


##Extract Day time temperature in Aqua
os.mkdir("C:/Users/HP/Desktop/UoA/SECOND_SEMESTER/MAP_Algebra/Assessment1/Aqua_Day/") 
rootPath = "C:/Users/HP/Desktop/UoA/SECOND_SEMESTER/MAP_Algebra/Assessment1/AquaAss/" 
outputPath = "C:/Users/HP/Desktop/UoA/SECOND_SEMESTER/MAP_Algebra/Assessment1/Aqua_Day/" 
for filename in hdfList:
    print (rootPath+filename)
    arcpy.ExtractSubDataset_management(in_raster=rootPath+filename, out_raster=outputPath+filename[8:-29]+".tif", subdataset_index="0")
    
##Extract Night time temperature in Aqua
os.mkdir("C:/Users/HP/Desktop/UoA/SECOND_SEMESTER/MAP_Algebra/Assessment1/Aqua_Night/") 
rootPath = "C:/Users/HP/Desktop/UoA/SECOND_SEMESTER/MAP_Algebra/Assessment1/AquaAss/" 
outputPath = "C:/Users/HP/Desktop/UoA/SECOND_SEMESTER/MAP_Algebra/Assessment1/Aqua_Night/" 
for filename in hdfList:
    print (rootPath+filename)
    arcpy.ExtractSubDataset_management(in_raster=rootPath+filename, out_raster=outputPath+filename[8:-29]+".tif", subdataset_index="4")

