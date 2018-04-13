%Syntax
%   err = PS_Abort(StimN)
%Description
%   Causes all stimulation to cease immediately even if there is a pulse or arbitrary waveform in progress. This is in contrast to stopping stimulation by calling PS_StopStimChannel or PS_StopStimAllChannels.
%   StimN  - stimulator number to finalize (starts from 1)
%   Returns: 
%       -1 - invalid argument(s)
%       0 � OK, 
%       1 - device error.
