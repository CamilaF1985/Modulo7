# Sushi Pe - Gestión de Pedidos de Sushi

"Sushi Pe" es una aplicación web de gestión de pedidos de sushi desarrollada en Java, que aprovecha el poder del framework Spring y otras tecnologías para brindar
funcionalidades de gestión de pedidos y seguridad, con el objetivo de crear una experiencia de usuario eficiente y segura en la plataforma web.

## Estado del Proyecto

La aplicación "Sushi Pe" se encuentra finalizada y lista para ser utilizada. Puedes correr la aplicación desde un servidor web local ejecutando el archivo WAR incluido en el proyecto, o desde un servidor local (por ejemplo, Tomcat) en localhost.

## Funcionalidades

- Registro y autenticación de usuarios con diferentes roles (cliente y administrador).
- Gestión de pedidos de sushi por parte del cliente.
- Seguridad avanzada mediante Spring Security y contraseñas encriptadas con Bcrypt.
- Visualización de menú o carta de productos.
- Interfaz intuitiva para la creación y envío de pedidos.
- Visualización de pedidos ingresados a sistema y posibilidad de actualizar su estado por parte del administrador.

## Tecnologías Utilizadas

- Java
- Spring Framework
- Spring Security
- Thymeleaf
- Hibernate
- MySQL
- HTML
- CSS
- Maven

## Requisitos de Ejecución

- Java 8 o superior
- Servidor MySQL
- Maven

## Instalación y Uso

1. Clona o descarga este repositorio en tu máquina local.

2. Asegúrate de tener configurada una base de datos MySQL y ajusta la configuración de conexión en el archivo `application.properties`. El Script para crear la base de datos se encuentra en este repositorio.

3. Importa el proyecto en tu entorno de desarrollo (Eclipse JEE).

4. **Opción 1: Ejecutar desde Entorno de Desarrollo:**
   - Ejecuta la aplicación desde tu entorno de desarrollo. La aplicación se ejecutará en un servidor integrado que proporciona el IDE.

5. **Opción 2: Ejecutar en Servidor Local (Tomcat, por ejemplo) con el archivo WAR incluido:**
   - Asegúrate de tener instalado un servidor web local, como [Tomcat](http://tomcat.apache.org/).
   - Copia el archivo WAR que ya está incluido en el repositorio a la carpeta `webapps` del directorio de Tomcat.
   - Inicia el servidor Tomcat.
   - La aplicación debería estar disponible en `http://localhost:8080/sushipe

6. Accede a la aplicación a través de tu navegador web utilizando la URL proporcionada en el paso anterior.

## Vistas de Usuario

- Usuarios con rol cliente pueden editar sus datos personales (teléfono y dirección), ver la carta de productos y realizar pedidos.
- Usuarios con rol administrador pueden acceder a la Vista de Pedidos para ver el tiempo transcurrido desde que el pedido ingresó al sistema y actualizar su estado.

## Comprobación de Responsividad

La responsividad de la aplicación se ha comprobado en tres dispositivos: Samsung Galaxy S8+ (teléfono móvil), iPad Air y notebook Asus. Se utilizó el simulador incluido en las herramientas de desarrollo de Google Chrome.

## Licencia

Este proyecto está bajo la Licencia MIT.

## Contribuciones

Las contribuciones son bienvenidas. Si deseas colaborar en este proyecto, por favor crea un fork y envía tus pull requests.

## Contacto

Si tienes preguntas o comentarios sobre el proyecto, no dudes en ponerte en contacto conmigo a través de mi correo electrónico: camila.fabbroni1985@gmail.com.

---
Desarrollado por [Camila Fabbroni](https://github.com/CamilaF1985)


