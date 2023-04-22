package controlador;

import java.io.IOException;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import modelo.Canino;
import modelo.Felino;
import modelo.Mascota;

public class MascotasServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private final ArrayList<Mascota> mascotas = new ArrayList<>();
    private double promedioEdades;
    private int contadorCaninos = 0;
    private int contadorFelinos = 0;
    public MascotasServlet() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String tipo = request.getParameter("tipo");
        String nombre = request.getParameter("nombre");
        String raza = request.getParameter("raza");
        String color = request.getParameter("color");
        String edadString = request.getParameter("edad");
        int edad = 0;
        if (edadString != null && !edadString.isEmpty()) {
            edad = Integer.parseInt(edadString);
        }
        String nombreEliminar = request.getParameter("nombreEliminar");

        if (nombreEliminar != null && !nombreEliminar.isEmpty()) {
            for (int i = 0; i < mascotas.size(); i++) {
                if (mascotas.get(i).getNombre().equals(nombreEliminar)) {
                    mascotas.remove(i);
                    break;
                }
            }
        } else {
            if (tipo.equals("canino")) {
                String nivelEntrenamientoString = request.getParameter("nivelEntrenamiento");
                int nivelEntrenamiento = 0;
                if (nivelEntrenamientoString != null && !nivelEntrenamientoString.isEmpty()) {
                    nivelEntrenamiento = Integer.parseInt(nivelEntrenamientoString);
                }
                Canino canino = new Canino(nombre, raza, color, edad, nivelEntrenamiento);
                mascotas.add(canino);
                contadorCaninos++;
            } else if (tipo.equals("felino")) {
                String libreDeToxoplasmosisString = request.getParameter("libreDeToxoplasmosis");
                boolean libreDeToxoplasmosis = false;
                if (libreDeToxoplasmosisString != null && !libreDeToxoplasmosisString.isEmpty()) {
                    libreDeToxoplasmosis = Boolean.parseBoolean(libreDeToxoplasmosisString);
                }
                Felino felino = new Felino(nombre, raza, color, edad, libreDeToxoplasmosis);
                mascotas.add(felino);
                contadorFelinos++;
            }
        }
        int totalEdades = 0;
        for (Mascota mascota : mascotas) {
            totalEdades += mascota.getEdad();
        }
        promedioEdades = (double) totalEdades / mascotas.size();
        request.setAttribute("mascotas", mascotas);
        request.setAttribute("promedioEdades", promedioEdades);
        request.setAttribute("contadorCaninos", contadorCaninos);
        request.setAttribute("contadorFelinos", contadorFelinos);
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

}
