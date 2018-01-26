function [] = GUI_10()
% Demonstrate how to make an image visible or invisible by pushbutton.
% Pushing the pushbutton makes the image appear and disappear to the user.
% Many people have trouble with this because just setting the axes property
% does not do the job.
%
%
% Author:  Matt Fig
% Date:  1/15/2010

S.fh = figure('units','pixels',...
              'position',[200 000 500 600],...
              'menubar','none',...
              'numbertitle','off',...
              'name','GUI',...
              'resize','off');
S.ax = axes('units','pixels',...
            'position',[0 200 500 400]);
        
S.pb = uicontrol('style','push',...
                 'units','pix',...
                 'position',[10 150 480 40],...
                 'fontsize',14,...
                 'string','Browse for Image',...
                 'callback',{@Browse,S});        
S.ed = uicontrol('style','edit',...
                 'unit','pix',...
                 'position',[10 80 350 40],...
                 'fontsize',14,...
                 'string','Image Path');
S.pb = uicontrol('style','push',...
                 'units','pix',...
                 'position',[370 80 120 40],...
                 'fontsize',14,...
                 'string','Load Image',...
                 'callback',{@ed_call,S});
             
A=imread('F:/PEP.png');
imshow(A, 'Parent', S.ax);
        
% S.im = load('F:/PEP.png');  % This is a built-in ML example.
% S.R = image(S.im.X);  % Display the image on S.ax.
% colormap(S.im.map);  % Set the figure's colormap.
% set(S.ax,'xtick',[],'ytick',[])  % Get rid of ticks.
% S.pb = uicontrol('style','push',...
%                  'units','pixels',...
%                  'position',[10 10 180 30],...
%                  'fontsize',14,...
%                  'string','INVISIBLE/VISIBLE',...
%                  'callback',{@pb_call,S});

% function [] = pb_call(varargin)
% % Callback for the pushbutton.
% S = varargin{3};  % Get the structure.
% switch get(S.R,'visible')
%     case 'on'
%         st = 'off';
%     case 'off'
%         st = 'on';
%     otherwise
%         close(S.fh)  % It would be very strange to end up here.
%         error('An unknown error occured in the callback')
% end
% set([S.R,S.ax],'visible',st)  % Set BOTH the image and axis visibility.

function []=Browse(varargin)
    S = varargin{3};
    hack('browse');

function [] = ed_call(varargin)
S = varargin{3};
str=get(S.ed,'string');
ha      ck('online', str);