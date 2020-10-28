function varargout = PDF_CDF(varargin)
% PDF_CDF MATLAB code for PDF_CDF.fig
%      PDF_CDF, by itself, creates a new PDF_CDF or raises the existing
%      singleton*.
%
%      H = PDF_CDF returns the handle to a new PDF_CDF or the handle to
%      the existing singleton*.
%
%      PDF_CDF('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PDF_CDF.M with the given input arguments.
%
%      PDF_CDF('Property','Value',...) creates a new PDF_CDF or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before PDF_CDF_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to PDF_CDF_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help PDF_CDF

% Last Modified by GUIDE v2.5 26-Sep-2020 14:57:35

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @PDF_CDF_OpeningFcn, ...
                   'gui_OutputFcn',  @PDF_CDF_OutputFcn, ...
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


% --- Executes just before PDF_CDF is made visible.
function PDF_CDF_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to PDF_CDF (see VARARGIN)

% Choose default command line output for PDF_CDF
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes PDF_CDF wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = PDF_CDF_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function Fre_slider_Callback(hObject, eventdata, handles)
% hObject    handle to Fre_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global Fre;
Fre=1000*get(handles.Fre_slider,'Value');
s1=sprintf('%f',Fre);
set(handles.Fre_edit,'String',s1);

% --- Executes during object creation, after setting all properties.
function Fre_slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Fre_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function Amp_slider_Callback(hObject, eventdata, handles)
% hObject    handle to Amp_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global Amp;
Amp=100*get(handles.Amp_slider,'Value');
s2=sprintf('%f',Amp);
set(handles.Amp_edit,'String',s2);

% --- Executes during object creation, after setting all properties.
function Amp_slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Amp_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function Fre_edit_Callback(hObject, eventdata, handles)
% hObject    handle to Fre_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Fre_edit as text
%        str2double(get(hObject,'String')) returns contents of Fre_edit as a double


% --- Executes during object creation, after setting all properties.
function Fre_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Fre_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Amp_edit_Callback(hObject, eventdata, handles)
% hObject    handle to Amp_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Amp_edit as text
%        str2double(get(hObject,'String')) returns contents of Amp_edit as a double


% --- Executes during object creation, after setting all properties.
function Amp_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Amp_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Noise.
function Noise_Callback(hObject, eventdata, handles)
% hObject    handle to Noise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global y;
global N;
global Amp;
global Fre;
global x;
y=0.3*Amp*randn(1,N);

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

% --- Executes on button press in Run.
function Run_Callback(hObject, eventdata, handles)
% hObject    handle to Run (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Amp;
global x;
global y;
plot(handles.signal,x,y,'b','linewidth',1);
title(handles.signal,'Waveform');
xlim(handles.signal,[0,0.1]);
ylim(handles.signal,[-1.5*Amp,1.5*Amp]);
A1=-1.5*Amp;A2=-A1;M=500;da=(A2-A1)/M;
a=linspace(A1,A2,M);
h=hist(y,a);
p=h/length(y);
plot(handles.pdf,a,p,'b','linewidth',1);
title(handles.pdf,'Pdf');
c(1)=0;
for i=2:M
    c(i)=c(i-1)+p(i);
end
plot(handles.cdf,a,c,'b','linewidth',1);
title(handles.cdf,'Cdf');


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
