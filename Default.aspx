<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div class="collapse navbar-collapse" id="mainMenu">
                                <ul class="nav navbar-nav pull-left" id="ul_height">
                                    <asp:Repeater ID="rpMainCat" runat="server">
                                        <ItemTemplate>
                                            <li class="primary voyllaMegaMenuTrigger" id="li_Women" style="height: 38px !important;">
                                                <a class="change_home_taxonomy_tag_Women firstLevel hasSubMenu h_Women" style="height: 39px;" href="Products.aspx?id=<%#Eval("id") %>&name=<%#Eval("name") %>">
                                                    <span><%#Eval("name") %></span></a>
                                                <!--for nia -->
                                                <div class="voyllaMegaMenu subMenu" style="z-index: 1000;" id="div_Women">
                                                    <div class="row">
                                                        <div class="col-md-8 col-sm-12 col-xs-12">
                                                            <div class="megaInner">
                                                                <ul id="ul_Women" class="submenu">
                                                                    <asp:Repeater ID="rptcat" runat="server"   DataSource='<%# DataBinder.Eval(Container.DataItem,"rel1") %>' >
                                                                        <ItemTemplate>
                                                                            <div class="col-md-4 col-sm-12 col-xs-12">
                                                                                <li class="dropdownSubmenu">
                                                                                    <p class="p_Women">
                                                                                        <a href="Products.aspx" class="hasSubMenu a_Women"><span style="margin-right: 4px;"></span><%#DataBinder.Eval(Container.DataItem, "[\"name\"]") %></a>
                                                                                    </p>
                                                                                    <ul class="" id="ul_menu_Silver_Women">
                                                                                         <asp:Repeater ID="rptsubcat" runat="server" DataSource='<%# DataBinder.Eval(Container.DataItem,"rel2") %>'>
                                                                                            <ItemTemplate>
                                                                                                  <li class="sub-submenu" style="white-space: nowrap;"><a href="Products.aspx"><%#DataBinder.Eval(Container.DataItem, "[\"name\"]") %></a></li>
                                                                                            </ItemTemplate>
                                                                                        </asp:Repeater>
                                                                                    </ul>
                                                                                </li>
                                                                            </div>
                                                                        </ItemTemplate>
                                                                    </asp:Repeater>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <script>
                                                        var wind_width = $(window).width();
                                                        if (wind_width < 1025) {
                                                            $('.menu_image').find('img').removeAttr('src');
                                                        }
            </script>
                                                </div>
                                            </li>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                    <li class="voylla"><a href="ContactUs.aspx" title="Offers"><span>Contact Us</span></a></li>
                                </ul>
                                <div class="right-nav desktop_view" style="display: inline-flex; float: right ! important;">
                                    <div id="cd-cart-trigger" class="cart_main_image" style="display: inline-flex; font-size: 15px; letter-spacing: 1px;">
                                        <div class="jewel-box" style="margin: 7px 2px 0px 0px;">Jewel Box</div>
                                        <li class="cart_counter_image" style="cursor: pointer;">
                                            <span class="cart_counter" style="padding-left: 45%; font-size: 10.5pt;">0</span>
                                        </li>
                                    </div>
                                </div>
                            </div>
    </div>
    </form>
</body>
</html>
