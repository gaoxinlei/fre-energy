function dl=lpcaa2dl(aa)
%LPCAA2DL LPC: Convert area coefficients to dct of log area DL=(AA)

% note: we do not correct for sinc distortion; perhaps we should multiply by
% k=1:p-1;s=[sqrt(0.5)/p 2*sin(pi*k/(2*p))./(pi*k)];



%      Copyright (C) Mike Brookes 1998
%
%      Last modified Fri Apr  3 14:57:15 1998
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

[nf,p2]=size(aa);
dl=rdct(log(aa(:,2:p2-1)./aa(:,p2*ones(1,p2-2))).').';


