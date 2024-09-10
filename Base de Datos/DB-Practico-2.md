# Practico Bases de Datos

## 1 - Practico de normalizacion

- > **Del teorico:**
  > Se tiene un sistema de bibliotecas de una ciudad, el sistema está formado por bibliotecas de las que se proveen su nombre, y su domicilio formado por calle y número; las bibliotecas tienen libros de los que se almacena su ISBN, su título y sus autores; las bibliotecas llevan un número de inventario para distinguir entre las distintas copias de libros; además las bibliotecas tienen socios para los que se almacena nombre, DNI y posición (la misma puede ser egresado, docente, estudiante, etc.); a los socios se les prestan ejemplares de libros.
  > **¿Cuál es el esquema universal para este problema?**

  bibliotecas(**nombre**, domicilio(**calle**,**numero**))
  libros(**ISBN**, **titulo**, **autores**, **numero de inventario**)
  socios(**nombre**, **DNI**, **posicion**)

  Bibliotecas(nombre, calle, numero; ISBN, titulo, autores, numero de inventario; nombre socio, DNI, posicion)

  > **Significado**: Una tupla de información para una relación de ese esquema para un sistema de bibliotecas consiste de: datos sobre una persona (correspondientes a nombre, DNI, posición) datos sobre un libro (correspondientes a numInv, ISBN, título, autores), datos sobre una biblioteca (correspondientes a calle, número, nomBib), tal que esa persona es socia de esa biblioteca, y se le ha prestado ese libro que es de esa biblioteca.
  > **¿conviene usarlo como diseño de una BD relacional?**
  > Respuesta: no, porque el esquema universal usualmente tiene problemas de calidad, como redundancia de información.
  > **Problemas de diseño**:

  - Redundancia de información: direcciónCS aparece repetido para cada coche asegurado por esa compañía de seguros; nombre aparece repetido por cada coche que tiene esa persona.
  - Manejo de valores nulos: si una persona no tiene coche, aparecen los demás campos en nulo; si una compañía de seguro no tiene coches asegurados, aparecen los demás campos en nulo.
    - Antes de decidir si agregamos valores nulos, tenemos que hacer consultas.
    - P.ej. si a una persona le sacamos coche asegurado, hay que consultar si tiene otros coches asegurados, sino hay que poner nulos.

  > **¿Cómo se pueden eliminar los problemas citados?**
  > Solución: **descomponer** el esquema universal para eliminar los problemas citados.

  **Ejemplo**:
  Descomponemos el esquema
  SmaAutomotor = (DNI, nombre, marca, modelo, patente, numSeguro, compañíaSeguro, direcciónCS):
  en:
  Persona = (DNI, nombre)
  Auto = (marca, modelo, patente)
  CompañíaAseguradora = (compañíaSeguro, direcciónCS)
  Seguro = (patente, compañíaSeguro, numSeguro)
  TieneAuto = (patente, DNI)

> **1)** Construir el esquema universal para el siguiente problema: En un restaurante hay varias mesas. Cada mesa tiene un numero y una capacidad (cantidad de personas que pueden estar en ella). Todo cliente tiene un numero telefonico, un nombre y DNI. Una asignacion de menu consiste de un menu y de un horario que viene dado por una fecha y una hora. A su vez para que una asignacion de menu pueda existir debe estar vinculada con exactamente una mesa (puede pasar que dos asignaciones de menu diferentes tengan el mismo horario y menu). Tambien puede pasar que una mesa no tenga una asignacion de menu. Los clientes pueden tener o no reservadas asignaciones de menu. Toda asignacion de menu debe haber sido reservada por a lo mas un cliente.
> **Esquema universal**: el conjunto de todos los atributos (atómicos) del problema actual.

Restaurante - mesas - numero y capacidad
cliente - numero de telefono, nombre y DNI
asignacion de menu - menu y horario(- fecha y hora)
asignacion de menu vinculada a exactamente una mesa
dos asignaciones diferentes pueden tener mismo horario y menu
una mesa puede no tener asignacion
clientes pueden tener o no reservadas asignaciones de menu
toda asignacion de menu debe haber sido reservada por exactamente un cliente.

Esquema universal:

Restaurante(numero, capacidad; numero de telefono, nombre, DNI; menu, fecha, hora)

> **2)** Para la siguiente relación, ¿por qué no se cumplen las siguientes dependencias?
> **Una DF \(\alpha \to \beta\) se cumple si**, para cualquier par de tuplas en la relación, si las tuplas tienen los mismos valores en los atributos de \(\alpha\), también deben tener los mismos valores en los atributos de \(\beta\).

<!-- Atributos: A, B, C -->

| **A** | **B** | **C** |
| :---: | :---: | :---: |
|  a1   |  b1   |  c1   |
|  a2   |  b2   |  c2   |
|  a2   |  b1   |  c1   |
|  a1   |  b2   |  c3   |

<!-- Tuplas (a1,b1,c1),... donde a1, b1,... son instancias-->

