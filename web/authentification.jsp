<%-- 
    Document   : authentification
    Created on : 13 oct. 2018, 13:15:37
    Author     : ibrah
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta  charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="dist/css/bootstrap.css" rel="stylesheet"/>
        <link rel="stylesheet" href="dist/css/mystyle.css" />
        <link rel="stylesheet" type="text/css" href="Style/style1.css">
        <link rel="icon" type="image/png" href="Image/icone_logo.png" sizes="310x310" />
        <style type="text/css">
            body{
                /*background: url("images/fr_ar01.JPG");*/
                background-color: #2ecc71;
                background-repeat: no-repeat; 
                background-size: auto;               
                width: 100%;
                height: 100%;
            }
            #log{
                /* background: url(images/gouttes3.jpg) no-repeat;*/
                background-color: #00a1dc;
                padding: 60px 40px;
                margin-top: 20px;
                -webkit-box-shadow: -5px 2px 62px 8px rgba(0,0,0,0.75);
                -moz-box-shadow: -5px 2px 62px 8px rgba(0,0,0,0.75);
                box-shadow: -5px 2px 62px 8px rgba(0,0,0,0.75);
            }
            img{
                margin: auto;
                width: 120px;
                height: 120px;
            }
            h1{
                margin-left: 30px;
                margin-top: -40px;
                font-weight: bolder;
                color: white;

            }
            h2{
                margin-left: 30px;
                margin-top: 20px;
                color: red;

            }
            label{
                font-size: 20px;
                color: white;
            }
            button{
                -webkit-box-shadow: -5px 2px 62px 8px rgba(0,0,0,0.75);
                -moz-box-shadow: -5px 2px 62px 8px rgba(0,0,0,0.75);
                box-shadow: -5px 2px 62px 8px rgba(0,0,0,0.75);    
            }
            button[type="submit"]{
                border-radius: 50px;
            }
            button:hover{
                color: gray;
            }
            .im_retour{
                height: 40px;
                width: 40px;
                float: left;
                margin-left: 0;
                margin-top: 35px;
            }
            #logPar{
                background-color: #0092ef;
                padding: 60px 40px;
                margin-top: 20px;
                -webkit-box-shadow: -5px 2px 62px 8px rgba(0,0,0,0.75);
                -moz-box-shadow: -5px 2px 62px 8px rgba(0,0,0,0.75);
                box-shadow: -5px 2px 62px 8px rgba(0,0,0,0.75);  
            }
            
        </style>
    </head>
    <body>
        
        <script type="text/javascript" src="dist/js/jquery-3.3.1.min.js"></script>
        <script type="text/javascript" src="dist/js/bootstrap.js"></script>
        <script type="text/javascript" src="dist/js/myscript.js"></script>
