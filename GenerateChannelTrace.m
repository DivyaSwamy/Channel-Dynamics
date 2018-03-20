function [Channel_Trace,OpenTimes,CloseTimes] = GenerateChannelTrace(tauop,tauclose,sample_time,total_time)
% March 20th 2018@ DS
% To generate a binary open close trace given that the channel
% has a mean open time of  tauop ms and a mean close time
% of taucl. 
% Sample_time = frame rate of experiment
% Total_time = total time you want to simulate the trace for
% VALIDATION
% To validate check mean(OpenTimes)*sample_time. It should equal tauop.
% Also mean(CloseTimes)*sample_time = tauclose.
% The exponential decay time you get from the distribution of OpenTimes and CloseTimes equal tauop and tauclose. 

Nsteps = ceil(total_time./sample_time);

% Generate Open Times
OpenTimes = -log(rand(1,Nsteps))*tauop; 
OpenTimes = ceil(OpenTimes./sample_time);

% Generate Close Times
CloseTimes = -log(rand(1,Nsteps))*tauclose;
CloseTimes = ceil(CloseTimes./sample_time);

% Put it together as sample trace.
Channel_Trace = zeros(1,Nsteps);
count = 1; tab = CloseTimes(count)+1;
while  tab <= Nsteps
       index_open = tab:tab+OpenTimes(count)-1;
       Channel_Trace(1,index_open)=1.0;
       tab = tab+OpenTimes(count)+CloseTimes(count+1);
       count=count+1;
end

return
end

