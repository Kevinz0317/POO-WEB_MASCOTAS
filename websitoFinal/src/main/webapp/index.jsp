<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="modelo.Mascota" %>
<%@ page import="modelo.Canino" %>
<%@ page import="modelo.Felino" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Lista de Mascotas</title>
	<link rel="stylesheet" type="text/css" href="style.css">
        <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
                  background-image:url('https://th.bing.com/th/id/R.8b063086dd4797bb29e4a066613a523a?rik=FKIgrS3Ufaz7zA&riu=http%3a%2f%2f1.bp.blogspot.com%2f-VBIMzEs7H84%2fT6twEuMATSI%2fAAAAAAAABiE%2fcbe_lphU6Bg%2fs1600%2fwallpaper-cute-puppy3.jpg&ehk=Dt78hKUkJtR%2bA4YLBlhTun7DAHw94ewfzVnuhaCpOLM%3d&risl=&pid=ImgRaw&r=0')
           
        }
        
        header {
            background-color: #f7a96d;
            padding: 10px;
            text-align: center;
        }
        
        h1 {
            color: black;
            font-size: 28px;
            margin: 0;
            text-align: center;
        }
        
        h3 {
            color: white;
            font-size: 16px;
            margin: 0;
            text-align: center;
        }
        
        form {
            background-color: #e8e8e8;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin: 20px auto;
            padding: 20px;
            width: 400px;
        }
        
        form label {
            display: block;
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 10px;
        }
        
        form input[type="text"],
        form input[type="number"] {
            font-size: 16px;
            padding: 5px;
            width: 100%;
        }
        
        form select {
            font-size: 16px;
            padding: 5px;
            width: 100%;
        }
        
        form input[type="submit"] {
            background-color: #f7a96d;
            border: none;
            border-radius: 5px;
            color: white;
            cursor: pointer;
            font-size: 18px;
            font-weight: bold;
            padding: 10px;
            margin-top: 20px;
            width: 100%;
        }
        
        table {
            border-collapse: collapse;
            margin: 20px auto;
            width: 600px;
        }
        
        table th,
        table td {
             background-color: lightgoldenrodyellow;
            color: black;
            font-size: 18px;
            font-weight: bold;
            text-transform: uppercase;
            border: 1px solid #ccc;
            padding: 10px;
            text-align: center;
        }
        
        table th {
            background-color: #f7a96d;
            color: white;
            font-size: 18px;
            font-weight: bold;
            text-transform: uppercase;
        }
        .success {
            background-color: #d4edda;
            color: #155724;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #c3e6cb;
            border-radius: 5px;
        }

        .error {
            background-color: #f8d7da;
            color: #721c24;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #f5c6cb;
            border-radius: 5px;
        }
        
        .button {
  background-color: #4CAF50; /* Green */
  border: none;
  color: white;
  padding: 16px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  transition-duration: 0.4s;
  cursor: pointer;
}

.button2 {
  background-color: white; 
  color: black; 
  border: 2px solid #008CBA;
}

.button2:hover {
  background-color: #008CBA;
  color: white;
}

.button3 {
  background-color: white; 
  color: black; 
  border: 2px solid #f44336;
}

.button3:hover {
  background-color: #f44336;
  color: white;
}
    </style>
  <script>
    function mostrarInterfaz(tipo) {
      if (tipo === 'canino') {
        document.getElementById('canino').style.display = 'block';
        document.getElementById('felino').style.display = 'none';
      } else if (tipo === 'felino') {
        document.getElementById('canino').style.display = 'none';
        document.getElementById('felino').style.display = 'block';
      }
    }
  </script>
</head>
<body>
    <header>LISTA DE MASCOTAS</header>
  
	<table>
		<tr>
			<th>Tipo</th>
			<th>Nombre</th>
			<th>Raza</th>
			<th>Color</th>
			<th>Edad</th>
			<th>Caracteristica Extra*</th>
		</tr>
		<%
			ArrayList<Mascota> mascotas = (ArrayList<Mascota>) request.getAttribute("mascotas");
			for (Mascota mascota : mascotas) {
				if (mascota instanceof Canino) {
					Canino canino = (Canino) mascota;
    %>
                <tr>
                    <td>Canino</td>
                    <td><%= canino.getNombre() %></td>
                    <td><%= canino.getRaza() %></td>
                    <td><%= canino.getColor() %></td>
                    <td><%= canino.getEdad() %></td>
                     <td><%= canino.getNivelEntrenamiento() %></td>
                </tr>
    <%
            } else if (mascota instanceof Felino) {
                Felino felino = (Felino) mascota;
    %>
                <tr>
                    <td>Felino</td>
                    <td><%= felino.getNombre() %></td>
                    <td><%= felino.getRaza() %></td>
                    <td><%= felino.getColor() %></td>
                    <td><%= felino.getEdad() %></td>
                    <td><%= felino.getLibreDeToxoplasmosis() %></td>
                   
                </tr>
    <%
            }
        }
    %>
</table>
<h3>
        *CARACTERISTICA EXTRA: 
        PARA CANINOS NIVEL DE ENTRENAMIENTO (0-10)
        PARA FELINOS LIBRE DE TOXOPLASMOSIS (TRUE/FALSE)
</h3>

<form action="MascotasServlet" method="POST">
 
  <input type="text" name="nombreEliminar">
  <button type="submit" class="button button3">Eliminar</button>
</form>
<h3>Promedio de edades: <%= request.getAttribute("promedioEdades") %></h3>
<h3>Hay <%= request.getAttribute("contadorCaninos") %> caninos y <%= request.getAttribute("contadorFelinos") %> felinos.</h3>
        
<div style="display:flex; justify-content:center; align-items:center;"> 
  <a href ="index.html" ><button class="button button2">Agregar Mascotas</button></a>
</div>
    
       </body>
        </html>