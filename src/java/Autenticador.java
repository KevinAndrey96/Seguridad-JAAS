import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/Autenticador"})
public class Autenticador extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String Usuario = req.getParameter("Usuario");
        String Contrasena = req.getParameter("Contrasena");
            File archivo = null;
            FileReader fr = null;
            BufferedReader br = null;
            try {
                String url = req.getContextPath() + "/Usuarios.txt";
                String h = req.getRealPath(url);
                archivo = new File(h);
                fr = new FileReader(archivo);
                br = new BufferedReader(fr);
                String linea;
                
                boolean Inicio=false;
                while ((linea = br.readLine()) != null)
                {       
                    if(Usuario.equals(linea.substring(linea.indexOf("Login:")+7,linea.indexOf(linea.substring(linea.indexOf(" Password:")-1)))))
                    {
                        if(Contrasena.equals(linea.substring(linea.indexOf("Password:")+10,linea.indexOf(linea.substring(linea.indexOf(" Rol")-1)))))
                        {
                            Inicio=true;
                            break;
                        }
                    }                    
                }
                if(Inicio)
                {
                    String NombreUsuario=linea.substring(linea.indexOf("Usuario:")+9,linea.indexOf(linea.substring(linea.indexOf(" Cargo:")-1)));
                    String Rol=linea.substring(linea.indexOf("Rol:")+5,linea.indexOf(linea.substring(linea.indexOf(">")-1)));
                    req.getSession().setAttribute("NombreUsuario", NombreUsuario);
                    req.getSession().setAttribute("Rol", Rol);
                    
                    resp.sendRedirect("secure/menu.jsp");
                }
                else
                {
                    response(resp, "Login Incorrecto");
                }
                
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                // En el finally cerramos el fichero, para asegurarnos
                // que se cierra tanto si todo va bien como si salta 
                // una excepcion.
                try {
                    if (null != fr) {
                        fr.close();
                    }
                } catch (Exception e2) {
                    e2.printStackTrace();
                }
            }

     
    }

    private void response(HttpServletResponse resp, String msg)
            throws IOException {
        PrintWriter out = resp.getWriter();
        out.println("<html>");
        out.println("<body>");
        out.println("<t1>" + msg + "</t1>");
        out.println("</body>");
        out.println("</html>");
    }

    private void Lectura() {

    }

    private void Escritura() {
        FileWriter fichero = null;
        PrintWriter pw = null;
        try {
            fichero = new FileWriter("Escritura.txt");
            pw = new PrintWriter(fichero);

            pw.println("");

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                // Nuevamente aprovechamos el finally para 
                // asegurarnos que se cierra el fichero.
                if (null != fichero) {
                    fichero.close();
                }
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }
    }
}
