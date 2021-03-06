        ??  ??                  ?3  4   ??
 T M S I W W E B E D         0         <public:component tagName="HtmlArea">
	<public:defaults viewLinkContent />
	<public:defaults viewInheritStyle="false" />
	<public:property name="html" get="<#COMPNAME>get_html" put="<#COMPNAME>set_html" />
	<public:event id="<#COMPNAME>htmlChangedEvent" name="onHtmlChanged" />
	<public:attach event="onContentReady" onevent="OnContentReady()" />
</public:component>
<style>
    label, textarea, select {
        font-family: tahoma;
        font-size: 8pt;
    }
    img.<#COMPNAME>ToolBarButton {
		cursor:pointer;
        cursor: hand;
    }

    .<#COMPNAME>editorText {
	    background-color:<#BGCOLOR>;
		font-size:<#FONTSIZE>pt;
		font-family:<#FONTNAME>;
		color:<#FONTCOLOR>;
		font-style:<#FONTSTYLE>;
		width:<#WIDTHTEXT>;
		height: <#HEIGHTTEXT>;
		overflow: auto; 

	 }
    
	</style>
<script language="JavaScript">
    var caretPos;
	var bk;
	var theX;
	var theY;
	var selectedText;

	function <#COMPNAME>get_html() {
      if (<#DISPLAYHTML>) 
	    var viewHtmlCheckBox = document.getElementById('<#COMPNAME>viewHtmlCheckBox');

	  editor = <#COMPNAME>getIFrame('<#COMPNAME>editorDiv');
      var editorTextArea = document.getElementById('<#COMPNAME>editorTextArea');
      
        if (<#DISPLAYHTML>) {
		  if (viewHtmlCheckBox.checked == true) {
            return editorTextArea.value;
           }
           else {
             return editor.document.body.innerHTML;
           }
		 }
    }
    
    function <#COMPNAME>set_html(data) {
      editor = <#COMPNAME>getIFrame('<#COMPNAME>editorDiv');
      if (<#DISPLAYHTML>) 
	    var viewHtmlCheckBox = document.getElementById('<#COMPNAME>viewHtmlCheckBox');

      var editorTextArea = document.getElementById('<#COMPNAME>editorTextArea');

	  if (<#DISPLAYHTML>) {
		if (viewHtmlCheckBox.checked == true) {
            editorTextArea.value = data;
        }
        else {
			editor.document.body.innerHTML = data;
        }
	  }
    }
    
    function <#COMPNAME>DoEditorAction(actionString) 
    {
      if (<#DISPLAYHTML>) 
        var viewHtmlCheckBox = document.getElementById('<#COMPNAME>viewHtmlCheckBox');
        var editorTextArea = document.getElementById('<#COMPNAME>editorTextArea');

      if (<#DISPLAYHTML>) {
        if (viewHtmlCheckBox.checked == true) {
          alert("Enable HTML editing by unchecking the 'View HTML Source' checkbox.");
          return;
        }
      }

      if (actionString == 'pre') 
      {
        editor.focus();
        try 
        {
          editor.document.execCommand('FormatBlock',false,'<PRE>');
        }
          catch (e)
        {
          alert('Your security settings do not allow you to use this command.  Please visit http://www.mozilla.org/editor/midasdemo/securityprefs.html for more information.');
        }  	
        return;    
      }

      if (actionString == 'CreateLink') 
      {
        editor = <#COMPNAME>getIFrame('<#COMPNAME>editorDiv');
        editor.focus();
        if (isIE) 
        {
          editor.document.execCommand('createlink','1',null);
        } 
        else 
        {
          var url = prompt('Enter a URL:', 'http://');
          if ((url != null) && (url != ''))  
          {
            try 
            {
              editor.document.execCommand('createlink',false,url);
            }
            catch(e)
            {
              alert('Your security settings do not allow you to use this command.  Please visit http://www.mozilla.org/editor/midasdemo/securityprefs.html for more information.');
            }
          }
        }
      }
      else 
      {
        if (actionString != 'paste') 
        {
          if(actionString == 'InsertImage') 
          {
            editor.focus();

			try
			{
				if (isIE)
				{
				  editor.document.execCommand(actionString,true,null);
				}
				else
				{
					imagePath = prompt('Enter Image URL:', 'http://');
						if ((imagePath != null) && (imagePath != "")) 
						  editor.document.execCommand('InsertImage', false, imagePath)					
				}
			}
			catch(e)
			{
			  alert('Your security settings do not allow you to use this command.  Please visit http://www.mozilla.org/editor/midasdemo/securityprefs.html for more information.');
			}
          }
          else 
          {
            if (actionString == 'InsertHorizontalRule') 
            {
              editor.focus();
              try 
              {
                editor.document.execCommand(actionString,'',null);
              }
              catch(e)
              {
                alert('Your security settings do not allow you to use this command.  Please visit http://www.mozilla.org/editor/midasdemo/securityprefs.html for more information.');
              }
            }
            else 
            {
              editor.focus();
              try{
                editor.document.execCommand(actionString,'',null);
              }
              catch(e)
              {
                alert('Your security settings do not allow you to use this command.  Please visit http://www.mozilla.org/editor/midasdemo/securityprefs.html for more information.');
              }
            }
          }
        }
        else 
        { 
          editor.focus();
          try
          {
            editor.document.execCommand(actionString);
          }
          catch (e)
          {
            alert('Your security settings do not allow you to use this command.  Please visit http://www.mozilla.org/editor/midasdemo/securityprefs.html for more information.');
          } 
        }
        editorTextArea.value = <#COMPNAME>editorDiv.innerHTML;
      }
    }
    
	function <#COMPNAME>DoEditorActionWithData(actionString, actionData) 
	{
	  editor = <#COMPNAME>getIFrame('<#COMPNAME>editorDiv');
		
      if (<#DISPLAYHTML>) 
   	    var viewHtmlCheckBox = document.getElementById('<#COMPNAME>viewHtmlCheckBox');
      
	  var editorTextArea = document.getElementById('<#COMPNAME>editorTextArea');

      if (<#DISPLAYHTML>) {
        if (viewHtmlCheckBox.checked == true) {
           alert("Enable HTML editing by unchecking the 'View HTML Source' checkbox.");
           return;
        }
	  }

	  editor.focus();
	  
	  if (actionString == "backColor")
	  {
		  if (isIE)
			editor.document.execCommand(actionString, false, actionData);
		  else
			editor.document.execCommand("hiliteColor", false, actionData);       
	  }
	  else
		editor.document.execCommand(actionString, false, actionData);

      <#COMPNAME>editorDiv.focus();
	  editorTextArea.value = <#COMPNAME>editorDiv.innerHTML;
    }
    
    function <#COMPNAME>OnBlurEditorDiv(divElement) {
   	  hiddenHtml = document.getElementById("<#COMPNAME>editorTextArea");
	  editor = <#COMPNAME>getIFrame("<#COMPNAME>editorDiv");
  	  hiddenHtml.value = editor.document.body.innerHTML;

      txt = editor.document.body.innerHTML;
	  txt = txt.replace(/\r|\n|\r\n/g, "");

	  if (hiddenHtml.value == '<P>&nbsp;</P>') 
	  {
	    hiddenHtml.value = '';
	  }

	  GSubmitter.elements['<#COMPNAME>'].value = txt;

	}

    function <#COMPNAME>OnBlurEditorTextArea(textAreaElement) 
    {
        <#COMPNAME>htmlChangedEvent.fire();
    }

    function <#COMPNAME>OnContentReady() {
        var url = document.URL + "/../";
        for (i = 0; i < 14; i++) {
             var srcFile = document.all['i' + i].srcFile;
             document.all['i' + i].src = url + srcFile;
        }
    }
    
    function <#COMPNAME>OnClickShowHtmlCheckBox(checkBoxElement) {
      editor = <#COMPNAME>getIFrame('<#COMPNAME>editorDiv');
      
      if (<#DISPLAYHTML>) 
	    var viewHtmlCheckBox = document.getElementById('<#COMPNAME>viewHtmlCheckBox');

	  var editorTextArea = document.getElementById('<#COMPNAME>editorTextArea');
        
      if (<#DISPLAYHTML>) {
		if (viewHtmlCheckBox.checked == true) {
			if (isIE)
			{
			  editorTextArea.value = editor.document.body.innerHTML;
			  document.getElementById('<#COMPNAME>editorDiv').style.display = 'none';
              editorTextArea.style.display = 'inline';
              editorTextArea.focus();
            }
            else
            {
              var editContent;
			  editorContent = document.createTextNode(editor.document.body.innerHTML);
			  editor.document.body.innerHTML = "";
			  editor.document.body.appendChild(editorContent);							
            }
        }
        else {
			if (isIE)
			{
		      editor.document.body.innerHTML = editorTextArea.value;	    
              editorTextArea.style.display = 'none';
              document.getElementById('<#COMPNAME>editorDiv').style.display = 'inline';
              editor.focus();
            }
            else
            {
              editorContent = editor.document.body.ownerDocument.createRange();
			  editorContent.selectNodeContents(editor.document.body);
			  editor.document.body.innerHTML = editorContent.toString();
            }
		}
	  }
	}
    
    function <#COMPNAME>OnClickToolBarButton(actionString) {
       <#COMPNAME>DoEditorAction(actionString);
    }

    function <#COMPNAME>OnSelectedIndexChangedFontColorList(listElement) {
        <#COMPNAME>DoEditorActionWithData('foreColor', listElement[listElement.selectedIndex].value);
    }

    function <#COMPNAME>OnSelectedIndexChangedBackColorList(listElement) {
        <#COMPNAME>DoEditorActionWithData('backColor', listElement[listElement.selectedIndex].value);
    }
    
    function <#COMPNAME>OnSelectedIndexChangedFontFaceList(listElement) {
        <#COMPNAME>DoEditorActionWithData('fontName', listElement[listElement.selectedIndex].value);
    }
    
    function <#COMPNAME>OnSelectedIndexChangedFontSizeList(listElement) {
        <#COMPNAME>DoEditorActionWithData('fontSize', listElement[listElement.selectedIndex].value);
    }
    
    function <#COMPNAME>OnSelectedIndexChangedFormattingList(listElement) {
        if (listElement.selectedIndex == 0) {
            <#COMPNAME>DoEditorActionWithData('formatBlock', 'Normal');
            <#COMPNAME>DoEditorAction('removeFormat');
        }
        else {
            <#COMPNAME>DoEditorActionWithData('formatBlock', listElement[listElement.selectedIndex].value);
        }
    }

    function <#COMPNAME>SetFont() {
	  listElement = document.getElementById("<#COMPNAME>fontFaceList");
	  DoEditorActionWithData('fontName', listElement[listElement.selectedIndex].value);
      listElement = document.getElementById("<#COMPNAME>fontSizeList");
	  DoEditorActionWithData('fontSize', listElement[listElement.selectedIndex].value);
      listElement = document.getElementById("<#COMPNAME>fontColorList");
	  DoEditorActionWithData('foreColor', listElement[listElement.selectedIndex].value);
      listElement = document.getElementById("<#COMPNAME>formattingList");
	  <#COMPNAME>DoEditorActionWithData('formatBlock', 'Normal');
	}

   function <#COMPNAME>ClearArea() {
     editor = <#COMPNAME>getIFrame('<#COMPNAME>editorDiv');
     editor.document.body.innerHTML = "";
     hiddenHtml = document.getElementById("<#COMPNAME>editorTextArea");
	 hiddenHtml.value = editor.document.body.innerHTML;
	 GSubmitter.elements['<#COMPNAME>'].value = editor.document.body.innerHTML;
   }

   function <#COMPNAME>SubmitValues(field) {
     editor = <#COMPNAME>getIFrame('<#COMPNAME>editorDiv');
     GSubmitter.elements['<#COMPNAME>'].value = editor.document.body.innerHTML;
   }

   function <#COMPNAME>storeCaret(textArea) {
    if (textArea.createTextRange) {
      textArea.caretPos = document.selection.createRange().duplicate();
	}
   }

   function <#COMPNAME>iePointerPosn() {
     if (window.event.x != theX && window.event.y != theY) {
       theX = window.event.x;
	   theY = window.event.y;
     }
   }
      
   _d=document;
   _nv=navigator.appVersion.toLowerCase();
   _f=false;
   _t=true;
   ie4=(!_d.getElementById&&_d.all)?_t:_f;
   ie5=(_nv.indexOf("msie 5.0")!=-1)?_t:_f;
   ie55=(_nv.indexOf("msie 5.5")!=-1)?_t:_f;
   ie6=(_nv.indexOf("msie 6.0")!=-1)?_t:_f;
   ie7=(_nv.indexOf("msie 7.0")!=-1)?_t:_f;
   ie8=(_nv.indexOf("msie 8.0")!=-1)?_t:_f;
   ie9=(_nv.indexOf("msie 9.0")!=-1)?_t:_f;
   isIE=(ie5||ie55||ie6||ie7||ie8||ie9)?_t:_f;

	function <#COMPNAME>getIFrame(name) 
	{
		if (isIE) 
		{

			return eval(name);
		} 
		else 
		{
			return document.getElementById(name).contentWindow;
		}
	}
   
   function <#COMPNAME>Initialize() 
   {
     hiddenHtml = document.getElementById("<#COMPNAME>editorTextArea");
	 editor = <#COMPNAME>getIFrame("<#COMPNAME>editorDiv");
	 editor.document.designMode = '<#DESIGNMODE>';
	 editor.document.open();
	 editor.document.write(hiddenHtml.value);
	 editor.document.close();
	 editor.document.contentEditable = '<#CONTENTEDITABLE>';	

	 if (!isIE)
	 {
	   editor.addEventListener("blur", function() {
			return <#COMPNAME>OnBlurEditorDiv();	
		}, true);	
	 }
	 GSubmitter.elements['<#COMPNAME>'].value = editor.document.body.innerHTML;
   }
</script>
  