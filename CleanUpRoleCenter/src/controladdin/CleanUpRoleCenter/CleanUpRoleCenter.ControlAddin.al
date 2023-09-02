controladdin "Clean Up Role Center"
{
    RequestedHeight = 1;
    RequestedWidth = 1;
    MaximumHeight = 1;
    MaximumWidth = 1;

    StartupScript =
        'CleanUpRoleCenter/src/controladdin/CleanUpRoleCenter/js/Startup.js';

    Scripts = 'https://code.jquery.com/jquery-3.7.0.min.js',
    'CleanUpRoleCenter/src/controladdin/CleanUpRoleCenter/js/Scripts.js';

    event ControlAddInReady();
    procedure RemoveAll();
    procedure RemoveItem(IdItem: Text);
    procedure RemoveParentItem(IdItem: Text);
    procedure RemoveParentParentItem(IdItem: Text);
    procedure HideItem(IdItem: Text);
    procedure HideParentItem(IdItem: Text);
    procedure HideParentParentItem(IdItem: Text);
    procedure HideButtonToNavigateToOtherProfiles();
    procedure RemovePageTitle();
    procedure RemoveTheButtonBelowToGoHome();
    procedure RemovePageTitleFromControlAddIn();
    procedure WeMakeTheControlAddinInTakeUpLessSpace(IdControlAddIn: Text);
    procedure RemoveAllMenuBar();
    procedure RemoveMenuBarChangeCompany();
    procedure RemoveMenuBarSearch();
    procedure RemoveMenuBarNotificationsButton();
    procedure RemoveMenuBarSettingButton();
    procedure RemoveMenuBarHelpButton();
    procedure RemoveMenuBarOfficeAccontButton();
    procedure RemoveMenuBarAppLauncherButton();


}
