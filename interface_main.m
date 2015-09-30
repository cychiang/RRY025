% interface of image_enhancement.m

function [] = interface_main()
    ui = figure('Visible','off','Position',[360,500,450,285]);
    % Push Button   : Load Image.
    btn = uicontrol('Style', 'pushbutton', 'String', 'Clear', ...
        'Position', [20 20 50 20], ...
        'Callback', 'cla');
    % Slider Bar    : Adjust variable.
    sld = uicontrol('Style', 'slider',...
        'Min',1,'Max',50,'Value',41,...
        'Position', [400 20 120 20],...
        'Callback', @k0_value); 
    % Push Button   : Image Enhancement.
    % Processing    : Run and Show Result.
    ui.Visible = 'on';
    
    function k0_value(source, callbackdata)
        var = source.Value;
    end
end