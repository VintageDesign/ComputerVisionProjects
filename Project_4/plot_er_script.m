clear;
%force data regen
S = {dir(sprintf('%s/*.png','TrainingImages/Boat64/UnProcessed'))};
test_image_path = 'C:\Users\riley\git\computer_vison_projects\Project_4\TestImages\Boat32\UnProcessed\img_1.png';
[U, sigma, image_vector, mean_A, X] = generateSingleManifold(S);
k = plot_ER(image_vector, sigma);