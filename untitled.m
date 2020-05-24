function varargout = untitled(varargin)
% UNTITLED MATLAB code for untitled.fig
%      UNTITLED, by itself, creates a new UNTITLED or raises the existing
%      singleton*.
%
%      H = UNTITLED returns the handle to a new UNTITLED or the handle to
%      the existing singleton*.
%
%      UNTITLED('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNTITLED.M with the given input arguments.
%
%      UNTITLED('Property','Value',...) creates a new UNTITLED or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitled_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitled_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled

% Last Modified by GUIDE v2.5 20-May-2020 23:00:17

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled_OutputFcn, ...
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


% --- Executes just before untitled is made visible.
function untitled_OpeningFcn(hObject, eventdata, handles, varargin)

radio1 = get(handles.rb1, 'Value');
radio2 = get(handles.rb2, 'Value');
if radio1 == 1
  set(handles.listbox1, 'Visible', 'on');
else
  set(handles.listbox1, 'Visible', 'off');
end
if radio2 == 1
  set(handles.listbox2, 'Visible', 'on');
else
  set(handles.listbox2, 'Visible', 'off');
end

% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitled (see VARARGIN)

% Choose default command line output for untitled
%vec = ['Bisection      ';'False_position';'Fixed_point';'Newton_Rhaphson';'Secant'];
vec = ['Bisection        ';'False_position   ';'Fixed_point      ';'Newton_Rhaphson  ';'Secant           ';'General algorithm'];
vec1 = ['Lagrange';'Newton  '];
handles.output = hObject;

set(handles.listbox1,'string',{vec});
set(handles.listbox2,'string',{vec1});


% Update handles structure
guidata(hObject, handles);

% UIWAIT makes untitled wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = untitled_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in rb2.
function rb2_Callback(hObject, eventdata, handles)

set(handles.edit2,'String','');
set(handles.edit3,'String','');
set(handles.edit5,'String','');
set(handles.edit4,'String','');
set(handles.edit6,'String','');
set(handles.edit8,'String','');
set(handles.text3,'String','');

set(handles.edit4, 'Visible', 'off');
set(handles.edit6, 'Visible', 'off');
set(handles.edit7, 'Visible', 'off');
set(handles.text9, 'Visible', 'off');
set(handles.text12, 'Visible', 'off');
set(handles.text13, 'Visible', 'off');
set(handles.edit8, 'Visible', 'off');
set(handles.text3, 'Visible', 'on');
set(handles.rb1, 'Value', 0);
radio1 = get(handles.rb1, 'Value');
radio2 = get(handles.rb2, 'Value');
if radio1 == 1
  set(handles.listbox1, 'Visible', 'on');
else
  set(handles.listbox1, 'Visible', 'off');
end
if radio2 == 1
  set(handles.listbox2, 'Visible', 'on');
else
  set(handles.listbox2, 'Visible', 'off');
end
myString = sprintf('x values');
set(handles.text5, 'String', myString);
myString = sprintf('y values');
set(handles.text6, 'String', myString);
myString = sprintf('values');
set(handles.text8, 'String', myString);
set(handles.text9, 'Visible', 'off');
set(handles.edit4, 'Visible', 'off');
set(handles.edit6, 'Visible', 'off');
set(handles.edit7, 'Visible', 'off');
% hObject    handle to rb2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDsssATA)

% Hint: get(hObject,'Value') returns toggle state of rb2


% --- Executes on button press in rb1.
function rb1_Callback(hObject, eventdata, handles)
set(handles.edit2,'String','');
set(handles.edit3,'String','');
set(handles.edit5,'String','');
set(handles.edit4,'String','');
set(handles.edit6,'String','');
set(handles.edit8,'String','');
set(handles.text3,'String','');
set(handles.edit8, 'Visible', 'on');
set(handles.text3, 'Visible', 'off');
set(handles.edit7, 'Visible', 'off');
set(handles.listbox1, 'Value', 1);
set(handles.edit4, 'Visible', 'on');
    set(handles.edit6, 'Visible', 'on');
    myString = sprintf('Upper : ');
    set(handles.text9, 'String', myString);
    myString = sprintf('Lower : ');
    set(handles.text12, 'String', myString);
    set(handles.text12, 'Visible', 'on');
    set(handles.text9, 'Visible', 'on');
