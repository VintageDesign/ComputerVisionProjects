function image = selectImage()
S = {dir(sprintf('%s/*.png','TestImages/Boat32/UnProcessed')),...
    dir(sprintf('%s/*.png','TestImages/Cabinet32/UnProcessed')),...
    dir(sprintf('%s/*.png','TestImages/Cup32/UnProcessed')),...
    dir(sprintf('%s/*.png','TestImages/Flashlight32/UnProcessed')),...
    dir(sprintf('%s/*.png','TestImages/Car32/UnProcessed')),...
    dir(sprintf('%s/*.png','TestImages/Chair32/UnProcessed')),...
    dir(sprintf('%s/*.png','TestImages/Handle32/UnProcessed')),...
    dir(sprintf('%s/*.png','TestImages/HoseReel32/UnProcessed')),...
    dir(sprintf('%s/*.png','TestImages/ibook0132/UnProcessed')),...
    dir(sprintf('%s/*.png','TestImages/imac0432/UnProcessed')),...
    dir(sprintf('%s/*.png','TestImages/imac9832/UnProcessed')),...
    dir(sprintf('%s/*.png','TestImages/Keyboard32/UnProcessed')),...
    dir(sprintf('%s/*.png','TestImages/LED32/UnProcessed')),...
    dir(sprintf('%s/*.png','TestImages/Light132/UnProcessed')),...
    dir(sprintf('%s/*.png','TestImages/Light232/UnProcessed')),...
    dir(sprintf('%s/*.png','TestImages/Mug32/UnProcessed')),...
    dir(sprintf('%s/*.png','TestImages/Scooter32/UnProcessed')),...
    dir(sprintf('%s/*.png','TestImages/SprayBottle32/UnProcessed')),...
    dir(sprintf('%s/*.png','TestImages/Stapler32/UnProcessed')),...
    dir(sprintf('%s/*.png','TestImages/Trash32/UnProcessed'))};

    random = randi([1 64],1, 20);
    for k = 1:20
        cell = S{k};
        F = cell(random(k));
        string_names(k) = convertCharsToStrings( strcat(F.folder,'\',F.name));
       subplot(5, 4, k)
      
        I = imread(char(string_names(k)));
        imshow(I);
         xlabel("Object Number: " + k);
    end
    
    
    value = input('Please select an image to classify: ');
    image = char(string_names(value));
end