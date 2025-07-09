<<<<<<< HEAD

1. Servicio de Usuarios
http://localhost:8080/api/usuarios

Método	Endpoint	Descripción	Ejemplo Body (POST/PUT)
GET	/	Obtener todos los usuarios
GET	/{id}	Obtener usuario por ID
POST	/	Crear nuevo usuario	{"nombre":"Juan","email":"juan@mail.com","contrasena":"pass123"}
PUT	/{id}	Actualizar usuario	{"nombre":"Juan Actualizado","email":"juan.nuevo@mail.com"}
DELETE	/{id}	Eliminar usuario
2. Servicio de Productos
http://localhost:8080/api/productos

Método	Endpoint	Descripción	Ejemplo Body (POST/PUT)
GET	/	Obtener todos los productos	
GET	/{id}	Obtener producto por ID	
POST	/	Crear nuevo producto	{"nombre":"Cepillo Bambú","descripcion":"Ecológico","precio":4.5,"stock":100}
PUT	/{id}	Actualizar producto	{"nombre":"Cepillo Bambú Premium","precio":5.99}
PATCH	/{id}/stock	Actualizar stock	{"cantidad": 10} o query param ?cantidad=10
DELETE	/{id}	Eliminar producto	
3. Servicio de Pedidos
http://localhost:8080/api/pedidos

Método	Endpoint
GET	/	Obtener todos los pedidos	
GET	/{id}	Obtener pedido por ID	
POST	/	Crear nuevo pedido	{"usuarioId":1,"productoId":2,"cantidad":3}
PATCH	/{id}/estado	Actualizar estado del pedido	Query param ?estado=COMPLETADO
DELETE	/{id}	Eliminar pedido	
4. Servicio de Reseñas
http://localhost:8080/api/resenias

Método	Endpoint	
GET	/	Obtener todas las reseñas	-
GET	/producto/{id}	Obtener reseñas por producto	
POST	/	Crear nueva reseña	{"usuarioId":3,"productoId":5,"calificacion":4.5,"comentario":"Excelente"}
DELETE	/{id}	Eliminar reseña	
5. Servicio de Descuentos
http://localhost:8080/api/descuentos

Método	Endpoint	
GET	/	Obtener todos los descuentos	
GET	/{id}	Obtener descuento por ID
POST	/	Crear nuevo descuento	{"codigo":"VERANO20","porcentaje":20.0,"categoria":"verano","validoHasta":"2025-08-31"}
PUT	/{id}	Actualizar descuento	{"porcentaje":25.0,"validoHasta":"2025-09-15"}
GET	/aplicar	Aplicar descuento a producto	Query params: ?codigo=VERANO20&productoId=5
DELETE	/{id}	Eliminar descuento	
GET	/categoria/{categoria}	Obtener descuentos por categoría	
6. Servicio de Favoritos
http://localhost:8080/api/favoritos

Método	Endpoint
POST	/	Agregar producto a favoritos	usuarioId y productoId
GET	/usuario/{usuarioId}	Obtener favoritos de un usuario	
DELETE	/	Eliminar de favoritos	usuarioId y productoId
GET	/existe	Verificar si es favorito	usuarioId y productoId

=======
# EFT-Fullstack.DPC
>>>>>>> 1c86fbb0ef9f6029c1dcf84bef42d24bc575d32f
