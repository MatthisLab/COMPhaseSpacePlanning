%ARSO_MotionCaptureMaster
clc
clear all
close all
if ispc %JSM PC
    codePath = 'C:\Users\jonma\Dropbox\ResearchProjects\GithubDesktop_DontEdit\COMPhaseSpacePlanning';
    dataPath = 'C:\Users\jonma\Google Drive\MotionCaptureProjects\COMPhaseSpacePlanningData\Data\Sub01\mat';
elseif ismac %MT Mac
    codePath = '/Users/MT/Documents/GitHub/COMPhaseSpacePlanning';
    dataPath = '/Users/MT/Google Drive File Stream/My Drive/MotionCaptureProjects/COMPhaseSpacePlanningData/Data/Sub01/mat';
end

cd(codePath)

%create method for changing directory to googledrive
addpath(genpath(cd)) %%add the current folder & subfolders to the path (so Matlab can see the BTK methods)

%% Experiment Info 
totalTrials =   11;
totalCond =     8;      %req for formatting trial results
totalExp =      12;     %req for formatting trial results

for trialNum = 1:totalTrials
    %% fid formatting
    fid = [dataPath filesep sprintf('trial%03d',trialNum) '.mat'];
    
    %% Initial conditions
    mmHeight = 1;
    kgMass   = 1;
    
    %% bodySegLength function
    % Function outputs length for individual body segs
    [bodySegLength] = calcBodySegLength(mmHeight);
    
    %% calcBodySegMass function
    % Function outputs mass for individual body segs
    [bodySegWeight,propSegWeight] = calcPropSegWeight(kgMass);
    
    %% Load data from specific fid
    % Function loads req outputs from .mat files
    [data_mar_dim_frame,markerLabels,numFrames,step_TO_HS,markerXYZ] = loadData(fid);
    
    %% Plot full body MoCap for trial from start to finish    
%     for fr = 1:10:numFrames
%         %Clear current frame
%         clf
%     
%         %Plot all markers in x,y, and z
%         plot3(data_mar_dim_frame(:, 1, fr),...
%             data_mar_dim_frame(:, 2, fr),...
%             data_mar_dim_frame(:, 3, fr),'k.','MarkerFaceColor','k')
%     
%         hold on
%     
%         %% Uncover the unknown marker location
%         plot3(markerXYZ(1,fr),...
%             markerXYZ(2,fr),...
%             markerXYZ(3,fr),'p','DisplayName','STRN');
%     
% %         %% Seg Evals in 3D
% %         %plot of total anatomical COM
% %         plot3(segCenter.RHandCenter_mar_dim_frame(1,fr),...
% %             segCenter.RHandCenter_mar_dim_frame(2,fr),...
% %             segCenter.RHandCenter_mar_dim_frame(3,fr),'p','DisplayName','Next');
% %     
% %         %% Total Body COM in 3D
% %         %plot of total anatomical COM
% %         plot3(totalCOMXYZ(1,fr),...
% %             totalCOMXYZ(2,fr),...
% %             totalCOMXYZ(3,fr),'p','DisplayName','TotalCOMXYZ');
%     %
%         %% Plotting parameters
%         axis equal
%         grid on
%         legend
%     
%         %optimal x y z graph limits
%         xlim([-1e3 5e3])
%         ylim([-1e3 1e3]) %full lab
%     %    ylim([1e3 3e3]) %smaller space
%         zlim([0 3e3])
%     
%         %unsure of what this section XYZs
%         az = -84.362;
%         el =  20.417;
%         view(az,el)
%        drawnow
%     end
    
    %     %% Butterworth filter
    %     order   = 4;
    %     cutoff  = 7;
    %
    %     [data_mar_dim_frame] = butterLowZero(order,cutoff,framerate,data); % data_mar_dim_frame, %left(1:numel(markerLabels),:,:) right(1:numel(markerLabels),1:3,:) Butterworth filter each marker's data and load it into the trial
    
    %% calcSegCOM function
    %Function outputs totalCOM considering marker location
    [segCenter] = calcPhaseSpaceSegCOM(data_mar_dim_frame,markerLabels); %,markerID)
    
    %% calcSegWeightCOM function
    %Function outputs totalCOM depending on seg weight
    [totalCOMXYZ] = calcSegWeightCOM(segCenter,propSegWeight);
    
    %% locEmptySegFrames function
    % Function outputs marker frames evaluation
    [emptyFrames] = locEmptySegFrames(segCenter,totalCOMXYZ);
    
    %% calcCOMXYZ_Vel_Acc_Jerk function
