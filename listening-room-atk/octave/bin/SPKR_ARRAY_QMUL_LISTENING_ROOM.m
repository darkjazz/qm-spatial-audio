function [ val ] = SPKR_ARRAY_QMUL_LISTENING_ROOM(c)
    %ARRAY_QMUL_LISTENING_ROOM Speaker positions
    
    val.id = {'TT', ...
    	'H1', 'H2', 'H3', 'H4', 'H5', 'H6', 'H7', ...
        'T1', 'T2', 'T3', 'T4', ...
        'B1', 'B2', 'B3', 'B4'
        };
    
    % azimuth (deg), elevation (deg), distance (meters)
	S = [ 
		0 			90 		0.85 
		0 			0		2.46 
		41.9 		0 		2.64
		94.6 		0 		1.78 
		150.6 		0 		2.31 
		-152.4 		0 		2.22 
		-94.5 		0 		1.82 
		-44 		0 		2.6 
		0 			28.3 	1.86 
		90 			27.2 	1.93 
		180 		26.7 	1.95 
		-90 		27.5 	1.97 
		-45 		-29 	3.18 
		45 			-30 	3.03 
		135 		-25.9 	3.58
		-135, 		-27.8 	3.38 
	];

    val.az = S(:,1)*pi/180;
    val.el = S(:,2)*pi/180;
    val.r = S(:,3);

    val.name = "qmul-listening-room";
    
    % direction cosines, unit vector
    [val.x, val.y, val.z] = sph2cart(val.az, val.el, 1);
    
end
