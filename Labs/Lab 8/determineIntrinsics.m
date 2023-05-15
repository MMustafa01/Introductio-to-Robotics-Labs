function Out = determineIntrinsics(camera)
% The camera is a bool variable: camera == 0 means colour and camera == 1
% means depth
    % Make Pipeline object to manage streaming
    pipe = realsense.pipeline();
    
    % Start streaming on an arbitrary camera with default settings
    profile = pipe.start();

    % Extract the color stream
    color_stream = profile.get_stream(realsense.stream.color).as('video_stream_profile');
    
    %Extract the IR stream
    depth_stream = profile.get_stream(realsense.stream.depth).as('video_stream_profile');

    
    % Get and display the intrinsics
    color_intrinsics = color_stream.get_intrinsics()
    depth_intrinsics = depth_stream.get_intrinsics()
    if camera == 0
        Out = color_intrinsics;
    elseif camera == 1
        Out = depth_intrinsics; 
    end
end