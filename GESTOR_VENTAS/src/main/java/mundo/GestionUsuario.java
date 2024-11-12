/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package mundo;

import Conexion.Conectar;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Usuario 1
 */
public class GestionUsuario {

    public GestionUsuario() {
    }

    /**
     * Metodo para obtener la lista de usuarios de la base de datos
     *
     * @return
     */
    public List<Usuario> obtenerUsuarios() {
        List<Usuario> usuarios = new ArrayList<>();
        Connection conexion = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            // Obtener la conexión a la base de datos
            conexion = Conectar.getConexion();
            String sql = "SELECT id, nombre, email, contrasenia, rol FROM usuarios";
            stmt = conexion.prepareStatement(sql);
            rs = stmt.executeQuery();

            // Iterar sobre los resultados y crear objetos Usuario
            while (rs.next()) {
                Usuario usuario = new Usuario(
                        rs.getInt("id"),
                        rs.getString("nombre"),
                        rs.getString("email"),
                        rs.getString("contrasenia"),
                        rs.getString("rol")
                );
                usuarios.add(usuario);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Cerrar recursos
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stmt != null) {
                    stmt.close();
                }
                if (conexion != null) {
                    conexion.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return usuarios;
    }

    /**
     * Metodo para eliminar un usuario segun el id ingresado
     *
     * @param id
     * @return
     */
    public boolean eliminarUsuario(int id) {
        boolean usuarioEliminado = false;
        Connection conexion = null;
        PreparedStatement stmt = null;

        try {
            // Establecer conexión con la base de datos
            conexion = Conectar.getConexion();

            // Preparar la consulta SQL para eliminar el usuario
            String sql = "DELETE FROM usuarios WHERE id = ?";
            stmt = conexion.prepareStatement(sql);
            stmt.setInt(1, id);

            // Ejecutar la consulta
            int filasAfectadas = stmt.executeUpdate();

            // Si al menos una fila fue afectada, se eliminó un usuario
            if (filasAfectadas > 0) {
                usuarioEliminado = true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Cerrar recursos
            try {
                if (stmt != null) {
                    stmt.close();
                }
                if (conexion != null) {
                    conexion.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return usuarioEliminado;
    }

    /**
     * Metodo para actualizar o editar la informacion de un usuario
     *
     * @param id
     * @param nombre
     * @param correo
     * @param rol
     * @return
     */
    public boolean actualizarUsuario(int id, String nombre, String correo, String rol) {
        boolean usuarioEditado = false;
        Connection conexion = null;
        PreparedStatement stmt = null;

        try {
            // Establecer conexión con la base de datos
            conexion = Conectar.getConexion();

            // Preparar la consulta SQL para actualizar el usuario
            String sql = "UPDATE usuarios SET nombre = ?, email = ?, rol = ? WHERE id = ?";
            stmt = conexion.prepareStatement(sql);
            stmt.setString(1, nombre);
            stmt.setString(2, correo);
            stmt.setString(3, rol);
            stmt.setInt(4, id);

            // Ejecutar la consulta
            int filasAfectadas = stmt.executeUpdate();

            // Si al menos una fila fue afectada, significa que el usuario fue editado
            if (filasAfectadas > 0) {
                usuarioEditado = true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Cerrar recursos
            try {
                if (stmt != null) {
                    stmt.close();
                }
                if (conexion != null) {
                    conexion.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return usuarioEditado;
    }



}
