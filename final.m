function varargout = final(varargin)
% FINAL MATLAB code for final.fig
%      FINAL, by itself, creates a new FINAL or raises the existing
%      singleton*.
%
%      H = FINAL returns the handle to a new FINAL or the handle to
%      the existing singleton*.
%
%      FINAL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FINAL.M with the given input arguments.
%
%      FINAL('Property','Value',...) creates a new FINAL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before final_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to final_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help final

% Last Modified by GUIDE v2.5 15-Apr-2016 01:25:29

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @final_OpeningFcn, ...
                   'gui_OutputFcn',  @final_OutputFcn, ...
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


% --- Executes just before final is made visible.
function final_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to final (see VARARGIN)

% Choose default command line output for final
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes final wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = final_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
global cover;
global embed;

axes(handles.coverimg);
%file name:name of file path name:entire path ..if user selects cancel then
%they r set to 0
[filename, pathname]=uigetfile( ...
{'*.jpg;*.png;*.bmp;*JPG;*jpeg;*.jpg','IMAGE Files';}, ...
'Pick an image file');
%IMAGE files:Cell array 
var=strcat(pathname,filename);
cover=imread(var);
% Showing the origional image
% h.image(IMG);
embed=cover;
imshow(cover);
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
global mcopy;
temp = mod(mcopy,2);
c=size(mcopy);
z=[c(1),c(2)];
for i=1:c(1)
    for j=1:c(2)
%         b=dec2bin(embed(i,j,1),8);
%         if strcmp(b(8),'1')==0
        if temp(i,j)==0
            z(i,j)=0;
        else
            z(i,j)=255;
        end
    end
end
%we are getting 8 digits for each pixel from the encoded part
%mod 2 is giving us last digit as we have encoded the LSB
% so if its white we getting 0 or its 1
%z is the blavk and white one
%imwrite z,file name,extension this file is written in the folder
imwrite(z,'decrypt.jpg','jpg');
axes(handles.decoded);
imshow(z);
set(handles.status2,'String','Done !');
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
global embed;
global mcopy;
c=size(mcopy);
z=[c(1),c(2)];
for i=1:c(1)
    for j=1:c(2)
        b=dec2bin(embed(i,j),8);
        if mod(i,3)==0
            if strcmp(b(6),'1')==0
                 z(i,j)=0;
            else
                 z(i,j)=255;
            end
        elseif mod(i,2)==0
            if strcmp(b(7),'1')==0 
                 z(i,j)=0;
            else
                 z(i,j)=255;
            end
        else
            if strcmp(b(8),'1')==0
                 z(i,j)=0;
            else
                 z(i,j)=255;
            end
        end
        
        embed(i,j,1)=bin2dec(b);
    end
end
imwrite(z,'decrypt.jpg','jpg');
axes(handles.decoded);
imshow(z);
set(handles.status2,'String','Done !');
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
global embed;
global mcopy;
c=size(mcopy);
z=[c(1),c(2)];
for i=1:c(1)
    for j=1:c(2)
        b=dec2bin(embed(i,j),8);
        if mod(i,2)==0
            if strcmp(b(6),'1')==0
                 z(i,j)=0;
            else
                 z(i,j)=255;
            end
        else
            if strcmp(b(8),'1')==0 
                 z(i,j)=0;
            else
                 z(i,j)=255;
            end
        end
        
        embed(i,j,1)=bin2dec(b);
    end
end
imwrite(z,'decrypt.jpg','jpg');
axes(handles.decoded);
imshow(z);
set(handles.status2,'String','Done !');
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
global embed;
global mcopy;
c=size(mcopy);
z=[c(1),c(2)];
for i=1:c(1)
    for j=1:c(2)
        b=dec2bin(embed(i,j,2),8);
        if mod(i,2)==0
            if strcmp(b(6),'1')==0
                 z(i,j)=0;
            else
                 z(i,j)=255;
            end
        else
            if strcmp(b(7),'1')==0 
                 z(i,j)=0;
            else
                 z(i,j)=255;
            end
        end
        
        embed(i,j,2)=bin2dec(b);
    end
end
imwrite(z,'decrypt.jpg','jpg');
axes(handles.decoded);
imshow(z);
set(handles.status2,'String','Done !');
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
%embed(i,j,1):A map alpha 
%LSB:Least significant bit algorithm. changing last bit
%PRINCIPLE:Human eye cant distinguish between 2 shades separated by 1 bit
% replace lsb of each pixel by 1 bit
global embed;

global mcopy;
if flag
    c=size(mcopy);
for i=1:c(1)
    for j=1:c(2)
        b=dec2bin(embed(i,j,1),8);
        if mcopy(i,j)==255
            b(8)='1';
        else
            b(8)='0';
        end
        embed(i,j,1)=bin2dec(b);
    end
