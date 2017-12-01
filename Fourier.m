function varargout = Fourier(varargin)
% FOURIER MATLAB code for Fourier.fig
%      FOURIER, by itself, creates a new FOURIER or raises the existing
%      singleton*.
%
%      H = FOURIER returns the handle to a new FOURIER or the handle to
%      the existing singleton*.
% See also: GUIDE, GUIDATA, GUIHANDLES
% Last Modified by GUIDE v2.5 25-Nov-2014 19:47:12

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Fourier_OpeningFcn, ...
                   'gui_OutputFcn',  @Fourier_OutputFcn, ...
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


% --- Executes just before Fourier is made visible.
function Fourier_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Fourier (see VARARGIN)

% Choose default command line output for Fourier
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Fourier wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Fourier_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



% --- Executes on slider movement.
function r_Callback(hObject, eventdata, handles)
% hObject    handle to r (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global  r
r=get(handles.r,'value');
set(handles.text_r,'String',r);
 menu(hObject, eventdata, handles);

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
set(handles.text_r1,'String',r);
 menu(hObject, eventdata, handles);

% --- Executes during object creation, after setting all properties.
function r1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to r1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function guardar_Callback(hObject, eventdata, handles)



% --- Executes during object creation, after setting all properties.
function guardar_CreateFcn(hObject, eventdata, handles)
% hObject    handle to guardar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end 


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)

global RGB
[nombre ruta]=uigetfile({'*.jpg;*.bmp'},'pushbutton1');
    RGB=imread(strcat(ruta,nombre));
   set(handles.editRuta,'string',ruta)
   axes(handles.axes1)
        imshow(RGB)
   menu(hObject, eventdata, handles);
   
   % --- Executes during object creation, after setting all properties.
function pushbutton1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
delete(Fourier);



function editRuta_Callback(hObject, eventdata, handles)
% hObject    handle to editRuta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editRuta as text
%        str2double(get(hObject,'String')) returns contents of editRuta as a double


% --- Executes during object creation, after setting all properties.
function editRuta_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editRuta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in menu.
function menu_Callback(hObject, eventdata, handles)
% hObject    handle to menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns menu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from menu
nombre=A;
A=imread('lena.jpg');
H=tamano(A);
Im=rgb2gray(H);
fftimg=fftshift(fft2(Im));
fftimgabs=abs(fftimg);
fftimgabsshift=abs(fft(fftimgabs));
imagesc(log10(1+fftimgabs))
E=log10(1+fftimgabsshift);
set(imagesc(handles.axes2,E))
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
imshow(abs(inv),[])
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
