// Esta función se encarga de inicializar la funcionalidad de arrastrar y soltar archivos en el ControlAddin de Business Central.
function InitializeFileDragAndDrop() {
    // Busca el controlAddIn en el documento padre que tengan el atributo "controlname" igual a "AttachmentsDragAndDropFactbox". Es importante que tenga el mismo nombre que la page donde tendremos nuestro ControlAddIn.
    nodes = window.parent.document.querySelectorAll('div[controlname="AttachmentsDragAndDropFactbox"]');

    // Selecciona el último elemento encontrado, que será el control en el que queremos habilitar la funcionalidad.
    // Aquí es importante encontrar todos los nodos HTML posibles de esta página mediante querySelectorAll. Porque en Business Central puedes abrir varias páginas sin cerrar las anteriores.
    FactBox = nodes[nodes.length - 1];

    // Evita los comportamientos por defecto de arrastrar y soltar para los eventos especificados estándar.
    // Esto se hace para tener un control total sobre cómo se interactúa con los archivos arrastrados y soltados en el ControlAddin de Business Central.
    ["dragenter", "dragover", "dragleave", "drop"].forEach((eventName) => {
        FactBox.addEventListener(eventName, preventDefaults, false);
        // También se previenen los comportamientos por defecto a nivel de documento.
        document.body.addEventListener(eventName, preventDefaults, false);
    });

    // Cuando un elemento se arrastra sobre el área de soltar, resalta visualmente el área.
    ["dragenter", "dragover"].forEach((eventName) => {
        FactBox.addEventListener(eventName, highlight, false);
    });

    // Cuando el elemento arrastrado sale del área de soltar o se suelta en ella, se quita el resaltado.
    ["dragleave", "drop"].forEach((eventName) => {
        FactBox.addEventListener(eventName, unhighlight, false);
    });

    // Maneja el evento de soltar un archivo en el área de soltar.
    FactBox.addEventListener("drop", handleDrop, false);
}

// Esta función previene los comportamientos por defecto de los eventos de arrastrar y soltar.
function preventDefaults(e) {
    e.preventDefault(); // Previene la acción por defecto asociada al evento.
    e.stopPropagation(); // Detiene la propagación del evento en la jerarquía del DOM.
}

// Esta función se encarga de resaltar el área de soltar cuando un elemento se arrastra sobre ella.
function highlight(e) {
    FactBox.style.border = "thick dotted blue"; // Cambia el estilo de borde para indicar visualmente el área de soltar.
}

// Esta función se encarga de quitar el resaltado del área de soltar cuando un elemento sale o se suelta en ella.
function unhighlight(e) {
    FactBox.style.border = ""; // Restaura el estilo de borde a su valor por defecto.
}

// Esta función maneja el evento de soltar un archivo en el área de soltar.
function handleDrop(e) {
    var dt = e.dataTransfer; // Obtiene el objeto de transferencia de datos del evento.
    var files = dt.files; // Obtiene la lista de archivos que se soltaron en el área.

    // Llama a la función para manejar los archivos soltados.
    handleFiles(files);
}

// Variable para llevar el conteo de archivos soltados.
var filesCount = 0;

// Esta función maneja una lista de archivos.
function handleFiles(files) {
    // Convierte la lista de archivos en un arreglo para facilitar su manejo.
    files = [...files];
    // Actualiza el conteo de archivos con la cantidad de archivos soltados.
    filesCount = files.length;
    // Llama a la función de subida de archivo para cada archivo en la lista.
    files.forEach(uploadFile);
}

// Esta función se encarga de cargar un archivo al sistema.
function uploadFile(file, i) {
    var reader = new FileReader(); // Crea un nuevo lector de archivos.
    reader.addEventListener("loadend", function () {
        // Cuando se completa la lectura del archivo...
        // El resultado del lector contiene el contenido del archivo en formato base64.
        var base64data = reader.result;

        // Invoca un método de extensibilidad de Business Central para manejar la subida del archivo y enviar la información a la page de Business Central.
        Microsoft.Dynamics.NAV.InvokeExtensibilityMethod("OnFileUpload", [file.name, base64data, filesCount == i + 1]);
    });

    // Lee el contenido del archivo como una URL base64.
    reader.readAsDataURL(file);
}
