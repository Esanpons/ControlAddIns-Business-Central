var selector;
var subtractWidth;
var SubtractHeight;
var isAll;
var IsHeight;
var IsWidth;

//Selector: Text; SubtractHeight: Decimal; SubtractWitdh: Decimal; IsAll: Boolean; IsHeight: Boolean; IsWidth: Boolean
function Ejecute(Newselector, NewSubtractHeight, NewSubtractWitdh, NewIsAll, NewIsHeight, NewIsWidth) {
    console.log('Ejecute:');
    selector = Newselector;
    SubtractHeight = NewSubtractHeight;
    subtractWidth = NewSubtractWitdh;
    isAll = NewIsAll;
    IsHeight = NewIsHeight;
    IsWidth = NewIsWidth;
    ChangeSize();
}


function ChangeSize() {
    console.log('isAll: ', isAll);

    if (isAll) {
        var elements = window.parent.document.querySelectorAll(selector);
        for (var i = 0; i < elements.length; i++) {
            OneChangeSize(elements[i]);
        }
    } else {
        var Container = window.parent.document.querySelector(selector);
        OneChangeSize(Container);
    }
}

function OneChangeSize(Container) {
    console.log('Before Container: ', Container);
    if (IsHeight) {
        Container.style.removeProperty('max-height');
        Container.style.removeProperty('height');

        var WidthWindows = window.outerHeight - SubtractHeight;
        Container.style.maxHeight = WidthWindows.toString() + 'px';
        Container.style.height = WidthWindows.toString() + 'px';
        console.log('height: ', Container.offsetHeight);
    }

    if (IsWidth) {
        Container.style.removeProperty('max-width');
        Container.style.removeProperty('width');

        var WidthWindows = window.outerWidth - subtractWidth;
        Container.style.maxWidth = WidthWindows.toString() + 'px';
        Container.style.width = WidthWindows.toString() + 'px';
        console.log('width: ', Container.offsetWidth);
    }

    console.log('After Container: ', Container);

}



window.addEventListener('resize', function (event) {
    ChangeSize();
}, true);
