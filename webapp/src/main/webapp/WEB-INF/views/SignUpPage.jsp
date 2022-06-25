<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Inscription</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <link type="text/css" rel="stylesheet" href="css/sourcesanspro-font.css" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link type="text/css" rel="stylesheet" href="css/style.css" />
    </head>
        <body class="form-v8">
            <div class="page-content">
                <div class="form-v8-content">
                    <div class="form-left">
                        <img src="images/body4.png"@ alt="form" height="600">
                    </div>
                    <div class="form-right">
                        <div class="tab">
                            <div class="tab-inner">
                                <button class="tablinks" onclick="window.location.assign('SignUpServlet');">Sign Up</button>
                            </div>
                            <div class="tab-inner">
                                <button class="tablinks" onclick="window.location.assign('LoginServlet');">Sign In</button>
                            </div>
                        </div>
                        <form class="form-detail" method="post"  action="SignUpServlet">
                            <div class="tabcontent" id="sign-up">
                                <div class="form-row">
                                    <label class="form-row-inner">
                                        <input type="text" id="login" name="login"  class="input-text" required>
                                        <span class="label">Username</span>
                                          <span class="border"></span>
                                    </label>
                                </div>
                                <div class="form-row">
                                    <label class="form-row-inner">
                                        <input type="text" name="email" id="email" class="input-text" required>
                                        <span class="label">E-Mail</span>
                                          <span class="border"></span>
                                    </label>
                                </div>
                                <div class="form-row">
                                    <label class="form-row-inner">
                                        <input type="password" id="password" name="password" class="input-text" required>
                                        <span class="label">Password</span>
                                        <span class="border"></span>
                                    </label>
                                </div>
                                <div class="form-row">
                                    <label class="form-row-inner">
                                        <input type="password" id="confirm_password" name="confirm_password"  class="input-text" required>
                                        <span class="label">Comfirm Password</span>
                                        <span class="border"></span>
                                    </label>
                                </div>
                                <div class="form-row-last">
                                    <input type="submit" name="register" class="register" value="Register">
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            
        </body>
        </html>