set(handles.rb2, 'Value', 0);
radio1 = get(handles.rb1, 'Value');
radio2 = get(handles.rb2, 'Value');
if radio1 == 1
  set(handles.edit5, 'Visible', 'on');
  set(handles.edit4, 'Visible', 'on');
  set(handles.edit2, 'Visible', 'on');
  set(handles.edit3, 'Visible', 'on');
  myString = sprintf('Equation');
  set(handles.text5, 'String', myString);
  myString = sprintf('Max Iter')
  set(handles.text6, 'String', myString);
  myString = sprintf('Error Bound');
  set(handles.text8, 'String', myString);
  set(handles.listbox1, 'Visible', 'on');
  
else
  set(handles.listbox1, 'Visible', 'off');
end
if radio2 == 1
  set(handles.listbox2, 'Visible', 'on');
else
  set(handles.listbox2, 'Visible', 'off');
end
% hObject    handle to rb1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of rb1


% --- Executes during object creation, after setting all properties.
function text2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on selection change in listbox1.
% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
 
%text9_edit4
%text12_edit6
%text13_edit7
cla(handles.ax2,'reset');
set(handles.edit4, 'Visible', 'off');
set(handles.edit6, 'Visible', 'off');
set(handles.edit7, 'Visible', 'off');
set(handles.text9, 'Visible', 'off');
set(handles.text12, 'Visible', 'off');
set(handles.text13, 'Visible', 'off');
 
if get(handles.rb2, 'Value') == 1
    return;
end
ListBoxValue = get(handles.listbox1,'Value');
if ListBoxValue == 1 || ListBoxValue == 2 || ListBoxValue == 5
    set(handles.edit2,'String','');
set(handles.edit3,'String','');
set(handles.edit5,'String','');
set(handles.edit4,'String','');
set(handles.edit6,'String','');
set(handles.edit8,'String','');
set(handles.text3,'String','');
    set(handles.edit4, 'Visible', 'on');
    set(handles.edit6, 'Visible', 'on');
    if ListBoxValue == 1 || ListBoxValue == 2
        myString1 = sprintf('Upper : ');
        myString2 = sprintf('Lower : ');
    else
        myString1 = sprintf('Xi : ');
        myString2 = sprintf('Xi-1 : ');
    end

    
    set(handles.text9, 'String', myString1);
    set(handles.text12, 'String', myString2);
    set(handles.text12, 'Visible', 'on');
    set(handles.text9, 'Visible', 'on');
else
    set(handles.edit2,'String','');
set(handles.edit3,'String','');
set(handles.edit5,'String','');
set(handles.edit4,'String','');
set(handles.edit6,'String','');
set(handles.edit8,'String','');
set(handles.text3,'String','');
    set(handles.edit4, 'Visible', 'on');
    myString = sprintf('initial Guess : ');
    set(handles.text9, 'String', myString);
    if ListBoxValue == 3
        set(handles.edit6, 'Visible', 'on');
        myString = sprintf('G(x) : ');
        set(handles.text12, 'String', myString);
        set(handles.text12, 'Visible', 'on');
    end
    set(handles.text9, 'Visible', 'on');
   
end
 
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 
% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1
 
% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in listbox2.
function listbox2_Callback(hObject, eventdata, handles)
set(handles.edit4, 'Visible', 'off');
set(handles.edit6, 'Visible', 'off');
set(handles.edit7, 'Visible', 'off');
set(handles.text9, 'Visible', 'off');
set(handles.text12, 'Visible', 'off');
set(handles.text13, 'Visible', 'off');
cla(handles.ax2,'reset');
if get(handles.rb1, 'Value') == 1
    return;
end
ListBoxValue = get(handles.listbox2,'Value');
if ListBoxValue == 1 || ListBoxValue == 2
    set(handles.edit2,'String','');
set(handles.edit3,'String','');
set(handles.edit5,'String','');
set(handles.edit4,'String','');
set(handles.edit6,'String','');
set(handles.edit8,'String','');
set(handles.text3,'String','');
end
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox2

%https://www.mathworks.com/matlabcentral/answers/27183-how-to-insert-elements-in-listbox
% --- Executes during object creation, after setting all properties.
function listbox2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton3.

