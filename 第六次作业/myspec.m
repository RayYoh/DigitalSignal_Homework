function varargout = myspec(varargin)
% MYSPEC MATLAB code for myspec.fig
%      MYSPEC, by itself, creates a new MYSPEC or raises the existing
%      singleton*.
%
%      H = MYSPEC returns the handle to a new MYSPEC or the handle to
%      the existing singleton*.
%
%      MYSPEC('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MYSPEC.M with the given input arguments.
%
%      MYSPEC('Property','Value',...) creates a new MYSPEC or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before myspec_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to myspec_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help myspec

% Last Modified by GUIDE v2.5 27-Oct-2020 10:39:36

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @myspec_OpeningFcn, ...
                   'gui_OutputFcn',  @myspec_OutputFcn, ...
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


% --- Executes just before myspec is made visible.
function myspec_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to myspec (see VARARGIN)

% Choose default command line output for myspec
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes myspec wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = myspec_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Run.
function Run_Callback(hObject, eventdata, handles)
% hObject    handle to Run (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% 基本参数
global fs;
global sc;
global fre;
fa = [ 50 800 ];    % 扫描频率上下限
fs = 6400;          % 采样频率
 
% 分辨率相关设定参数
te = 1;             % [s] 扫频时间长度
fre = 8;            % [s] 频率分辨率
tre = 0.002;        % [Hz] 时间分辨率
 
% Chirp 信号生成
t = 0:1/fs:te;                  % [s] 时间序列
sc = chirp(t,fa(1),te,fa(2));   % 信号生成
plot(handles.axes1,t,sc,'r','linewidth',0.5);

% --- Executes on button press in SIFT.
function SIFT_Callback(hObject, eventdata, handles)
% hObject    handle to SIFT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global fs;
global mywin;
global sc;
global fre;

% 分辨率相关输入参数
nsc = floor(fs/fre);
% nov = floor(nsc-(fs*tre));
nov = floor(nsc*0.9);
nff = max(256,2^nextpow2(nsc));


switch mywin
    case 1
        s = spectrogram(sc,rectwin(nsc),nov,nff,fs,'yaxis');
    case 2
        s = spectrogram(sc,hann(nsc),nov,nff,fs,'yaxis');
    case 3
        s = spectrogram(sc,hamming(nsc),nov,nff,fs,'yaxis');
    case 4
        s = spectrogram(sc,flattopwin(nsc),nov,nff,fs,'yaxis');
end

% 绘制自编函数结果
[S,W,T] = mf_spectrogram(sc,nsc,nov,fs);


set(pcolor(handles.axes2,W,T,S), 'LineStyle','none');         % 取消网格，避免一片黑


% 绘制 Matlab 函数结果

% Turn into DFT in dB
s1 = abs(s/nff);
s2 = s1(1:nff/2+1,:);             % Symmetric results of FFT
s2(2:end-1,:) = 2*s2(2:end-1,:);  % Add the value of the other half
s3 = 20*log10(s2);                % Turn sound pressure into dB level
    
set(pcolor(handles.axes3,W,T,s3 ), 'LineStyle','none');         % 取消网格，避免一片黑



function win_Callback(hObject, eventdata, handles)
% hObject    handle to win (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of win as text
%        str2double(get(hObject,'String')) returns contents of win as a double
global mywin;
mywin = get(handles.win,'value');

% --- Executes during object creation, after setting all properties.
function win_CreateFcn(hObject, eventdata, handles)
% hObject    handle to win (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
