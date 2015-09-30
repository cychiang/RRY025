function varargout = ui_interface(varargin)
% UI_INTERFACE MATLAB code for ui_interface.fig
%      UI_INTERFACE, by itself, creates a new UI_INTERFACE or raises the existing
%      singleton*.
%
%      H = UI_INTERFACE returns the handle to a new UI_INTERFACE or the handle to
%      the existing singleton*.
%
%      UI_INTERFACE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UI_INTERFACE.M with the given input arguments.
%
%      UI_INTERFACE('Property','Value',...) creates a new UI_INTERFACE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ui_interface_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ui_interface_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ui_interface

% Last Modified by GUIDE v2.5 30-Sep-2015 22:13:50

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ui_interface_OpeningFcn, ...
                   'gui_OutputFcn',  @ui_interface_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before ui_interface is made visible.
function ui_interface_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ui_interface (see VARARGIN)

% Choose default command line output for ui_interface
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ui_interface wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ui_interface_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in load_image.
function load_image_Callback(hObject, eventdata, handles)
% hObject    handle to load_image (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[fileName, pathName] = uigetfile({'*.mat'}, 'File Selector');
fullPathName = strcat(pathName, fileName);
mat=load(fullPathName);
image=mat.forestgray;
handles.image=image;
guidata(hObject, handles);

% --- Executes on button press in processing_image.
function processing_image_Callback(hObject, eventdata, handles)
% hObject    handle to processing_image (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
image=handles.image;
% Get Data from text
e = str2num(get(handles.ehancement_constant,'String'));
k0 = str2double(get(handles.k0,'String'));
k1 = str2double(get(handles.k1,'String'));
k2 = str2double(get(handles.k2,'String'));
mask = str2num(get(handles.mask,'String'));
m_class = image_enhancement;
out = m_class.local_image_enhancement(handles.image, e, k0, k1, k2, mask);
pairOfImages = [image, out];
figure, imshow(pairOfImages);

function ehancement_constant_Callback(hObject, eventdata, handles)
% hObject    handle to ehancement_constant (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ehancement_constant as text
%        str2double(get(hObject,'String')) returns contents of ehancement_constant as a double


% --- Executes during object creation, after setting all properties.
function ehancement_constant_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ehancement_constant (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function k0_Callback(hObject, eventdata, handles)
% hObject    handle to k0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of k0 as text
%        str2double(get(hObject,'String')) returns contents of k0 as a double


% --- Executes during object creation, after setting all properties.
function k0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to k0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function k1_Callback(hObject, eventdata, handles)
% hObject    handle to k1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of k1 as text
%        str2double(get(hObject,'String')) returns contents of k1 as a double


% --- Executes during object creation, after setting all properties.
function k1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to k1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function k2_Callback(hObject, eventdata, handles)
% hObject    handle to k2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of k2 as text
%        str2double(get(hObject,'String')) returns contents of k2 as a double


% --- Executes during object creation, after setting all properties.
function k2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to k2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function mask_Callback(hObject, eventdata, handles)
% hObject    handle to mask (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of mask as text
%        str2double(get(hObject,'String')) returns contents of mask as a double


% --- Executes during object creation, after setting all properties.
function mask_CreateFcn(hObject, eventdata, handles)
% hObject    handle to mask (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
