function [rStep_Acc,lStep_Acc,rStep_Jerk,lStep_Jerk] = Vel_Acc_Jerk_per_step(allSteps,subject_trial,trialName)

%% Formatting of vel,acc,jerk
%velocity
rAnkVel2D = subject_trial.RFoot.marVel';
lAnkVel2D = subject_trial.LFoot.marVel';
%acceleration
rAnkAcc2D = subject_trial.RFoot.marAcc';
lAnkAcc2D = subject_trial.LFoot.marAcc';
%jerk
rAnkJerk2D = subject_trial.RFoot.marAcc;
lAnkJerk2D = subject_trial.LFoot.marJerk';

%% Formatting step per foot
for ii = allSteps(:,3)
    allSteps_TO = allSteps(:,1);
    allSteps_HS = allSteps(:,2);
    
    %Right step id
    rStep_finder = find(ii == 1);
    rStep_id(:,1) = allSteps_TO(rStep_finder);
    rStep_id(:,2) = allSteps_HS(rStep_finder);
    
    %Left step id
    lStep_finder = find(ii == 2);    
    lStep_id(:,1) = allSteps_TO(lStep_finder);
    lStep_id(:,2) = allSteps_HS(lStep_finder);
end

%% Create frames of each step to reference
if rStep_id >= 0
    rStep_1(:,1) =  rStep_id(1,1):rStep_id(1,2);
    rStep_2(:,1) =  rStep_id(2,1):rStep_id(2,2);
    rStep_3(:,1) =  rStep_id(3,1):rStep_id(3,2);
    rStep_4(:,1) =  rStep_id(4,1):rStep_id(4,2);
%     rStep_5(:,1) =  rStep_id(5,1):rStep_id(5,2);
%     rStep_6(:,1) =  rStep_id(6,1):rStep_id(6,2);
end

% for ii = allSteps(:,1)
%     rStep_first(:,1) =  ii(1,1):ii(2,1);
%     rStep_second(:,1) = ii(3,1):ii(4,1);
%     rStep_third(:,1) =  ii(5,1):ii(6,1);
% end

% rTO_HS_frames_firstStep = rTO_HS(1):rTO_HS(2);
% rTO_HS_frames_secondStep = rTO_HS(3):rTO_HS(4);
% rTO_HS_frames_thirdStep = rTO_HS(5):rTO_HS(6);

if lStep_id >= 0
    lStep_1(:,1) =  lStep_id(1,1):lStep_id(1,2);
    lStep_2(:,1) =  lStep_id(2,1):lStep_id(2,2);
    lStep_3(:,1) =  lStep_id(3,1):lStep_id(3,2);
    lStep_4(:,1) =  lStep_id(4,1):lStep_id(4,2);
%     lStep_5(:,1) =  lStep_id(5,1):lStep_id(5,2);
%     lStep_6(:,1) =  lStep_id(6,1):lStep_id(6,2);
end

lTO_HS_frames_firstStep = lTO_HS(1):lTO_HS(2);
lTO_HS_frames_secondStep = lTO_HS(3):lTO_HS(4);
lTO_HS_frames_thirdStep = lTO_HS(5):lTO_HS(6);
lTO_HS_frames_fourthStep = lTO_HS(7):lTO_HS(8);
lTO_HS_frames_fifthStep = lTO_HS(9):lTO_HS(10);
lTO_HS_frames_sixthStep = lTO_HS(11):lTO_HS(12);
lTO_HS_frames_seventhStep = lTO_HS(13):lTO_HS(14);

%% Velocity per step
%Right foot
rVel_step1 =        rAnkVel2D(rTO_HS_frames_firstStep);
rStep_vel.step1 =   sum(rVel_step1);
rVel_step2 =        rAnkVel2D(rTO_HS_frames_secondStep);
rStep_vel.step2 =   sum(rVel_step2);
rVel_step3 =        rAnkVel2D(rTO_HS_frames_thirdStep);
rStep_vel.step3 =   sum(rVel_step3);

