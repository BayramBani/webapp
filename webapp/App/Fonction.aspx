<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Fonction.aspx.cs" Inherits="webapp.App.Fonction" %>
<%@ Register Assembly="DevExpress.Web.v19.2, Version=19.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-2">
        <div class="row">
            <div class="col-sm-12">
                <h1 class="display-4">Gestion des Fonctions </h1>
                <hr />
            </div>
        </div>
        <div class="row">
            <div class="col-sm-6">
                <dx:ASPxGridView ID="ASPxGridView_Main" runat="server" Width="100%" AutoGenerateColumns="False" DataSourceID="SqlDataSource_Fonction" KeyFieldName="ID">
                    <Settings ShowFilterRow="True"></Settings>

                    <Columns>
                        <dx:GridViewCommandColumn ShowDeleteButton="True" VisibleIndex="0" ShowNewButtonInHeader="True" ShowEditButton="True" ShowClearFilterButton="True"></dx:GridViewCommandColumn>
                        <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" VisibleIndex="1">
                            <EditFormSettings Visible="False"></EditFormSettings>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="LIBELLE" VisibleIndex="2"></dx:GridViewDataTextColumn>
                    </Columns>
                </dx:ASPxGridView>

                <asp:SqlDataSource runat="server" ID="SqlDataSource_Fonction" ConflictDetection="CompareAllValues" ConnectionString='<%$ ConnectionStrings:webapp_dbConnectionString %>' DeleteCommand="DELETE FROM [FONCTION] WHERE [ID] = @original_ID AND [LIBELLE] = @original_LIBELLE" InsertCommand="INSERT INTO [FONCTION] ([LIBELLE]) VALUES (@LIBELLE)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [FONCTION] ORDER BY [ID]" UpdateCommand="UPDATE [FONCTION] SET [LIBELLE] = @LIBELLE WHERE [ID] = @original_ID AND [LIBELLE] = @original_LIBELLE">
                    <DeleteParameters>
                        <asp:Parameter Name="original_ID" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="original_LIBELLE" Type="String"></asp:Parameter>
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="LIBELLE" Type="String"></asp:Parameter>
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="LIBELLE" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_ID" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="original_LIBELLE" Type="String"></asp:Parameter>
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </div>
</asp:Content>
