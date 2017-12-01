function varargout = fourier2(varargin)
% FOURIER2 MATLAB code for fourier2.fig
%      FOURIER2, by itself, creates a new FOURIER2 or raises the existing
%      singleton*.
%
%      H = FOURIER2 returns the handle to a new FOURIER2 or the handle to
%      the existing singleton*.
%
%      FOURIER2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FOURIER2.M with the given input arguments.
%
%      FOURIER2('Property','Value',...) creates a new FOURIER2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before fourier2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to fourier2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help fourier2

% Last Modified by GUIDE v2.5 25-Nov-2014 20:17:05

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @fourier2_OpeningFcn, ...
                   'gui_OutputFcn',  @fourier2_OutputFcn, ...
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


% --- Executes just before fourier2 is made visible.
function fourier2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to fourier2 (see VARARGIN)

% Choose default command line output for fourier2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes fourier2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = fourier2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in abrir.
function abrir_Callback(hObject, eventdata, handles)
% hObject    handle to abrir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global RGB
[nombre ruta]=uigetfile({'*.jpg;*.bmp'},'ABRIR');
    RGB=imread(strcat(ruta,nombre));
   set(handles.texto,'string',ruta)
   axes(handles.axes1)
    imshow(RGB)
   calculo(hObject, eventdata, handles);
   
% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

delete(fourier2);

% --- Executes on button press in guardar.
function guardar_Callback(hObject, eventdata, handles)
% hObject    handle to guardar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on slider movement.
function r_Callback(hObject, eventdata, handles)
% hObject    handle to r (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global  r
r=get(handles.r,'value');
set(handles.text_r1,'String',r);
 calculo(hObject, eventdata, handles);

% --- Executes during object creation, after setting all properties.
function r_CreateFcn(hObject, eventdata, handles)
% hObject    handle to r (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function r1_Callback(hObject, eventdata, handles)
% hObject    handle to r1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global  r1
r1=get(handles.r1,'value');
set(handles.text_r1,'String',r1);
calculo(hObject, eventdata, handles);

% --- Executes during object creation, after setting all properties.
function r1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to r1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on selection change in menu.
function menu_Callback(hObject, eventdata, handles)
% hObject    handle to menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns menu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from menu


switch get(handles.menu,'value');

    case 1
    
     axes(handles.axes3)
     imshow(mask,[])

    
    case 2
        
        axes(handles.axes3)
        imshow(~mask2,[])
        
    case 3
       
       axes(handles.axes3)
       imshow(G)
        
        
    case 4
        axes(handles.axes3)
        imshow(~G)
   otherwise
end

% --- Executes during object creation, after setting all properties.
function menu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function texto_Callback(hObject, eventdata, handles)
% hObject    handle to texto (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of texto as text
%        str2double(get(hObject,'String')) returns contents of texto as a double


% --- Executes during object creation, after setting all properties.
function texto_CreateFcn(hObject, eventdata, handles)
% hObject    handle to texto (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function axes5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes5


function calculo(hObject, eventdata, handles)
global RGB
A=RGB;
H=tamano(A);
Im=rgb2gray(H);
fftimg=fftshift(fft2(Im));
fftimgabs=abs(fftimg);
fftimgabsshift=abs(fft(fftimgabs));
E=log10(1+fftimgabsshift);
set(imshow(handles.axes2,E))
colormap(hot)
m=160;
m1=160;
n=120;
n1=120;
[x y]=meshgrid(-m:m,-n:n);
mask= double((x.^2)+(y.^2)<r.^2);
[x1 y1]=meshgrid(-m1:m1,-n1:n1);
 mask2= double((x1.^2)+(y1.^2)<r1.^2);
 G=mask+(~mask2);
  
 w=mask.*fftimg;
inv=ifft2(w);
axes(handles.axes5)
imshow(abs(inv),[])