end
axes(handles.embeddedimg);
% z=x;
imshow(embed);
set(handles.status1,'String','Ready:) !');
end
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
global embed;
global mcopy;
global flag;
if flag 
c=size(mcopy);
for i=1:c(1)
    for j=1:c(2)
        b=dec2bin(embed(i,j),8);
        if mod(i,3)==0
            if mcopy(i,j)==255
                b(6)='1';
            else
                b(6)='0';
            end
        elseif mod(i,2)==0
            if mcopy(i,j)==255
                b(7)='1';
            else
                b(7)='0';
            end
        else
             if mcopy(i,j)==255
                b(8)='1';
            else
                b(8)='0';
            end  
        end
        
        embed(i,j,1)=bin2dec(b);
    end
end
imwrite(embed,'embed.jpg','jpg');

axes(handles.embeddedimg);
imshow(embed);
set(handles.status1,'String','Ready !');
end
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
global embed;
global mcopy;
global flag;
if flag 
c=size(mcopy);
for i=1:c(1)
    for j=1:c(2)
        b=dec2bin(embed(i,j),8);
        if mod(i,2)==0
            if mcopy(i,j)==255
                b(6)='1';
            else
                b(6)='0';
            end
        else
            if mcopy(i,j)==255
                b(8)='1';
            else
                b(8)='0';
            end
        end
        
        embed(i,j,1)=bin2dec(b);
    end
end
imwrite(embed,'embed.jpg','jpg');

axes(handles.embeddedimg);
imshow(embed);
set(handles.status1,'String','Ready !');
end
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
global embed;
global mcopy;
 global flag;
if flag 
c=size(mcopy);
for i=1:c(1)
    for j=1:c(2)
        b=dec2bin(embed(i,j,2),8);
        if mod(i,2)==0
            if mcopy(i,j)==255
                b(6)='1';
            else
                b(6)='0';
            end
        else
            if mcopy(i,j)==255
                b(7)='1';
            else
                b(7)='0';
            end
        end
        
        embed(i,j,2)=bin2dec(b);
    end
end
imwrite(embed,'embed.jpg','jpg');
axes(handles.embeddedimg);
imshow(embed);
set(handles.status1,'String','Ready !');
end
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
global message;
global cover;
global mcopy;
global flag;
% every time to use or see the variable we need to declare the variable
% global each time SAME NAME
axes(handles.messageimg);
[filename, pathname]=uigetfile( ...
{'*.jpg;*.png;*.bmp;*.jpg','IMAGE Files';}, ...
'Pick an image file');
var=strcat(pathname,filename);
message=imread(var);
% Showing the origional image
% h.image(IMG);
mcopy=message;
c=size(message);
d=size(cover);
%cover image dimension should be greater than that msg one
if d(1)<c(1) || d(2)<c(2)
    flag=0;
else
    flag=1;
end
imshow(message);
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton18.
function pushbutton18_Callback(hObject, eventdata, handles)
global embed;
global cover;
x=embed;  %reading encrypted image
y=cover;  %reading non-encrypted image
global flag;
if flag 
x=uint16(x);    %16 bit conversion
y=uint16(y);    %16 bit conversion

[x_row, x_col]=size(x);

b=0;k=1;
%decrypting loop
for i=1:x_row
    for j=1:x_col
        if(x(i,j)>=y(i,j))
            a=x(i,j)-y(i,j);
        else
            a=256+x(i,j)-y(i,j);
        end
        
        if(a~=0)
            z(k)=uint8(a);
            k=k+1;
        else
            b=1;
            break;
        end
    end
    if(b==1)
        break;
    end
end
for i=1:k-1
    f(i) = z(i); %writing to file
end
f = char(f);
set(handles.edit4,'String',f);
set(handles.status2,'String','Done !');
end
% hObject    handle to pushbutton18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

 % --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
Str = get(handles.edit2,'String');
Str=uint16(Str);    %converting to 16 bit numbers for proper calculation
global cover;
global embed;
x=cover;   %reading the image file
x=uint16(x);                %conversion to 16 bit %class uinit 16 bit unsigned 16 bit
[x_row,x_col]=size(x);

c=numel(Str);   %counting characters
a=1;

%encrypting loop
for i=1:x_row
    for j=1:x_col
        if(a<=c)
            
            if(x(i,j)+Str(a)>255)
                temp=x(i,j)+Str(a)-256;
            else
                temp=x(i,j)+Str(a);
            end
            z(i,j)=uint8(temp);
        else
            z(i,j)=uint8(x(i,j));
        end
        a=a+1;
    end
end
embed = z;
axes(handles.embeddedimg);
imshow(embed);
set(handles.status1,'String','Ready !');

% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
