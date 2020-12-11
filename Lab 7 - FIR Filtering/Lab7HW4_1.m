%part 4.1
xx = 255*(rem(1:159,30)>19);
bb = [1,-1];
yy = firfilt(bb,xx);

n1 = 1:length(xx); %length of xx is 159
n2 = 1:length(yy); %length of yy is 160, which is one more than xx:
%the fiter adds one more value at the end where only half the filter is on
%the signal and the other half is in "empty space"
subplot(2,1,1);
stem(n1-1, xx(n1))
subplot(2,1,2);
stem(n2-1,yy(n2),'filled') %--Make black dots
xlabel('Time Index (n)')

%the FIR filter shows where transitions between 255 and 0 occur in xx


T = 1;
dd = [];
for i = 1:length(yy)
    if abs(yy(i)) >= T
        add = true;
        dd = [dd add];
    else
        add = false;
        dd = [dd add];
    end
end

edges = find(dd>0);
figure
n3 = 1:length(edges); %length of edge locations: 10
stem(n3-1, edges(n3))
xlabel('Time Index (n)')
%The side before the transition is marked as true.


