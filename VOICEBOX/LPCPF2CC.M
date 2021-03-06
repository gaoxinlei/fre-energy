function cc=lpcpf2cc(pf,np)
%LPCPF2CC Convert power spectrum to complex cepstrum CC=(PF,NP)
% Note this conversion is not exact unless the pf() spectrum is much > np

%      Copyright (C) Mike Brookes 1998
%
%      Last modified Tue May 12 16:20:30 1998
%
%   VOICEBOX home page: http://www.ee.ic.ac.uk/hp/staff/dmb/voicebox/voicebox.html
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   This program is free software; you can redistribute it and/or modify
%   it under the terms of the GNU General Public License as published by
%   the Free Software Foundation; either version 2 of the License, or
%   (at your option) any later version.
%
%   This program is distributed in the hope that it will be useful,
%   but WITHOUT ANY WARRANTY; without even the implied warranty of
%   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%   GNU General Public License for more details.
%
%   You can obtain a copy of the GNU General Public License from
%   ftp://prep.ai.mit.edu/pub/gnu/COPYING-2.0 or by writing to
%   Free Software Foundation, Inc.,675 Mass Ave, Cambridge, MA 02139, USA.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if nargin<2 np=size(pf,2)-2; end
cc=irfft(log(pf.')).';
cc(:,1)=[];
[nf,p]=size(cc);
if np>p
   cc=[cc zeros(nf,np-p)];
else
   cc(:,np+1:p)=[];
end