- ¿\( A \to B \)?
  En la fila 1 y 4 A tiene a1, pero en B varia por lo que no se cumple.
- ¿\( B \to C \)?
  En la fila 1 y 3 se cumple una dependencia funcional.
  En la 2 y 4 no. Por lo que no se cumple.
- ¿\( CB \to A \)?
  En la fila 1 y 3 B y C tienen los mismos valores pero en A varia, por lo que no se cumple.

> **3)** Hallar todas las dependencias funcionales que si cumple la relacion del ejercicio anterior.

- \( C \to B \) Si se cumple
  En C se repite c1 en las filas 1 y 3 y en B tienen b1.
  Luego no se repite otro valor en C.
- \( AC \to B \) Si se cumple
  No se repite ningun valor en AC.
- \( AB \to C \) Si se cumple
  No se repite ningun valor en AB.

> **4)** Considere el siguiente esquema de un estudio de cine
> (nActor,dActor,nEstudio,dEstudio,titulo,año,presupuesto,rol,salario)
> Considere las siguientes afirmaciones:
> (A) Cada actor queda identificado por su nombre y tiene una unica direccion.
> (B) Cada estudio queda identificado por su nombre y tiene una unica direccion.
> (C) No hay dos peliculas con igual titulo en un mismo año de estreno, y cada pelicula tiene un presupuesto y corresponde a un unico estudio.
> (D) Un actor puede representar roles diferentes en una misma pelicula. Multiples actores pueden representar el mismo rol en la misma pelicula.
> (E) Si multiples actores representan el mismo rol en la misma pelicula, tienen que tener el mismo salario. Pero si un actor representa diferentes roles en la misma pelicula puede tener diferentes salarios.
> Responda

<!-- actor(nombre PK, direccion UNIQUE)
estudio(nombre PK, direccion UNIQUE)
pelicula(estudio PK, (titulo, año de estreno) UNIQUE, presupuesto)
pelicula-rol((peliculaID FK, actorID FK, rolID FK) PK)
rol(rol PK, salario) -->

Esquema universal: (nActor,dActor,nEstudio,dEstudio,titulo,año,presupuesto,rol,salario)
PK UNIQUE PK UNIQUE ( UNIQUE ) ( UNIQUE )

- ¿Es este un buen esquema relacional? Explique y liste los diferentes tipos de anomalias que presenta este esquema.

  - Situaciones que obligan a trabajar con valores nulos:
    1. _Películas sin actores_: Esto puede ocurrir en la fase de preproducción, donde aún no se han contratado actores, generando campos nulos como nActor, dActor, rol y salario.
    2. _Estudios sin películas_: Un estudio recién fundado puede no tener ninguna película producida, lo que lleva a nulos en todos los campos relacionados con películas y actores.
    3. _Actores sin películas_: Un actor puede estar registrado en el sistema sin haber trabajado en ninguna película, lo que causa nulos en campos como nEstudio, dEstudio, titulo, año, presupuesto, rol, y salario.
    - ...
  - Casos de redundancia de información:
    1. _Un actor en múltiples estudios_: Si un actor aparece en más de un estudio, se repetirá su dirección (dActor) en cada registro.
    2. _Un actor con múltiples roles en el mismo estudio_: En este caso, se repetirían dActor, nEstudio y dEstudio en los registros.
    3. _Un actor con múltiples roles en una película_: Aquí se repetirían aún más atributos: dActor, nEstudio, dEstudio, titulo, y año.
    4. _Varios actores con el mismo rol_: Se repetiría el salario, ya que, según la afirmación, todos los actores con el mismo rol deben tener el mismo salario.
    - ...

- Basado en las afirmaciones, determine el listado de todas las DFs (dependencias funcionales) no triviales. Indique de cual afirmacion extrae cada una de ellas.

  - \( nActor \leftrightarrow dActor \): Esto proviene de la afirmación (A), donde se especifica que cada actor tiene una única dirección, lo que implica una dependencia funcional entre nActor y dActor.
  - \( nEstudio \leftrightarrow dEstudio \): De la afirmación (B), se deduce que un estudio tiene una única dirección, por lo que esta dependencia no genera redundancias en sí misma.
  - \( titulo, Año \to nEstudio, dEstudio, presupuesto\): De la afirmación (C), sabemos que no puede haber dos películas con el mismo título en un mismo año, lo que implica que titulo y año determinan el estudio, su dirección y el presupuesto de la película.
  - \( rol \to salario\): De la afirmación (E), se deduce que un mismo rol tiene un salario único, lo que genera esta dependencia funcional entre rol y salario.

> **5)** Explicar el modo en que las dependencias funcionales se pueden utilizar para indicar lo siguiente:

- Existe un conjunto de relaciones de uno a uno entre los conjuntos de entidades decano y facultad.

\( decano \leftrightarrow facultad \): Si establecemos una DF entre decano y facultad en ambas direcciones, cada vez que aparezca uno debera si o si aparecer el otro.

