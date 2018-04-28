uiwait(msgbox('Pick a starting folder on the next window that will come up.'));
topLevelFolder = uigetdir(start_path);
if topLevelFolder == 0
	return;
end
fprintf('The top level folder is "%s".\n', topLevelFolder);

files = dir(topLevelFolder, '\**\*.mha'); 
files = dir('C:\Users\Nabilla Abraham\Desktop\BRATS2015_Training\HGG\**\*.mat')