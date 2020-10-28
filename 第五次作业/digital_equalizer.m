function varargout = digital_equalizer(varargin)
% DIGITAL_EQUALIZER MATLAB code for digital_equalizer.fig
%      DIGITAL_EQUALIZER, by itself, creates a new DIGITAL_EQUALIZER or raises the existing
%      singleton*.
%
%      H = DIGITAL_EQUALIZER returns the handle to a new DIGITAL_EQUALIZER or the handle to
%      the existing singleton*.
%
%      DIGITAL_EQUALIZER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DIGITAL_EQUALIZER.M with the given input arguments.
%
%      DIGITAL_EQUALIZER('Property','Value',...) creates a new DIGITAL_EQUALIZER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before digital_equalizer_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to digital_equalizer_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help digital_equalizer

% Last Modified by GUIDE v2.5 20-Oct-2020 09:37:44

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @digital_equalizer_OpeningFcn, ...
                   'gui_OutputFcn',  @digital_equalizer_OutputFcn, ...
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


% --- Executes just before digital_equalizer is made visible.
function digital_equalizer_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to digital_equalizer (see VARARGIN)

% Choose default command line output for digital_equalizer
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes digital_equalizer wait for user response (see UIRESUME)
% uiwait(handles.figure1);
set(handles.slider33 , 'Value',0.5);
set(handles.slider44 , 'Value',0.5);
set(handles.slider63 , 'Value',0.5);
set(handles.slider88 , 'Value',0.5);
set(handles.slider125 , 'Value',0.5);
set(handles.slider180 , 'Value',0.5);
set(handles.slider250, 'Value',0.5);
set(handles.slider355 , 'Value',0.5);
set(handles.slider500 , 'Value',0.5);
set(handles.slider710 , 'Value',0.5);
set(handles.slider1000 , 'Value',0.5);
set(handles.slider1400, 'Value',0.5);
set(handles.slider2000 , 'Value',0.5);
set(handles.slider2800, 'Value',0.5);
set(handles.slider4000 , 'Value',0.5);
set(handles.slider5600, 'Value',0.5);
set(handles.slider8000 , 'Value',0.5);
set(handles.slider11300 , 'Value',0.5);
set(handles.slider16000, 'Value',0.5);
set(handles.slider22000 , 'Value',0.5);

% --- Outputs from this function are returned to the command line.
function varargout = digital_equalizer_OutputFcn(hObject, eventdata, handles) 
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
global audio_all;
global Fs;
global audio;
[Fnameh,Pnameh]=uigetfile('*.*');%'*.mp3' %Fnameh文件名称，Pnameh文件路径
filename=[Pnameh,Fnameh];%存储文件路径和名称
set(handles.path,'String',filename);
[audio_all,Fs]=audioread(filename);
audio=audio_all;

