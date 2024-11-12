<%@page import="java.util.List"%>
<%@page import="mundo.Articulo"%>
<%@page import="mundo.GestionarArticulo"%>
<%@include file="libs/header.jsp" %>

<%@include file="libs/navbar-vista-principal.jsp" %>
<div class="container my-5">
    <h1 class="text-center">Artículos Disponibles</h1>
    <table class="table table-striped table-bordered mt-4 mx-auto" style="width: 80%;">
        <thead class="table-primary">
            <tr>
                <th>ID</th>
                <th>Nombre del Producto</th>
                <th>Descripción</th>
                <th>Precio</th>
                <th>Cantidad en Stock</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
            <%
                GestionarArticulo gestiona = new GestionarArticulo();
                List<Articulo> listaArticulos = gestiona.obtenerArticulos();
                if (listaArticulos != null) {
                    for (Articulo a : listaArticulos) {
            %>
            <tr>
                <td><%= a.getId() %></td>  
                <td><%= a.getNombre() %></td>
                <td><%= a.getDescripcion() %></td>
                <td><%= a.getPrecio() %></td>
                <td><%= a.getCantidad() %></td>
                <td>
                    <!-- Botón para abrir el modal de ver -->
                    <button type="button" class="btn btn-warning verArticulo-btn" 
                            data-bs-toggle="modal" 
                            data-bs-target="#exampleModalVer" 
                            data-id="<%= a.getId() %>"
                            data-nombre="<%= a.getNombre() %>"
                            data-descripcion="<%= a.getDescripcion() %>"
                            data-precio="<%= a.getPrecio() %>"
                            data-cantidad="<%= a.getCantidad() %>">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16">
                            <path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8M1.173 8a13 13 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5s3.879 1.168 5.168 2.457A13 13 0 0 1 14.828 8q-.086.13-.195.288c-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5s-3.879-1.168-5.168-2.457A13 13 0 0 1 1.172 8z"/>
                            <path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5M4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0"/>
                        </svg>
                    </button>  
                   
                    <!-- Botón para eliminar un artículo -->
                    <button type="button" class="btn btn-success eliminarArticulo-btn" data-bs-toggle="modal" data-bs-target="#exampleModal" data-id="<%= a.getId() %>">
                       Comprar
                    </button>
                </td>
            </tr>
            <%
                    }
                } else {
            %>
            <tr> 
                <td colspan="6" class="text-center">No hay datos que mostrar</td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
</div>

<!-- Modal para ver un artículo -->
<div class="modal fade" id="exampleModalVer" tabindex="-1" aria-labelledby="exampleModalLabelVer" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header bg-warning text-white">
                <h5 class="modal-title" id="exampleModalLabelVer">Ver Producto</h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p><strong>ID:</strong> <span id="ver-id"></span></p>
                <p><strong>Nombre:</strong> <span id="ver-nombre"></span></p>
                <p><strong>Descripción:</strong> <span id="ver-descripcion"></span></p>
                <p><strong>Precio:</strong> <span id="ver-precio"></span></p>
                <p><strong>Cantidad en Stock:</strong> <span id="ver-cantidad"></span></p>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- Script para obtener los datos de un articulo y mostrarlos en el modal -->
<script>
    $(document).ready(function(){
        // Manejar el evento cuando se hace clic en el botón de ver
        $('#exampleModalVer').on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget); // Botón que abrió el modal
            var id = button.data('id');
            var nombre = button.data('nombre');
            var descripcion = button.data('descripcion');
            var precio = button.data('precio');
            var cantidad = button.data('cantidad');
            
            // Actualizar el contenido del modal
            var modal = $(this);
            modal.find('#ver-id').text(id);
            modal.find('#ver-nombre').text(nombre);
            modal.find('#ver-descripcion').text(descripcion);
            modal.find('#ver-precio').text(precio);
            modal.find('#ver-cantidad').text(cantidad);
        });
    });
</script>
<%@include file="libs/foother.jsp" %>