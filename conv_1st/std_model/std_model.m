%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% School: Shanghai Jiao Tong University
% Author: Wenyao Chen
%
% Create Date: 2023/7/20
% Module Name: std_model
% Project Name: CNN first-layer convolution Design
% Description: Testbench data generator
%
% Revision:
% 2023/8/15:
% update the check procedure
% Additional Comments:
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc
clear
close all

% Parameter settings
fig_num = 10;
fig_seed = 1; % Must be no more than fig_num
fig_cyc = 10;
weight_num = 32;
fig_size = [30 10];
weight_size = [11 7];
rescale_param = [14 111];
check_flag = 0;

% Import data
fig_mat = zeros(fig_size(1),fig_size(2),fig_num);
weight_mat = zeros(weight_size(1),weight_size(2),weight_num);

disp('Loading the figure...');
for fig_cnt=1:1:fig_num
    fig_mat(:,:,fig_cnt) = importdata([num2str(fig_cnt),'.txt']);
end

disp('Loading the weight matrix...');
temp_weight_mat = importdata('Param_Conv_Weight.txt');
for weight_cnt=1:1:weight_num
    weight_mat(:,:,weight_cnt) = temp_weight_mat(((weight_cnt-1)*weight_size(1)+1):(weight_cnt*weight_size(1)),:);
end

disp('Loading the bias data...');
bias_mat = importdata('Param_Conv_Bias.txt');
disp('Done!');

% Caculate the standard result
disp('Start calculating...');
result_mat = zeros(fig_size(1)-weight_size(1)+1,fig_size(2)-weight_size(2)+1,fig_num,weight_num);
for fig_cnt=1:1:fig_num
    for weight_cnt=1:1:weight_num
        result_mat(:,:,fig_cnt,weight_cnt) = conv2(fig_mat(:,:,fig_cnt),rot90(weight_mat(:,:,weight_cnt),2),'valid');
        result_mat(:,:,fig_cnt,weight_cnt) = result_mat(:,:,fig_cnt,weight_cnt)+bias_mat(weight_cnt);
    end
end
result_mat(result_mat<0)=0; % Activation
result_mat = result_mat.*(rescale_param(2)*2^(-rescale_param(1))); % Rescale
disp('Done!');

% Generate hardware input
disp('Generating hardware input...');
disp('Figure reformating...');
fig_mat_hd = zeros(fig_size(1)*fig_size(2),1);
for fig_cnt=fig_seed
    fig_mat_hd(1:(fig_size(1)*fig_size(2)),1) = flipud(reshape(fig_mat(:,:,fig_cnt)',[fig_size(1)*fig_size(2),1]));
end
fig_mat_hd = dec2hex(fig_mat_hd,2);
fig_mat_div = char(zeros((fig_size(1)*fig_size(2))/4,10));
for fig_row = 1:1:(fig_size(1)*fig_size(2))/4
    fig_mat_div(fig_row,:) = [fig_mat_hd((fig_row-1)*4+4,:),fig_mat_hd((fig_row-1)*4+3,:),fig_mat_hd((fig_row-1)*4+2,:),fig_mat_hd((fig_row-1)*4+1,:),dec2hex(fig_row-1,2)];
end
writematrix(fig_mat_div,'figure.txt');
disp('Done!');


disp('Weight matrix reformating...');
weight_mat_hd = zeros(weight_num*weight_size(1)*weight_size(2),1);
for weight_cnt=1:1:weight_num
    weight_mat_hd(((weight_cnt-1)*weight_size(1)*weight_size(2)+1):(weight_cnt*weight_size(1)*weight_size(2)),1) = flipud(reshape(weight_mat(:,:,weight_cnt)',[weight_size(1)*weight_size(2),1]));
end
weight_mat_hd = dec2hex(weight_mat_hd);
weight_mat_div = char(zeros(weight_num*(weight_size(1)*weight_size(2)+4)/9,18));
for weight_cnt=1:1:weight_num
    temp_weight = weight_mat_hd(((weight_cnt-1)*weight_size(1)*weight_size(2)+1):(weight_cnt*weight_size(1)*weight_size(2)),:);
    temp_weight = ['00';'00';'00';'00';temp_weight];
    for div_cnt=1:1:(weight_size(1)*weight_size(2)+4)/9
        weight_mat_div((weight_cnt-1)*(weight_size(1)*weight_size(2)+4)/9+div_cnt,:) = [temp_weight((div_cnt-1)*9+1,:),temp_weight((div_cnt-1)*9+2,:),temp_weight((div_cnt-1)*9+3,:),temp_weight((div_cnt-1)*9+4,:),temp_weight((div_cnt-1)*9+5,:),temp_weight((div_cnt-1)*9+6,:),temp_weight((div_cnt-1)*9+7,:),temp_weight((div_cnt-1)*9+8,:),temp_weight((div_cnt-1)*9+9,:)];
    end
end
writematrix(weight_mat_div,'weight.txt');
disp('Done!');

disp('Bias matrix reformating...');
bias_mat_hd = dec2hex(fliplr(bias_mat),4);
bias_mat_hd = [dec2hex(rescale_param,4);bias_mat_hd];
bias_mat_addr = char(zeros(size(bias_mat_hd,1),size(bias_mat_hd,2)+2));
for bias_cnt=1:1:size(bias_mat_hd,1)
    bias_mat_addr(bias_cnt,:) = [bias_mat_hd(bias_cnt,:),dec2hex(size(bias_mat_hd,1)-bias_cnt,2)];
end
writematrix(bias_mat_addr,'bias.txt');
disp('Done!');

if check_flag==1
    fid = fopen('result.txt');
    raw_result = textscan(fid,'%s');
    hd_mat = zeros(4*weight_num*fig_cyc,20);
    temp_char = char(zeros(40,7));
    for hd_cnt=1:2:(4*weight_num*fig_cyc)
        temp = raw_result{1,1}{(hd_cnt+1)/2,1};
        for split_cnt=1:1:40
            temp_char(40-split_cnt+1,:) = ['0x',temp(((split_cnt-1)*2+1):(split_cnt*2)),'s32'];
        end
        hd_mat(hd_cnt:hd_cnt+1,:) = reshape(hex2dec(temp_char),[20,2])';
        hd_result = zeros(fig_size(1)-weight_size(1)+1,fig_size(2)-weight_size(2)+1,fig_cyc,weight_num);
        for fig_cnt=1:1:fig_cyc
            for weight_cnt=1:1:weight_num
                hd_result(:,:,fig_cnt,weight_cnt) = hd_mat(((fig_cnt-1)*weight_num+weight_cnt-1)*4+1:((fig_cnt-1)*weight_num+weight_cnt)*4,:)';
            end
        end
    end
    for fig_cnt=1:1:fig_cyc
        for weight_cnt=1:1:weight_num
            if sum((abs(result_mat(:,:,fig_seed,weight_cnt)-hd_result(:,:,fig_cnt,weight_cnt))>=1)&(abs(abs(result_mat(:,:,fig_seed,weight_cnt)-hd_result(:,:,fig_cnt,weight_cnt))-256)>=1),'all')==0
            % Do nothing
            else
                error('Check fail!');
            end
        end
    end
    disp('Check pass!');
end