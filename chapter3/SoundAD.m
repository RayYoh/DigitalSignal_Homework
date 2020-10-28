function varargout = SoundAD(varargin)
% SOUNDAD MATLAB code for SoundAD.fig
%      SOUNDAD, by itself, creates a new SOUNDAD or raises the existing
%      singleton*.
%
%      H = SOUNDAD returns the handle to a new SOUNDAD or the handle to
%      the existing singleton*.
%
%      SOUNDAD('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SOUNDAD.M with the given input arguments.
%
%      SOUNDAD('Property','Value',...) creates a new SOUNDAD or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SoundAD_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SoundAD_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SoundAD

% Last Modified by GUIDE v2.5 22-Sep-2020 09:08:15

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SoundAD_OpeningFcn, ...
                   'gui_OutputFcn',  @SoundAD_OutputFcn, ...
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


% --- Executes just before SoundAD is made visible.
function SoundAD_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SoundAD (see VARARGIN)

% Choose default command line output for SoundAD
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes SoundAD wait for user response (see UIRESUME)
% uiwait(handles.figure1);
set(handles.Stop,'enable','on');
set(handles.Continue,'enable','off');
global Z1; Z1=0.05; %Ylim Waveform , change according to your computer
global Z2; Z2=0.015; %Ylim Spectrum , change according to your computer
global t; %Timer, Refresh rate 0.2 sec
t = timer('StartDelay',0, 'Period',0.2, 'TasksToExecute',150000,'ExecutionMode', 'fixedRate');
t.TimerFcn ={ @my_callback_fcn1};

function my_callback_fcn1(obj,event)
global h; global Z1; global Z2
Fs=22050; duration=0.1; N=duration*Fs;
recorder = audiorecorder(Fs,16,1);
recordblocking(recorder, duration);
y = getaudiodata(recorder);
% global filename;
% [y,Fs]=audioread(filename);
N=2048; y=y(1:N); x=linspace(0,N,N);
plot(h.plot_1,x,y,'b','LineWidth',1.5);
ylim(h.plot_1,[-Z1,Z1]); xlim(h.plot_1,[0,1000]);
grid(h.plot_1);
f=linspace(0,Fs/2,N/2);
P=fft(y,N); Pyy =2*sqrt(P.* conj(P))/N;
plot(h.plot_2,f,Pyy(1:N/2),'b','LineWidth',1.5);
ylim(h.plot_2,[0,Z2]); grid(h.plot_2);


% --- Outputs from this function are returned to the command line.
function varargout = SoundAD_OutputFcn(hObject, eventdata, handles) 
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
global filename;
global mp;
mp.URL=filename;
global h;h=handles;
global t;start(t);



% --- Executes on button press in Stop.
function Stop_Callback(hObject, eventdata, handles)
% hObject    handle to Stop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global mp;
% while 1
%     if strcmp(get(handles.Stop,'String'),'Stop')
%         mp.controls.pause;
%         set(handles.Stop,'String','Continue');
%     end
%     if strcmp(get(handles.Stop,'String'),'Continue')
%         mp.controls.play;
%         set(handles.Stop,'String','Stop');
%     end
% end
mp.controls.pause;
set(handles.Stop,'enable','off');
set(handles.Continue,'enable','on');
global t;stop(t);

    
% --- Executes on button press in Open.
function Open_Callback(hObject, eventdata, handles)
% hObject    handle to Open (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global filename;
[Fnameh,Pnameh]=uigetfile('*.*');%'*.mp3' %Fnameh文件名称，Pnameh文件路径
filename=[Pnameh,Fnameh];%存储文件路径和名称
set(handles.edit1,'String',filename);
global mp;
mp=handles.activex1;




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


% --- Executes on button press in Continue.
function Continue_Callback(hObject, eventdata, handles)
% hObject    handle to Continue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global mp;
mp.controls.play;
set(handles.Stop,'enable','on');
set(handles.Continue,'enable','off');
global t;start(t);


% --------------------------------------------------------------------
function activex1_PlayStateChange(hObject, eventdata, handles)
% hObject    handle to activex1 (see GCBO)
% eventdata  structure with parameters passed to COM event listener
% handles    structure with handles and user data (see GUIDATA)
