function varargout = TimeWavePlay(varargin)
% TIMEWAVEPLAY MATLAB code for TimeWavePlay.fig
%      TIMEWAVEPLAY, by itself, creates a new TIMEWAVEPLAY or raises the existing
%      singleton*.
%
%      H = TIMEWAVEPLAY returns the handle to a new TIMEWAVEPLAY or the handle to
%      the existing singleton*.
%
%      TIMEWAVEPLAY('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TIMEWAVEPLAY.M with the given input arguments.
%
%      TIMEWAVEPLAY('Property','Value',...) creates a new TIMEWAVEPLAY or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before TimeWavePlay_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to TimeWavePlay_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help TimeWavePlay

% Last Modified by GUIDE v2.5 13-Sep-2020 11:06:48

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @TimeWavePlay_OpeningFcn, ...
                   'gui_OutputFcn',  @TimeWavePlay_OutputFcn, ...
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




% --- Executes just before TimeWavePlay is made visible.
function TimeWavePlay_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to TimeWavePlay (see VARARGIN)

% Choose default command line output for TimeWavePlay
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
set(handles.slider_ylim,'Value',0.5);
set(handles.slider_move,'Value',0);
set(handles.slider_zoom,'Value',1);

% UIWAIT makes TimeWavePlay wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = TimeWavePlay_OutputFcn(hObject, eventdata, handles) 
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
global x;
global y;
plot(handles.plot,x,y,'b','linewidth',1);
grid(handles.plot,'on');
k=0;
global flag;
flag=1;
while flag
    if k>max(x)
        break;
    end
    xlim(handles.plot,[k,k+0.01]);
    pause(0.042);
    k=k+0.01;
end




% --- Executes on button press in Stop.
function Stop_Callback(hObject, eventdata, handles)
% hObject    handle to Stop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global flag;
flag=0;


% --- Executes on button press in Play.
function Play_Callback(hObject, eventdata, handles)
% hObject    handle to Play (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Fs;
Fs=44100;
dt=1.0/Fs;
global T;
T=0.5;
global N;
N=T/dt;
global x;
x=linspace(0,T,N);
global y;
player=audioplayer(y,Fs);
playblocking(player);


% --- Executes on button press in Noise.
function Noise_Callback(hObject, eventdata, handles)
% hObject    handle to Noise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global y;
global N;
y=randn(1,N);



% --- Executes on button press in Sine.
function Sine_Callback(hObject, eventdata, handles)
% hObject    handle to Sine (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Amp;
global Fre;
global x;
global y;
y=Amp*sin(2*3.14*Fre*x);

% --- Executes on button press in Square.
function Square_Callback(hObject, eventdata, handles)
% hObject    handle to Square (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Amp;
global Fre;
global x;
global y;
y=Amp*square(2*3.14*Fre*x);

% --- Executes on button press in Trangle.
function Trangle_Callback(hObject, eventdata, handles)
% hObject    handle to Trangle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Amp;
global Fre;
global x;
global y;
y=Amp*sawtooth(2*3.14*Fre*x);


% --- Executes on slider movement.
function slider_Fre_Callback(hObject, eventdata, handles)
% hObject    handle to slider_Fre (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global Fre;
Fre=1000*get(handles.slider_Fre,'Value');
s1=sprintf('%f',Fre);
set(handles.edit_Fre,'String',s1);


% --- Executes during object creation, after setting all properties.
function slider_Fre_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_Fre (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider_Amp_Callback(hObject, eventdata, handles)
% hObject    handle to slider_Amp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global Amp;
Amp=get(handles.slider_Amp,'Value');
s2=sprintf('%f',Amp);
set(handles.edit_Amp,'String',s2);


% --- Executes during object creation, after setting all properties.
function slider_Amp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_Amp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function edit_Fre_Callback(hObject, eventdata, handles)
% hObject    handle to edit_Fre (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_Fre as text
%        str2double(get(hObject,'String')) returns contents of edit_Fre as a double


% --- Executes during object creation, after setting all properties.
function edit_Fre_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_Fre (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_Amp_Callback(hObject, eventdata, handles)
% hObject    handle to edit_Amp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_Amp as text
%        str2double(get(hObject,'String')) returns contents of edit_Amp as a double


% --- Executes during object creation, after setting all properties.
function edit_Amp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_Amp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function slider_ylim_Callback(hObject, eventdata, handles)
% hObject    handle to slider_ylim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global Ymax;
Ymax=3*get(handles.slider_ylim,'Value');
if Ymax==0
    Ymax=0.01;
end
ylim(handles.plot,[-Ymax,Ymax]);
    


% --- Executes during object creation, after setting all properties.
function slider_ylim_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_ylim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider_move_Callback(hObject, eventdata, handles)
% hObject    handle to slider_move (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global Move;
Move=get(handles.slider_move,'Value');
if Move==1
    Move=0.999;
end
global T;
global Zoom;
xlim(handles.plot,[Move*T/Zoom,Move*T/Zoom+T/Zoom]);

% --- Executes during object creation, after setting all properties.
function slider_move_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_move (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider_zoom_Callback(hObject, eventdata, handles)
% hObject    handle to slider_zoom (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global Zoom;
Zoom=100*get(handles.slider_zoom,'Value');
if Zoom<1
    Zoom=1;
end
global Move;
global T;
xlim(handles.plot,[Move*T/Zoom,Move*T/Zoom+T/Zoom]);

% --- Executes during object creation, after setting all properties.
function slider_zoom_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_zoom (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
