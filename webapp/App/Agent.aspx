<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Agent.aspx.cs" Inherits="webapp.App.Agent" %>

<%@ Register Assembly="DevExpress.Web.v19.2, Version=19.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-2">
        <div class="row">
            <div class="col-sm-12">
                <h1 class="display-4">Gestion des Agents </h1>
                <hr />
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">
                <dx:ASPxGridView ID="ASPxGridView_Main" runat="server" Width="100%" AutoGenerateColumns="False" DataSourceID="SqlDataSource_Agent" KeyFieldName="MATRICULE">
                    <Settings ShowFilterRow="True"></Settings>

                    <Columns>
                        <dx:GridViewCommandColumn ShowEditButton="True" VisibleIndex="0" ShowNewButtonInHeader="True" ShowDeleteButton="True" ShowClearFilterButton="True"></dx:GridViewCommandColumn>
                        <dx:GridViewDataTextColumn FieldName="MATRICULE" ReadOnly="True" VisibleIndex="1">
                            <EditFormSettings Visible="False"></EditFormSettings>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="NOM" VisibleIndex="2"></dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="PRENOM" VisibleIndex="3"></dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="CIN" VisibleIndex="4"></dx:GridViewDataTextColumn>
                        <dx:GridViewDataDateColumn FieldName="DATE_NAISSANCE" VisibleIndex="5"></dx:GridViewDataDateColumn>
                        <dx:GridViewDataTextColumn FieldName="EMAIL" VisibleIndex="6"></dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="TELEPHONE" VisibleIndex="7"></dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="VILLE" VisibleIndex="8"></dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="ADRESSE" VisibleIndex="9"></dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="FONCTION" VisibleIndex="10"></dx:GridViewDataTextColumn>
                    </Columns>
                </dx:ASPxGridView>

                <asp:SqlDataSource runat="server" ID="SqlDataSource_Agent" ConflictDetection="CompareAllValues" ConnectionString='<%$ ConnectionStrings:webapp_dbConnectionString %>' DeleteCommand="DELETE FROM [AGENT] WHERE [MATRICULE] = @original_MATRICULE AND [NOM] = @original_NOM AND [PRENOM] = @original_PRENOM AND [CIN] = @original_CIN AND (([DATE_NAISSANCE] = @original_DATE_NAISSANCE) OR ([DATE_NAISSANCE] IS NULL AND @original_DATE_NAISSANCE IS NULL)) AND (([EMAIL] = @original_EMAIL) OR ([EMAIL] IS NULL AND @original_EMAIL IS NULL)) AND (([TELEPHONE] = @original_TELEPHONE) OR ([TELEPHONE] IS NULL AND @original_TELEPHONE IS NULL)) AND (([VILLE] = @original_VILLE) OR ([VILLE] IS NULL AND @original_VILLE IS NULL)) AND (([ADRESSE] = @original_ADRESSE) OR ([ADRESSE] IS NULL AND @original_ADRESSE IS NULL)) AND (([FONCTION] = @original_FONCTION) OR ([FONCTION] IS NULL AND @original_FONCTION IS NULL))" InsertCommand="INSERT INTO [AGENT] ([NOM], [PRENOM], [CIN], [DATE_NAISSANCE], [EMAIL], [TELEPHONE], [VILLE], [ADRESSE], [FONCTION]) VALUES (@NOM, @PRENOM, @CIN, @DATE_NAISSANCE, @EMAIL, @TELEPHONE, @VILLE, @ADRESSE, @FONCTION)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [AGENT] ORDER BY [MATRICULE]" UpdateCommand="UPDATE [AGENT] SET [NOM] = @NOM, [PRENOM] = @PRENOM, [CIN] = @CIN, [DATE_NAISSANCE] = @DATE_NAISSANCE, [EMAIL] = @EMAIL, [TELEPHONE] = @TELEPHONE, [VILLE] = @VILLE, [ADRESSE] = @ADRESSE, [FONCTION] = @FONCTION WHERE [MATRICULE] = @original_MATRICULE AND [NOM] = @original_NOM AND [PRENOM] = @original_PRENOM AND [CIN] = @original_CIN AND (([DATE_NAISSANCE] = @original_DATE_NAISSANCE) OR ([DATE_NAISSANCE] IS NULL AND @original_DATE_NAISSANCE IS NULL)) AND (([EMAIL] = @original_EMAIL) OR ([EMAIL] IS NULL AND @original_EMAIL IS NULL)) AND (([TELEPHONE] = @original_TELEPHONE) OR ([TELEPHONE] IS NULL AND @original_TELEPHONE IS NULL)) AND (([VILLE] = @original_VILLE) OR ([VILLE] IS NULL AND @original_VILLE IS NULL)) AND (([ADRESSE] = @original_ADRESSE) OR ([ADRESSE] IS NULL AND @original_ADRESSE IS NULL)) AND (([FONCTION] = @original_FONCTION) OR ([FONCTION] IS NULL AND @original_FONCTION IS NULL))">
                    <DeleteParameters>
                        <asp:Parameter Name="original_MATRICULE" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="original_NOM" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_PRENOM" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_CIN" Type="Int32"></asp:Parameter>
                        <asp:Parameter DbType="Date" Name="original_DATE_NAISSANCE"></asp:Parameter>
                        <asp:Parameter Name="original_EMAIL" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_TELEPHONE" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_VILLE" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_ADRESSE" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_FONCTION" Type="Int32"></asp:Parameter>
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="NOM" Type="String"></asp:Parameter>
                        <asp:Parameter Name="PRENOM" Type="String"></asp:Parameter>
                        <asp:Parameter Name="CIN" Type="Int32"></asp:Parameter>
                        <asp:Parameter DbType="Date" Name="DATE_NAISSANCE"></asp:Parameter>
                        <asp:Parameter Name="EMAIL" Type="String"></asp:Parameter>
                        <asp:Parameter Name="TELEPHONE" Type="String"></asp:Parameter>
                        <asp:Parameter Name="VILLE" Type="String"></asp:Parameter>
                        <asp:Parameter Name="ADRESSE" Type="String"></asp:Parameter>
                        <asp:Parameter Name="FONCTION" Type="Int32"></asp:Parameter>
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="NOM" Type="String"></asp:Parameter>
                        <asp:Parameter Name="PRENOM" Type="String"></asp:Parameter>
                        <asp:Parameter Name="CIN" Type="Int32"></asp:Parameter>
                        <asp:Parameter DbType="Date" Name="DATE_NAISSANCE"></asp:Parameter>
                        <asp:Parameter Name="EMAIL" Type="String"></asp:Parameter>
                        <asp:Parameter Name="TELEPHONE" Type="String"></asp:Parameter>
                        <asp:Parameter Name="VILLE" Type="String"></asp:Parameter>
                        <asp:Parameter Name="ADRESSE" Type="String"></asp:Parameter>
                        <asp:Parameter Name="FONCTION" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="original_MATRICULE" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="original_NOM" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_PRENOM" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_CIN" Type="Int32"></asp:Parameter>
                        <asp:Parameter DbType="Date" Name="original_DATE_NAISSANCE"></asp:Parameter>
                        <asp:Parameter Name="original_EMAIL" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_TELEPHONE" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_VILLE" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_ADRESSE" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_FONCTION" Type="Int32"></asp:Parameter>
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </div>
</asp:Content>
