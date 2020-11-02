function varargout = arduino(varargin)
% ARDUINO MATLAB code for arduino.fig
%      ARDUINO, by itself, creates a new ARDUINO or raises the existing
%      singleton*.
%
%      H = ARDUINO returns the handle to a new ARDUINO or the handle to
%      the existing singleton*.
%
%      ARDUINO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ARDUINO.M with the given input arguments.
%
%      ARDUINO('Property','Value',...) creates a new ARDUINO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before arduino_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to arduino_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help arduino

% Last Modified by GUIDE v2.5 02-Nov-2020 21:58:57

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @arduino_OpeningFcn, ...
                   'gui_OutputFcn',  @arduino_OutputFcn, ...
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


% --- Executes just before arduino is made visible.
function arduino_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to arduino (see VARARGIN)

% Choose default command line output for arduino
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes arduino wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = arduino_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in open.
function open_Callback(hObject, eventdata, handles)
% hObject    handle to open (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear;clc
global s;
s = serial('COM5');  %定义串口对象
set(s,'BaudRate',9600);  %设置波特率s
fopen(s);  %打开串口对象s
msgbox('采集卡连接成功！');

% --- Executes on button press in close.
function close_Callback(hObject, eventdata, handles)
% hObject    handle to close (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global s;
fclose(s);  %关闭串口对象s
close arduino


function dist_Callback(hObject, eventdata, handles)
% hObject    handle to dist (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of dist as text
%        str2double(get(hObject,'String')) returns contents of dist as a double


% --- Executes during object creation, after setting all properties.
function dist_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dist (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function led_Callback(hObject, eventdata, handles)
% hObject    handle to led (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of led as text
%        str2double(get(hObject,'String')) returns contents of led as a double


% --- Executes during object creation, after setting all properties.
function led_CreateFcn(hObject, eventdata, handles)
% hObject    handle to led (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in show.
function show_Callback(hObject, eventdata, handles)
% hObject    handle to show (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global s;
interval = 10000;  
step = 1;
t = 1;
x = 0;
while(t<interval)
    b = str2num(fgetl(s));  %用函数fget(s)从缓冲区读取串口数据，当出现终止符（换行符）停止。
    set(handles.dist,'String',b)
    if(b<=20)
        set(handles.led,'backgroundcolor',[1,0,0])
    else
        set(handles.led,'backgroundcolor',[0,1,0])
    end
    x = [x,b];                       %所以在Arduino程序里要使用Serial.println()
    plot(x);
    grid
    t = t+step;
    drawnow;
end