%     %function outputs vel,acc, and jerk values for totalCOM
    [totalCOM_calc,trial_start_end] = calcCOMXYZ_Vel_Acc_Jerk(totalCOMXYZ);
%     
%     %Individual total jerk per x y z position
%     COMx_totalJerk_per_frame = totalCOM_calc.absMarJerkx./length(trial_start_end);
%     COMx_totalJerk_per_trial(trialNum) = sum(COMx_totalJerk_per_frame);
%     COMy_totalJerk_per_frame = totalCOM_calc.absMarJerky./length(trial_start_end);
%     COMy_totalJerk_per_trial(trialNum) = sum(COMy_totalJerk_per_frame);
%     COMz_totalJerk_per_frame = totalCOM_calc.absMarJerkz./length(trial_start_end);
%     COMz_totalJerk_per_trial(trialNum) = sum(COMz_totalJerk_per_frame);
%     
%     %Total jerk per x-y position
%     totalCOM_jerk_per_frame = totalCOM_calc.totalmarJerk_abs./length(trial_start_end);
%     totalCOM_jerk_per_trial(trialNum) = sum(totalCOM_jerk_per_frame);
    
    %% Calculates marker vel,acc,and jerk for trials
    [head,chest,hip,LThigh,RThigh,LLeg,RLeg,LFoot,RFoot] = calcMar_Vel_Acc_Jerk(segCenter,trial_start_end);

    %% Filter step finder
    [rev_step_TO_HS] = stepFilter(step_TO_HS,markerXYZ,trial_start_end);
    %change start time depending on trial_start_end
    
    %% Plot head, chest, hip, and feet
    %Create function that plots marker in x,y,z
    plotMar_vel_acc_jerk(head,chest,hip,LThigh,RThigh,LLeg,RLeg,LFoot,RFoot,trialNum,rev_step_TO_HS);


    
    %         %% ZeniStepFinder
    %         % Identify all heel-toe step locations
    %         [allSteps,step_hs_to_ft_XYZ,peaks,hs_to_ft_Data] = ZeniStepFinder_ccpVid_modified(data_mar_dim_frame, markerLabels,framerate);
    
    %     %% Vel_Acc_Jerk_per_step
    %     [totalCOM_totalJerk_per_step,totalAnkleJerk_per_step] = Vel_Acc_Jerk_per_step(step_TO_HS,RFoot,LFoot,totalCOM_calc,numFrames);
    %
    % %     rJerk_per_trial(trialNum) =       rFoot_totalJerk;
    % %     lJerk_per_trial(trialNum) =       lFoot_totalJerk;
    %     totalJerk_per_trial(trialNum) =             totalAnkleJerk_per_step;
    %     totalCOM_totalJerk_per_trial(trialNum) =    totalCOM_totalJerk_per_step;
    
end

%% Find conditions of different trials
% [condMatrix] = formatCond(totalCOM_jerk_per_trial,COMx_totalJerk_per_trial,...
%     COMy_totalJerk_per_trial,COMz_totalJerk_per_trial,totalCond,totalExp);

%Attempt to create vertical lines on figures
% y = max(RFoot.marVelx).*ones(size(step_TO_HS,1),1);
% y = 0:max(RFoot.marVelx);%.*ones(size(step_TO_HS,1),1);
% y = 30;
% line(step_TO_HS(:,1),30,'Color','red','LineStyle','--')
