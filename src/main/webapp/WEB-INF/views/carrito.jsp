<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="es"><head>
    <meta charset="UTF-8"><title>Carrito</title>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/estilos.css">
</head><body>
<h1>Mi Carrito</h1>
<c:choose>
    <c:when test="${empty items}">
        <p>El carrito está vacío.</p>
    </c:when>
    <c:otherwise>
        <table>
            <thead><tr>
                <th>Producto</th><th>Precio</th>
                <th>Cantidad</th><th>Subtotal</th>
            </tr></thead>
            <tbody>
            <c:forEach var="item" items="${items}">
                <tr>
                    <td>${item.producto.nombre}</td>
                    <td><fmt:formatNumber value="${item.producto.precio}"
                                          type="currency" currencySymbol="$"/></td>
                    <td>${item.cantidad}</td>
                    <td><fmt:formatNumber value="${item.subtotal}"
                                          type="currency" currencySymbol="$"/></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </c:otherwise>
</c:choose>

<!-- Botón limpiar -->
<form method="post"
      action="${pageContext.request.contextPath}/carrito">
    <input type="hidden" name="accion" value="limpiar">
    <button type="submit">Limpiar carrito</button>
</form>

<a href="${pageContext.request.contextPath}/catalogo">
    ← Seguir comprando
</a>
</body></html>