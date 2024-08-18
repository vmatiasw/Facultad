# Ingeniería del Software I - Práctico N◦ 2

FaMAF, Universidad Nacional de Córdoba
Libro: An Integrated Approach to Software Engineering de Jalote

## 1. ¿Que especifican los requisitos de funcionalidad? ¿Que otras componentes conforman la especificación de los requisitos del software? De al menos dos ejemplos de características que especifiquen cada una de ellas

- Los requerimientos de funcionalidad especifican:
  - Toda la funcionalidad que el sistema debe proveer
  - Qué salidas se deben producir para cada entrada dada y las relaciones entre ellas.
  - Todas las operaciones que el sistema debe realizar.
  - Las entradas válidas y las verificaciones de validez de la entrada y salida.
  - El comportamiento del sistema en caso de entradas inválidas, errores de cálculo u otras   situaciones anormales, o en el caso de situaciones normales pero con imposibilidad de operar.
  
- componentes conforman la especificación de los requisitos del software:
  1. Funcionalidad.
  2. Desempeño (performance).
  3. Restricciones de diseño.
  4. Interfaces externas.
  
- Dos ejemplos de características que especifiquen cada una de ellas:
  1. Funcionalidad.
     - Recibir dinero e id de producto y devolver el cambio justo, el producto y un recibo.
     - Recibir información de registro de una persona y crear el usuario.
  2. Desempeño (performance).
     - Tardar menos de un minuto (Dinámico)
     - Hasta 10 usuarios admitidos simultáneamente (Estático)
  3. Restricciones de diseño.
     - Ajustarse al estándar de tamaño de productos para maquinas expendedoras
     - Seguridad y respaldo para los usuarios registrados, no robo de identidad,...
  4. Interfaces externas.
     - La gente podrá a través de botones numerados del 1 al 16 indicarle a la maquina los productos.
     - El software deberá sincronizar su base de datos con la central cada 10 usuarios registrados.
