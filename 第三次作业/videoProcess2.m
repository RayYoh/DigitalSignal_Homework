function varargout = videoProcess2(varargin)
% VIDEOPROCESS2 MATLAB code for videoProcess2.fig
%      VIDEOPROCESS2, by itself, creates a new VIDEOPROCESS2 or raises the existing
%      singleton*.
%
%      H = VIDEOPROCESS2 returns the handle to a new VIDEOPROCESS2 or the handle to
%      the existing singleton*.
%
%      VIDEOPROCESS2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in VIDEOPROCESS2.M with the given input arguments.
%
%      VIDEOPROCESS2('Property','Value',...) creates a new VIDEOPROCESS2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before videoProcess2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to videoProcess2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help videoProcess2

% Last Modified by GUIDE v2.5 26-Sep-2020 15:25:55

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @videoProcess2_OpeningFcn, ...
                   'gui_OutputFcn',  @videoProcess2_OutputFcn, ...
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


% --- Executes just before videoProcess2 is made visible.
function videoProcess2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to videoProcess2 (see VARARGIN)

% Choose default command line output for videoProcess2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes videoProcess2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = videoProcess2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in openCamera.
function openCamera_Callback(hObject, eventdata, handles)
% hObject    handle to openCamera (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Camera;
global vid;                                           %设置全局变量方便采集图像时使用
vid=videoinput('winvideo',Camera);                    %读取摄像头
usbvidRes=get(vid,'videoResolution');                 %读像素
nBand=get(vid,'NumberOfBands');                       %不清楚这个是干什么的
axes(handles.video);                                  %设置坐标轴
hImage=imshow(zeros(usbvidRes(2),usbvidRes(1),nBand));%使得显示的坐标轴和图象一致
preview(vid,hImage);                                  %显示实时照片

% --- Executes on button press in Collect.
function Collect_Callback(hObject, eventdata, handles)
% hObject    handle to Collect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global vid;
global frame;
% frame=getsnapshot(vid);
% axes(handles.photo);
% imshow(frame);%显示采集的照片
for (i=1:20)
    set(handles.edit1,'String',i);
    global Camera;
    if Camera==2
        set(vid,'ReturnedColorSpace','rgb');
    end
    frame=getsnapshot(vid);
    axes(handles.photo);
    imshow(frame);
    HSV = rgb2hsv(frame);
    H=HSV(:,:,1); S=HSV(:,:,2);
    V=HSV(:,:,3);
    axes(handles.original); imhist(V);
    v1=histeq(V);
    newimg = cat(3,H,S,v1);
    Im2 = hsv2rgb(newimg);
    axes(handles.result); imshow(Im2);
    axes(handles.process); imhist(v1);
    pause(0.5);
end



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in select.
function select_Callback(hObject, eventdata, handles)
% hObject    handle to select (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns select contents as cell array
%        contents{get(hObject,'Value')} returns selected item from select
val=get(handles.select,'value');%选择摄像头 自带摄像头或USB摄像头
global Camera;
switch val
    case 2
        Camera=1;
    case 3
        Camera=2;
end

% --- Executes during object creation, after setting all properties.
function select_CreateFcn(hObject, eventdata, handles)
% hObject    handle to select (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
