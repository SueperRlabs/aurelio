# QUANTY MASTER — edición romana

Versión visual paralela de `master.html`. Entrada: **`quanty-master-roman.html`**.

## Probar

Descarga esta rama completa desde GitHub (Code → Download ZIP), descomprímela y abre `quanty-master-roman.html`. Conserva las carpetas `quanty-master-assets` y `portada` junto al HTML. Para un entorno equivalente a GitHub Pages, sirve la carpeta con cualquier servidor estático local.

La publicación actual de `master.html` no cambia. Esta rama no publica automáticamente una dirección nueva en GitHub Pages: requiere integrar sus archivos nuevos en la rama publicada. No se ha sustituido la prueba anterior `quanty-master.html`.

## Qué cambió

- Portada: imagen aprobada optimizada a WebP, con título y botón HTML accesible.
- Interior: entorno romano reconstruido a partir de la referencia aprobada, eliminando los controles dibujados para dejar lugar a los controles reales. Imagen derivada con asistencia de IA; conserva la composición de mármol, mano robótica, núcleo Q y luz dorada/cian.
- Paneles, módulos, ranking (Salón de honor), insignias, login, quiz, resultado y supervisor: capa CSS común de vidrio oscuro, oro y cian.
- Supervisor: QUANTY COMMAND. Resultado: PROTOCOLO COMPLETADO.
- Feedback de respuesta: CORRECTO / CONOCIMIENTO ADQUIRIDO o RESPUESTA INCORRECTA / CONOCIMIENTO INCORPORADO. Se mantienen la explicación y el XP real.
- Celebraciones ligeras: máximo 12 elementos, sin WebGL, con limpieza automática y respeto a `prefers-reduced-motion`.

## Funcionalidad preservada

El JavaScript inline de la aplicación original es **idéntico byte a byte** en el documento paralelo. Se conservan preguntas, módulos, navegación, usuarios, login, PIN supervisor, cálculo de XP, ranking, logros, progreso, analítica, gestión y respaldo. El archivo adicional `roman.js` interviene únicamente en presentación: textos visibles, imágenes, estado visual de pantalla y sustitución de los fuegos artificiales por una celebración más ligera.

No se renombran identificadores ni claves de almacenamiento. Ambas versiones comparten usuarios y progreso si se sirven desde el mismo origen y navegador. Usar el quiz o la gestión en cualquiera puede cambiar esos datos compartidos, tal como ocurre en MASTER. Un ZIP abierto localmente no accede automáticamente al almacenamiento de GitHub Pages.

Se mantienen las dependencias originales de Google Fonts y GSAP por CDN; no se añadieron servicios de datos ni conexiones nuevas. Los recursos nuevos son locales (aproximadamente 451 KB entre ambas imágenes). No se promete funcionamiento completamente offline de las dependencias heredadas. La autenticación local y las credenciales demo preexistentes no equivalen a seguridad de servidor.

## Archivos añadidos

- `quanty-master-roman.html`: documento paralelo funcional.
- `quanty-master-assets/roman.css`: sistema visual y adaptación móvil.
- `quanty-master-assets/roman.js`: efectos y textos de presentación.
- `quanty-master-assets/cover.webp`: portada aprobada optimizada.
- `quanty-master-assets/temple.webp`: entorno interior sin controles dibujados.
- `quanty-master-assets/build-reskin.cjs`: generación reproducible a partir de MASTER, con comprobación de integridad de scripts.
- `QUANTY_MASTER_README.md`: esta documentación.

No se modificó ningún archivo existente del repositorio.

## Edición

Colores y diseño: `roman.css`, comenzando por las variables de `:root`. Efectos ligeros y etiquetas dinámicas: `roman.js`. Para actualizar la base posteriormente, ejecutar `node quanty-master-assets/build-reskin.cjs` tras revisar los cambios de MASTER; nunca editar el original para ajustar este reskin. Las sustituciones de marcado del generador deben revisarse si cambia la estructura del archivo base.

## Verificación realizada — 11 de septiembre de 2026

- Lectura completa de `master.html` e identificación de estructura, CSS y JavaScript.
- Construcción del documento e igualdad byte a byte de los scripts originales.
- Comprobación de sintaxis del JavaScript adicional.
- Confirmación con Git de que todos los archivos originales permanecen sin cambios.
- Inspección visual de portada en navegador Chromium y prueba del botón hacia el login.
- Recursos visuales locales cargados; sin desbordamiento horizontal en la resolución desktop inspeccionada.

**Pendiente:** recorrido autenticado completo de vendedor y supervisor, exploración de piezas, quiz, persistencia, exportación/importación y revisión visual del interior con datos; el acceso seguro de prueba no se completó. No se han comprobado físicamente Safari, Firefox, móvil ni un Mac 2012. La preservación del código no sustituye esas pruebas: esta entrega es una rama de revisión, no una certificación de regresión completa.
