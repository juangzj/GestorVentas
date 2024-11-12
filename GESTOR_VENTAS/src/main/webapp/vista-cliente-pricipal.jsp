<%@page import="java.util.Base64"%>
<%@page import="java.util.List"%>
<%@page import="mundo.Articulo"%>
<%@page import="mundo.GestionarArticulo"%>
<%@include file="libs/header.jsp" %>
<%@include file="libs/navbar-vista-principal.jsp" %>

<div class="container my-5">
    <h1 class="text-center">Artículos Disponibles</h1>
    <div class="row">
        <%
            GestionarArticulo gestiona = new GestionarArticulo();
            List<Articulo> listaArticulos = gestiona.obtenerArticulos();
            if (listaArticulos != null) {
                String imagenBase64 = "";
                for (Articulo a : listaArticulos) {
                    // Convertimos los bytes en base64 solo si no es null
                    imagenBase64 = a.getImagen() != null ? Base64.getEncoder().encodeToString(a.getImagen()).trim() : "";
        %>
        <div class="col-md-4 col-lg-3 mb-4">
            <div class="card h-100">
                <!-- Imagen del artículo -->
                <img src="data:image/png;base64,<%= imagenBase64 %>" 
                     class="card-img-top" 
                     style="max-width: 100%; height: 200px; object-fit: cover;" 
                     alt="Imagen de <%= a.getNombre() %>" />
                <!-- Contenido de la tarjeta -->
                <div class="card-body">
                    <h5 class="card-title"><%= a.getNombre() %></h5>
                    <p class="card-text"><%= a.getDescripcion() %></p>
                    <p class="card-text"><strong>Precio:</strong> $<%= a.getPrecio() %></p>
                    <p class="card-text"><small class="text-muted">Stock: <%= a.getCantidad() %></small></p>
                </div>
                
                <!-- Botón de acción -->
                <div class="card-footer text-center">
                    <button type="button" class="btn btn-success eliminarArticulo-btn" data-bs-toggle="modal" data-bs-target="#exampleModal" data-id="<%= a.getId() %>">
                        Comprar
                    </button>
                </div>
            </div>
        </div>
        <%
                }
            } else {
        %>
        <div class="col-12">
            <p class="text-center">No hay datos que mostrar</p>
        </div>
        <%
            }
        %>
    </div>
</div>

<%@include file="libs/foother.jsp" %>
