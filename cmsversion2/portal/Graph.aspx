<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Graph.aspx.cs" Inherits="portal_Graph" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
     <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
        <div class="col-md-12">
                     <div class="col-md-12">
                                <telerik:RadLabel ID="lblMonths" runat="server" Text="Month:"></telerik:RadLabel>
                                <telerik:RadComboBox ID="rcbMonth" Skin="Glow" Width="230px" Height="200px" runat="server" AutoPostBack="true"></telerik:RadComboBox>
                    </div>
         </div>
    <div>
    <div class="demo-container no-bg size-medium">
                <telerik:RadHtmlChart runat="server" ID="RadHtmlChart1" DataSourceID="SqlDataSource2" Width="600px" Height="400px">
                    <PlotArea>
                        <Series>
                            <telerik:BarSeries Name="Booking" DataFieldY="BookingId">
                                <TooltipsAppearance Color="White" DataFormatString="{0}"></TooltipsAppearance>
                                <LabelsAppearance Visible="false">
                                </LabelsAppearance>
                            </telerik:BarSeries>
                        </Series>
                        <XAxis DataLabelsField="BookingDate">
                            <MinorGridLines Visible="false"></MinorGridLines>
                            <MajorGridLines Visible="false"></MajorGridLines>
                            <TitleAppearance Position="Center" RotationAngle="0" Text="Date"></TitleAppearance>
                        </XAxis>
                        <YAxis>
                            <LabelsAppearance DataFormatString="{0}"></LabelsAppearance>
                            <MinorGridLines Visible="false"></MinorGridLines>
                        </YAxis>
                    </PlotArea>
                    <Legend>
                        <Appearance Visible="false"></Appearance>
                    </Legend>
                    <ChartTitle Text="Booking per Month"></ChartTitle>
                </telerik:RadHtmlChart>
            </div>
    </div>

         <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Cms %>"
        SelectCommand="select CAST(DateBooked AS DATE) as BookingDate, COUNT(b.BookingId) AS BookingId
                        from Booking b Group By CAST(DateBooked AS DATE)">
        </asp:SqlDataSource>
    </form>
</body>
</html>
