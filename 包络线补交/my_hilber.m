function varargout = my_hilber(varargin)
% MY_HILBER MATLAB code for my_hilber.fig
%      MY_HILBER, by itself, creates a new MY_HILBER or raises the existing
%      singleton*.
%
%      H = MY_HILBER returns the handle to a new MY_HILBER or the handle to
%      the existing singleton*.
%
%      MY_HILBER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MY_HILBER.M with the given input arguments.
%
%      MY_HILBER('Property','Value',...) creates a new MY_HILBER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before my_hilber_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to my_hilber_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help my_hilber

% Last Modified by GUIDE v2.5 31-Oct-2020 12:33:26

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @my_hilber_OpeningFcn, ...
                   'gui_OutputFcn',  @my_hilber_OutputFcn, ...
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


% --- Executes just before my_hilber is made visible.
function my_hilber_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to my_hilber (see VARARGIN)

% Choose default command line output for my_hilber
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes my_hilber wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = my_hilber_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in run.
function run_Callback(hObject, eventdata, handles)
% hObject    handle to run (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
fs=400;                                 % 采样频率
N=400;                                  % 数据长度
n=0:1:N-1;
dt=1/fs;
t=n*dt;                                 % 时间序列
A=0.5;                                  % 相位调制幅值
x=(1+0.5*cos(2*pi*5*t)).*cos(2*pi*50*t+A*sin(2*pi*10*t));  % 信号序列
x_fft=fft(x);
y=zeros(1,N);
y(1)=1;y(N/2+1)=1;
for i=2:1:N/2
    y(i)=2;
end
z=ifft(x_fft.*y);
a=abs(z);                               % 包络线
z1=hilbert(x');
a1=abs(z1);
plot(handles.axes1,t,x,'k'); hold on;
plot(handles.axes1,t,a1,'g','linewidth',2);
title(handles.axes1,'包络线---MATLAB'); ylabel(handles.axes1,'幅值'); xlabel(handles.axes1,['时间/s' 10 '(a)']);
ylim(handles.axes1,[-2,2]);
plot(handles.axes2,t,x,'k'); hold on;
plot(handles.axes2,t,a,'r--','linewidth',2);
title(handles.axes2,'包络线---SELF'); ylabel(handles.axes2,'幅值'); xlabel(handles.axes2,['时间/s' 10 '(a)']);
ylim(handles.axes2,[-2,2]);

