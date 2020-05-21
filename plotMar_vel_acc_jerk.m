function plotMar_vel_acc_jerk(head,chest,hip,LThigh,RThigh,LLeg,RLeg,LFoot,RFoot,trialNum,rev_step_TO_HS)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Function plots the x y z vel, acc, and jerk
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Velocity for markers in the x coordinate frames

figure(trialNum)

%head marker coordinates
subplot(3,2,1)
plot(head.marVelx,'k')
hold on
head_ylim = ylim;
%toe strike
for ii = 1:length(rev_step_TO_HS)
    plot([rev_step_TO_HS(ii,1) rev_step_TO_HS(ii,1)],[head_ylim(1) head_ylim(2)],'b')
end
%heel strike
for ii = 1:length(rev_step_TO_HS)
    plot([rev_step_TO_HS(ii,2) rev_step_TO_HS(ii,2)],[head_ylim(1) head_ylim(2)],'g')
end
title('Head Velx')

%chest marker coordinates
subplot(3,2,3)
plot(chest.marVelx,'k')
hold on
chest_ylim = ylim;
%toe strike
for ii = 1:length(rev_step_TO_HS)
    plot([rev_step_TO_HS(ii,1) rev_step_TO_HS(ii,1)],[chest_ylim(1) chest_ylim(2)],'b')
end
%heel strike
for ii = 1:length(rev_step_TO_HS)
    plot([rev_step_TO_HS(ii,2) rev_step_TO_HS(ii,2)],[chest_ylim(1) chest_ylim(2)],'g')
end
title('Chest Velx')

%hip marker coordinates
subplot(3,2,5)
plot(hip.marVelx,'k')
hold on
hip_ylim = ylim;
%toe strike
for ii = 1:length(rev_step_TO_HS)
    plot([rev_step_TO_HS(ii,1) rev_step_TO_HS(ii,1)],[hip_ylim(1) hip_ylim(2)],'b')
end
%heel strike
for ii = 1:length(rev_step_TO_HS)
    plot([rev_step_TO_HS(ii,2) rev_step_TO_HS(ii,2)],[hip_ylim(1) hip_ylim(2)],'g')
end
title('Hip Velx')

%LThigh & RThigh marker overlayed
subplot(3,2,2)
plot(LThigh.marVelx,'b')
hold on
plot(RThigh.marVelx,'r')
thigh_ylim = ylim;
%toe strike
for ii = 1:length(rev_step_TO_HS)
    plot([rev_step_TO_HS(ii,1) rev_step_TO_HS(ii,1)],[thigh_ylim(1) thigh_ylim(2)],'k')
end
%heel strike
for ii = 1:length(rev_step_TO_HS)
    plot([rev_step_TO_HS(ii,2) rev_step_TO_HS(ii,2)],[thigh_ylim(1) thigh_ylim(2)],'m')
end
title('LThigh & RThigh Velx')

%LLeg & RLeg marker overlayed
subplot(3,2,4)
plot(LLeg.marVelx,'b')
hold on
plot(RLeg.marVelx,'r')
leg_ylim = ylim;
%toe strike
for ii = 1:length(rev_step_TO_HS)
    plot([rev_step_TO_HS(ii,1) rev_step_TO_HS(ii,1)],[leg_ylim(1) leg_ylim(2)],'k')
end
%heel strike
for ii = 1:length(rev_step_TO_HS)
    plot([rev_step_TO_HS(ii,2) rev_step_TO_HS(ii,2)],[leg_ylim(1) leg_ylim(2)],'m')
end
title('LLeg & RLeg Velx')

%LFoot & RFoot marker overlayed
subplot(3,2,6)
plot(LFoot.marVelx,'b')
hold on
plot(RFoot.marVelx,'r')
foot_ylim = ylim;
for ii = 1:length(rev_step_TO_HS)
    plot([rev_step_TO_HS(ii,1) rev_step_TO_HS(ii,1)],[foot_ylim(1) foot_ylim(2)],'k')
end
%heel strike
for ii = 1:length(rev_step_TO_HS)
    plot([rev_step_TO_HS(ii,2) rev_step_TO_HS(ii,2)],[foot_ylim(1) foot_ylim(2)],'m')
