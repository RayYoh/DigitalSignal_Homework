function varargout = my_morlet(varargin)
% MY_MORLET MATLAB code for my_morlet.fig
%      MY_MORLET, by itself, creates a new MY_MORLET or raises the existing
%      singleton*.
%
%      H = MY_MORLET returns the handle to a new MY_MORLET or the handle to
%      the existing singleton*.
%
%      MY_MORLET('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MY_MORLET.M with the given input arguments.
%
%      MY_MORLET('Property','Value',...) creates a new MY_MORLET or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before my_morlet_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to my_morlet_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help my_morlet

% Last Modified by GUIDE v2.5 27-Oct-2020 11:02:19

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @my_morlet_OpeningFcn, ...
                   'gui_OutputFcn',  @my_morlet_OutputFcn, ...
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


% --- Executes just before my_morlet is made visible.
function my_morlet_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to my_morlet (see VARARGIN)

% Choose default command line output for my_morlet
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes my_morlet wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = my_morlet_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in multsine.
function multsine_Callback(hObject, eventdata, handles)
% hObject    handle to multsine (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Fs;
global T;
global N;
global t;
global z;
Fs = 1024; dt=1.0/Fs;
T =1; N=T/dt; 
t=0:dt:4*(N-1)/N;
z=sin(2*pi*4.*t).*(t>=0 & t<=(N-1)/N)+sin(2*pi*10.*t).*(t>=1 & t<=2*(N-1)/N)+sin(2*pi*15.*t).*(t>=2 & t<=3*(N-1)/N)+sin(2*pi*30.*t).*(t>=3 & t<=4*(N-1)/N);
plot(handles.axes1,t,z,'b','linewidth',1.5);
axis(handles.axes1,[0,4,-2,2]);
tempfft = abs(fft(z));
plot(handles.axes4,tempfft(1:round(length(tempfft)/2)),'b','linewidth',1.5);
xlim(handles.axes4,[0,200]);

% --- Executes on button press in cwt.
function cwt_Callback(hObject, eventdata, handles)
% hObject    handle to cwt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Fs;
global z;
global t;
global f;
%旧版本
wavename='cmor1-3'; %可变参数，分别为cmor的
%举一个频率转尺度的例子
fmin=2;
fmax=20;
df=0.1;

f=fmin:df:fmax-df;%预期的频率
wcf=centfrq(wavename); %小波的中心频率
scal=Fs*wcf./f;%利用频率转换尺度
coefs = cwt(z,scal,wavename);
gca =pcolor(handles.axes7,t,f,abs(coefs));shading interp
set(gca, 'LineStyle','none');         % 取消网格，避免一片黑

% --- Executes on button press in mycwt.
function mycwt_Callback(hObject, eventdata, handles)
% hObject    handle to mycwt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% 自己实现的小波函数
global f;
global z;
global Fs;
global t;
n = length(z);
[psi,xval] = morlet(-4,4,n);
plot(handles.axes2,xval,psi,'r','linewidth',2);
axis(handles.axes2,[-4,4,-1,1]);
tempfft = abs(fft(psi));
plot(handles.axes5,tempfft(1:round(length(tempfft)/2)),'r','linewidth',2);
xlim(handles.axes5,[0,250]);

y = ifft(fft(z).*fft(psi));
plot(handles.axes3,t,y,'m','linewidth',2);
tempfft = abs(fft(y));
plot(handles.axes6,tempfft(1:round(length(tempfft)/2)),'m','linewidth',2);
xlim(handles.axes6,[0,250]);

coefs2=cwt_cmor(z,1,3,f,Fs);
pcolor(handles.axes8,t,f,abs(coefs2));shading interp
