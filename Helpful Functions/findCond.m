function [condMatrix,configMatrix_mean,configMatrix_std] = findCond(totalCOM_jerk_per_trial)
%Find and organize conditions into matrix

%Condition structure for sub01
condNum = [0 4 7 2 1 5 6 3 0 3 6 5 1 2 7 4];
condNum_p1 = [0 4 7 2 1 5 6 3];
sort_condNum_p1 = sort(condNum_p1);
condNum_p2 = [0 3 6 5 1 2 7 4];
sort_condNum_p2 = sort(condNum_p1);

% condNum = [0 4 7 2 1 5 6 3 0 3 6 5 1 2 7 4];
% condMatrix = ones(12,16);
condMatrix = reshape(totalCOM_jerk_per_trial,[12,16]);
% condTitle = string(condNum);
% T = table(condMatrix,'RowNames',condTitle);





for ii = condNum
%     if ii(find(ii == 0))
    configMatrix_mean = mean(condMatrix,1);
    configMatrix_std =  std(condMatrix,0,1);
    condNum_sort = sort(condNum);
    figure(length(condNum))
    bar(configMatrix_mean)
    hold on
    error(configMatrix_mean,configMatrix_std);
end
        
        


% condMatrix = reshape(totalCOM_jerk_per_trial,[(length(totalCOM_jerk_per_trial)/12,16]);

% % condMatrix = ones(length(condNum),12);
% for ii = 1:length(condNum)
%     condMatrix(1,ii) = totalCOM_jerk_per_trial(ii); %trials 1:16
%     condMatrix(2,ii) = totalCOM_jerk_per_trial(ii+1:1+length(condNum)); %trials 17:32
%     condMatrix(3,ii) = totalCOM_jerk_per_trial(ii+1:1+length(condNum)); %trials 33:48
end
