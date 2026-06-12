# Cambios identificados

1. **Animación en `DetailScreen`:** Cada canción cuenta con una pantalla de detalles que incluye dos animaciones: una transición de la imagen al abrir cancion y el botón de reproducción se agranda cuando la canción está sonando.

2. **Nuevos Iconos:** Se añadió un nuevo ícono de en la barra de navegacion para acceder a la pantalla de Misiones y también se actualizó el ícono que aparece cuando una imagen no carga correctamente.

3. **vista de iconos:** Al tocar una canción en la pantalla de búsqueda, ya no se reproduce directamente sino que abre la pantalla de detalle. El botón de play fue removido de la lista y ahora se ve únicamente dentro del detalle de la canción.

4. **Vibración:** La vibración dejó de funcionar porque el botón que la activaba fue movido de la pantalla de búsqueda a la pantalla de detalle, y en ese nuevo lugar no se incluyó la vibración.

5. **Nueva Vista de Reproducción:** Se creó una pantalla nueva que aparece al tocar una canción, mostrando la imagen del álbum en grande, el nombre de la canción, el artista y un botón de play y pausa con animación.

6. **Error en Perfil:** Se modificó la interfaz de la app, eliminando la fuente personalizada y el modo oscuro forzado. Esto puede estar causando que algunas pantallas, incluyendo el perfil, se vean diferente a lo esperado.

7. **Imágenes por Defecto:** Cuando un dato llega vacío desde la base de datos, la app ahora muestra valores de reemplazo automáticos: un título genérico, un nombre de artista genérico y una imagen de placeholder.

8. **Escalado de Texto:** La animación de escalado no es sobre el texto sino sobre el botón de play y pausa, que crece un poco al estar reproduciendo y vuelve a su tamaño normal al pausar.
