<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="KG.SignUp" %>

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
                                <a class="nav-link" href="Login.aspx"><i class="bi bi-person-fill"></i>Login</a>
                            </li>
                        </ul>
                    </div>
                </nav>
            </div>
        </div>

        <!-- Content -->
        <div class="container-fluid h-custom">
            <div class="row d-flex justify-content-center align-items-center h-100">

                <!-- Image -->
                <div class="col-md-9 col-lg-6 col-xl-5">
                    <img src="image/SignupImage.jpg" class="img-fluid" alt="" />
                </div>
                <div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">
                    <br />

                    <!-- Name input -->
                    <div class="form-outline mb-2">
                        <asp:TextBox ID="NameTextBox" runat="server" class="form-control form-control-lg"
                            placeholder="Enter your name"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please enter name" ControlToValidate="NameTextBox" ForeColor="Red" SetFocusOnError="True" Display="Dynamic" Font-Size="Small"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Please enter valid name" Display="Dynamic" Font-Size="Small" ControlToValidate="NameTextBox" SetFocusOnError="True" ForeColor="Red" ValidationExpression="^[A-Za-z\s]+$"></asp:RegularExpressionValidator>
                        <label class="form-label" for="NameTextBox"></label>
                    </div>

                    <!-- Email input -->
                    <div class="form-outline mb-2">
                        <asp:TextBox ID="EmailTextBox" runat="server" class="form-control form-control-lg"
                            placeholder="Enter your email id "></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter email id" ControlToValidate="EmailTextBox" ForeColor="Red" SetFocusOnError="True" Display="Dynamic" Font-Size="Small"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please enter valid email id" Display="Dynamic" Font-Size="Small" ControlToValidate="EmailTextBox" SetFocusOnError="True" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                        <label class="form-label" for="form3Example2"></label>
                    </div>

                    <!-- Mobile Number input -->
                    <div class="form-outline mb-2">
                        <asp:TextBox ID="MobileTextBox" runat="server" class="form-control form-control-lg"
                            placeholder="Enter your mobile number "></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Please enter  mobile number" ControlToValidate="MobileTextBox" ForeColor="Red" SetFocusOnError="True" Display="Dynamic" Font-Size="Small"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Please enter valid mobile number" Display="Dynamic" Font-Size="Small" ControlToValidate="MobileTextBox" SetFocusOnError="True" ForeColor="Red" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                        <label class="form-label" for="MobileTextBox"></label>
                    </div>

                    <!-- Alternative Mobile Number input -->
                    <div class="form-outline mb-2">
                        <asp:TextBox ID="AlternativeMobileTextBox" runat="server" class="form-control form-control-lg"
                            placeholder="Enter your Alternative mobile number "></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Please enter Alternative mobile number" ControlToValidate="AlternativeMobileTextBox" ForeColor="Red" SetFocusOnError="True" Display="Dynamic" Font-Size="Small"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="Please enter valid Alternative mobile number" Display="Dynamic" Font-Size="Small" ControlToValidate="AlternativeMobileTextBox" SetFocusOnError="True" ForeColor="Red" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                        <label class="form-label" for="AlternativeMobileTextBox"></label>
                    </div>

                    <!-- Pincode input -->
                    <div class="form-outline mb-2">
                        <asp:TextBox ID="PincodeTextBox" runat="server" class="form-control form-control-lg"
                            placeholder="Pincode"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Please enter Pincode" ControlToValidate="PincodeTextBox" ForeColor="Red" SetFocusOnError="True" Display="Dynamic" Font-Size="Small"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ErrorMessage="Please enter valid Pincode" Display="Dynamic" Font-Size="Small" ControlToValidate="PincodeTextBox" SetFocusOnError="True" ForeColor="Red" ValidationExpression="^[1-9]{1}[0-9]{2}[0-9]{3}$"></asp:RegularExpressionValidator>
                        <label class="form-label" for="PincodeTextBox"></label>
                    </div>

                    <!-- State input -->
                    <div class="form-outline mb-2">
                        <asp:TextBox ID="StateTextBox" runat="server" class="form-control form-control-lg"
                            placeholder="State"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Please enter State" ControlToValidate="StateTextBox" ForeColor="Red" SetFocusOnError="True" Display="Dynamic" Font-Size="Small"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ErrorMessage="Please enter valid State" Display="Dynamic" Font-Size="Small" ControlToValidate="StateTextBox" SetFocusOnError="True" ForeColor="Red" ValidationExpression="^[A-Za-z\s]+$"></asp:RegularExpressionValidator>
                        <label class="form-label" for="StateTextBox"></label>
                    </div>

                    <!-- City input -->
                    <div class="form-outline mb-2">
                        <asp:TextBox ID="CityTextBox" runat="server" class="form-control form-control-lg"
                            placeholder="City"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Please enter City" ControlToValidate="CityTextBox" ForeColor="Red" SetFocusOnError="True" Display="Dynamic" Font-Size="Small"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ErrorMessage="Please enter valid City" Display="Dynamic" Font-Size="Small" ControlToValidate="CityTextBox" SetFocusOnError="True" ForeColor="Red" ValidationExpression="^[A-Za-z\s]+$"></asp:RegularExpressionValidator>
                        <label class="form-label" for="CityTextBox"></label>
                    </div>

                    <!-- Address input -->
                    <div class="form-outline mb-2">
                        <asp:TextBox ID="AddressTextBox" runat="server" class="form-control form-control-lg"
                            placeholder="Address"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="Please enter Address" ControlToValidate="AddressTextBox" ForeColor="Red" SetFocusOnError="True" Display="Dynamic" Font-Size="Small"></asp:RequiredFieldValidator>
                        <label class="form-label" for="AddressTextBox"></label>
                    </div>

                    <!-- Password input -->
                    <div class="form-outline mb-2">
                        <asp:TextBox ID="PasswordTextBox" runat="server" class="form-control form-control-lg"
                            placeholder="Enter your password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please enter password" ControlToValidate="PasswordTextBox" ForeColor="Red" SetFocusOnError="True" Display="Dynamic" Font-Size="Small"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Minimum 8 characters required" Display="Dynamic" Font-Size="Small" ControlToValidate="PasswordTextBox" SetFocusOnError="True" ForeColor="Red" ValidationExpression="^[\s\S]{8,}$"></asp:RegularExpressionValidator>
                        <label class="form-label" for="form3Example3"></label>
                    </div>

                    <!-- Confirm Password input -->
                    <div class="form-outline mb-3">
                        <asp:TextBox ID="ConfirmPasswordTextBox" runat="server" class="form-control form-control-lg"
                            placeholder="Confirm your password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please re-enter password" ControlToValidate="ConfirmPasswordTextBox" ForeColor="Red" SetFocusOnError="True" Display="Dynamic" Font-Size="Small"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password not matched" ControlToCompare="PasswordTextBox" ControlToValidate="ConfirmPasswordTextBox" Display="Dynamic" SetFocusOnError="True" ForeColor="Red" Font-Size="Small"></asp:CompareValidator>
                        <label class="form-label" for="form3Example4"></label>
                    </div>

                    <!-- RegisterButton -->
                    <div class="text-center text-lg-start mt-3 pt-2 mb-5 ">
                        <asp:Button ID="RegisterButton" runat="server" Text="Register" Style="padding-left: 2.5rem; padding-right: 2.5rem;" CssClass="btn btn-primary btn-lg" OnClick="RegisterButton_Click" />
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
