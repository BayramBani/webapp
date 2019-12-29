<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="GridView_DataTable.aspx.cs" Inherits="webapp.Demo.GridView_DataTable" %>

<%@ Register Assembly="DevExpress.Web.v19.2, Version=19.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-2">
        <div class="row">
            <div class="col-sm-12">
                <h1 class="display-4">GridView DataTable data source</h1>
                <hr />
            </div>
        </div>
        <div class="row m-1">
            <div class="col-sm-12">
                <asp:Button ID="Button_Importer" runat="server" Text="Importer" CssClass="btn btn-sm btn-info" OnClick="Button_Importer_Click" />
                <asp:Button ID="Button_Valider" runat="server" Text="Valider" CssClass="btn btn-sm btn-success" OnClick="Button_Valider_Click" />
            </div>
        </div>
        <div class="row m-1">
            <div class="col-sm-4">

                <dx:ASPxGridView ID="ASPxGridView_Main" runat="server" Width="100%" AutoGenerateColumns="False" KeyFieldName="ID" OnRowInserting="ASPxGridView_Main_RowInserting"
                    OnRowUpdating="ASPxGridView_Main_RowUpdating" OnRowDeleting="ASPxGridView_Main_RowDeleting" OnDataBinding="ASPxGridView_Main_DataBinding">
                    <SettingsEditing Mode="Batch" BatchEditSettings-EditMode="Row" BatchEditSettings-StartEditAction="DblClick" />
                    <Columns>
                        <dx:GridViewCommandColumn VisibleIndex="0" ShowNewButtonInHeader="True" ShowDeleteButton="True"></dx:GridViewCommandColumn>
                        <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" VisibleIndex="1">
                            <EditFormSettings Visible="False"></EditFormSettings>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="LIBELLE" VisibleIndex="2"></dx:GridViewDataTextColumn>
                    </Columns>
                </dx:ASPxGridView>


            </div>
            <div class="col-sm-4">
                <dx:ASPxGridView ID="ASPxGridView_2" runat="server" Width="100%" AutoGenerateColumns="False" KeyFieldName="ID" DataSourceID="SqlDataSource_Fonction">
                    <SettingsEditing Mode="Batch" BatchEditSettings-EditMode="Row" BatchEditSettings-StartEditAction="DblClick" />
                    <Columns>
                        <dx:GridViewCommandColumn ShowNewButtonInHeader="True" VisibleIndex="0" ShowDeleteButton="True"></dx:GridViewCommandColumn>
                        <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" VisibleIndex="1">
                            <EditFormSettings Visible="False"></EditFormSettings>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="LIBELLE" VisibleIndex="2"></dx:GridViewDataTextColumn>
                    </Columns>
                </dx:ASPxGridView>

                <asp:SqlDataSource runat="server" ID="SqlDataSource_Fonction" ConflictDetection="CompareAllValues" ConnectionString='<%$ ConnectionStrings:webapp_dbConnectionString %>' DeleteCommand="DELETE FROM [FONCTION] WHERE [ID] = @original_ID AND [LIBELLE] = @original_LIBELLE" InsertCommand="INSERT INTO [FONCTION] ([LIBELLE]) VALUES (@LIBELLE)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [FONCTION]" UpdateCommand="UPDATE [FONCTION] SET [LIBELLE] = @LIBELLE WHERE [ID] = @original_ID AND [LIBELLE] = @original_LIBELLE">
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
        <div class="row">
            <div class="col-sm-12">
                <hr />
                <asp:Literal ID="Literal_Msg" runat="server"></asp:Literal>
                <asp:GridView ID="GridView_Test" runat="server"></asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
