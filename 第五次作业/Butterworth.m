function varargout = Butterworth(varargin)
% BUTTERWORTH MATLAB code for Butterworth.fig
%      BUTTERWORTH, by itself, creates a new BUTTERWORTH or raises the existing
%      singleton*.
%
%      H = BUTTERWORTH returns the handle to a new BUTTERWORTH or the handle to
%      the existing singleton*.
%
%      BUTTERWORTH('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BUTTERWORTH.M with the given input arguments.
%
%      BUTTERWORTH('Property','Value',...) creates a new BUTTERWORTH or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Butterworth_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Butterworth_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Butterworth

% Last Modified by GUIDE v2.5 17-Oct-2020 15:06:10

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Butterworth_OpeningFcn, ...
                   'gui_OutputFcn',  @Butterworth_OutputFcn, ...
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


% --- Executes just before Butterworth is made visible.
function Butterworth_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Butterworth (see VARARGIN)

% Choose default command line output for Butterworth
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Butterworth wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Butterworth_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;




% --- Executes on selection change in filter.
function filter_Callback(hObject, eventdata, handles)
% hObject    handle to filter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns filter contents as cell array
%        contents{get(hObject,'Value')} returns selected item from filter
val=get(handles.filter,'value');
global flag_filter;
switch val
    case 2
        flag_filter=1;
    case 3
        flag_filter=2;
    case 4
        flag_filter=3;
    case 5
        flag_filter=4;
end

% --- Executes during object creation, after setting all properties.
function filter_CreateFcn(hObject, eventdata, handles)
% hObject    handle to filter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function run_Callback(hObject, eventdata, handles)
% hObject    handle to run (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global high;
global low;
global flag_filter;
global num;
Fs = 2048; dt=1.0/Fs;
T =1; N=T/dt; t=[0:N-1]/N;
x1 =sin(2*pi*50*t)+sin(2*pi*300*t)+sin(2*pi*500*t);
plot(handles.axes4,t,x1,'linewidth',2);
axis(handles.axes4,[0, 0.1, -2,2]);
A=zeros(1,num);
B=zeros(1,num);
C=zeros(1,num);
D=zeros(1,num);
E=zeros(1,num);
for k=1:num
    E(k)=cos((2*k+2*num-1)*pi/(4*num));
    D(k)=1/(1+low^2-2*low*E(k));
    A(k)=low^2*D(k);
    B(k)=2*(low^2-1)*D(k);
    C(k)=(1+low^2+2*low*E(k))*D(k);
end
b=[A(k),2*A(k),A(k)];
a=[1,B(k),C(k)];
x2= filter(b,a,x1);
for k=1:num
    E(k)=cos((2*k+2*num-1)*pi/(4*num));
    D(k)=1/(1+high^2-2*high*E(k));
    A(k)=high^2*D(k);
    B(k)=2*(high^2-1)*D(k);
    C(k)=(1+high^2+2*high*E(k))*D(k);
end
b=[A(k),2*A(k),A(k)];
a=[1,B(k),C(k)];
x3= filter(b,a,x1);
switch flag_filter
    case 1
        plot(handles.axes5,t,x2,'linewidth',2);
        axis(handles.axes5,[0, 0.1, -1.5,1.5]);
    case 2
        plot(handles.axes5,t,x1-x3,'linewidth',2);
        axis(handles.axes5,[0, 0.1, -1.5,1.5]);
    case 3
        plot(handles.axes5,t,x1-x2-x3,'linewidth',2);
        axis([0, 0.1, -1.5,1.5]);
    case 4
        plot(handles.axes5,t,x2+x3,'linewidth',2);
        axis([0, 0.1, -1.5,1.5]);
end


function low_Callback(hObject, eventdata, handles)
% hObject    handle to low (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of low as text
%        str2double(get(hObject,'String')) returns contents of low as a double
global low;
low=str2num(get(handles.low,'string'));

% --- Executes during object creation, after setting all properties.
function low_CreateFcn(hObject, eventdata, handles)
% hObject    handle to low (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function high_Callback(hObject, eventdata, handles)
% hObject    handle to high (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of high as text
%        str2double(get(hObject,'String')) returns contents of high as a double

global high;
high=str2num(get(handles.high,'string'));
% --- Executes during object creation, after setting all properties.
function high_CreateFcn(hObject, eventdata, handles)
% hObject    handle to high (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in self.
function self_Callback(hObject, eventdata, handles)
% hObject    handle to self (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global high;
global low;
global flag_filter;
global num;
Fs = 2048; dt=1.0/Fs;
T =1; N=T/dt; t=[0:N-1]/N;
x1 =sin(2*pi*50*t)+sin(2*pi*300*t)+sin(2*pi*500*t);
plot(handles.axes4,t,x1,'linewidth',2);
axis(handles.axes4,[0, 0.1, -2,2]);
switch flag_filter
    case 1
        [b,a] = butter(2*num,low,'low');
    case 2
        [b,a] = butter(2*num,high,'high');
    case 3
        [b,a] = butter(2*num,[low,high],'bandpass');
    case 4
        [b,a] = butter(2*num,[low ,high],'stop');
end
x2= filter(b,a,x1);
plot(handles.axes5,t,x2,'linewidth',2);
axis(handles.axes5,[0, 0.1, -1.5,1.5]);



function order_Callback(hObject, eventdata, handles)
% hObject    handle to order (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of order as text
%        str2double(get(hObject,'String')) returns contents of order as a double
global num;
num=str2num(get(handles.order,'string'));

% --- Executes during object creation, after setting all properties.
function order_CreateFcn(hObject, eventdata, handles)
% hObject    handle to order (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
