function init(){
    var div = document.getElementById('controlAddIn');
    
    div.innerHTML += '<div class="contenedor">' + 
                     '    <div id="IDcontenedor"></div>' +
                     '</div>';
  
    div.innerHTML += '<span class="orange">'+
                    'Esta es una línea, y a continuación insertamos un salto de línea.<br/>'+
                    '</span>';
  
 
    div.innerHTML += '<span class="ref">Un texto donde necesito alguna cosa</span>'
 }

function HelloWorld(text){
    alert("Hello world en " + text); 
}
