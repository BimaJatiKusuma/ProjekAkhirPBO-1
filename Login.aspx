<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <!--Login Form-->
<section class="vh-100">
  <div class="container-fluid h-custom">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-md-9 col-lg-6 col-xl-5">
        <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/draw2.webp"
          class="img-fluid" alt="Sample image">
      </div>
      <div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">

          <!-- Email input -->
          <div class="form-outline mb-4">
            <label class="form-label" for="form3Example3">Email address</label>
            <asp:TextBox type="email" ID="LoginEmail" runat="server" CssClass="form-control from-control-lg" placeholder="Enter a valid email address"></asp:TextBox>
          </div>

          <!-- Password input -->
          <div class="form-outline mb-3">
            <label class="form-label" for="form3Example4">Password</label>
            <asp:TextBox type="password" ID="LoginPassword" runat="server" CssClass="form-control from-control-lg" placeholder="Enter password"></asp:TextBox>
          </div>

          <!--LoginButton-->
          <div class="text-center text-lg-start mt-4 pt-2">
            <asp:Button type="button" CssClass="btn btn-primary btn-lg" style="padding-left: 2.5rem; padding-right: 2.5rem" runat="server" Text="Login" OnClick="btnLogin"/>
            <asp:Label ID="login_tandapesan" runat="server"></asp:Label>
            <p class="small fw-bold mt-2 pt-1 mb-0">Don't have an account? <a runat="server" href="~/Signup"
                class="link-danger">Register</a></p>
          </div>


      </div>
    </div>
  </div>
  <div>
    <class="d-flex flex-column flex-md-row text-center text-md-start justify-content-between py-4 px-4 px-xl-5 bg-primary">
    <!-- Copyright -->
    <div class="text-white mb-3 mb-md-0">
      Copyright © 2020. All rights reserved.
    </div>
    <!-- Copyright -->

    <!-- Right -->
    <div>
      <a href="#!" class="text-white me-4">
        <i class="fab fa-facebook-f"></i>
      </a>
      <a href="#!" class="text-white me-4">
        <i class="fab fa-twitter"></i>
      </a>
      <a href="#!" class="text-white me-4">
        <i class="fab fa-google"></i>
      </a>
      <a href="#!" class="text-white">
        <i class="fab fa-linkedin-in"></i>
      </a>
    </div>
    <!-- Right -->
  </div>
</section>
<!--login_end-->

</asp:Content>