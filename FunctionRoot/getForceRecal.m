function [force_left, force_right] = getForceRecal(analog, analog_id)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Recalculate the forces based on the analog channels
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

cal_id_names = ["Lz1","Lz2","Lz3","Lz4","Lx1","Lx2","Ly1","Rz1","Rz2","Rz3","Rz4", ...
          "Rx1","Rx2","Ry1"];
      
cal_recal_id = [];
      
for cal_id_name = cal_id_names
    cal_recal_id = [cal_recal_id, find(analog_id == cal_id_name)];   
end

analog_recal = analog(cal_recal_id, :);

calMatrix = [54.795,40.568,-1.547,26.088,865.447,863.439,58.430,0,0,0,0,0,0,0; ...
             5.967,-4.176,-10.593,-25.480,-21.803,31.700,-899.297,0,0,0,0,0,0,0; ...
            -491.636,-493.042,-491.068,-490.675,23.193,-2.379,-22.126,0,0,0,0,0,0,0; ...
             325.415,-339.021,-283.225,334.421,-4.893,-6.050,97.272,0,0,0,0,0,0,0; ...
             274.139,269.241,10.232,16.540,33.729,31.660,14.399,0,0,0,0,0,0,0; ...
             37.854,-28.409,-0.375,13.614,615.431,-555.705,-580.154,0,0,0,0,0,0,0; ...
             0,0,0,0,0,0,0,11.669,0.034,-57.359,-2.701,-894.684,-852.648,-2.500; ...
             0,0,0,0,0,0,0,-6.751,16.550,5.266,-23.216,50.658,-38.945,-893.177; ...
             0,0,0,0,0,0,0,-490.709,-491.017,-493.687,-491.098,22.880,13.525,19.404; ...
             0,0,0,0,0,0,0,282.293,-344.332,-333.906,329.709,10.587,-14.998,110.488; ...
             0,0,0,0,0,0,0,2.732,-0.413,-264.278,-252.251,-14.736,-23.390,5.007; ...
             0,0,0,0,0,0,0,4.723,0.761,32.852,11.397,552.036,-576.666,538.952;];
         
         
force = calMatrix*analog_recal;

force_left = force(1:6, :);
force_right = force(7:12, :);

end