% This script will ask the user for a path to the 3D files. 
% It will convert each volume into 155 slices and rewrite each slice into 
% Flair, T1, T1c or T2 folders 
 
% start_path = fullfile(matlabroot, '\toolbox');
% if ~exist(start_path, 'dir')
% 	start_path = matlabroot;
% end
clear;
% Ask user to confirm the folder, or change it.
uiwait(msgbox('Pick a starting folder on the next window that will come up.'));
topLevelFolder = uigetdir();  %dont need the start path
if topLevelFolder == 0
	return;
end

% topLevelFolder = 'C:\Users\Nabilla Abraham\Desktop\BRATS2015_Training\HGG';
fprintf('The top level folder is "%s".\n', topLevelFolder);

files = dir(sprintf('%s/**/*.mha', topLevelFolder));
nFiles = length(files);

currDir = 'Test_Sorted';
newFlair = strcat(currDir, '\','Flair')
mkdir(newFlair); 

newT1 = strcat(currDir, '\','T1');
mkdir(newT1); 

newT1C = strcat(currDir, '\','T1C')
mkdir(newT1C); 

newT2 = strcat(currDir, '\','T2')
mkdir(newT2); 

count = 1; 

for i = 1:nFiles
    currFile = fullfile(files(i).folder, files(i).name);
    img = mha_read_volume(currFile); 
    normImg = normalize(img,0,255);
    
%ax slice is 3rd idx; coronal is the 2nd idx; saggital is the first idx

    if contains(currFile, 'Flair') 
        for ax = 1:size(img,3)
            currImg = normImg(:,:,ax);
            newName = sprintf('Patient%d_Flair_Test_Slice %d.jpg', count,ax);
            newFilename = fullfile(newFlair, newName); 
            imwrite(currImg,newFilename, 'jpg');
        end
                
    elseif contains(currFile, 'T1') && ~contains(currFile,'T1c')
        for ax = 1:size(img,3)
            currImg = normImg(:,:,ax);
            newName = sprintf('Patient%d_T1_Test_Slice %d.jpg', count,ax);
            newFilename = fullfile(newT1, newName); 
            imwrite(currImg,newFilename, 'jpg');
        end
        
    elseif contains(currFile,'T1c')
        for ax = 1:size(img,3)
            currImg = normImg(:,:,ax);        
            newName = sprintf('Patient%d_T1C_Test_Slice %d.jpg', count,ax);
            newFilename = fullfile(newT1C, newName); 
            imwrite(currImg,newFilename, 'jpg');
        end

    elseif contains(currFile, 'T2')
        for ax = 1:size(img,3)
            currImg = normImg(:,:,ax);
            newName = sprintf('Patient%d_T2_Test_Slice %d.jpg', count,ax);
            newFilename = fullfile(newT2, newName); 
            imwrite(currImg,newFilename, 'jpg');
        end
        count = count + 1;
    end
end


