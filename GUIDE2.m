function varargout = GUIDE2(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUIDE2_OpeningFcn, ...
                   'gui_OutputFcn',  @GUIDE2_OutputFcn, ...
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



function GUIDE2_OpeningFcn(hObject, eventdata, handles, varargin)
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

set(handles.hin,'value',0);
set(handles.lin,'value',255);
set(handles.hout,'value',0);
set(handles.lout,'value',255);
set(handles.gamma,'value',1);



guidata(hObject, handles);

function varargout = GUIDE2_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;


% cargar.
function cargar_Callback(hObject, eventdata, handles)
global RGB;
global gray

[fn pn] = uigetfile('*.jpg','select jpg')
imagen = strcat(pn,fn);
RGB=imread(imagen);
% gray=mi_rgb2gray(RGB,'l');
iter(hObject, eventdata, handles)


%cerrar.
% function cerrar_Callback(hObject, eventdata, handles)
% delete(handles.figura)


% slider1
function hout_Callback(hObject, eventdata, handles)
global high_out;

high_out=get(handles.hout,'value');
set(handles.hout,'string',high_out);

function hout_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end




% slider3 .
function hin_Callback(hObject, eventdata, handles)
global high_in;
high_in=get(handles.hin,'value');
set(handles.hin,'string',high_in);
iter (hObject, eventdata, handles);


function hin_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% slider4
function lin_Callback(hObject, eventdata, handles)
global low_in;

low_in=get(handles.lin ,'value');
set(handles.lin,'string',low_in);

iter (hObject, eventdata, handles);

function lin_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% slider cinco
function gamma_Callback(hObject, eventdata, handles)
global n;
n=get(handles.gamma,'value');
set(handles.gamma,'string',n);

iter (hObject, eventdata, handles);

function gamma_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function iter (hObject, eventdata, handles)

global RGB;
global gray;
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

I=my_adjust(RGB,low_in,high_in,low_out,high_out,n);
axes(handles.imagen);
imshow(I)


axes(handles.histograma)
mi_imhist(I,1);

%%% muestra curva de la imagen ajustada %%%
grafica = my_adjust([0:255],0,255,0,255,0.5);
axes(handles.contraste);
plot(grafica,'r','LineWidth',3);
grid on;
axis([0 255 0 255]);


% --- Executes on slider movement.
function lout_Callback(hObject, eventdata, handles)
global low_out;
low_out=get(handles.lout,'value');
set(handles.lout,'string',low_out);
iter(hObject, eventdata, handles);


% --- Executes during object creation, after setting all properties.
function lout_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lout (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

