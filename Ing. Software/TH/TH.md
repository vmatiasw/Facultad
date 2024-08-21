# Take Home - El Switcher

Entrega hasta el 23:55hs del día 29/08/2024

Formato de entrega: un archivo pdf por cada punto.
Apellido.Nombre.Alcance.pdf
Apellido.Nombre.DFD.pdf
Apellido.Nombre.DiagramaClases.pdf
Apellido.Nombre.CasosUsos.pdf

__Entregables:__

## Alcance del proyecto

- Objetivos
- Qué cosas entran y no entran en el proyecto
- Requerimientos funcionales y no funcionales
- Etc.

> - Qué cosas entran en / abarca el proyecto?
> - Qué cosas no entran en / no abarca el proyecto?
> - Objetivos, entregables y requerimientos. Tiempos de entrega.
> - Cuales son las prioridades para saber qué hacer primero.
> - Criterio de aceptación (¿qué tipo de usuario lo aceptará?).
> - Limitantes presupuestarios.

## DFD

Se pide el diagrama de flujo de datos del sistema.

> - Se enfoca en qué hacen los transformadores, no en cómo lo hacen.
> - Usualmente se muestran sólo las entradas/salidas más significativas y se ignoran lasde menor importancia, como por ej. mensajes de error.
> - En general, NO hay loops, razonamiento condicional.
> - Un DFD NO es un diagrama de control, no debería existir diseño ni pensamiento algorítmico.
>   **Pasos:**
> - Identificar las entradas, salidas, fuentes, sumideros del sistema.
> - Trabajar consistentemente desde la entrada hacia la salida.
> - Si se complica => cambiar el sentido, de la salida a la entrada.
> - Avanzar identificando los transformadores de más alto nivel para capturar la transformación completa.
> - Cuando los transformadores de alto nivel están definidos, refinar cada uno con transformaciones más detalladas.
> - No mostrar nunca lógica de control; si se comienza a pensar en término de loops condiciones: parar y recomenzar.
> - Etiquetar cada flecha y burbuja. Identificar cuidadosamente las entradas y salidas de cada transformador.
> - Hacer uso de + y \*.
> - Intentar dibujar grafos de flujo de datos alternativos antes de definirse por uno.

## Diagrama de clases del proyecto

Se pide el diagrama de clases completo del proyecto.

> El análisis orientado a objetos es más fácil de construir y de mantener. Porque es más resistente/adaptable a cambios gracias a que los objetos son más estables que las funciones.
> El sistema es visto como un conjunto de objetos interactuando entre sí, o con el usuario, a través de servicios que cada objeto provee.
>
> El modelado consiste en **identificar los objetos** en el dominio del problema, **agruparlos en clases** identificando cuál es la información del estado que ésta encapsula (i.e. los atributos) e **identificar las relaciones entre las clases**, ya sea en la jerarquía o a través de llamadas a métodos.
>
> Cada clase tiene **nombre**, **atributos**, y **servicios**. Los servicios se acceden a través de mensajes que se envían a los objetos y sirven para ver sus atributos o modificarlos cambiando sus valores y por lo tanto su **estado**.

<div style="display: flex; align-items: left;">
    <img src="../PNGs/image-2.png" width="350" style="margin-right: 20px;">
    <p> Guía para realizar el análisis OO: <br> • Objetos y clases: Identificar sustantivos - Aislar potenciales objetos del sistema <br> • Estructuras: Considerar si alguno especifica significativamente a otro (herencia) o si alguno es parte de otro (agregación) <br> • Atributos: Características, dentro del dominio del problema (No agregar atributos innecesarios), que definen los objetos <br> • Asociaciones: Capturan la relación entre instancias de varias clases - Pueden tener sus propios atributos (no forzar estos atributos en los objetos) <br> • Servicios: Definir los estados del sistema y por cada estado listar los eventos externos y respuestas requeridas - Asociar estas actividades con las clases </p>
</div>

## Casos de usos especificados, tres

1. Crear partida
2. Turno completo
3. Bloqueo y desbloqueo de figura