function pushbutton3_Callback(hObject, eventdata, handles)
tic;
try
%ListBoxValue = get(handles.listbox1,'Value');
%myString = sprintf('Hello world!\nThe value is %d', ListBoxValue);
%set(handles.text1, 'String', myString);
    set(handles.edit8,'String',{['']});
    radio1 = get(handles.rb1, 'Value');
    radio2 = get(handles.rb2, 'Value');
    if radio1 == 1

      ListBoxValue = get(handles.listbox1,'Value');
      formula =get(handles.edit2, 'String');
      m=get(handles.edit3, 'String');
      if size(m) == 0
        maxitr =100;
      else
        maxitr =str2double(get(handles.edit3, 'String'));
      end

      m=get(handles.edit5, 'String');
      if size(m) == 0
        error =.0001;
      else
        error =str2double(get(handles.edit5, 'String'));
      end
      if ListBoxValue == 1 || ListBoxValue == 2 || ListBoxValue == 5

          upper =str2double(get(handles.edit4, 'String'));
          lower =str2double(get(handles.edit6, 'String'));

          if ListBoxValue == 1
            [root, xLowerVec, xHighVec, xMidVec,errorVec] = biSection(lower, upper, formula, error, maxitr);
            timeElapsed = toc;
          end

          if ListBoxValue == 2 
            [root, xLowerVec, xHighVec, xMidVec, yLowerVec, yHighVec, yMidVec ,errorVec] = regulaFalsi(formula, lower, upper, error, maxitr);
            timeElapsed = toc;
          end
          
          if ListBoxValue == 5
            [root, xLowerVec, xMidVec, xHighVec,errorVec] = secant(formula, lower, upper, maxitr, error);
          timeElapsed = toc;
          end
          
          if ListBoxValue == 1 || ListBoxValue == 2
               format long;
          currString= get(handles.edit8,'String')
          rootString=sprintf('root : %d \n time: %d', root,timeElapsed);
          currString{end+1}=  rootString;
          set(handles.edit8,'String',currString);
          for it = 1 : size(xLowerVec,2)
            currString= get(handles.edit8,'String')
            rootString=sprintf('iteration : %d \n   low : %d \n    high = %d \n    mid = %d\n   error = %d',it, xLowerVec(1, it), xHighVec(1, it), xMidVec(1, it),errorVec(1, it));
            currString{end+1}=  rootString;
            set(handles.edit8,'String',currString);
          end
          else
                format long;
          currString= get(handles.edit8,'String')
          rootString=sprintf('root : %d \n time: %d', root,timeElapsed);
          currString{end+1}=  rootString;
          set(handles.edit8,'String',currString);
          for it = 1 : size(xLowerVec,2)
            currString= get(handles.edit8,'String')
            rootString=sprintf('\niteration : %d \n   xi-1 : %d \n    xi = %d \n   error = %d',it, xLowerVec(1, it), xHighVec(1, it),errorVec(1, it));
            currString{end+1}=  rootString;
            set(handles.edit8,'String',currString);
          end
          end
         
      end
      if ListBoxValue == 6
          inGuess = str2double(get(handles.edit4, 'String'));
          flagOfBirgeVeta=0;
          for i=1:length(formula);
          if isletter(formula(i)) && formula(i)~='x'
              flagOfBirgeVeta=1;
              break;
          end
          end
          if flagOfBirgeVeta==0
           aa=birge_Vieta(inGuess, formula, maxitr, error);
          timeElapsed = toc;
         bika = sprintf('time : %d \nRoots =\n',timeElapsed);

         for i=1:length(aa);
            bika = sprintf('%s%d\n', bika,aa(i));
         end
         set(handles.edit8, 'String',bika);
          else
         [root, xVec, nextVec, errorVec] = newton_raphson(formula, inGuess, maxitr,error);
        timeElapsed = toc;
        format short;
        currString = get(handles.edit8,'String')
        rootString=sprintf('The function is not polynomial we will use newton raphson \nroot : %d \n time : %d', root,timeElapsed);
        currString{end+1}=  rootString;
        set(handles.edit8,'String',currString);
        for it = 1 : size(xVec,2)
          currString= get(handles.edit8,'String')
          rootString=sprintf('iteration : %d \n   initialGuess : %d \n    next Guess = %d \n	error = %d',it, xVec(1, it), nextVec(1, it), errorVec(1, it));
          currString{end+1}=  rootString;
          set(handles.edit8,'String',currString);
         end
         
         % currString= get(handles.edit8,'String')
         % rootString=sprintf('low : %d , high = %d , mid = %d, error = %d', xLowerVec, xHighVec, xMidVec,errorVec);
         % currString{end+1}=  rootString;
         % set(handles.edit8,'String',currString);
          end
      end
      if ListBoxValue == 3 || ListBoxValue == 4

        inGuess = str2double(get(handles.edit4, 'String'));
        if ListBoxValue == 3
            gFunc = get(handles.edit6, 'String');
            [root, xVec, nextVec, errorVec] = fixedPoint(formula, gFunc, inGuess, error, maxitr);
        timeElapsed = toc;
        end
        if ListBoxValue == 4
            [root, xVec, nextVec, errorVec] = newton_raphson(formula, inGuess, maxitr,error);
        timeElapsed = toc;
        end
        format short;
        currString = get(handles.edit8,'String')
        rootString=sprintf('root : %d \n time : %d', root,timeElapsed);
        currString{end+1}=  rootString;
        set(handles.edit8,'String',currString);
        for it = 1 : size(xVec,2)
          currString= get(handles.edit8,'String')
          rootString=sprintf('iteration : %d \n   initialGuess : %d \n    next Guess = %d \n	error = %d',it, xVec(1, it), nextVec(1, it), errorVec(1, it));
          currString{end+1}=  rootString;
          set(handles.edit8,'String',currString);
        end

      end

    end
    if radio2 == 1
      ListBoxValue = get(handles.listbox2,'Value');
       x_value = str2double(strsplit(get(handles.edit2, 'String'),{' ',','}));
       y_value = str2double(strsplit(get(handles.edit3, 'String'),{' ',','}));
       values = str2double(strsplit(get(handles.edit5, 'String'),{' ',','}));


    tf = sum(sum(isnan(x_value)));
 
    if tf > 0
        errorID = 'Bad:Expression';
        msg = 'Enter right inputs';
        baseException = MException(errorID, msg);
        throw(baseException);
    end
    tf=sum(sum( isnan(y_value)));
    if tf > 0
        errorID = 'Bad:Expression';
        msg = 'Enter right inputs';
        baseException = MException(errorID, msg);
        throw(baseException);
    end
    tf =sum(sum(isnan(values)));
    if tf > 0 && length(values) > 1
        errorID = 'Bad:Expression';
        msg = 'Enter right inputs';
        baseException = MException(errorID, msg);
        throw(baseException);
    end
    if length(values) == 1 && tf > 0
        values = [];
    end
    
    if length(x_value)~=length(unique(x_value))
        errorID = 'Bad:Expression';
        msg = 'Enter right inputs,x values must be unique';
        baseException = MException(errorID, msg);
        throw(baseException);
    end
    if length(x_value)~=length(y_value)
        errorID = 'Bad:Expression';
        msg = 'Enter right inputs,x values & y values must be the same size';
        baseException = MException(errorID, msg);
        throw(baseException);
    end
      if ListBoxValue == 1
          
        summ =lagrange_interpolation(values,x_value , y_value);
        timeElapsed = toc;
         bika = strcat('Lagrange : f(x) = ' , char(summ));
         %set(handles.text3, 'String',strcat('Function = ' , char(sum)));
         bika = sprintf('time : %d \n%s\n',timeElapsed, bika);

         for i=1:length(values);
             syms x
            x = values(i);
            w = double(subs(summ));
            bika = sprintf('%sf(%d) = %d\n', bika,x, w);
         end
         set(handles.text3, 'String',bika);
         %myString = sprintf('Hello world!\nThe value is %d', ListBoxValue);
         %set(handles.text11, 'String',myString);

      end

      if ListBoxValue == 2

          summ =Newton_Interpolation(x_value , y_value);
          timeElapsed = toc;
          bika = strcat('Newton : f(x) = ' , char(summ));
         %set(handles.text3, 'String',strcat('Function = ' , char(sum)));
         bika = sprintf('time : %d \n%s\n',timeElapsed, bika);;

         for i=1:length(values)
            syms X
            X = values(i);
            w = subs(summ);
            bika = sprintf('%sf(%d) = %d\n', bika,X, double(w));
         end
         set(handles.text3, 'String',bika);
      end
    end
catch ME
    rethrow(ME);
msgText = ME.message;
radio1 = get(handles.rb1, 'Value');
radio2 = get(handles.rb2, 'Value');
if radio1 ==1
set(handles.edit8, 'String',msgText);
end
if radio2 == 1
 set(handles.text3, 'String',msgText); 
end
end

% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in listbox4.
function listbox4_Callback(hObject, eventdata, handles)
% hObject    handle to listbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox4


% --- Executes during object creation, after setting all properties.
function listbox4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
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



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



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



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end





% --- Executes during object creation, after setting all properties.
function text1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit8_Callback(hObject, eventdata, handles)

% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function rb1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rb1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over pushbutton3.
function pushbutton3_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
