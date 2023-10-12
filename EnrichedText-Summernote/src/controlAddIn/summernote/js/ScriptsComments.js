var controlAddIn;
var TextHtml;
var JsonMention;


function InitHtmlComments(NewJsonMention) {
    JsonMention = NewJsonMention;
    controlAddIn = document.getElementById('controlAddIn');
    controlAddIn.innerHTML = '';
    TextHtml = '';
    TextHtml += '<div id="global">';

}
function AddNewSummerNoteComments(Data, EntryNo, OrderNo) {
    TextHtml += '<br>';
    TextHtml += '<hr style="border:15px;">';
    TextHtml += '<DIV align="right">Nº Pedido: ' + OrderNo + '</DIV>';
    TextHtml += '   ';
    TextHtml += '<div class="summernoteText' + EntryNo + '">' + Data + '</div>';
    TextHtml += '<br>';
    TextHtml += '<button id="edit' + EntryNo + '"class="btn-primary" onclick="edit(\'' + EntryNo + '\')" type="button">Edit</button>';
    TextHtml += '   ';
    TextHtml += '<button id="save' + EntryNo + '"class="btn-primary" onclick="save(\'' + EntryNo + '\',\'' + OrderNo + '\')" type="button" style="visibility:hidden;">Save</button>';
    TextHtml += '   ';
    TextHtml += '<button id="cancel' + EntryNo + '"class="btn-primary" onclick="cancel(\'' + EntryNo + '\')" type="button" style="visibility:hidden;">Cancel</button>';
}
function FinishHtmlComments() {
    TextHtml += '</div>';
    controlAddIn.innerHTML = TextHtml;

}
var edit = function (EntryNo) {
    document.getElementById('save' + EntryNo).style.visibility = 'visible';
    document.getElementById('cancel' + EntryNo).style.visibility = 'visible';

    $('.summernoteText' + EntryNo).summernote(
        {
            height: 100,
            focus: true,
            lang: 'es-ES',
            //Esto permitirá tabular a través de los campos en Formularios.
            tabDisable: true,

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
                    Microsoft.Dynamics.NAV.InvokeExtensibilityMethod("MentionComments", [item, EntryNo]);
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
    $('.note-editable');
};

var save = function (EntryNo, OrderNo) {
    var txt = $('.summernoteText' + EntryNo).summernote('code');
    $('.summernoteText' + EntryNo).summernote('destroy');
    Microsoft.Dynamics.NAV.InvokeExtensibilityMethod("OnChangeComments", [txt, EntryNo, OrderNo]);

    document.getElementById('save' + EntryNo).style.visibility = 'hidden';
    document.getElementById('cancel' + EntryNo).style.visibility = 'hidden';
};

var cancel = function (EntryNo) {
    $('.summernoteText' + EntryNo).summernote('destroy');
    document.getElementById('save' + EntryNo).style.visibility = 'hidden';
    document.getElementById('cancel' + EntryNo).style.visibility = 'hidden';
};