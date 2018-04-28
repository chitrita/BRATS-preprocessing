addpath('C:\Users\Nabila Abraham\Google Drive\MASc\Thesis\ReadData3D_version1k') 


folder = pwd;
imgs = dir(fullfile(folder,'*.mha'));

filename = fullfile(folder,imgs(1).name);
[V,info]=ReadData3D(filename);
    
V = mha_read_volume(filename);
XV = mha_read_volume(filename); 
imshow(squeeze(V(:,:,round(end/2))),[]);
imshow(squeeze(V(:,:,125)),[]);     

for i = 1:size(allfiles,1)
    if strfind(allfiles(i).name, 'Flair')
        fprintf('File #%d found flair\n',i); 
    end
end

