# Alcance del proyecto

(
debemos hacer solo lo que nos pusieron o mas? en que nos basamos?
todo hablado, dividido por categorias y hablado, por puntos??
)

> - Cuales son las prioridades para saber qué hacer primero.
> - Criterio de aceptación (¿qué tipo de usuario lo aceptará?).
> - Limitantes presupuestarios.
> - Objetivos, entregables y requerimientos. Tiempos de entrega.

## Objetivos

( Esto puede ir aca?
Requerimientos de desempeño:
- Todas las restricciones en el desempeño del sistema de software.
- Requerimientos Dinámicos (especifican restricciones sobre la ejecución):
  - Tiempo de respuesta.
  - Tiempo esperado de terminación de una operación dada.
  - Tasa de transferencia o rendimiento.
  - Cantidad de operaciones realizadas por unidad de tiempo.
  - En general se especifican los rangos aceptables de los distintos parámetros, en casos normales y extremos.
- Requerimientos Estáticos o de capacidad (no imponen restricción en la ejecución):
  - Cantidad de terminales admitidas.
  - Cantidad de usuarios admitidos simultáneamente.
  - Cantidad de archivos a procesar y sus tamaños.
- Todos los requisitos se especifican en términos medibles => verificable.
)

### En la fase de Desarrollo

1. Diseñar el sistema entre los integrantes (aca podrian ir los pasos a seguir para hacer el proyecto,...?)
2. Dividir el trabajo y establecer pautas
3. Terminar antes del ...

### En la fase de Produccion

1. Que 1 usuario pueda crear una sala en la web.
2. Que 1-3 usuarios puedan conectarse a una sala existente en la web.
3. Que los usuarios dentro de una sala puedan identificarse.
4. Que en una sala, 2-4 usuarios puedan jugar una partida de Switcher entre ellos.
5. Al terminar la partida la sala se cerrara. (preguntar si no salir de la sala y volver a jugar?)

## Qué cosas entran y no entran en el proyecto

## Qué cosas entran en / abarca el proyecto?

## Qué cosas no entran en / no abarca el proyecto?

## Requerimientos funcionales y no funcionales

(
todas las posibles acciones del usuario van aca?
aca se refieren a esto?
- Objetivos, entregables y __requerimientos__. Tiempos de entrega.
)

## Mi idea del producto final

El producto sera una pagina web donde los usuarios desde la interface de inicio podrán crear o unirse a una sala online de entre 1 y 4 jugadores. Allí los mismos podrán identificarse entre si de alguna forma y jugar al juego de mesa "El Switcher".

Al jugar, los eventos transcurrirán de la siguiente manera:

1. El juego inicia en el siguiente estado:
   - Habrá un tablero 6x6 con fichas cajón distribuidas aleatoriamente entre las casillas.
   - Las fichas cajón serán de 4 posibles colores, tal que haya 9 fichas de cada color.
   - Cada jugador tendrá 3 tarjetas figura que todos podrán ver. y 20 (numero fijo? o dependiendo el n de jugadores hay que distribuir mas o menos??) mas en reserva que nadie puede ver.
   - Cada jugador tendrá 3 cartas de movimiento que nadie mas que ellos pueden ver.
2. La partida:
   - Empieza quien creo la sala (o aleatoriamente?).
   - Se genera un orden a partir del primero y a partir de ahi, se respeta hasta final de partida.
3. Un turno:
   - El jugador tiene 2 minutos para jugar, luego se pasara al siguiente turno. (puede pasar de turno manualmente? o debe esperar si o si 2m?)
   - El jugador debe buscar en el tablero figuras enteras formadas por fichas cajón del mismo color que tengan la misma forma que alguna de sus tarjetas figura o de las de los demás.
   - El jugador puede bloquear a otro jugador J si este jugador J no esta boqueado y tiene una tarjeta figura de la forma de una figura de un color no bloqueado en el tablero.
   - El jugador puede...
...

Al terminar de jugar, aparecerá una pantalla con el ganador y al cabo de 5 segundos se cerrara la sala y los usuarios volverán a la interface de inicio.
