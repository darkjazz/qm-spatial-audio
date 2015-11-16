
if false
    ambi_run_allrad(...
        SPKR_ARRAY_QMUL_LISTENING_ROOM(), ...  % full sphere
        [1 1], ...         % ambisonic order
        false, ...  % imaginary speaker at bottom of dome
        '', ... % default outpath
        true ... % do plots in MATLAB and Octave
        );
else  
    ambi_run_pinv(...
        SPKR_ARRAY_QMUL_LISTENING_ROOM(), ...  % full sphere
        [1 1], ...         % ambisonic order
        false, ...  % imaginary speaker at bottom of dome
        '', ... % default outpath
        true ...
        );
end
