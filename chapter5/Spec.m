function varargout = Spec(varargin)
% SPEC MATLAB code for Spec.fig
%      SPEC, by itself, creates a new SPEC or raises the existing
%      singleton*.
%
%      H = SPEC returns the handle to a new SPEC or the handle to
%      the existing singleton*.
%
%      SPEC('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SPEC.M with the given input arguments.
%
%      SPEC('Property','Value',...) creates a new SPEC or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Spec_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Spec_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Spec

% Last Modified by GUIDE v2.5 11-Oct-2020 21:24:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Spec_OpeningFcn, ...
                   'gui_OutputFcn',  @Spec_OutputFcn, ...
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


% --- Executes just before Spec is made visible.
function Spec_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Spec (see VARARGIN)

% Choose default command line output for Spec
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Spec wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Spec_OutputFcn(hObject, eventdata, handles) 
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
global filename;
[Fnameh,Pnameh]=uigetfile('*.*');%'*.mp3' %Fnameh文件名称，Pnameh文件路径
filename=[Pnameh,Fnameh];%存储文件路径和名称
set(handles.edit_file,'String',filename);



function edit_file_Callback(hObject, eventdata, handles)
% hObject    handle to edit_file (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_file as text
%        str2double(get(hObject,'String')) returns contents of edit_file as a double


% --- Executes during object creation, after setting all properties.
function edit_file_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_file (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in play.
function play_Callback(hObject, eventdata, handles)
% hObject    handle to play (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global filename;
global y_noi;
global Fs;
global noise;
[y,Fs]=audioread(filename);
y_=y(2000:500000);
L=length(y_);
noise=0.2*randn(L,1);
y_noi=y_.'+noise;
plot(handles.MuAndNoi,y_noi,'linewidth',1);
xlim(handles.MuAndNoi,[2000,500000]);
ffty = abs(fft(y_noi));
plot(handles.axes4,ffty,'linewidth',1);
xlim(handles.axes4,[0,length(ffty)/2]);
play=audioplayer(y_noi,Fs);
playblocking(play);

% --- Executes on button press in spec.
function spec_Callback(hObject, eventdata, handles)
% hObject    handle to spec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global y_noi;
global fftnoise;
global music;
ffty = fft(y_noi);
fftmusic = ffty - fftnoise;
plot(handles.axes6,abs(fftmusic),'linewidth',1);
music = ifft(fftmusic);
plot(handles.Mu,music,'linewidth',1);


% --- Executes on button press in play2.
function play2_Callback(hObject, eventdata, handles)
% hObject    handle to play2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global pmusic;
global music;
global Fs;
pmusic = audioplayer(music,Fs);
play(pmusic);


% --- Executes on button press in noise.
function noise_Callback(hObject, eventdata, handles)
% hObject    handle to noise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global fftnoise;
global noise;
fftnoise = fft(noise);
plot(handles.Noi,noise,'linewidth',1);
plot(handles.axes5,abs(fftnoise),'linewidth',1);
