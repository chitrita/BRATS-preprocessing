# -*- coding: utf-8 -*-
"""
Created on Sun Apr 22 16:40:06 2018

@author: Nabilla Abraham
"""


from scipy import misc
from scipy import ndimage
from scipy import misc
import PIL 
import matplotlib.image as mpimg
import matplotlib.pyplot as plt
import numpy as np
import os


path = "C:\\Users\\Nabilla Abraham\\Desktop\\brats_preprocessing\\HGG Processed\\T1"
pathGT = 'C:\\Users\\Nabilla Abraham\\Google Drive\\MASc\\Thesis\\Ground_Truth\\HGG'
fnames = ['Patient2_T1_Axial_Slice {}.jpg'.format(i+1) for i in range(155)]


numofPat = 2
numofSlices = 155
   
f = []
data = np.empty((numofPat,240,240,numofSlices), dtype=np.uint8)
tmp = np.empty((240,240,numofSlices),dtype=np.uint8)

for pCount in range (numofPat):
    for sCount in range(numofSlices):
        #f = 'Patient{}_T1_Axial_Slice {}.jpg'.format(pCount+1, sCount+1)
        f = 'Patient{}-GT_Axial_Slice {}.jpg'.format(pCount+1,sCount+1)
        name = os.path.join(pathGT,f)
        img = mpimg.imread(name)
        tmp[:,:,sCount] = img

    data[pCount,:,:,:] = tmp
    
#plt.imshow(data[0,:,:,52])


#    f= ['Patient{}_T1_Axial_Slice {}.jpg'.format(count,i+1) for i in range(155)] 
#    data = np.array([mpimg.imread(os.path.join(path,f[i])) for i in range(155)], dtype=np.float32)

