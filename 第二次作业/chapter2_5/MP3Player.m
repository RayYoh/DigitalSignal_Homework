function varargout = MP3Player(varargin)
%MP3PLAYER MATLAB code file for MP3Player.fig
%      MP3PLAYER, by itself, creates a new MP3PLAYER or raises the existing
%      singleton*.
%
%      H = MP3PLAYER returns the handle to a new MP3PLAYER or the handle to
%      the existing singleton*.
%
%      MP3PLAYER('Property','Value',...) creates a new MP3PLAYER using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to MP3Player_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      MP3PLAYER('CALLBACK') and MP3PLAYER('CALLBACK',hObject,...) call the
%      local function named CALLBACK in MP3PLAYER.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help MP3Player

% Last Modified by GUIDE v2.5 13-Sep-2020 20:29:12

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @MP3Player_OpeningFcn, ...
                   'gui_OutputFcn',  @MP3Player_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
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


% --- Executes just before MP3Player is made visible.
function MP3Player_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for MP3Player
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes MP3Player wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = MP3Player_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function Move_Callback(hObject, eventdata, handles)
% hObject    handle to Move (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global Move;
global y;
Move=get(handles.Move,'Value');
plot(handles.plot_2,y);
global length Zoom;
if Zoom==1
    Zoom=0.95;
end
xlim([length*Move,length*(Move+0.1*(1-Zoom))]);


% --- Executes during object creation, after setting all properties.
function Move_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Move (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function Zoom_Callback(hObject, eventdata, handles)
% hObject    handle to Zoom (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global Move;
global Zoom;
global y;
Zoom=get(handles.Zoom,'Value');
plot(handles.plot_2,y);
global length;
if Zoom==1
    Zoom=0.95;
end
xlim([length*Move,length*(Move+0.1*(1-Zoom))]);


% --- Executes during object creation, after setting all properties.
function Zoom_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Zoom (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in pushbutton_open.
function pushbutton_open_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_open (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global filename;
[Fnameh,Pnameh]=uigetfile('*.wav');%'*.mp3' %Fnameh文件名称，Pnameh文件路径
filename=[Pnameh,Fnameh];%存储文件路径和名称
set(handles.edit_file,'String',filename);
global y;
global Fs;
[y,Fs]=audioread(filename);
play=audioplayer(y,Fs);
playblocking(play);
global length;
[length,d]=size(y);
plot(handles.plot_1,y);
set(handles.Move,'Value',0);
set(handles.Zoom,'Value',0);
plot(handles.plot_2,y);
global Move;
global Zoom;
Move=get(handles.Move,'Value');
Zoom=get(handles.Zoom,'Value');
xlim([length*Move,length*(Move+0.1*(1-Zoom))]);