end
title('LFoot & RFoot Velx')

%% Acceleration for markers in the x coordinate frames

figure(trialNum+100)

%head marker coordinates
subplot(3,2,1)
plot(head.marAccx,'k')
hold on
head_ylim = ylim;
%toe strike
for ii = 1:length(rev_step_TO_HS)
    plot([rev_step_TO_HS(ii,1) rev_step_TO_HS(ii,1)],[head_ylim(1) head_ylim(2)],'b')
end
%heel strike
for ii = 1:length(rev_step_TO_HS)
    plot([rev_step_TO_HS(ii,2) rev_step_TO_HS(ii,2)],[head_ylim(1) head_ylim(2)],'g')
end
title('Head Accx')

%chest marker coordinates
subplot(3,2,3)
plot(chest.marAccx,'k')
hold on
chest_ylim = ylim;
%toe strike
for ii = 1:length(rev_step_TO_HS)
    plot([rev_step_TO_HS(ii,1) rev_step_TO_HS(ii,1)],[chest_ylim(1) chest_ylim(2)],'b')
end
%heel strike
for ii = 1:length(rev_step_TO_HS)
    plot([rev_step_TO_HS(ii,2) rev_step_TO_HS(ii,2)],[chest_ylim(1) chest_ylim(2)],'g')
end
title('Chest Accx')

%hip marker coordinates
subplot(3,2,5)
plot(hip.marAccx,'k')
hold on
hip_ylim = ylim;
%toe strike
for ii = 1:length(rev_step_TO_HS)
    plot([rev_step_TO_HS(ii,1) rev_step_TO_HS(ii,1)],[hip_ylim(1) hip_ylim(2)],'b')
end
%heel strike
for ii = 1:length(rev_step_TO_HS)
    plot([rev_step_TO_HS(ii,2) rev_step_TO_HS(ii,2)],[hip_ylim(1) hip_ylim(2)],'g')
end
title('Hip Accx')

%LThigh & RThigh marker overlayed
subplot(3,2,2)
plot(LThigh.marAccx,'b')
hold on
plot(RThigh.marAccx,'r')
thigh_ylim = ylim;
%toe strike
for ii = 1:length(rev_step_TO_HS)
    plot([rev_step_TO_HS(ii,1) rev_step_TO_HS(ii,1)],[thigh_ylim(1) thigh_ylim(2)],'k')
end
%heel strike
for ii = 1:length(rev_step_TO_HS)
    plot([rev_step_TO_HS(ii,2) rev_step_TO_HS(ii,2)],[thigh_ylim(1) thigh_ylim(2)],'m')
end
title('LThigh & RThigh Accx')

%LLeg & RLeg marker overlayed
subplot(3,2,4)
plot(LLeg.marAccx,'b')
hold on
plot(RLeg.marAccx,'r')
leg_ylim = ylim;
%toe strike
for ii = 1:length(rev_step_TO_HS)
    plot([rev_step_TO_HS(ii,1) rev_step_TO_HS(ii,1)],[leg_ylim(1) leg_ylim(2)],'k')
end
%heel strike
for ii = 1:length(rev_step_TO_HS)
    plot([rev_step_TO_HS(ii,2) rev_step_TO_HS(ii,2)],[leg_ylim(1) leg_ylim(2)],'m')
end
title('LLeg & RLeg Accx')

%LFoot & RFoot marker overlayed
subplot(3,2,6)
plot(LFoot.marAccx,'b')
hold on
plot(RFoot.marAccx,'r')
foot_ylim = ylim;
for ii = 1:length(rev_step_TO_HS)
    plot([rev_step_TO_HS(ii,1) rev_step_TO_HS(ii,1)],[foot_ylim(1) foot_ylim(2)],'k')
end
%heel strike
for ii = 1:length(rev_step_TO_HS)
    plot([rev_step_TO_HS(ii,2) rev_step_TO_HS(ii,2)],[foot_ylim(1) foot_ylim(2)],'m')
end
title('LFoot & RFoot Accx')

end