%Left foot
lVel_step1 =        lAnkVel2D(lTO_HS_frames_firstStep);
lStep_vel.step1 =   sum(lVel_step1);
lVel_step2 =        lAnkVel2D(lTO_HS_frames_secondStep);
lStep_vel.step2 =   sum(lVel_step2);
lVel_step3 =        lAnkVel2D(lTO_HS_frames_thirdStep);
lStep_vel.step3 =   sum(lVel_step3);
lVel_step4 =        lAnkVel2D(lTO_HS_frames_fourthStep);
lStep_vel.step4 =   sum(lVel_step4);
lVel_step5 =        lAnkVel2D(lTO_HS_frames_fifthStep);
lStep_vel.step5 =   sum(lVel_step5);
lVel_step6 =        lAnkVel2D(lTO_HS_frames_sixthStep);
lStep_vel.step6 =   sum(lVel_step6);
lVel_step7 =        lAnkVel2D(lTO_HS_frames_seventhStep);
lStep_vel.step7 =   sum(lVel_step7);

%Array of velocity taking place for right foot
% rTO_HS_vel = [rAnkVel2D(rTO_HS_frames_firstStep) rAnkVel2D(rTO_HS_frames_secondStep) rAnkVel2D(rTO_HS_frames_thirdStep)];

%% Acceleration per step
%Right foot
rAcc_step1 =        rAnkAcc2D(rTO_HS_frames_firstStep);
rStep_Acc.step1 =   sum(rAcc_step1);
rAcc_step2 =        rAnkAcc2D(rTO_HS_frames_secondStep);
rStep_Acc.step2 =   sum(rAcc_step2);
rAcc_step3 =        rAnkAcc2D(rTO_HS_frames_thirdStep);
rStep_Acc.step3 =   sum(rAcc_step3);

%Left foot
lAcc_step1 =        lAnkAcc2D(lTO_HS_frames_firstStep);
lStep_Acc.step1 =   sum(lAcc_step1);
lAcc_step2 =        lAnkAcc2D(lTO_HS_frames_secondStep);
lStep_Acc.step2 =   sum(lAcc_step2);
lAcc_step3 =        lAnkAcc2D(lTO_HS_frames_thirdStep);
lStep_Acc.step3 =   sum(lAcc_step3);
lAcc_step4 =        lAnkAcc2D(lTO_HS_frames_fourthStep);
lStep_Acc.step4 =   sum(lAcc_step4);
lAcc_step5 =        lAnkAcc2D(lTO_HS_frames_fifthStep);
lStep_Acc.step5 =   sum(lAcc_step5);
lAcc_step6 =        lAnkAcc2D(lTO_HS_frames_sixthStep);
lStep_Acc.step6 =   sum(lAcc_step6);
lAcc_step7 =        lAnkAcc2D(lTO_HS_frames_seventhStep);
lStep_Acc.step7 =   sum(lAcc_step7);

%% Jerk per step
%Right foot
rJerk_step1 =        rAnkJerk2D(rTO_HS_frames_firstStep);
rStep_Jerk.step1 =   sum(abs(rJerk_step1));
rJerk_step2 =        rAnkJerk2D(rTO_HS_frames_secondStep);
rStep_Jerk.step2 =   sum(abs(rJerk_step2));
rJerk_step3 =        rAnkJerk2D(rTO_HS_frames_thirdStep);
rStep_Jerk.step3 =   sum(abs(rJerk_step3));

%Left foot
lJerk_step1 =        lAnkJerk2D(lTO_HS_frames_firstStep);
lStep_Jerk.step1 =   sum(abs(lJerk_step1));
lJerk_step2 =        lAnkJerk2D(lTO_HS_frames_secondStep);
lStep_Jerk.step2 =   sum(abs(lJerk_step2));
lJerk_step3 =        lAnkJerk2D(lTO_HS_frames_thirdStep);
lStep_Jerk.step3 =   sum(abs(lJerk_step3));
lJerk_step4 =        lAnkJerk2D(lTO_HS_frames_fourthStep);
lStep_Jerk.step4 =   sum(abs(lJerk_step4));
lJerk_step5 =        lAnkJerk2D(lTO_HS_frames_fifthStep);
lStep_Jerk.step5 =   sum(abs(lJerk_step5));
lJerk_step6 =        lAnkJerk2D(lTO_HS_frames_sixthStep);
lStep_Jerk.step6 =   sum(abs(lJerk_step6));
lJerk_step7 =        lAnkJerk2D(lTO_HS_frames_seventhStep);
lStep_Jerk.step7 =   sum(abs(lJerk_step7));


