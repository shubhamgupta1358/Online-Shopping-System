<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResetPassword.aspx.cs" Inherits="KG.ResetPassword" %>

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
                    <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        </ul>
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <a class="nav-link" href="Login.aspx"><i class="bi bi-person-fill"></i>Login/SignUp</a>
                            </li>
                        </ul>
                    </div>
                </nav>
            </div>
        </div>

        <div class="container-fluid h-custom">
            <div class="row d-flex justify-content-center align-items-center h-100">

                <!-- image -->
                <div class="col-md-9 col-lg-6 col-xl-5">
                    <img src="image/ForgetPasswordImage.jpg" class="img-fluid" alt="" />
                </div>
                <div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">

                    <!-- Display Password -->
                    <div class="form-outline mb-5">
                        <asp:Label ID="Label1" runat="server" Visible="False"></asp:Label>
                        <label class="form-label"></label>
                    </div>

                    <!-- Password input -->
                    <div class="form-outline mb-3">
                        <asp:TextBox ID="PasswordTextBox" runat="server" class="form-control form-control-lg"
                            placeholder="Enter your new password" Visible="False"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please enter new password" ControlToValidate="PasswordTextBox" ForeColor="Red" SetFocusOnError="True" Display="Dynamic" Font-Size="Small"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Minimum 8 characters required" Display="Dynamic" Font-Size="Small" ControlToValidate="PasswordTextBox" SetFocusOnError="True" ForeColor="Red" ValidationExpression="^[\s\S]{8,}$"></asp:RegularExpressionValidator>
                        <label class="form-label" for="form3Example3"></label>
                    </div>

                    <!-- Confirm Password input -->
                    <div class="form-outline mb-3">
                        <asp:TextBox ID="ConfirmPasswordTextBox" runat="server" class="form-control form-control-lg"
                            placeholder="Confirm your new password" Visible="False"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please re-enter new password" ControlToValidate="ConfirmPasswordTextBox" ForeColor="Red" SetFocusOnError="True" Display="Dynamic" Font-Size="Small"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password not matched" ControlToCompare="PasswordTextBox" ControlToValidate="ConfirmPasswordTextBox" Display="Dynamic" SetFocusOnError="True" ForeColor="Red" Font-Size="Small"></asp:CompareValidator>
                        <label class="form-label" for="form3Example4"></label>
                    </div>

                    <!-- SubmitButton -->
                    <div class="text-center text-lg-start mt-3 pt-2 " style="margin-bottom: 15%;">
                        <asp:Button ID="ResetButton" runat="server" Text="Reset" Style="padding-left: 2.5rem; padding-right: 2.5rem;" CssClass="btn btn-primary btn-lg" OnClick="ResetButton_Click" Visible="False" />
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
