page 60005 "Clean Up Role Center Part"
{
    Caption = 'Clean Up Role Center', Comment = 'ESP="Limpiar área de trabajo"';
    PageType = CardPart;
    UsageCategory = None;

    layout
    {
        area(Content)
        {
            usercontrol(CleanUpRoleCenter; "Clean Up Role Center")
            {

                ApplicationArea = All;
                trigger ControlAddInReady()
                begin
                    CurrPage.CleanUpRoleCenter.WeMakeTheControlAddinInTakeUpLessSpace('');
                    CurrPage.CleanUpRoleCenter.RemoveMenuBarChangeCompany();
                    CurrPage.CleanUpRoleCenter.RemoveMenuBarSearch();
                    CurrPage.CleanUpRoleCenter.RemovePageTitleFromControlAddIn();
                    CurrPage.CleanUpRoleCenter.RemoveMenuBarNotificationsButton();
                    CurrPage.CleanUpRoleCenter.RemoveMenuBarSettingButton();
                    CurrPage.CleanUpRoleCenter.RemoveMenuBarHelpButton();
                    CurrPage.CleanUpRoleCenter.RemoveMenuBarOfficeAccontButton();
                    CurrPage.CleanUpRoleCenter.RemoveMenuBarAppLauncherButton();
                    CurrPage.CleanUpRoleCenter.HideButtonToNavigateToOtherProfiles();

                end;
            }


        }
    }


}