- Existe un conjunto de relaciones de varios a uno entre los conjuntos de entidades alumno y supervisor

\( alumno \to supervisor\): Si establecemos una DF entre alumno y supervisor pero solo en esa dirrecion, cada alumno tendra un solo supervisor pero el supervisor sera libre de tener muchos alumnos.

> **6)** Usar la siguiente definicion:
>
> - Una DF es **trivial** si es satisfecha por todas la relaciones de un esquema.
>
> Probar la siguiente afirmacion:
> \[ \alpha \rightarrow \beta \text{ es trivial } \iff \beta \subseteq \alpha. \]

Resuelto en el teorico/resumen

> **7)** Sea \( R = (A, B, C, G, H, I) \) con el siguiente conjunto de dependencias funcionales:
> \[
> F = \{ A \rightarrow B; \; A \rightarrow C; \; CG \rightarrow H; \; CG \rightarrow I; \; B \rightarrow H \}.
> \]

- Ejercicios: (Usare los axiomas y sus inferencias mencionadas donde su prueba este en el teorico/resumen)

  - **a)** Derivar \( A \rightarrow BCH \) de \( F \).
    \(F = \{ A \rightarrow B; \; A \rightarrow C; \; CG \rightarrow H; \; CG \rightarrow I; \; B \rightarrow H \}.\)

    1. \( A \rightarrow C \)
    2. \( A \rightarrow B \)
    3. \( B \rightarrow H \)
    4. \( A \rightarrow H \text{ (Transitividad en b, c) }\)
    5. \( A \rightarrow BC \text{ (Union en a, b) }\)
    6. \( A \rightarrow HBC \text{ (Union en d, e) }\)

  - **b)** Derivar \( AG \rightarrow I \) de \( F \).
    \(F = \{ A \rightarrow B; \; A \rightarrow C; \; CG \rightarrow H; \; CG \rightarrow I; \; B \rightarrow H \}.\)

    1. \( A \rightarrow C \)
    2. \( CG \rightarrow I \)
    3. \( AG \rightarrow I \text{ (Pseudotransitividad en a, c) } \)

  - **c)** Calcular \( A^+\_F \) y \( (AG)^+\_F \).
    \(F = \{ A \rightarrow B; \; A \rightarrow C; \; CG \rightarrow H; \; CG \rightarrow I; \; B \rightarrow H \}.\)
    - \( A^+\_F \)
      1. \( \text{ res } = \{ A \} \)
      2. \( A \in \text{ res } \land \{ A \rightarrow B; A \rightarrow C \} \subseteq F \implies \text{ res } = \text{ res } \cup \{ B, C \} \)
      3. \( B \in \text{ res } \land \{ B \rightarrow H \} \subseteq F \implies \text{ res } = \text{ res } \cup \{ H \} \)
      4. \( A^+\_F = res = \{A, C, B, H\} \)
    - \( (AG)^+\_F \)
      1. \( \text{ res } = \{ AG \} \)
      2. \( AG^+\_F = res = \{AG\} \)
      - AG no esta a la izquierda de nada en F.
  - **d)** Calcular las claves candidatas de \( R \).
    \(F = \{ A \rightarrow B; \; A \rightarrow C; \; CG \rightarrow H; \; CG \rightarrow I; \; B \rightarrow H \}.\)
    \( R = (A, B, C, G, H, I) \)
    1. Propongo \( \alpha = \{ A, CG \}\)
    2. Verifico que sea superclave:
    - \( \alpha^+\_F \)
      1. \( \text{ res } = \{ A, CG\} \)
      2. \( A \in \text{ res } \land \{ A \rightarrow B; A \rightarrow C \} \subseteq F \implies \text{ res } = \text{ res } \cup \{ B, C \} \)
      3. \( B \in \text{ res } \land \{ B \rightarrow H \} \subseteq F \implies \text{ res } = \text{ res } \cup \{ H \} \)
      4. \( CG \in \text{ res } \land \{ CG \rightarrow I \} \subseteq F \implies \text{ res } = \text{ res } \cup \{ I \} \)
      5. \( \alpha^+\_F = res = \{A, B, C, G, H, I\} = R \)
    3. Verifico que sea clave candidata:
    - Si \( A \notin \alpha \implies \{ B, C \} \nsubseteq \alpha^+\_F \neq R\) por lo que no seria superclave.
    - Si \( AG \notin \alpha \implies \{ I \} \nsubseteq \alpha^+\_F \neq R\) por lo que no seria superclave.

> **8)** Sea el esquema \( R = (A, B, C, D, E, F, G) \) y el conjunto de dependencias funcionales:
> \[
> G = \{A \to CD; CE \to AD; CF \to EB; E \to F ; CD \to E; G \to E\}
> \]
> Mostrar una dependencia funcional que no es derivable de \( G \). Probar que no es derivable de \( G \) indicando todos los pasos de la prueba.

