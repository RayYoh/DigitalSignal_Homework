function varargout = videoProcess(varargin)
%VIDEOPROCESS MATLAB code file for videoProcess.fig
%      VIDEOPROCESS, by itself, creates a new VIDEOPROCESS or raises the existing
%      singleton*.
%
%      H = VIDEOPROCESS returns the handle to a new VIDEOPROCESS or the handle to
%      the existing singleton*.
%
%      VIDEOPROCESS('Property','Value',...) creates a new VIDEOPROCESS using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to videoProcess_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      VIDEOPROCESS('CALLBACK') and VIDEOPROCESS('CALLBACK',hObject,...) call the
%      local function named CALLBACK in VIDEOPROCESS.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  select "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help videoProcess

% Last Modified by GUIDE v2.5 26-Sep-2020 15:20:53

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @videoProcess_OpeningFcn, ...
                   'gui_OutputFcn',  @videoProcess_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
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


% --- Executes just before videoProcess is made visible.
function videoProcess_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% select default command line output for videoProcess
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
set(handles.Frame,'Value',0);
set(handles.Fre,'Value',0.4);
global numFrame;
global Time;
numFrame=10*get(handles.Frame,'Value')+10;
set(handles.Frame_ed,'String',numFrame);
Time=0.1+get(handles.Fre,'Value');
set(handles.Fre_ed,'String',Time);


% UIWAIT makes videoProcess wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = videoProcess_OutputFcn(hObject, eventdata, handles)
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



% --- Executes on button press in collectImage.
function collectImage_Callback(hObject, eventdata, handles)
% hObject    handle to collectImage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes on button press in His.
function His_Callback(hObject, eventdata, handles)
% hObject    handle to His (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global vid;
global frame;
% frame=getsnapshot(vid);
% axes(handles.photo);
% imshow(frame);%显示采集的照片
global numFrame;
global Time;
global Camera;
for (i=1:numFrame)
    set(handles.edit3,'String',i);
    
    if Camera==2
        set(vid,'ReturnedColorSpace','rgb');
    end
    frame=getsnapshot(vid);
    axes(handles.photo);
    imshow(frame);
    R=frame(:,:,1); G=frame(:,:,2); B=frame(:,:,3);
    I1=rgb2gray(frame); Grey=I1(:,:,1);
    [N,M]=size(R);
    R1=zeros(1,256); G1=zeros(1,256);
    B1=zeros(1,256); Grey1=zeros(1,256);
    for i=1:N
        for j=1:M
            x=R(i,j); R1(x+1)=R1(x+1)+1;
            x=G(i,j); G1(x+1)=G1(x+1)+1;
            x=B(i,j); B1(x+1)=B1(x+1)+1;
            x=Grey(i,j); Grey1(x+1)=Grey1(x+1)+1;
        end
    end
    stem(handles.red,R1,'.','r','linewidth',1);
    xlim(handles.red,[0,260]);
    stem(handles.green,G1,'.','g','linewidth',1);
    xlim(handles.green,[0,260]);
    stem(handles.blue,B1,'.','b','linewidth',1);
    xlim(handles.blue,[0,260]);
    stem(handles.grey,Grey1,'.','k','linewidth',1);
    xlim(handles.grey,[0,260]);
    pause(Time);
end


% --- Executes on slider movement.
function Frame_Callback(hObject, eventdata, handles)
% hObject    handle to Frame (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global numFrame;
numFrame=10*get(handles.Frame,'Value')+10;
set(handles.Frame_ed,'String',numFrame);

% --- Executes during object creation, after setting all properties.
function Frame_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Frame (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function Fre_Callback(hObject, eventdata, handles)
% hObject    handle to Fre (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global Time;
Time=0.1+get(handles.Fre,'Value');
set(handles.Fre_ed,'String',Time);

% --- Executes during object creation, after setting all properties.
function Fre_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Fre (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function Frame_ed_Callback(hObject, eventdata, handles)
% hObject    handle to Frame_ed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Frame_ed as text
%        str2double(get(hObject,'String')) returns contents of Frame_ed as a double


% --- Executes during object creation, after setting all properties.
function Frame_ed_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Frame_ed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Fre_ed_Callback(hObject, eventdata, handles)
% hObject    handle to Fre_ed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Fre_ed as text
%        str2double(get(hObject,'String')) returns contents of Fre_ed as a double


% --- Executes during object creation, after setting all properties.
function Fre_ed_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Fre_ed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
 

% --- Executes on button press in Equ.
function Equ_Callback(hObject, eventdata, handles)
% hObject    handle to Equ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;
videoProcess2;


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
