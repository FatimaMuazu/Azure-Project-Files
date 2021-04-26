<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Messages_WebRole._Default" %>

<!DOCTYPE html>
<html lang="en">

    <head runat="server">
        <title>Messages</title>
        <link href="main.css" rel="stylesheet" type="text/css" />
    </head>

    <body>

        <form id="frmMessages" runat="server">
            
            <div style="width: 600px; position: absolute; left: 50%; margin-left:-300px; ">
                <div>
                    <h1 style="font-family:'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif">
                        Microsoft Azure Messages Exercise
                    </h1>
                </div>

                <div style="width: auto; padding: 5px; background-color: #3366FF; color: white; font-size: x-large; font-family: Tahoma; font-weight: bold;">
                    Insert or Replace Message
                </div>
                       
                <div id="divInputMessage"          
                    style="width: auto; padding: 5px; border-style: inset; border-width: medium; margin: 10px 0px 10px 0px; font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;">
                    <table style="width: auto;">
                        <tr>
                            <td style="vertical-align: top; text-align: right">
                                <label>Author :</label>
                            </td>
                            <td>
                                <asp:TextBox 
                                        ID="txtAuthor" 
                                        runat="server" Width="200px"/>
                                <asp:RequiredFieldValidator 
                                        ID="AuthorRequiredValidator" 
                                        runat="server" 
                                        ControlToValidate="txtAuthor"
                                        Text="*" />
                            </td>
                        </tr>
                        <tr>
                            <td style="vertical-align: top; text-align: right;">
                                <label>Message :</label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="txtMessage" 
                                    runat="server" 
                                    TextMode="MultiLine" 
                                    Height="74px" 
                                    Width="460px"  
                                    Font-Names="'Segoe UI', Tahoma, Geneva, Verdana, sans-serif"/>
                                <asp:RequiredFieldValidator 
                                    ID="MessageRequiredValidator" 
                                    runat="server" 
                                    ControlToValidate="txtMessage"
                                    Text="*" />
                            </td>
                        </tr>
                        <tr>
                            <td style="vertical-align: top; text-align: right">
                                <label>Row Key :</label>
                            </td>
                            <td style="vertical-align: top; ">
                                <asp:TextBox ID="txtRowKey" runat="server" Width="400px" ReadOnly="True"/>
                            </td>
                        </tr>
                        <tr>
                            <td style="vertical-align: top; text-align: right">
                                <label>Partition Key :</label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtPartitionKey" runat="server" Width="100px" ReadOnly="True"/>
                            </td>
                        </tr>
<%--                        <tr>
                            <td align="right">
                                <label for="PhotoUpload">Photo:</label>
                            </td>
                            <td>
                                <asp:FileUpload ID="PhotoUpload" runat="server" size="16" />
                            </td> 
                        </tr> --%>
                    </table>

                    <div style="text-align: right">
                        <asp:Button ID="btnInsert" runat="server" OnClick="btnInsert_Click" 
                            Text = "Insert" />&nbsp;&nbsp;
                        <asp:Button ID="btnReplace" runat="server" OnClick="btnReplace_Click" 
                            Text = "Replace" />&nbsp;&nbsp;&nbsp;
                    </div>  
                </div>

                <div style="width: auto; padding: 5px; background-color: #3366FF; color: white; font-size: x-large; font-family: Tahoma; font-weight: bold;">
                    Message List
                </div>

                <asp:DataList 
                    ID="dataListMessages" 
                    runat="server" 
                    DataSourceID="dsMessages" CellPadding="4" 
                    ForeColor="#333333" GridLines="Both" style="margin-right: 0px; width: 600px;">
                    <AlternatingItemStyle BackColor="White" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <ItemStyle BackColor="#EFF3FB" />
                    <ItemTemplate>
<%--                        <div style="width:100%; display:table; font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; font-size: smaller; ">
                            <div style="display:table-row; height: 125px;">
                                <div style="display:table-cell;">
                                    <img src="<%# Eval("ImageURI") %>" style="width: 100px; height: 125px;" /> 
                                </div>
                                <div style="display:table-cell; vertical-align:top; padding:10px; ">      
                                    Image URI: <br />
                                    <asp:Label width="400px" runat="server" Text='<%# Eval("ImageURI") %>' />                                          
                                </div>
                            </div> 
                        </div>--%>
                        <div>                            
                            <div style="font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif">
                                <asp:Label ID="AuthorListLabel" runat="server" Font-Bold="true"
                                    Text='<%# Eval("Author") %>' />                      
                                &nbsp;
                                <asp:Label ID="TimestampListLabel" runat="server" Font-Italic="true"
                                    Text='<%# Eval("Timestamp", "{0:dd-MMM-yyyy HH:mm}") %>' />
                            </div>
                            <div style="font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;">
                                <asp:Label ID="MessageTextListLabel" runat="server" 
                                    Text='<%# Eval("MessageText") %>' />
                            </div>
                            <div style="font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;">
                                <asp:CheckBox ID="RowKey" runat="server" 
                                    Text='<%# Eval("RowKey") %>' /> (Row Key) &nbsp;|&nbsp;
                                <asp:Label ID="PartitionKey" runat="server" 
                                    Text='<%# Eval("PartitionKey") %>' />  (Partition Key)                            
                            </div>
                        </div>                  
                    </ItemTemplate>
                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                </asp:DataList>

                <asp:ObjectDataSource 
                   ID="dsMessages"
                   runat="server"
                   SelectMethod="GetMessages" 
                   TypeName="Messages_WebRole._Default" 
                   OldValuesParameterFormatString="original_{0}">
                </asp:ObjectDataSource>

                <div style="text-align: right">
                    <asp:Button ID="btnEdit" runat="server" CausesValidation="False" 
                        onclick="btnEdit_Click" Text="Edit" />&nbsp;&nbsp;
                    <asp:Button ID="btnDelete" runat="server" OnClick="btnDelete_Click" 
                        Text = "Delete" CausesValidation="False" 
                        UseSubmitBehavior="False" />
                </div> 

            </div>

        </form>

    </body>

</html>
