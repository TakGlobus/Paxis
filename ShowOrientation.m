% To show the orientation estimation result
function ShowOrientation(Orient,image,name)
%function ShowOrientation(Orient,image)
    figure('visible', 'off');
    %figure;
    %fig = figure;
    imagesc(image);
    %colormap(jet);
    colormap(gray);
    axis image;
    axis off;
    hold on;
    step1=size(image,1)/size(Orient,1);
    step2=size(image,2)/size(Orient,2);
    [x,y]=meshgrid(step1/2:step1:size(image,1),...
      step2/2:step2:size(image,2));
    u=real(Orient)./abs(Orient);  
    v=-imag(Orient)./abs(Orient);
    %h=quiver(x,y,v,u);
    h=quiver(x,y,v,u,'linewidth',5);
    set(h,'color','red');
    
    %figure;
    %A=angle(Orient);
    %A(A<0)=A(A<0)+pi;
    %A=180*A/pi;
    %imagesc(A);axis image;colormap(hsv);colorbar;

%  Tak add: Show orientation
    %r = atan2(h.VData, h.UData);
    %r = atan2(z.VData, z.UData);
    %display(rad2deg(r));


 % Tak add: Save image
    %print(gcf,'-djpeg',[name, '.jpg'],'-r100');

    %filename = [name,'.jpg'];
    %saveas("gcf", filename);
