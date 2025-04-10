<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Default" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Mitarbeiter- und Projektverwaltung</title>
    <telerik:RadStyleSheetManager ID="RadStyleSheetManager1" runat="server" />
</head>
<body>
    <form id="form1" runat="server">
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
            <Scripts>
                <%-- Verweise auf Telerik-Skripte --%>
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.Core.js" />
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQuery.js" />
            </Scripts>
        </telerik:RadScriptManager>
        
        <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
            <%-- Konfiguration für AJAX-Aktualisierungen --%>
            <AjaxSettings>
                <telerik:AjaxSetting AjaxControlID="RadTabStrip1">
                    <UpdatedControls>
                        <%-- Aktualisiert RadMultiPage1 nach Tab-Klicks --%>
                        <telerik:AjaxUpdatedControl ControlID="RadMultiPage1" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
            </AjaxSettings>
        </telerik:RadAjaxManager>

        <div>
            <%-- Tab-Leiste zur Navigation zwischen Mitarbeiter- und Projektansicht --%>
            <telerik:RadTabStrip 
                ID="RadTabStrip1" 
                runat="server" 
                MultiPageID="RadMultiPage1"
                SelectedIndex="0"
                AutoPostBack="True"
                OnTabClick="RadTabStrip1_TabClick"
                RenderMode="Lightweight">
                <Tabs>
                    <%-- Tab für die Mitarbeiteransicht --%>
                    <telerik:RadTab Text="Mitarbeiter" Selected="True"></telerik:RadTab>
                    <%-- Tab für die Projektansicht --%>
                    <telerik:RadTab Text="Projekt"></telerik:RadTab>
                </Tabs>
            </telerik:RadTabStrip>

            <%-- MultiPage-Bereich zur Anzeige der jeweiligen Grid-Ansicht --%>
            <telerik:RadMultiPage ID="RadMultiPage1" runat="server" SelectedIndex="0">
                <%-- PageView für die Mitarbeiter-Grid --%>
                <telerik:RadPageView ID="PageView1" runat="server">
                    <telerik:RadGrid 
                        ID="RadGrid1" 
                        runat="server"
                        AutoGenerateColumns="True"
                        AllowPaging="True" 
                        AllowSorting="True"
                        PageSize="10">
                        <%-- Paging-Stil --%>
                        <PagerStyle Mode="NextPrevAndNumeric" />
                    </telerik:RadGrid>
                </telerik:RadPageView>
                
                <%-- PageView für die Projekt-Grid --%>
                <telerik:RadPageView ID="PageView2" runat="server">
                    <telerik:RadGrid 
                        ID="RadGrid2" 
                        runat="server"
                        AutoGenerateColumns="True"
                        AllowPaging="True" 
                        AllowSorting="True"
                        PageSize="10">
                        <%-- Paging-Stil --%>
                        <PagerStyle Mode="NextPrevAndNumeric" />
                    </telerik:RadGrid>
                </telerik:RadPageView>
            </telerik:RadMultiPage>
        </div>
    </form>
</body>
</html>
