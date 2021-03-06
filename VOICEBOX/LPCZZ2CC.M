function cc=lpczz2cc(zz,np)
%LPCZZ2CC Convert poles to "complex" cepstrum CC=(ZZ,NP)


%      Copyright (C) Mike Brookes 1997
%
%      Last modified Tue May 12 16:16:10 1998
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

[nf,p]=size(zz);
if (nargin < 2) np=p; end
cc=zeros(nf,np);
yy=zz.';
if p<2			% special case 'cos sum() is weird
  cc(:,1)=real(zz);
  for k=2:np
    yy=yy.*zz.';
    cc(:,k)=real(yy).'/k;
  end
else
  cc(:,1)=sum(real(yy)).';
  for k=2:np
    yy=yy.*zz.';
    cc(:,k)=sum(real(yy)).'/k;
  end
end
