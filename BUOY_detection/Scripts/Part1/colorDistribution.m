close all;clear all;clc;cd ..;cd ..;
train = 'Images/TrainingSet/Frames/';
coroped='Images/TrainingSet/CroppedBuoys/';
mkdir('Output/Part1/');
folder = @(i) fullfile(sprintf('Output/Part1/%s_hist.jpg',i));
%%
SamplesR = [];
SamplesY = [];
SamplesG = [];
for k=1:20
    % Load image
    I = imread(sprintf('%s/%03d.jpg',train,k));
    I=imgaussfilt(I,2);
%     I=rgb2lab(I);
    % You may consider other color space than RGB
    R = double(I(:,:,1));
    G = double(I(:,:,2));
    B = double(I(:,:,3));
    % Collect Cropped samples
    %Red buoy
    maskR = imread(sprintf('%s/R_%03d.jpg',coroped,k));
    sample_ind_R = find(maskR > 0);
    RR = R(sample_ind_R);
    GR = G(sample_ind_R);
    BR = B(sample_ind_R);
    SamplesR = [SamplesR; [RR GR BR]];
    %Yellow buoy
    maskY = imread(sprintf('%s/Y_%03d.jpg',coroped,k));
    sample_ind_Y = find(maskY > 0);
    RY = R(sample_ind_Y);
    GY = G(sample_ind_Y);
    BY = B(sample_ind_Y);
    SamplesY = [SamplesY; [RY GY BY]];
    %Green buoy
    maskG = imread(sprintf('%s/G_%03d.jpg',coroped,k));
    sample_ind_G = find(maskG > 0);
    RG = R(sample_ind_G);
    GG = G(sample_ind_G);
    BG = B(sample_ind_G);
    SamplesG = [SamplesG; [RG GG BG]];
end
%%
% visualize the sample distribution
% figure,
% scatter3(SamplesR(:,1),SamplesR(:,2),SamplesR(:,3),'.');
% title('Pixel Color Distribubtion');
% xlabel('Red');
% ylabel('Green');
% zlabel('Blue');
% saveas(gcf,folder('R'));
% figure,
% scatter3(SamplesY(:,1),SamplesY(:,2),SamplesY(:,3),'.');
% title('Pixel Color Distribubtion');
% xlabel('Red');
% ylabel('Green');
% zlabel('Blue');
% saveas(gcf,folder('Y'));
% figure,
% scatter3(SamplesG(:,1),SamplesG(:,2),SamplesG(:,3),'.');
% title('Pixel Color Distribubtion');
% xlabel('Red');
% ylabel('Green');
% zlabel('Blue');
% saveas(gcf,folder('G'));
% close all;

%%
cd scripts/Part1/
[mu_r,sigma_r]=estimatPerameters(SamplesR);
[mu_y,sigma_y]=estimatPerameters(SamplesY);
[mu_g,sigma_g]=estimatPerameters(SamplesG);

save('ColorSamples.mat','mu_r','sigma_r','mu_y','sigma_y','mu_g','sigma_g');
