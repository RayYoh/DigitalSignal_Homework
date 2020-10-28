function varargout = DIgitalPiano(varargin)
% DIGITALPIANO MATLAB code for DIgitalPiano.fig
%      DIGITALPIANO, by itself, creates a new DIGITALPIANO or raises the existing
%      singleton*.
%
%      H = DIGITALPIANO returns the handle to a new DIGITALPIANO or the handle to
%      the existing singleton*.
%
%      DIGITALPIANO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DIGITALPIANO.M with the given input arguments.
%
%      DIGITALPIANO('Property','Value',...) creates a new DIGITALPIANO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before DIgitalPiano_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to DIgitalPiano_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help DIgitalPiano

% Last Modified by GUIDE v2.5 12-Sep-2020 16:56:01

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @DIgitalPiano_OpeningFcn, ...
                   'gui_OutputFcn',  @DIgitalPiano_OutputFcn, ...
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


% --- Executes just before DIgitalPiano is made visible.
function DIgitalPiano_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to DIgitalPiano (see VARARGIN)

% Choose default command line output for DIgitalPiano
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes DIgitalPiano wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = DIgitalPiano_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

global Fs;
Fs=44100;
dt=1.0/Fs;
T=0.5;
N=T/dt;
global x;
x=linspace(0,T,N);
% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Fs;
global x;
y=0.8*sin(2*3.14*523*x);
plot(x,y);
xlim([0,0.01]);
p1=audioplayer(y,Fs);
playblocking(p1);



% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Fs;
global x;
y=0.8*sin(2*3.14*578*x);
plot(x,y);
xlim([0,0.01]);
p1=audioplayer(y,Fs);
playblocking(p1);

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Fs;
global x;
y=0.8*sin(2*3.14*659*x);
plot(x,y);
xlim([0,0.01]);
p1=audioplayer(y,Fs);
playblocking(p1);

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global Fs;
global x;
y=0.8*sin(2*3.14*698*x);
plot(x,y);
xlim([0,0.01]);
p1=audioplayer(y,Fs);
playblocking(p1);
% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Fs;
global x;
y=0.8*sin(2*3.14*784*x);
plot(x,y);
xlim([0,0.01]);
p1=audioplayer(y,Fs);
playblocking(p1);

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Fs;
global x;
y=0.8*sin(2*3.14*880*x);
plot(x,y);
xlim([0,0.01]);
p1=audioplayer(y,Fs);
playblocking(p1);

% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Fs;
global x;
y=0.8*sin(2*3.14*988*x);
plot(x,y);
xlim([0,0.01]);
p1=audioplayer(y,Fs);
playblocking(p1);

% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Fs;
global x;
y=0.8*sin(2*3.14*1046*x);
plot(x,y);
xlim([0,0.01]);
p1=audioplayer(y,Fs);
playblocking(p1);

% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Fs;
global x;
y=0.8*sin(2*3.14*1200*x);
plot(x,y);
xlim([0,0.01]);
p1=audioplayer(y,Fs);
playblocking(p1);
