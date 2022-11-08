<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="KG.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css" />

</head>
<body style="margin-top: 66px">
    <form id="form1" runat="server">

        <!-- Navbar -->
        <div class="container-fluid">
            <div class="row">
                <nav class="navbar fixed-top  navbar-expand-lg navbar-light bg-light">                    
                        <img src="image/BrandLogo.png" alt="BrandLogo" style="width: 45px;" class="navbar-brand" />                                        
                </nav>
            </div>
        </div>

        <div class="container-fluid h-custom">
            <div class="row d-flex justify-content-center align-items-center h-100">

                <!-- image -->
                <div class="col-md-9 col-lg-6 col-xl-5">
                    <img src="image/LoginImage.jpg" class="img-fluid" alt="" />
                </div>
                <div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">
                    <br />

                    <!-- Email input -->
                    <div class="form-outline mb-0">
                        <asp:TextBox ID="EmailTextBox" runat="server" TextMode="Email" CssClass="form-control form-control-lg" placeholder="Enter your Email"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Enter Valid Email" Display="Dynamic" Font-Size="Small" ControlToValidate="EmailTextBox" SetFocusOnError="True" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                        <label class="form-label" for="EmailTextBox"></label>
                    </div>

                    <!-- OR -->
                    <div class="form-check mb-3">
                        <asp:Label ID="Label2" runat="server" Text="Label">OR</asp:Label>
                    </div>

                    <!-- Mobile Number input -->
                    <div class="form-outline mb-3">
                        <asp:TextBox ID="MobileTextBox" runat="server" class="form-control form-control-lg"
                            placeholder="Enter your mobile number "></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Please enter valid mobile number" Display="Dynamic" Font-Size="Small" ControlToValidate="MobileTextBox" SetFocusOnError="True" ForeColor="Red" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                        <label class="form-label" for="MobileTextBox"></label>
                    </div>

                    <!-- Password input -->
                    <div class="form-outline mb-5">
                        <asp:TextBox ID="PasswordTextBox" runat="server" TextMode="Password" CssClass="form-control form-control-lg" placeholder="Enter your password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please Enter Password" ControlToValidate="PasswordTextBox" ForeColor="Red" SetFocusOnError="True" Display="Dynamic" Font-Size="Small"></asp:RequiredFieldValidator>

                        <!-- ShowPassword checkbox -->
                        <div class="form-check mb-1" style="padding-left: 0;">
                            <input type="checkbox" onchange="document.getElementById('PasswordTextBox').type=this.checked?'text':'password'" />
                            <asp:Label ID="Label1" runat="server" Text="Label">Show Password</asp:Label>
                            <label class="form-label" for="PasswordTextBox"></label>
                        </div>
                    </div>

                    <!-- Remember me Checkbox -->
                    <div class="d-flex justify-content-between align-items-center">
                        <div class="form-check mb-1" style="padding-left: 0;">
                            <asp:CheckBox ID="CheckBox2" runat="server" />
                            <label class="form-check-label" for="form2Example3">
                                Remember me
                            </label>
                        </div>

                        <!-- Forgot password? -->
                        <a href="ForgotPassword.aspx" class="text-body">Forgot password?</a>
                    </div>

                    <!-- LoginButton -->
                    <div class="text-center text-lg-start mt-3 pt-2">
                        <asp:Button ID="LoginButton" runat="server" Text="Login" Style="padding-left: 2.5rem; padding-right: 2.5rem;" CssClass="btn btn-primary btn-lg" OnClick="LoginButton_Click" />

                        <!-- Register -->
                        <p class="small fw-bold mt-2 pt-1 mb-5">
                            Don't have an account? <a href="SignUp.aspx"
                                class="link-danger">Register</a>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <!-- Bootstrap popper & Js -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

</body>
</html>
