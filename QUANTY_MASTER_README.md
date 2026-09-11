# QUANTY MASTER — edición romana

Versión visual paralela de `master.html`. Entrada: **`quanty-master-roman.html`**.

## Probar

Descarga esta rama completa desde GitHub (Code → Download ZIP), descomprímela y abre `quanty-master-roman.html`. Conserva las carpetas `quanty-master-assets` y `portada` junto al HTML. Para un entorno equivalente a GitHub Pages, sirve la carpeta con cualquier servidor estático local.

La publicación actual de `master.html` no cambia. La nueva entrada independiente es `https://sueperrlabs.github.io/aurelio/quanty-master-roman.html`. No se ha sustituido la prueba anterior `quanty-master.html`.

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

- Acceso seguro supervisor completado; apertura de Crear desafío, Vendedores (5 filas), Analítica y Datos comprobada. Sin alterar usuarios ni respaldos.
- Acceso seguro vendedor completado; interior, ranking e insignias inspeccionados con datos demo.
- Quiz Herramientas completo: una respuesta incorrecta y cuatro correctas, feedback y explicación, racha x4, resultado 4/5 (80%), +900 XP y total actualizado de 5400 a 6300 XP. Volver al mapa conserva el mejor resultado previo 5/5, conforme a la lógica original.
- Cinco puntos de producto comprobados; contador 5/5 y desbloqueo de Ir al quiz. Video local de despiece cargado (readyState 4, sin error).
- Portada móvil inspeccionada en un marco de 390 × 844 px; botón principal visible. Ajustado título de panel para evitar desbordamiento desktop.

**Límites de comprobación:** pruebas realizadas en Chromium sobre copia local con datos demo, no sobre datos de producción. No se han ejecutado restauración/reinicio destructivos ni altas/bajas de usuarios. No se han comprobado físicamente Safari, Firefox ni un Mac 2012. No se afirma una certificación exhaustiva de todos los navegadores y combinaciones.
