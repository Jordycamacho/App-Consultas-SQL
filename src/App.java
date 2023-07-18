import java.awt.BorderLayout;
import java.awt.FlowLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.*;

import javax.swing.*;

public class App {

    public static void main(String[] args) {

        JFrame mimarco = new MiMarco();

        mimarco.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        mimarco.setVisible(true);

    }
}

class MiMarco extends JFrame {

    public MiMarco() {

        setTitle("Consulta BBDD");

        setBounds(500, 300, 400, 400);

        setLayout(new BorderLayout());

        JPanel menus = new JPanel();

        menus.setLayout(new FlowLayout());

        secciones = new JComboBox();

        secciones.setEditable(false);

        secciones.addItem("Todos");

        paises = new JComboBox();

        paises.setEditable(false);

        paises.addItem("Todos");

        resultado = new JTextArea(4, 50);

        resultado.setEditable(false);

        add(resultado);

        menus.add(secciones);

        menus.add(paises);

        add(menus, BorderLayout.NORTH);

        add(resultado, BorderLayout.CENTER);

        JButton botonConsulta = new JButton("Consulta");

        botonConsulta.addActionListener(new ActionListener() {

            public void actionPerformed(ActionEvent arg0) {

                EjecutaConsuta();

            }
        });

        add(botonConsulta, BorderLayout.SOUTH);
        // Conexion BBDD

        try {

            miConexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/pruebas", "root",
                    "012890");

            Statement st = miConexion.createStatement();

            String consulta = ("SELECT DISTINCTROW SECCION FROM productos");

            ResultSet rs = st.executeQuery(consulta);

            while (rs.next()) {
                secciones.addItem(rs.getString(1));
            }

            rs.close();

            String consulta2 = ("SELECT DISTINCTROW PAISORIGEN FROM productos");

            ResultSet rs1 = st.executeQuery(consulta2);

            while (rs1.next()) {
                paises.addItem(rs1.getString(1));
            }
            rs.close();

        } catch (Exception e) {

            System.out.println("No se guardaron bien los datos");

            e.printStackTrace();

        }

    }

    private void EjecutaConsuta() {

        ResultSet rs = null;

        try {

            resultado.setText("\n");

            String seccion = (String) secciones.getSelectedItem();

            String pais = (String) paises.getSelectedItem();

            if (!seccion.equals("Todos") && pais.equals("Todos")) {

                enviarConsultaSeccion = miConexion.prepareStatement(consultaSeleccion);

                enviarConsultaSeccion.setString(1, seccion);

                rs = enviarConsultaSeccion.executeQuery();

            } else if (seccion.equals("Todos") && !pais.equals("Todos")) {

                enviarConsultaPais = miConexion.prepareStatement(consultaPais);

                enviarConsultaPais.setString(1, pais);

                rs = enviarConsultaPais.executeQuery();

            } else if (!seccion.equals("Todos") && !pais.equals("Todos")) {

                enviaConsultaTodos = miConexion.prepareStatement(consultaTodos);

                enviaConsultaTodos.setString(1, seccion);

                enviaConsultaTodos.setString(2, pais);

                rs = enviaConsultaTodos.executeQuery();

            } else if (seccion.equals("Todos") && !pais.equals("Todos")) {

                enviaConsultaGeneral = miConexion.prepareStatement(consultaGeneral);

                enviaConsultaGeneral.setString(1, seccion);

                enviaConsultaGeneral.setString(2, pais);

                rs = enviaConsultaGeneral.executeQuery();

            }

            while (rs.next()) {

                resultado.append(rs.getString(1));

                resultado.append(", ");

                resultado.append(rs.getString(2));

                resultado.append(", ");

                resultado.append(rs.getString(3));

                resultado.append(", ");

                resultado.append(rs.getString(4));

                resultado.append("\n");

            }

        } catch (Exception e) {

        }
    }

    private Connection miConexion;

    private PreparedStatement enviarConsultaSeccion;

    private PreparedStatement enviarConsultaPais;

    private PreparedStatement enviaConsultaTodos;

    private PreparedStatement enviaConsultaGeneral;

    private final String consultaSeleccion = "SELECT NOMBREARTICULO, SECCION, PRECIO, PAISORIGEN FROM productos WHERE SECCION=?";

    private final String consultaPais = "SELECT NOMBREARTICULO, SECCION, PRECIO, PAISORIGEN FROM productos WHERE PAISORIGEN=?";

    private final String consultaTodos = "SELECT NOMBREARTICULO, SECCION, PRECIO, PAISORIGEN FROM productos WHERE SECCION=? AND PAISORIGEN=? ";

    private final String consultaGeneral = "SELECT NOMBREARTICULO, SECCION, PRECIO, PAISORIGEN FROM productos";

    private JComboBox secciones;

    private JComboBox paises;

    private JTextArea resultado;

}

