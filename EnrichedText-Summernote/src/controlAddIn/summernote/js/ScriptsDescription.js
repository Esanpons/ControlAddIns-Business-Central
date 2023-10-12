function AddNewSummerNoteDescription(Data, JsonMention) {
    var controlAddIn = document.getElementById('controlAddIn');
    controlAddIn.innerHTML = '<textarea class="summernote" id="summernote"></textarea>';
    CreateSummerNoteDescription(Data, JsonMention);
}

function CreateSummerNoteDescription(Data, JsonMention) {

    //Initialize editor only once when DOM is loaded
    $(document).ready(function () {
        $('.summernote').summernote(
            {
                height: ($(window).height() - 100),
                focus: true,
                lang: 'es-ES',
                //Esto permitirá tabular a través de los campos en Formularios.
                tabDisable: true,
                callbacks: {
                    //Bind onChange callback with our OnChange BC event
                    onChange: function (contents, $editable) {
                        Microsoft.Dynamics.NAV.InvokeExtensibilityMethod("OnChangeDescription", [contents]);
                    }
                },

                hint: {
                    mentions: JsonMention,
                    match: /\B@(\w*)$/,
                    search: function (keyword, callback) {
                        callback($.grep(this.mentions, function (item) {
                            return item.name.toLowerCase().indexOf(keyword.toLowerCase()) == 0;
                        }));
                    },
                    template: function (item) {
                        return item.name;
                    },
                    content: function (item) {
                        Microsoft.Dynamics.NAV.InvokeExtensibilityMethod("MentionDescription", [item]);
                        return $('<a>')
                            .attr('href', item.code)
                            .text('@' + item.name)
                            .get(0);
                    }
                },

                //esto es la configuracion de la bara cuando no esta el air activado
                toolbar: [
                    ['style', ['style']],
                    ['font', ['bold', 'italic', 'underline', 'strikethrough', 'superscript', 'subscript', 'clear']],
                    ['fontname', ['fontname']],
                    ['fontsize', ['fontsize']],
                    ['color', ['color']],
                    ['Misc', ['undo', 'redo']],
                    ['para', ['ul', 'ol', 'paragraph', 'height']],
                    ['insert', ['picture', 'link', 'video', 'table', 'hr']],
                    ['view', ['codeview', 'help']]
                ]
            }
        );
        $('.note-editable').html(Data);
    });
}

//pone no editable el area
function DisableDescription() {
    $('#summernote').summernote('disable');
}

//pone editable el area
function EnableDescription() {
    $('#summernote').summernote('enable');
}

function GetDataDescription(Data) {
    Data = $('#summernote').summernote('code');
}

function SetDataDescription(Data) {
    $('#summernote').summernote('code', Data);
}

//pone no editable el area
function DestroyDescription() {
    $('#summernote').summernote('destroy');
}
