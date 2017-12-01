function varargout = guide_imadjust(varargin)
% GUIDE_IMADJUST M-file for guide_imadjust.fig
%      GUIDE_IMADJUST, by itself, creates a new GUIDE_IMADJUST or raises the existing
%      singleton*.
%
%      H = GUIDE_IMADJUST returns the handle to a new GUIDE_IMADJUST or the handle to
%      the existing singleton*.
%
%      GUIDE_IMADJUST('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUIDE_IMADJUST.M with the given input arguments.
%
%      GUIDE_IMADJUST('Property','Value',...) creates a new GUIDE_IMADJUST or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before guide_imadjust_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to guide_imadjust_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help guide_imadjust

% Last Modified by GUIDE v2.5 08-Sep-2014 20:38:44

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @guide_imadjust_OpeningFcn, ...
                   'gui_OutputFcn',  @guide_imadjust_OutputFcn, ...
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


% --- Executes just before guide_imadjust is made visible.
function guide_imadjust_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to guide_imadjust (see VARARGIN)

% Choose default command line output for guide_imadjust
handles.output = hObject;


global low_out;
global low_in;
global high_out;
global high_in;
global n;


low_in=0;
high_in=255;
low_out=0;
high_out=255;
n=1;

set(handles.sliderlowin,'value',0);
set(handles.sliderhighin,'value',255);
set(handles.sliderlowout,'value',0);
set(handles.sliderhighout,'value',255);
set(handles.slidergama,'value',1);

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes guide_imadjust wait for user response (see UIRESUME)
% uiwait(handles.figura);


% --- Outputs from this function are returned to the command line.
function varargout = guide_imadjust_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushabrir.
function pushabrir_Callback(hObject, eventdata, handles)
% hObject    handle to pushabrir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global RGB;
global gray

[fn pn] = uigetfile('*.jpg','select jpg')
complete = strcat(pn,fn);
%%set(handles.EditRuta,'string',complete);
RGB=imread(complete);
gray=mi_rgb2gray(RGB,'l');
evaluar(hObject, eventdata, handles)

% --- Executes on button press in pushcerrar.
function pushcerrar_Callback(hObject, eventdata, handles)
% hObject    handle to pushcerrar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

delete(handles.figura)


function evaluar (hObject, eventdata, handles)

global RGB;
global gray;
global low_out;
global low_in;
global high_out;
global high_in;
global n;


imagenactual=mi_imadjust(gray,low_in,high_in,low_out,high_out,n);
axes(handles.imagen);
imshow(imagenactual)

axes(handles.histograma)
mi_imhist(imagenactual,1);

%%% muestra curva de la imagen ajustada %%%
grafica = mi_imadjust([0:255],low_in,high_in,low_out,high_out,n);
axes(handles.imadjust);
plot(grafica,'r','LineWidth',3);
grid on;
axis([0 255 0 255]);






% --- Executes on slider movement.
function sliderlowout_Callback(hObject, eventdata, handles)
% hObject    handle to sliderlowout (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

global low_out;

low_out=get(handles.sliderlowout,'value');
set(handles.editlowout,'string',low_out);

evaluar (hObject, eventdata, handles);


% --- Executes during object creation, after setting all properties.
function sliderlowout_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderlowout (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function sliderhighout_Callback(hObject, eventdata, handles)
% hObject    handle to sliderhighout (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

global high_out;

high_out=get(handles.sliderhighout,'value');
set(handles.edithighout,'string',high_out);

evaluar (hObject, eventdata, handles);

% --- Executes during object creation, after setting all properties.
function sliderhighout_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderhighout (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function sliderlowin_Callback(hObject, eventdata, handles)
% hObject    handle to sliderlowin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

global low_in;

low_in=get(handles.sliderlowin,'value');
set(handles.editlowin,'string',low_in);

evaluar (hObject, eventdata, handles);



% --- Executes during object creation, after setting all properties.
function sliderlowin_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderlowin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function sliderhighin_Callback(hObject, eventdata, handles)
% hObject    handle to sliderhighin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

global high_in;

high_in=get(handles.sliderhighin,'value');
set(handles.edithighin,'string',high_in);

evaluar (hObject, eventdata, handles);

% --- Executes during object creation, after setting all properties.
function sliderhighin_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderhighin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slidergama_Callback(hObject, eventdata, handles)
% hObject    handle to slidergama (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global n;

n=get(handles.slidergama,'value');
set(handles.editgama,'string',n);

evaluar (hObject, eventdata, handles);

% --- Executes during object creation, after setting all properties.
function slidergama_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slidergama (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function editlowout_Callback(hObject, eventdata, handles)
% hObject    handle to editlowout (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editlowout as text
%        str2double(get(hObject,'String')) returns contents of editlowout as a double


% --- Executes during object creation, after setting all properties.
function editlowout_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editlowout (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edithighout_Callback(hObject, eventdata, handles)
% hObject    handle to edithighout (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edithighout as text
%        str2double(get(hObject,'String')) returns contents of edithighout as a double


% --- Executes during object creation, after setting all properties.
function edithighout_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edithighout (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editlowin_Callback(hObject, eventdata, handles)
% hObject    handle to editlowin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editlowin as text
%        str2double(get(hObject,'String')) returns contents of editlowin as a double


% --- Executes during object creation, after setting all properties.
function editlowin_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editlowin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edithighin_Callback(hObject, eventdata, handles)
% hObject    handle to edithighin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edithighin as text
%        str2double(get(hObject,'String')) returns contents of edithighin as a double


% --- Executes during object creation, after setting all properties.
function edithighin_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edithighin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editgama_Callback(hObject, eventdata, handles)
% hObject    handle to editgama (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editgama as text
%        str2double(get(hObject,'String')) returns contents of editgama as a double


% --- Executes during object creation, after setting all properties.
function editgama_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editgama (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over sliderhighout.
function sliderhighout_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to sliderhighout (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
