<%@ Page EnableEventValidation="false" Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index"  %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <link rel="shortcut icon" type="image/x-icon" href="Images/emblem.png" />
    
    <title>AP Cargo - Web vr.2</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet" />

    <!-- Custom CSS -->
    <link href="css/full-slider.css" rel="stylesheet" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js" type="text/javascript"></script>
 
</head>

<body>
    <form id="form1" runat="server">
        <!-- Navigation -->
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <div class="container">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header" >
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>

                   
                    <a class="navbar-brand" href="#"> <img src="../images/logo.png"  style=""/></a>
                </div>
                <!-- Collect the nav links, forms, and other content for toggling -->

                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1" style="text-align: right">
                    <form name="sentMessage" id="login-form" novalidate>
                        <br />
                        <ul class="nav navbar-nav navbar-right">
                            <li style="width: 170px">

                                <div class="col-md-6" style="color: white">Username</div>
                                <br />
                                <div class="col-md-6">
                                    <asp:TextBox ID="login_username" Width="160px" class="form-control" runat="server" required></asp:TextBox>
                                </div>
                                <asp:Label ID="lblStatus" Style="width: 300px" runat="server" Text=" "></asp:Label>

                            </li>

                            <li style="width: 185px">

                                <div class="col-md-6" style="color: white">Password</div>
                                <br />
                                <div class="col-md-6">

                                    <asp:TextBox ID="login_password" Width="160px" class="form-control" TextMode="Password" runat="server" required></asp:TextBox>
                                </div>
                            </li>
                            
                            <li>
                                <br />
                                <asp:Button ID="btnSubmit" Text="Login" OnClick="btnSubmit_Click" runat="server" class="btn btn-xl" />
                                <%--<button type="submit" class="btn btn-primary btn-lg btn-block" onclick="CheckCredentials()">Login</button>--%>
                                <%--<button type="submit" class="btn btn-primary btn-lg btn-block" onclick="CheckCredentials()">Login</button>--%>
                            </li>

                        </ul>


                    </form>
                </div>

                <br />
                <!-- /.navbar-collapse -->
            </div>
            <!-- /.container -->
        </nav>

        <!-- Full Page Image Background Carousel Header -->
        <header id="myCarousel" class="carousel slide">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
            </ol>

            <!-- Wrapper for Slides -->
            <div class="carousel-inner">
                <div class="item active">
                    <!-- Set the first background image using inline CSS below. -->
                    <div class="fill" style="background-image: url('http://apcargo.com.ph/images/banners/01-b-keyvisual-home-big-v2.jpg');"></div>
                    <div class="carousel-caption">
                        <%--<h2>Caption 1</h2>--%>
                    </div>
                </div>
                <div class="item">
                    <!-- Set the second background image using inline CSS below. -->
                    <div class="fill" style="background-image: url('http://apcargo.com.ph/images/banners/01-d-keyvisual-home-big-1.jpg');"></div>
                    <div class="carousel-caption">
                        <%--<h2>Caption 2</h2>--%>
                    </div>
                </div>
                <div class="item">
                    <!-- Set the third background image using inline CSS below. -->
                    <div class="fill" style="background-image: url('http://apcargo.com.ph/images/banners/partnership-home-banner.jpg');"></div>
                    <div class="carousel-caption">
                        <%--<h2>Caption 3</h2>--%>
                    </div>
                </div>
            </div>

            <!-- Controls -->
            <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                <span class="icon-prev"></span>
            </a>
            <a class="right carousel-control" href="#myCarousel" data-slide="next">
                <span class="icon-next"></span>
            </a>

        </header>

        <!-- Page Content -->
        <div class="container">

            <%--   <div class="row">
            <div class="col-lg-12">
                <h1>Full Slider by Start Bootstrap</h1>
                <p>The background images for the slider are set directly in the HTML using inline CSS. The rest of the styles for this template are contained within the <code>full-slider.css</code>file.</p>
            </div>
        </div>--%>

            <hr>

            <!-- Footer -->
            <footer>
                <div class="row" style="text-align: center">
                    <div class="col-lg-12">
                        <p>Copyright &copy; APCargo 2016</p>
                    </div>
                </div>
                <!-- /.row -->
            </footer>

        </div>
        <!-- /.container -->

        <!-- jQuery -->
        <script src="js/jquery.js"></script>
        
        <!-- Bootstrap Core JavaScript -->
        <script src="js/bootstrap.min.js"></script>
        

        <!-- Script to Activate the Carousel -->
        <script>
            $('.carousel').carousel({
                interval: 3000 //changes the speed
            })
    </script>
            
      

    </form>
</body>
</html>