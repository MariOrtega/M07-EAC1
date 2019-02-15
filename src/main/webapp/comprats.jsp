<%@page import="java.util.Map"%>
<%@page import="java.text.DecimalFormat"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    /*
     TODO
     Si  l'usuari ha donat a un dels enllaços Eliminar, llavors la url serà:
     .../comprats.jsp?eina=xxx, on xxx és el nom del'eina.
     
     A la variable Java eina, hem recuperat aquest nom amb
     request.getParameter("eina") 
    
     A la variable Java comprar, hem recuperat el llistat d'eines comprades
      amb session.getAttribute("comprar");     
    
    
     Què heu de fer?
     Elimineu l'eina de la llista d'eines comprades
     */
   
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Llistat d'eines comprades</title>
        <!-- CSS -->
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

        <!-- css propis -->
        <link href="owncss/eines.css" rel="stylesheet">

        <!-- JAVA SCRIPT -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>


    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-10">
                    <h1>Llistat d'eines comprades</h1>
                </div>
            </div>                
            <div class="row">
                <div class="col-md-8">
                    <table class="table table-hover">
                        <thead class="thead-inverse">
                            <tr>
                                <th></th>
                                <th>Eina</th>
                                <th>Quantitat</th>
                                <th>Acció</th>
                            </tr>
                        </thead>
                        <!--
                        TODO
                        Amb JSTL heu de desenvolupar les files de la taula que es pot veure a l'enunciat.
                        El contingut són les eines comprades.
                        No cal que sigui exacta a la que veieu, però el contingut ha de ser el mateix.
                        Heu de cambiar cada color de la fila amb JSTL.
                        L'enllaç Eliminar de cada fila, és l'element
                            <a  href='xxx'>Eliminar</a>
                                on xxx l'heu de construir amb JSTL i la url ha de ser 
                        ...comprats.jsp?eina=yyy
                                    on yyy és el nom del'eina de la fila
                        Per a la imatge, podeu fer servir la classe css ownImgTable
                        
                        Heu de definir i calcular la variable JSTL ptotal com el total de la factura (suma dels preus*quantitat.)
                        Aquesta variable la mostrareu al final de tot.
                        -->

                      
                        <tfoot>
                            <tr>     
                                <th></th>
                                <th class="text-right">Total</th>                                                                        
                                <th>
                                    <fmt:setLocale value="es_ES"/>
                                      <!-- 
                                    TODO 
                                     Cal posar a xx el valor del total
                                     
                                    --> 
                                    <fmt:formatNumber value="${xx}" type="number"/> €</th>
                                <th></th>
                            </tr>
                        </tfoot>
                    </table>
                    </table>
                </div>
                <div class="col-md-2">
                   <h4><a href='<c:url value="eines.jsp"/>'>Tornar</a></h4>
                </div>
            </div>
        </div>
    </body>
</html>
