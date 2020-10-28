function varargout = chapter5_1(varargin)
% CHAPTER5_1 MATLAB code for chapter5_1.fig
%      CHAPTER5_1, by itself, creates a new CHAPTER5_1 or raises the existing
%      singleton*.
%
%      H = CHAPTER5_1 returns the handle to a new CHAPTER5_1 or the handle to
%      the existing singleton*.
%
%      CHAPTER5_1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CHAPTER5_1.M with the given input arguments.
%
%      CHAPTER5_1('Property','Value',...) creates a new CHAPTER5_1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before chapter5_1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to chapter5_1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help chapter5_1

% Last Modified by GUIDE v2.5 11-Oct-2020 19:45:47

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @chapter5_1_OpeningFcn, ...
                   'gui_OutputFcn',  @chapter5_1_OutputFcn, ...
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


% --- Executes just before chapter5_1 is made visible.
function chapter5_1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to chapter5_1 (see VARARGIN)

% Choose default command line output for chapter5_1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes chapter5_1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);
global Fs;
Fs=1024;
dt=1.0/Fs;
global T;
T=1;
global N;
N=T/dt;
global x;
x=linspace(-T,T,N);

% --- Outputs from this function are returned to the command line.
function varargout = chapter5_1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function slider_Fre_Callback(hObject, eventdata, handles)
% hObject    handle to slider_Fre (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global Fre;
Fre=10*get(handles.slider_Fre,'Value');
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
Amp=100*get(handles.slider_Amp,'Value');
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


% --- Executes on button press in Run.
function Run_Callback(hObject, eventdata, handles)
% hObject    handle to Run (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global x;
global y;global y2;
global T;
global Rxy;

Rxytemp = ifft(fft(y).*conj(fft(y2)));
Rxy = fftshift(Rxytemp);

plot(handles.plot,x,y,'b','linewidth',1);
title(handles.plot,'y1');
xlim(handles.plot,[-T,T]);

plot(handles.plot_2,x,y2,'b','linewidth',1);
title(handles.plot_2,'y2');
xlim(handles.plot_2,[-T,T]);


plot(handles.plot_3,x,Rxy,'b','linewidth',1);
title(handles.plot_3,'Rxy');
xlim(handles.plot_3,[-T,T]);


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
Fs=1024;
dt=1.0/Fs;
global T;
T=1;
global N;
N=T/dt;
global x;
x=linspace(0,T,N);
global y;
player=audioplayer(y,Fs);
playblocking(player);

% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Noise.
function Noise_Callback(hObject, eventdata, handles)
% hObject    handle to Noise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global y;global y2;
global N;
global Amp;
global Fre;
global x;
global T;
y=2*randn(1,N);
y2=xcorr(y);
Rxy = xcorr(y,'unbiased');
N1=length(y2);
x1=linspace(-T,T,N1);

plot(handles.plot,x,y,'b','linewidth',1);
title(handles.plot,'y1');
xlim(handles.plot,[0,T]);

plot(handles.plot_2,x1,y2,'b','linewidth',1);
title(handles.plot_2,'xcorr(y1)');
xlim(handles.plot_2,[-T/2,T/2]);

plot(handles.plot_3,x1,Rxy,'b','linewidth',1);
title(handles.plot_3,'Rxy');
xlim(handles.plot_3,[-T/2,T/2]);


% --- Executes on button press in Sine.
function Sine_Callback(hObject, eventdata, handles)
% hObject    handle to Sine (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Amp;global Amp2;
global Fre;global Fre2;
global x;
global y;global y2;
y=Amp*sin(2*3.14*Fre*x);
y2=Amp2*cos(2*3.14*Fre2*x);


% --- Executes on button press in Square.
function Square_Callback(hObject, eventdata, handles)
% hObject    handle to Square (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Amp;global Amp2;
global Fre;global Fre2;
global x;
global y;global y2;
y=Amp*square(2*3.14*Fre*x);
y2=Amp2*square(2*3.14*Fre2*x+2*3.14*Fre2/4);


% --- Executes on button press in Trangle.
function Trangle_Callback(hObject, eventdata, handles)
% hObject    handle to Trangle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Amp;global Amp2;
global Fre;global Fre2;
global x;
global y;global y2;
y=Amp*sawtooth(2*3.14*Fre*x);
y2=Amp2*sawtooth(2*3.14*Fre2*x+2*3.14*Fre2/4);

% --- Executes on button press in SineNol.
function SineNol_Callback(hObject, eventdata, handles)
% hObject    handle to SineNol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Amp;global Amp2;
global Fre;global Fre2;
global x;
global y;global y2;
y=0.5*randn(1,N)+Amp*sin(2*3.14*Fre*x);


% --- Executes on slider movement.
function slider_Fre2_Callback(hObject, eventdata, handles)
% hObject    handle to slider_Fre2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global Fre2;
Fre2=10*get(handles.slider_Fre2,'Value');
s1=sprintf('%f',Fre2);
set(handles.edit_Fre2,'String',s1);

% --- Executes during object creation, after setting all properties.
function slider_Fre2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_Fre2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider_Amp2_Callback(hObject, eventdata, handles)
% hObject    handle to slider_Amp2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global Amp2;
Amp2=100*get(handles.slider_Amp2,'Value');
s2=sprintf('%f',Amp2);
set(handles.edit_Amp2,'String',s2);

% --- Executes during object creation, after setting all properties.
function slider_Amp2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_Amp2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function edit_Fre2_Callback(hObject, eventdata, handles)
% hObject    handle to edit_Fre2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_Fre2 as text
%        str2double(get(hObject,'String')) returns contents of edit_Fre2 as a double


% --- Executes during object creation, after setting all properties.
function edit_Fre2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_Fre2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_Amp2_Callback(hObject, eventdata, handles)
% hObject    handle to edit_Amp2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_Amp2 as text
%        str2double(get(hObject,'String')) returns contents of edit_Amp2 as a double


% --- Executes during object creation, after setting all properties.
function edit_Amp2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_Amp2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in self_xcorr.
function self_xcorr_Callback(hObject, eventdata, handles)
% hObject    handle to self_xcorr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global x;
global y;global y2;
global T;
global Rxy;


Rxy = xcorr(y,y2);
N1=length(Rxy);
x1=linspace(-T,T,N1);

plot(handles.plot,x,y,'b','linewidth',1);
title(handles.plot,'y1');
xlim(handles.plot,[-T,T]);

plot(handles.plot_2,x,y2,'b','linewidth',1);
title(handles.plot_2,'y2');
xlim(handles.plot_2,[-T,T]);

plot(handles.plot_3,x1,Rxy,'b','linewidth',1);
title(handles.plot_3,'Rxy');
xlim(handles.plot_3,[-T,T]);