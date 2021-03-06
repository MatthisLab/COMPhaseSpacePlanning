function [rev_step_TO_HS] = stepFilter(step_TO_HS,markerXYZ,trial_start_end)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Filter step_TO_HS from zeniStepFinder
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Determine start of trial filter
% marker_diffx = diff(markerXYZ(1,:));
% marker_diffy = diff(markerXYZ(2,:));
% marker_diffz = diff(markerXYZ(3,:));


%% Filter for the start of the trial
marker = diff(markerXYZ(1,:));
for ii = 1:length(marker(1,:))
    startTrial = find(marker(1,:) >= 1.0,1);
    if startTrial >= 1.0
        startStep = find(step_TO_HS >= startTrial,1); %references 2nd row
        revised_step_TO_HS = (step_TO_HS(startStep:end,:));
    end
end

%% 2nd filter of unwanted steps 
for stepNum = 2:length(step_TO_HS)
%     stepNum %print out the steps that the loop is on
    currStepLeg = step_TO_HS(stepNum,3);
    prevStepLeg = step_TO_HS(stepNum-1,3);
    
    if isnan(prevStepLeg)
        continue       
    elseif currStepLeg == prevStepLeg
        step_TO_HS(stepNum,:) = nan;
    end
    
end %stepNum

step_TO_HS(isnan(step_TO_HS(:,3)),:) = [];    %delete data in path that has nans
rev_step_TO_HS = step_TO_HS(:,1:2) - trial_start_end(1);

end
