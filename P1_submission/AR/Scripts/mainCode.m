clear all;close all;clc;
% cd rvctools;startup_rvc;cd ..;
cd ..;cd Data/;
refImage=rgb2gray(imread('ref_marker.png'));
video=vision.VideoFileReader('Tag1.mp4');cd ..;cd Scripts/;

firstFrame=rgb2gray(step(video));

figure
imshow(firstFrame)
hold on

x=1e3*[0.9710,1.0438,1.0438,0.9748]
y=[434,434,492.5,492.5];
% % firstFrame = imgaussfilt(firstFrame,2);
% % C=corner(firstFrame,19);
% % figure;
% % imshow(firstFrame);
% % hold on;
% % plot(C(:,1), C(:,2), 'r*');
% corner=icorner(firstFrame,'nfeat',19);
% corner.plot;
% cornerPt=corner.p;
% out=refImage;
% % num_frames=1;
% % generated_imgs = cell(num_frames, 1); 
% % for i = 1:num_frames
% %     draw_corners = {
% %       [corners(1,:,i) 5], ...
% %       [corners(2,:,i) 5], ...
% %       [corners(3,:,i) 5], ...
% %       [corners(4,:,i) 5], ...
% %     };
% %     generated_imgs{i} = insertShape(video_imgs{i}, ...
% %                         'FilledCircle',draw_corners{1},...
% %                         'Color','red');
% %     generated_imgs{i} = insertShape(generated_imgs{i}, ...
% %                         'FilledCircle',draw_corners{2},...
% %                         'Color','blue');
% %     generated_imgs{i} = insertShape(generated_imgs{i}, ...
% %                         'FilledCircle',draw_corners{3},...
% %                         'Color','green');
% %     generated_imgs{i} = insertShape(generated_imgs{i}, ...
% %                         'FilledCircle',draw_corners{4},...
% %                         'Color','black');
% % end