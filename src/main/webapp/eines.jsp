<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="java.text.DecimalFormat"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
    Map<String, Integer> comprar = new HashMap();
    Map<String, Integer> eines = new HashMap();
%>
<%
    /*
     TODO
     Les eines que es poden comprar són les que podeu veure a la carpeta img 
     Fem coincidir el nom de l'eina amb el nom del fitxer sense l'extensió
     (Alicate, Destral,...)
     
     Què heu de fer?
     Afegir tots les eines en el cas que la variable 'eines' estigui 
     buida.
     */
    if (eines.isEmpty()) {
        eines.put("Alicate", 15);
        eines.put("Destral", 167);
        eines.put("JocTornavis", 165);
        eines.put("MaletiBroques", 175);
        eines.put("MartellGoma", 105);
        eines.put("Multius", 150);
        eines.put("SerraJardi", 815);
        eines.put("SerraMetall", 915);

    }

    /*
     TODO
     L'aplicació ha d'emmagatzemar l'eina i la quantitat d'objectes de la 
     mateixa eina que l'usuari vol comprar. 
        
     Llavors, quan l'usuari ha fet clic a un dels enllaços,la quantitat 
     associada es guardarà al 'Map' anomenat 'comprar'.
     
     La URL associada a cadascuna dels enllaços és:
    
     .../eines.jsp?eina=xxx&quantitat=yyy
     on xxx és el nom del eina y 'yyy' és la quantitat.
     
     A continuació heu de recuperar el nom de l'eina i la quantitat
     donada. En el cas que no siguin nuls, afegiu-lo al Map 'comprar'.
        
     */
    String eina = request.getParameter("eina");
    String quantitat = request.getParameter("quantitat");

    if (eina != null && quantitat != null) {
        comprar.put(eina, Integer.parseInt(quantitat));
    }

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Eines</title>
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
                <div class="col-md-8">
                    <h1>Eines disponibles</h1>
                </div>
                <div class="col-md-2">
                    <h1>Comprades</h1>
                </div>
            </div>                
            <div class="row">
                <div class="col-md-8">
                    <div class="row textcenter">
                        <%                            /*
                        TODO
                        
                        Què és vol fer?
                        Es vol mostrar totes les eines. S'ha de mostrar
                        el seu nom, la fotografia i els enllaços amb la quantitat
                        d'eines que es poden comprar ( 1 a 5).
                        
                        Com?
                        Realitza un bucle que recorri totes les eines.                                               
                        
                        IMPORTANT:
                        Una vegada ho has realitzat, NO tanquis el bucle. L'HTML
                        que hi ha a continuació es part del cos del bucle.*/
                            for (String nom_eina : eines.keySet()) {
                        %>

                        <div class="col-md-3 divEina">
                            <div class="row" >
                                <h4>
                                    <!--
                                    TODO
                                    Mostreu en negreta el nom de l'eina actual i el seu preu                               
                                    -->
                                    <%
                                        out.println("<strong>" + nom_eina + " - " + eines.get(nom_eina) + "€</strong>");


                                    %>
                                </h4>
                                <div class="row">
                                    <!--
                                   TODO
                                   Inseriu un element img class="img-responsive ownImgTable col-centered" amb
                                   src de la carpeta img l'eina xxx.png (on xxx ha de ser variable)
                                    -->
                                    <%  
                                        String imatge = "img/" + nom_eina + ".png";
                                    %>
                                    <img src="<%=imatge%>" img class="img-responsive ownImgTable col-centered" />
                                </div>

                            </div>
                            <div  >
                                <!--
                                                                TODO
                                                                Com podeu veure a les imatges de l'enunciat, es mostren uns 
                                                                enllaços (1,2,3,4,5) que corresponen a la quantitat que es vol
                                                                comprar d'aquella eina.
                                
                                                                Què heu de fer?
                                
                                                                Mostrar correctament el nombre d'enllaços amb les quantitats que
                                                                es poden comprar de cada eina.
                                                                Només s'han de mostrar en el cas que encara no s'hagi comprat.
                                                                
                                                                Com?
                                                                Heu de guardar com a atribut de pàgina la variable 'nom' que conté el
                                                                nom de l'eina actual. (L'utiltizareu quan realitzeu el bucle amb JSTL)
                                                                Heu de mirar si el Map 'comprar' conté el nom de l'eina,
                                                                    Si el conté, llavors heu de crear 5
                                .                                        <div class="col-md-2"> 
                                                                    buits
                                                                    
                                                                    Si no el conté, llavors
                                                                        heu de mostrar els nombres del 1 al 5  on cadascun d'ells té
                                                                        associat un enllaç amb el nom de l'eina i la
                                                                        quantitat
                                                                            <div class="col-md-2"> 
                                                                                <a href='xxx'>1</a>
                                                                                <a href='xxx'>2</a>
                                                                                <a href='xxx'>3</a>
                                                                                <a href='xxx'>4</a>
                                                                                <a href='xxx'>5</a>
                                                                            </div>                                      
                                                                            on xxx l'heu de construir amb JSTL i la url ha de ser:
                                                                            eines.jsp?eina=yyy&quantitat=zzz
                                                                                on yyy és el nom de l'eina (emmagatzemat al pageContext)
                                                                                i  zzz és la quantitat (pot ser: 1,2,3,4, o 5).
                                                                            Feu un bucle for del 1 al 5 per construir amb JSTL 
                                                                            les url amb els enllaços anteriors.
                                -->                                                  

                            </div>
                        </div> 

                        <%                            // AQUI HEU DE TANCAR EL BUCLE
                            }
                        %>
                    </div>        

                </div>

                <div class="col-md-4 " >
                    <div class="row col-centered" >
                        <img class = "img-responsive ownImgTable" src='img/cistella.png'/>
                    </div>
                    <div class="row">
                        <div class="col-md-6 textcenter">

                            <%                                /*
                                 TODO
                                 Calculeu el valor de quantitat: Nombre d'eines diferents comprades
                                 Calculeu el valor total: Total de factura
                                 */
 /*
                                TODO
                                Per calcular el total heu de recòrrer el map anomenat comprar.
                                Ho podeu fer amb un bucle de tipus for on a cada volta mireu el nom de l'eina
                                i agafeu el preu associat al map "eines".
                                Per exemple, el for ha de ser així:
                                for (Map.Entry<String, Integer> v : comprar.entrySet())
                                
                                on v és l'assossiació <eina,quantitat>
                                
                                Cada vegada s'actualitzarà la variable total. 
                                 */

                            %>
                            <h4>
                                Quantitat:
                            </h4>
                            <h4>
                                Total:  
                            </h4>
                            <h4><a href='<c:url value="comprats.jsp"/>'>Veure</a></h4>
                            <% /*
                                 TODO
                                 Necessitarem que les variables eines i comprar
                                 siguin accessibles desde JSTL. Ho necessitareu a comprats.jsp
                                 Què heu de fer?
                                 Feu que eines i comprar siguin accessibles desde JSTL
                                 */

                            %>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </body>
</html>