function path_Callback(hObject, eventdata, handles)
% hObject    handle to path (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of path as text
%        str2double(get(hObject,'String')) returns contents of path as a double


% --- Executes during object creation, after setting all properties.
function path_CreateFcn(hObject, eventdata, handles)
% hObject    handle to path (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function slider63_Callback(hObject, eventdata, handles)
% hObject    handle to slider63 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider63_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider63 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider88_Callback(hObject, eventdata, handles)
% hObject    handle to slider88 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider88_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider88 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider125_Callback(hObject, eventdata, handles)
% hObject    handle to slider125 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider125_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider125 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider180_Callback(hObject, eventdata, handles)
% hObject    handle to slider180 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider180_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider180 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider250_Callback(hObject, eventdata, handles)
% hObject    handle to slider250 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider250_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider250 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider355_Callback(hObject, eventdata, handles)
% hObject    handle to slider355 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider355_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider355 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider500_Callback(hObject, eventdata, handles)
% hObject    handle to slider500 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider500_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider500 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider710_Callback(hObject, eventdata, handles)
% hObject    handle to slider710 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider710_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider710 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider1000_Callback(hObject, eventdata, handles)
% hObject    handle to slider1000 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider1000_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1000 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider1400_Callback(hObject, eventdata, handles)
% hObject    handle to slider1400 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider1400_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1400 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider2000_Callback(hObject, eventdata, handles)
% hObject    handle to slider2000 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider2000_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2000 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider2800_Callback(hObject, eventdata, handles)
% hObject    handle to slider2800 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider2800_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2800 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider4000_Callback(hObject, eventdata, handles)
% hObject    handle to slider4000 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider4000_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider4000 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider5600_Callback(hObject, eventdata, handles)
% hObject    handle to slider5600 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider5600_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider5600 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider8000_Callback(hObject, eventdata, handles)
% hObject    handle to slider8000 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider8000_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider8000 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider11300_Callback(hObject, eventdata, handles)
% hObject    handle to slider11300 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider11300_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider11300 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider44_Callback(hObject, eventdata, handles)
% hObject    handle to slider44 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider44_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider44 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider16000_Callback(hObject, eventdata, handles)
% hObject    handle to slider16000 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider16000_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider16000 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider22000_Callback(hObject, eventdata, handles)
% hObject    handle to slider22000 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider22000_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider22000 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider33_Callback(hObject, eventdata, handles)
% hObject    handle to slider33 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider33_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider33 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in play.
function play_Callback(hObject, eventdata, handles)
% hObject    handle to play (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global audio;
global Fs;
play=audioplayer(audio,Fs);
playblocking(play);



% --- Executes on button press in FFT.
function FFT_Callback(hObject, eventdata, handles)
% hObject    handle to FFT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global audio;
audio_f = abs(fft(audio));
plot(handles.axes1,audio_f);

% --- Executes on button press in Equalizer.
function Equalizer_Callback(hObject, eventdata, handles)
% hObject    handle to Equalizer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global Fs;
global audio;
audio_33=fx_FIR(Fs,1,33,audio);
audio_44=fx_FIR(Fs,34,44,audio);
audio_63=fx_FIR(Fs,45,63,audio);
audio_88=fx_FIR(Fs,64,88,audio);
audio_125=fx_FIR(Fs,89,125,audio);
audio_180=fx_FIR(Fs,126,180,audio);
audio_250=fx_FIR(Fs,181,250,audio);
audio_355=fx_FIR(Fs,251,355,audio);
audio_500=fx_FIR(Fs,356,500,audio);
audio_710=fx_FIR(Fs,501,710,audio);
audio_1000=fx_FIR(Fs,711,1000,audio);
audio_1400=fx_FIR(Fs,1001,1400,audio);
audio_2000=fx_FIR(Fs,1401,2000,audio);
audio_2800=fx_FIR(Fs,2001,2800,audio);
audio_4000=fx_FIR(Fs,2801,4000,audio);
audio_5600=fx_FIR(Fs,4001,5600,audio);
audio_8000=fx_FIR(Fs,5601,8000,audio);
audio_11300=fx_FIR(Fs,8001,11300,audio);
audio_16000=fx_FIR(Fs,11301,16000,audio);
audio_22000=fx_FIR(Fs,16001,22000,audio);

%获取各个滑动条的位置
a = 2*get(handles.slider33 , 'Value');
b = 2*get(handles.slider44 , 'Value');
c = 2*get(handles.slider63 , 'Value');
d = 2*get(handles.slider88 , 'Value');
e = 2*get(handles.slider125 , 'Value');
f = 2*get(handles.slider180 , 'Value');
g = 2*get(handles.slider250, 'Value');
h = 2*get(handles.slider355 , 'Value');
i = 2*get(handles.slider500 , 'Value');
j = 2*get(handles.slider710 , 'Value');
k = 2*get(handles.slider1000 , 'Value');
l = 2*get(handles.slider1400, 'Value');
m = 2*get(handles.slider2000 , 'Value');
n = 2*get(handles.slider2800, 'Value');
o = 2*get(handles.slider4000 , 'Value');
p = 2*get(handles.slider5600, 'Value');
q = 2*get(handles.slider8000 , 'Value');
r = 2*get(handles.slider11300 , 'Value');
s = 2*get(handles.slider16000, 'Value');
t = 2*get(handles.slider22000 , 'Value');

audio_new=a*audio_33+b*audio_44 +c*audio_63 +d*audio_88 +e*audio_125 +f* audio_180+g*audio_250 +h*audio_355 +i* audio_500+j*audio_710 +k*audio_1000 +l*audio_1400+m* audio_2000+n*audio_2800 +o*audio_4000 +p*audio_5600 +q*audio_8000 +r*audio_11300 +s*audio_16000 +t*audio_22000;
audio_new_f=abs(fft(audio_new));
plot(handles.axes2,audio_new_f);
play=audioplayer(audio_new,Fs);
playblocking(play);
