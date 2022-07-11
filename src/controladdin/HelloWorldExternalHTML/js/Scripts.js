function init() {
    $("#controlAddIn").load(Microsoft.Dynamics.NAV.GetImageResource("src/controladdin/HelloWorldExternalHTML/html/main.html"));
}

function HelloWorld(text) {
    alert("Hello world en " + text);
}