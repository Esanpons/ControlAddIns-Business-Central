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
                    // Hacemos que el controlAddIn ocupe menos espacio
                    CurrPage.CleanUpRoleCenter.WeMakeTheControlAddinInTakeUpLessSpace('#b15');

                    // Esto elimina de la barra de navegación de Business Central el botón de cambiar de empresa
                    CurrPage.CleanUpRoleCenter.RemoveParentParentItem('#BC_EnvironmentLauncher_container');

                    // Esto elimina de la barra de navegación de Business Central el botón de búsqueda
                    CurrPage.CleanUpRoleCenter.RemoveParentParentItem('#search_container');

                    // Eliminamos el título del controladdin
                    CurrPage.CleanUpRoleCenter.RemoveParentItem('.ms-nav-band-header');

                    // Esto elimina de la barra de navegación de Business Central el botón de notificaciones
                    CurrPage.CleanUpRoleCenter.RemoveParentParentItem('#notifications_container');

                    // Esto elimina de la barra de navegación de Business Central el botón de configuración
                    CurrPage.CleanUpRoleCenter.RemoveParentParentItem('#O365_MainLink_Settings_container');

                    // Esto elimina de la barra de navegación de Business Central el botón de ayuda
                    CurrPage.CleanUpRoleCenter.RemoveParentParentItem('#O365_MainLink_Help_container');

                    // Esto elimina de la barra de navegación de Business Central el botón de la cuenta de Office
                    CurrPage.CleanUpRoleCenter.RemoveParentParentItem('#O365_MainLink_Me');

                    // Esto elimina de la barra de navegación de Business Central el botón de iniciador de aplicaciones
                    CurrPage.CleanUpRoleCenter.RemoveParentParentItem('#O365_MainLink_NavMenu');

                    // Ocultamos el botón de navegar a otros perfiles
                    CurrPage.CleanUpRoleCenter.HideParentItem('.profile-action-container--2aSoMSmscwR9-5kzHiuG7g');
                end;
            }
        }
    }
}