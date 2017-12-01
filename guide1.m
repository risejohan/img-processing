function varargout = guide1(varargin)
% Last Modified by GUIDE v2.5 08-Sep-2014 17:23:57
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @guide1_OpeningFcn, ...
                   'gui_OutputFcn',  @guide1_OutputFcn, ...
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

function guide1_OpeningFcn(hObject, eventdata, handles, varargin)

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

set(handles.slider5,'value',0);
set(handles.slider6,'value',255);
set(handles.slider3,'value',0);
set(handles.slider4,'value',255);
set(handles.slider7,'value',1);



guidata(hObject, handles);

function varargout = guide1_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;


function cargar_Callback(hObject, eventdata, handles)
global RGB;
global gray

[fn pn] = uigetfile('*.jpg','select jpg')
complete = strcat(pn,fn);
RGB=imread(complete);
gray=mi_rgb2gray(RGB,'l');
iter(hObject, eventdata, handles)



function Cerrar_Callback(hObject, eventdata, handles)
delete(handles.figura)



function slider3_Callback(hObject, eventdata, handles)
global low_out;

low_out=get(handles.slider3,'value');
set(handles.editslider3,'string',low_out);

iter(hObject, eventdata, handles);
function slider3_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end




function slider4_Callback(hObject, eventdata, handles)
global high_out;

high_out=get(handles.slider4,'value');
set(handles.editslider4,'string',high_out);

iter (hObject, eventdata, handles);
function slider4_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end




function slider5_Callback(hObject, eventdata, handles)
global low_in;

low_in=get(handles.slider5,'value');
set(handles.editslider5,'string',low_in);

iter (hObject, eventdata, handles);
function slider5_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


function slider6_Callback(hObject, eventdata, handles)
global high_in;
high_in=get(handles.slider6,'value');
set(handles.editslider6,'string',high_in);
iter (hObject, eventdata, handles);
function slider6_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end





function slider7_Callback(hObject, eventdata, handles)
global n;
n=get(handles.slider7,'value');
set(handles.editslider7,'string',n);
iter (hObject, eventdata, handles);
function slider7_CreateFcn(hObject, eventdata, handles)
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


I=my_adjust(gray,low_in,high_in,low_out,high_out,n);
axes(handles.imagen);
imshow(I)

axes(handles.histograma)
mi_imhist(I,1);

%%% muestra curva de la imagen ajustada %%%
grafica = my_adjust([0:255],low_in,high_in,low_out,high_out,n);
axes(handles.contraste);
plot(grafica,'r','LineWidth',3);
grid on;
axis([0 255 0 255]);
