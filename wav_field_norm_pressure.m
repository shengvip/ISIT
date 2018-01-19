function P=wav_field_norm_pressure(P,x,y,xref,yref);
xysamples=44100;
% Use the half of the x axis and xref
[a,xidx] = find(x>xref(1),1);
[a,yidx] = find(y>yref(1),1);
% abs(x(1)-x(end))/xysamples gives us the maximum distance between to samples.
% If abs(x(xidx)-xref(1)) is greater this indicates that we are out of our
% bounds
%if isempty(xidx) || abs(x(xidx)-xref(1))>2*abs(x(1)-x(end))/xysamples
 %   error('%s: your used conf.xref is out of your X boundaries',upper(mfilename));
%end
%if isempty(yidx) || abs(y(yidx)-xref(2))>2*abs(y(1)-y(end))/xysamples
%    error('%s: your used conf.xref is out of your Y boundaries',upper(mfilename));
%end
% Scale signal to 1
P = 1*P/real(P(yidx,xidx));
end