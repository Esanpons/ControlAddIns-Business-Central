function RemoveAll() {
    HideButtonToNavigateToOtherProfiles();
    RemovePageTitle();
    RemoveTheButtonBelowToGoHome();
    RemovePageTitleFromControlAddIn();  
    WeMakeTheControlAddinInTakeUpLessSpace(); 
    RemoveAllMenuBar(); 
}

function RemoveItem(IdItem){
    //Es para eliminar cualquier item dentro el controlAddIn
    $(IdItem).remove();
}

function RemoveParentItem(IdItem){
    //Es para eliminar cualquier item por encima del controlAddIn
    parent.$(IdItem).remove();
}

function RemoveParentParentItem(IdItem){
    //Es para eliminar cualquier item dos veces por encima del controlAddIn
    parent.parent.$(IdItem).remove();
}

function HideItem(IdItem){
    //Es para ocultar cualquier item dentro el controlAddIn
    $(IdItem).hide();
}

function HideParentItem(IdItem){
    //Es para ocultar cualquier item por encima del controlAddIn
    parent.$(IdItem).hide();
}

function HideParentParentItem(IdItem){
    //Es para ocultar cualquier item dos veces por encima del controlAddIn
    parent.parent.$(IdItem).hide();
}

function HideButtonToNavigateToOtherProfiles(){
    //ocultamos el boton de navegar a otros perfiles
    HideParentItem('.profile-action-container--2aSoMSmscwR9-5kzHiuG7g');
}

function RemovePageTitle(){
    //eliminamos el titulo de la pagina del controladdin
    RemoveParentItem('.pagetitle-control');
}

function RemoveTheButtonBelowToGoHome(){      
    //eliminamos el boton de abajo para ir a inicio
    RemoveParentItem('a.buttonColorHCM--PqstsvDbqv5QRfAWip29R');
}

function RemovePageTitleFromControlAddIn(){
    //eliminamos el titulo del controladdin
    RemoveParentItem('.ms-nav-band-header');
}

function WeMakeTheControlAddinInTakeUpLessSpace(IdControlAddIn){
    //hacemos que el controlAddIn ocupe menos espacio
    parent.$(IdControlAddIn).removeClass();
    parent.$(IdControlAddIn).attr('style', 'width: 1px !important; height: 1px !important; min-width: 1px !important; min-height: 1px !important; max-width: 1px !important; max-height: 1px !important;');
}

function RemoveAllMenuBar(){
    //esto elimina la barra de navegacion de business central des de una area de trabajo
    RemoveParentParentItem('#shell-header');
}

function RemoveMenuBarChangeCompany(){
    //esto elimina de la barra de navegacion de business central el boton de cambiar de empresa
    RemoveParentParentItem('#BC_EnvironmentLauncher_container');
}

function RemoveMenuBarSearch(){
    //esto elimina de la barra de navegacion de business central el boton de busqueda
    RemoveParentParentItem('#search_container');
}

function RemoveMenuBarNotificationsButton(){
    //esto elimina de la barra de navegacion de business central el boton de notificaciones
    RemoveParentParentItem('#notifications_container');
}

function RemoveMenuBarSettingButton(){
    //esto elimina de la barra de navegacion de business central el boton de configuración
    RemoveParentParentItem('#O365_MainLink_Settings_container');
}

function RemoveMenuBarHelpButton(){
    //esto elimina de la barra de navegacion de business central el boton de ayuda
    RemoveParentParentItem('#O365_MainLink_Help_container');
}

function RemoveMenuBarOfficeAccontButton(){
    //esto elimina de la barra de navegacion de business central el boton de la cuenta de office
    RemoveParentParentItem('#O365_MainLink_Me');
}

function RemoveMenuBarAppLauncherButton(){
    //esto elimina de la barra de navegacion de business central el boton de iniciador de aplicaciones
    RemoveParentParentItem('#O365_MainLink_NavMenu');
}
