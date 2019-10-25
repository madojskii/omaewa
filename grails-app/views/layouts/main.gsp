<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title><g:layoutTitle default="Test" /></title>
    <link rel="shortcut icon" href="${createLinkTo(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
    <script src="https://kit.fontawesome.com/5f159114ee.js" crossorigin="anonymous"></script>
    <meta name="description" content="">
    <meta name="author" content="">


    <!-- Bootstrap core CSS -->
    <asset:stylesheet src="bootstrap.css"/>
    <!-- Custom styles for this template -->
    <asset:stylesheet src="simple-sidebar.css"/>
    <asset:javascript src="jquery-3.3.1.min.js"/>
    <asset:javascript src="bootstrap.bundle.js"/>
    <asset:stylesheet src="watch-it.css"/>
    <asset:stylesheet src="application.css"/>
    <asset:javascript src="application.js"/>
    <g:layoutHead/>
</head>

<body id="page-top">

<g:render template="/layouts/navbar"/>

<div id="wrapper">

    <g:render template="/layouts/menu"/>
    <div id="backgroundImage" style="background-image: url(${assetPath(src: 'background.jpg')});opacity: 0.4"></div>
    <g:layoutBody/>
</div>
<script>
    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });
</script>

</body>

</html>
