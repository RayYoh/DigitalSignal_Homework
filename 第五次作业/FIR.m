function varargout = FIR(varargin)
% FIR MATLAB code for FIR.fig
%      FIR, by itself, creates a new FIR or raises the existing
%      singleton*.
%
%      H = FIR returns the handle to a new FIR or the handle to
%      the existing singleton*.
%
%      FIR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FIR.M with the given input arguments.
%
%      FIR('Property','Value',...) creates a new FIR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before FIR_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to FIR_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help FIR

% Last Modified by GUIDE v2.5 17-Oct-2020 09:25:15

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @FIR_OpeningFcn, ...
                   'gui_OutputFcn',  @FIR_OutputFcn, ...
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


% --- Executes just before FIR is made visible.
function FIR_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to FIR (see VARARGIN)

% Choose default command line output for FIR
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes FIR wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = FIR_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in window.
function window_Callback(hObject, eventdata, handles)
% hObject    handle to window (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns window contents as cell array
%        contents{get(hObject,'Value')} returns selected item from window
val=get(handles.window,'value');
global flag_window;
switch val
    case 2
        flag_window=1;
    case 3
        flag_window=2;
    case 4
        flag_window=3;
end

% --- Executes during object creation, after setting all properties.
function window_CreateFcn(hObject, eventdata, handles)
% hObject    handle to window (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


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



function length_Callback(hObject, eventdata, handles)
% hObject    handle to length (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of length as text
%        str2double(get(hObject,'String')) returns contents of length as a double
global N;
N=str2num(get(handles.length,'string'));


% --- Executes during object creation, after setting all properties.
function length_CreateFcn(hObject, eventdata, handles)
% hObject    handle to length (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in run.
function run_Callback(hObject, eventdata, handles)
% hObject    handle to run (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global N;
global low; global high;
global flag_filter; global flag_window;
if flag_filter==1
    k=1;
    h=zeros(1,2*N+1);
    for i=-N:N
        f=i*pi;
        h(k)=sin(low*f)/f;
        k=k+1;
    end
    h(N+1)=low;
    M=length(h);
    x=linspace(-N,N,M);
    plot(handles.axes1,x,h,'r','linewidth',0.5);
    for i=0:M-1
        w_hamming(i+1)=0.54-0.46*cos(2*pi*i/(M-1)); %Hamming
        w_hann(i+1)=0.5*(1-cos(2*pi*i/(M-1))); %Hann
        w_flattop(i+1)=0.42-0.5*cos(2*pi*i/(M-1))+0.08*cos(4*pi*i/(M-1)); %Flattop
    end
    if flag_window==1
        c=h.*w_hamming;
        plot(handles.axes2,x,w_hamming,'c','linewidth',1.5);
    elseif flag_window==2
        c=h.*w_hann;
        plot(handles.axes2,x,w_hann,'c','linewidth',1.5); 
    elseif flag_window==3
        c=h.*w_flattop;
        plot(handles.axes2,x,w_flattop,'c','linewidth',1.5);
    end
    plot(handles.axes3,x,c,'r','linewidth',.5);

    Fs = length(h); dt=1.0/Fs;
    T =1; L=T/dt; t=[0:L-1]/L;
    x1 =sin(2*pi*50*t)+sin(2*pi*300*t)+sin(2*pi*500*t);
    plot(handles.axes4,t,x1,'linewidth',1.5);xlim(handles.axes4,[0,0.1]);
    ylim(handles.axes4,[-2,2]);
    grid on;
    temp=fft(x1).*fft(c);
    result=ifft(temp);
    plot(handles.axes5,t,result,'k','linewidth',1.5);
    xlim(handles.axes5,[0,0.1]);
    grid on;
elseif flag_filter==2
    k=1;
    h=zeros(1,2*N+1);
    for i=-N:N
        f=i*pi;
        h(k)=-sin(high*f)/f;
        k=k+1;
    end
    h(N+1)=1-high;
    M=length(h);
    x=linspace(-N,N,M);
    plot(handles.axes1,x,h,'r','linewidth',.5);
    for i=0:M-1
        w_hamming(i+1)=0.54-0.46*cos(2*pi*i/(M-1)); %Hamming
        w_hann(i+1)=0.5*(1-cos(2*pi*i/(M-1))); %Hann
        w_flattop(i+1)=0.42-0.5*cos(2*pi*i/(M-1))+0.08*cos(4*pi*i/(M-1)); %Flattop
    end
    if flag_window==1
        c=h.*w_hamming;
        plot(handles.axes2,x,w_hamming,'c','linewidth',1.5);
    elseif flag_window==2
        c=h.*w_hann;
        plot(handles.axes2,x,w_hann,'c','linewidth',1.5); 
    elseif flag_window==3
        c=h.*w_flattop;
        plot(handles.axes2,x,w_flattop,'c','linewidth',1.5);
    end
    plot(handles.axes3,x,c,'r','linewidth',.5);

    Fs = length(h); dt=1.0/Fs;
    T =1; L=T/dt; t=[0:L-1]/L;
    x1 =sin(2*pi*50*t)+sin(2*pi*300*t)+sin(2*pi*500*t);
    plot(handles.axes4,t,x1,'linewidth',1.5);xlim(handles.axes4,[0,0.1]);
    ylim(handles.axes4,[-2,2]);
    grid on;
    temp=fft(x1).*fft(c);
    result=ifft(temp);
    plot(handles.axes5,t,result,'k','linewidth',1.5);
    xlim(handles.axes5,[0,0.1]);
    grid on;
    
elseif flag_filter==3
    k=1;
    h=zeros(1,2*N+1);
    for i=-N:N
        f=i*pi;
        h(k)=sin(high*f)/f-sin(low*f)/f;
        k=k+1;
    end
    h(N+1)=high-low;
    M=length(h);
    x=linspace(-N,N,M);
    plot(handles.axes1,x,h,'r','linewidth',.5);
    for i=0:M-1
        w_hamming(i+1)=0.54-0.46*cos(2*pi*i/(M-1)); %Hamming
        w_hann(i+1)=0.5*(1-cos(2*pi*i/(M-1))); %Hann
        w_flattop(i+1)=0.42-0.5*cos(2*pi*i/(M-1))+0.08*cos(4*pi*i/(M-1)); %Flattop
    end
    if flag_window==1
        c=h.*w_hamming;
        plot(handles.axes2,x,w_hamming,'c','linewidth',1.5);
    elseif flag_window==2
        c=h.*w_hann;
        plot(handles.axes2,x,w_hann,'c','linewidth',1.5); 
    elseif flag_window==3
        c=h.*w_flattop;
        plot(handles.axes2,x,w_flattop,'c','linewidth',1.5);
    end
    plot(handles.axes3,x,c,'r','linewidth',.5);

    Fs = length(h); dt=1.0/Fs;
    T =1; L=T/dt; t=[0:L-1]/L;
    x1 =sin(2*pi*50*t)+sin(2*pi*300*t)+sin(2*pi*500*t);
    plot(handles.axes4,t,x1,'linewidth',1.5);
    xlim(handles.axes4,[0,0.1]);
    ylim(handles.axes4,[-2,2]);
    grid on;
    temp=fft(x1).*fft(c);
    result=ifft(temp);
    plot(handles.axes5,t,result,'k','linewidth',1.5);
    xlim(handles.axes5,[0,0.1]);
    grid on;
elseif flag_filter==4
    k=1;
    h=zeros(1,2*N+1);
    for i=-N:N
        f=i*pi;
        h(k)=-(sin(high*f)/f+sin(low*f)/f);
        k=k+1;
    end
    h(N+1)=1-(high-low);
    M=length(h);
    x=linspace(-N,N,M);
    plot(handles.axes1,x,h,'r','linewidth',.5);
    for i=0:M-1
        w_hamming(i+1)=0.54-0.46*cos(2*pi*i/(M-1)); %Hamming
        w_hann(i+1)=0.5*(1-cos(2*pi*i/(M-1))); %Hann
        w_flattop(i+1)=0.42-0.5*cos(2*pi*i/(M-1))+0.08*cos(4*pi*i/(M-1)); %Flattop
    end
    if flag_window==1
        c=h.*w_hamming;
        plot(handles.axes2,x,w_hamming,'c','linewidth',1.5);
    elseif flag_window==2
        c=h.*w_hann;
        plot(handles.axes2,x,w_hann,'c','linewidth',1.5); 
    elseif flag_window==3
        c=h.*w_flattop;
        plot(handles.axes2,x,w_flattop,'c','linewidth',1.5);
    end
    plot(handles.axes3,x,c,'r','linewidth',.5);

    Fs = length(h); dt=1.0/Fs;
    T =1; L=T/dt; t=[0:L-1]/L;
    x1 =sin(2*pi*50*t)+sin(2*pi*300*t)+sin(2*pi*500*t);
    plot(handles.axes4,t,x1,'linewidth',1.5);
%     xlim(handles.axes4,[0,0.1]);
%     ylim(handles.axes4,[-3,3]);
    axis(handles.axes4,[0,0.1,-2,2]);
    grid on;
    temp=fft(x1).*fft(c);
    result=ifft(temp);
    plot(handles.axes5,t,result,'k','linewidth',1.5);
    xlim(handles.axes5,[0,0.1]);
    grid on;
end 
    


function lowFre_Callback(hObject, eventdata, handles)
% hObject    handle to lowFre (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of lowFre as text
%        str2double(get(hObject,'String')) returns contents of lowFre as a double
global low;
low=str2num(get(handles.lowFre,'string'));


% --- Executes during object creation, after setting all properties.
function lowFre_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lowFre (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function highFre_Callback(hObject, eventdata, handles)
% hObject    handle to highFre (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of highFre as text
%        str2double(get(hObject,'String')) returns contents of highFre as a double
global high;
high=str2num(get(handles.highFre,'string'));

% --- Executes during object creation, after setting all properties.
function highFre_CreateFcn(hObject, eventdata, handles)
% hObject    handle to highFre (see GCBO)
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
global flag_filter;global flag_window;
global N;
global low; global high;
Fs = 2*N+1; dt=1.0/Fs;
T =1; L=T/dt; t=[0:L-1]/L;
x1 =sin(2*pi*50*t)+sin(2*pi*300*t)+sin(2*pi*500*t);
plot(handles.axes4,t,x1,'linewidth',1.5);
grid on;
axis(handles.axes4,[0, 0.1, -2,2]);
switch flag_window
    case 1
        window=hamming(N+1);
    case 2
        window=hann(N+1);
    case 3
        window=flattopwin(N+1);
end
plot(handles.axes2,window,'m','linewidth',1.5);
switch flag_filter
    case 1
        b=fir1(N,low,window);
    case 2
        b=fir1(N,high,'high',window);
    case 3
        b=fir1(N,[low,high],window);
    case 4
        b=fir1(N,[low,high],'stop',window);
end
x2= filter(b,1,x1);
plot(handles.axes5,t,x2,'g','linewidth',1.5);
xlim(handles.axes5,[0, 0.1]);
grid on;
