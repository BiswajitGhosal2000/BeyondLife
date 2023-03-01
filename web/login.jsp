<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${not empty User}" >
    <jsp:forward page="userpage.jsp"/>
</c:if>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8" >
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="Employee Web">
        <meta name="author" content="Biswajit Ghosal">
        <title>Insurance Management</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link rel="apple-touch-icon" href="img/profilePhoto.png" sizes="180x180">
        <link rel="icon" href="img/logo.jpg" sizes="32x32" type="image/png">
        <link rel="icon" href="img/logo.jpg" sizes="16x16" type="image/png">
        <meta name="theme-color" content="#712cf9">
        <meta name="google-signin-client_id" content="176276386969-es89fhqq8nhjaub05gttqacmtkempd2j.apps.googleusercontent.com">
        <script src="https://accounts.google.com/gsi/client" async defer></script>

        <!-- Custom styles for this template -->
        <link href="css/login.css" rel="stylesheet">
    </head>
    <body class="text-center">
        <main class="form-signin w-100 m-auto">
            <div class="card" style="width:22rem;">
                <div class="card-header">
                    <img src="img/profilePhoto.png" class="card-img-top" alt="logo">
                </div>
                <c:if test="${not empty sessionScope.LoginErrorMsg}">
                    <div class="alert alert-danger" role="alert">
                        <c:out value="${sessionScope.LoginErrorMsg}"/>
                    </div>
                </c:if>

                <div class="card-body">
                    <h1 class="card-title">Sign in </h1>
                    <form action="Login" method="Post">


                        <div class="form-floating">
                            <input type="email" class="form-control" id="floatingInput" placeholder="name@example.com" name="email">
                            <label for="floatingInput">Email address</label>
                        </div>
                        <div class="form-floating">
                            <input type="password" class="form-control" id="floatingPassword" placeholder="Password" name="password">
                            <label for="floatingPassword">Password</label>
                        </div>
                        <div >
                            <label>
                                <input type="checkbox" value="remember-me"> Remember me
                            </label>
                        </div>
                        <button class="w-50 btn btn btn-primary" type="submit">Log in</button>
                    </form>
                    <div id="g_id_onload"
                                     data-client_id="176276386969-es89fhqq8nhjaub05gttqacmtkempd2j.apps.googleusercontent.com"
                                     data-context="signin"
                                     data-ux_mode="popup"
                                     data-callback="handleCredentialResponse"
                                     data-auto_prompt="false"></div>
                                <div class="g_id_signin"
                                     data-type="standard"
                                     data-shape="pill"
                                     data-theme="outline"
                                     data-text="signin_with"
                                     data-size="large"
                                     data-logo_alignment="left">
                                </div>
                    <div class="card-footer">
                        <a href="home.jsp">Home</a>
                    </div>
                </div>
            </div>
        </main>
        <form class="card-body cardbody-color p-lg-5" action="GmailLogin" method="Post" id="GmailForm" hidden >
            <div class="mb-3">
                <input type="text" class="form-control" id="ID" name="sub" aria-describedby="emailHelp"
                       placeholder="name@example.com">
            </div>
            <div class="mb-3">
                <input type="text" name = "email" class="form-control" id="email" placeholder="password">
            </div>
            <div class="mb-3">
                <input type="text" name = "given_name" class="form-control" id="firstName" placeholder="password">
            </div>
            <div class="mb-3">
                <input type="text" name = "family_name" class="form-control" id="lastName" placeholder="password">
            </div>
            <div class="mb-3">
                <input type="text" name = "picture" class="form-control" id="picture" placeholder="password">
            </div>
            <!--<button type="submit" class="btn btn-color px-5 mb-5 w-100">Gmail Login</button>-->
        </form>
        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script>
            function handleCredentialResponse(response) {
                const responsePayLoad = decodeJwtResponse(response.credential);
                console.log(responsePayLoad);
                var ID = responsePayLoad.sub;
                var Name = responsePayLoad.name;                
                var FirstName = responsePayLoad.given_name;
                var LastName = responsePayLoad.family_name;
                var Picture = responsePayLoad.picture;
                var email = responsePayLoad.email;
                document.getElementById("ID").value = ID;
                document.getElementById("email").value = email;
                document.getElementById("firstName").value = FirstName;
                document.getElementById("lastName").value = LastName;
                document.getElementById("picture").value = Picture;
                console.log("ID: " + ID);
                console.log("Name: " + Name);
                console.log("Given Name: " + FirstName);
                console.log("family Name: " + LastName);
                console.log("Image URL: " + Picture);
                console.log("Email: " + email);
                            }                            
        </script>
        <script>
            function decodeJwtResponse(data) {
                                    var tokens = data.split(".");
                                    return JSON.parse(atob(tokens[1]));
                            }
        </script>
        <div id="gmailLogin"></div>
    </body>
</html>
