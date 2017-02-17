function animate()
%makes a growing city
axis equal
axis off
whitebg('blue');
[music,fs] = audioread('The Books - You''ll Never Be Alone.mp3');
sound(music,fs);
walltex=imread('wallTexture.jpg');
grass=imread('grass.jpg');
    suntexture=imread('sun.jpg');
        moontexture=imread('moon.jpg');
     birdtex=imread('birbs.jpg');
    toptex=imread('top.jpg');
    
    imcell=[{toptex,walltex,walltex,walltex,walltex,walltex}];
    
%%%%MOVEMENT

    xx=[0,2,2,0,0,2,2,0];
    yy=[0,0,4,4,0,0,4,4];
    zz=[0,0,0,0,-18,-18,-18,-18];
    newpts=[xx;yy;zz];
    
    xxx=[-16,-12,-12,-16,-16,-12,-12,-16];
    yyy=[-12,-12,-14,-14,-12,-12,-14,-14];
    zzz=[0,0,0,0,-17,-15,-15,-17];
    newpts2=[xxx;yyy;zzz];
    
    xxxx=[-1,1,1,-1,-1,1,1,-1];
    yyyy=[-1,-1,1,1,-1,-1,1,1];
    zzzz=[0,0,0,0,-6,-6,-6,-6];
    newpts3=[xxxx;yyyy;zzzz];
    
for move=1:56
    rz=[cosd(move/56),-sind(move/56),0;sind(move/56),cosd(move/56),0;0,0,1];
    ry=[cosd(move/56),0,sind(move/56);0,1,0;-sind(move/56),0,cosd(move/56)];
    rx=[1,0,0;0,cosd(move/56),-sind(move/56);0,sind(move/56),cos(move/56)];
    
    
    axis([-20,20,-20,20,0,30]);
    axis off
    hold on
    
    view(move.^(2)*(.05-.1)-90,90-move*3/2);
    %view(3); %view from one point
    %sky
%     sq=linspace(-20,20);
%     [sq,sqq]=meshgrid(sq,sq);
%     surf(sqq,sq,sq*0+20,'FaceColor',[0,0,1],'edgecolor','none');

    %
    %surface
    %
    sq=linspace(-20,20);
    [sq,sqq]=meshgrid(sq,sq);
    surf(sqq,sq,sq*0,grass,'facecolor','texturemap','edgecolor','none');
    %bird
    [sunx,suny,sunz]=sphere(6);
   
    surf(sunx+sin(move*.08)*12,suny+cos(move*.1)*12,sunz+12+3*sin(move*.04),birdtex,'facecolor','texturemap','edgecolor','none');
    %sun
    [sunx,suny,sunz]=sphere(6);

    surf(sunx,suny+19*cos(move*.08),sunz+19*sin(move*.08),suntexture,'facecolor','texturemap','edgecolor','none');
    %moon
    [moonx,moony,moonz]=sphere(6);

    surf(moonx,moony+19*cos(move*.08),moonz-19*sin(move*.08),moontexture,'facecolor','texturemap','edgecolor','none');
    %t1
    
    newpts=rotPts(newpts,[2,4,0],[0,-180/56,0]);

    makeBuilding(newpts(1,:),newpts(2,:),newpts(3,:),'img',imcell);

    %t2
    newpts2=rotPts(newpts2,[-12,-12,0],[-180/56,0,0]);

    makeBuilding(newpts2(1,:),newpts2(2,:),newpts2(3,:),'img',imcell);

    newpts3=rotPts(newpts3,[-1,-1,0],[180/56,0,0]);

    makeBuilding(newpts3(1,:),newpts3(2,:),newpts3(3,:),'img',imcell);
    %t3
    
    [cylx,cyly,cylz]=cylinder(2);
    surf(cylx+4,cyly-12,cylz*12*move/56,walltex,'facecolor','texturemap','edgecolor','none');
    
    %t4
    
    [cylx2,cyly2,cylz2]=cylinder(2:-.25:0);
    surf(cylx2-10,cyly2+1,cylz2*10*move/56+12*move/56,walltex,'facecolor','texturemap','edgecolor','none');
    
    
    [cylx3,cyly3,cylz3]=cylinder(3);
    surf(cylx3-10,cyly3+1,cylz3*12*move/56,walltex,'facecolor','texturemap','edgecolor','none');

    [cylx3,cyly3,cylz3]=cylinder(2);
    surf(cylx3-10,cyly3+1,cylz3*16*move/56,walltex,'facecolor','texturemap','edgecolor','none');
%end cycle
    
    pause(.001);
    hold off
    if move<56
    clf;
    end
end
%
%
%%%%%%%%%%%%%%%%%%%%%
clear sound;
end
