% output angle of vector
function ioangle(Orient,ofile)
    A=angle(Orient);
    A(A<0)=A(A<0)+pi;
    A=180*A/pi;

    % IO
    formatSpec = '%6.2f\n';
    fileID = fopen(ofile, 'w');
    fprintf(fileID,formatSpec, A);
    fclose(fileID);
