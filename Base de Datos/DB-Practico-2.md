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

  - \( decano \leftrightarrow facultad \): Si establecemos una DF entre decano y facultad en ambas direcciones, cada vez que aparezca uno debera si o si aparecer el otro.

- Existe un conjunto de relaciones de varios a uno entre los conjuntos de entidades alumno y supervisor
  - \( alumno \to supervisor\): Si establecemos una DF entre alumno y supervisor pero solo en esa dirrecion, cada alumno tendra un solo supervisor pero el supervisor sera libre de tener muchos alumnos.

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

  - **c)** Calcular \( A^+_F \) y \( (AG)^+_F \).
    \(F = \{ A \rightarrow B; \; A \rightarrow C; \; CG \rightarrow H; \; CG \rightarrow I; \; B \rightarrow H \}.\)
    - \( A^+_F \)
      1. \( \text{ res } = \{ A \} \)
      2. \( A \in \text{ res } \land \{ A \rightarrow B; A \rightarrow C \} \subseteq F \implies \text{ res } = \text{ res } \cup \{ B, C \} \)
      3. \( B \in \text{ res } \land \{ B \rightarrow H \} \subseteq F \implies \text{ res } = \text{ res } \cup \{ H \} \)
      4. \( A^+_F = res = \{A, C, B, H\} \)
    - \( (AG)^+_F \)
      1. \( \text{ res } = \{ A, G \} \)
      2. \( A \in \text{ res } \land \{ A \rightarrow B; A \rightarrow C \} \subseteq F \implies \text{ res } = \text{ res } \cup \{ B, C \} \)
      3. \( B \in \text{ res } \land \{ B \rightarrow H \} \subseteq F \implies \text{ res } = \text{ res } \cup \{ H \} \)
      4. \( CG \in \text{ res } \land \{ CG \rightarrow I\} \subseteq F \implies \text{ res } = \text{ res } \cup \{ I \} \)
      5. \( (AG)^+_F = res = \{A, G, C, B, H, I\} \)
  - **d)** Calcular las claves candidatas de \( R \).
    \(F = \{ A \rightarrow B; \; A \rightarrow C; \; CG \rightarrow H; \; CG \rightarrow I; \; B \rightarrow H \}.\)
    \( R = (A, B, C, G, H, I) \)
    1. Propongo \( \alpha = \{ AG \}\)
    2. Verifico que sea superclave:
    - \( \alpha^+_F = (AG)^+_F = R \text{ (como vimos en el ejercicio anterior) } \)
    3. Verifico que sea clave candidata:
    - Si \( A \notin \alpha \implies \{ B, C \} \nsubseteq \alpha^+_F \neq R\) por lo que no seria superclave.
    - Si \( G \notin \alpha \implies \{ I \} \nsubseteq \alpha^+_F \neq R\) por lo que no seria superclave.

> **8)** Sea el esquema \( R = (A, B, C, D, E, F, G) \) y el conjunto de dependencias funcionales:
> \[ 
    G = \{A \to CD; CE \to AD; CF \to EB; E \to F ; CD \to E; G \to E\}
  \]
> Mostrar una dependencia funcional que no es derivable de \( G \). Probar que no es derivable de \( G \) indicando todos los pasos de la prueba.

**Proposición**: \( F \vdash \alpha \to \beta \iff \beta \subseteq \alpha^+_F \)

\( E \in R\), calculo \( E^+_G \):

\( res = {E} \)
\( E \in \text{ res } \land E \to F \implies \text{ res } = \text{ res }  \cup F \)
\( E^+_G = {E, F}\)

Por lo tanto, \( E \to A \) por ejemplo, no es derivable de \( G \) ya que \( G \notin E^+_G\)
> **9)** Los registros de un club deportivo son tuplas de la forma
> (clubNro, ubicacion, gerente, instalacion, tamaño, cuota, prioridad).
> Un club deportivo se divide en varios clubes que pueden estar o no en diferentes ciudades.
> La ubicacion es una ciudad y varios clubes pueden tener la misma ubicacion.
> El valor de clubNro es unico dentro de una ciudad dada, aun cuando pueden existir duplicados en diferentes ciudades.
> La combinacion de clubNro y ubicacion determina una tupla unica.
> Un gerente es una persona asignada a una ubicacion en particular y maneja todos los clubes de esa ciudad.
> Una instalacion es una subunidad de un club, por ejemplo, una piscina, un sauna, una cancha de tenis, etc.
> El tamaño describe una instalacion en unidades adecuadas, por ejemplo, volumen para una piscina, area para una cancha de tenis, o asientos para un baño sauna.
> La prioridad es un esquema de clasificacion que la empresa utiliza para medir la importancia economica de clubes; esta basada en la ubicacion.
> Cada ciudad cuenta con un intervalo distinto de valores de prioridad.
> La cuota es el cargo por hora de utilizar una instalacion en particular.
> La cuota es constante para una instalacion dada en todos los clubes de la misma ciudad.
> Se pide:

<!--
Registros de un club deportivo :
(clubNro, ubicacion, gerente, instalacion, tamaño, cuota, prioridad).

Un club deportivo se divide en varios clubes que pueden estar o no en diferentes ciudades. La ubicacion es una ciudad y varios clubes pueden tener la misma ubicacion.
El valor de clubNro es unico dentro de una ciudad dada, aun cuando pueden existir duplicados en diferentes ciudades. La combinacion de clubNro y ubicacion determina una tupla unica.
>>> (clubNro, ubicacion) UNIQUE
>>> clubNro -muchos a muchos- ubicacion

Un gerente es una persona asignada a una ubicacion en particular y maneja todos los clubes de esa ciudad.
>>> ubicacion <-> gerente
>>> (clubNro, ubicacion) -> gerente

Una instalacion es una subunidad de un club, por ejemplo, una piscina, un sauna, una cancha de tenis, etc.
El tamaño describe una instalacion en unidades adecuadas, por ejemplo, volumen para una piscina, area para una cancha de tenis, o asientos para un baño sauna.
>>> instalacion -> unidad(tamaño) (¿¿¿¿¿DF con el formato/unidad del atributo?????)
>>> ¿¿¿¿¿¿¿¿¿¿¿¿ clubNro -muchos a muchos- instalacion ???????????

La prioridad es un esquema de clasificacion que la empresa utiliza para medir la importancia economica de clubes; esta basada en la ubicacion.
Cada ciudad cuenta con un intervalo distinto de valores de prioridad.
>>> ubicacion -> intervalo(prioridad) (¿¿¿¿¿DF con el intervalo del atributo?????)

La cuota es el cargo por hora de utilizar una instalacion en particular.
La cuota es constante para una instalacion dada en todos los clubes de la misma ciudad.
>>> instalacion -> cuota

(clubNro, ubicacion, gerente, instalacion, tamaño, cuota, prioridad).
-->

a) Crear un conjunto de dependencias funcionales \(F\) para captar las restricciones de la base de datos.
\(
F = \{ubicacion \leftrightarrow gerente, instalacion \rightarrow cuota, (clubNro, ubicacion) \rightarrow gerente\}
\)
\(
R = \{clubNro, ubicacion, gerente, instalacion, tamaño, cuota, prioridad\}
\)
b) Aplicar el algoritmo de normalizacion de FNBC al esquema universal


> **Del teorico:**
  **Ejercicio**: Comprobación de Forma normal de Boyce Codd
>
> Sea F dado por:
>  1. nomBib → calle, numero
>  2. calle, numero → nomBib
>  3. ISBN → título, editorial, autores, edición
>  4. nomBib, numInv → ISBN
>
> Sean los esquemas:
>  - R = (nomBib, numInv, ISBN)
>  - Biblioteca = (nomBib, calle, número)
>  - Libro = (ISBN, título, editorial, autores, edición)
>
> Comprobar que Biblioteca, Libro están en FNBC:

>**Del teorico:**
>**Ejercicio**: Aplicar el algoritmo de normalización en FNBC a:
>R = (A, B, C, D, E, F)
>F = {A → CB, E →FA}
  
>**Del teorico:**
>**Ejercicio**: Sea el esquema universal:
BibLibs = (nomBib, calle, número, numInv, ISBN, título, editorial, autores, edición)
> Sea \( F \) dado por:
>- \( \text{nomBib} \to \text{calle}, \text{número} \)
>- \( \text{calle}, \text{número} \to \text{nomBib} \)
>- \( \text{ISBN} \to \text{título}, \text{editorial}, \text{autores}, \text{edición} \)
>- \( \text{nomBib}, \text{numInv} \to \text{ISBN} \)
>
Aplicar el algoritmo de normalización en FNBC:
- ¿\( \text{nomBib} \to \text{calle}, \text{número} \) es testigo?
  - Sí, porque no es trivial y 
  - \( \text{nomBib}^+ = \{\text{nomBib}, \text{calle}, \text{número}\} \neq R \) por lo que \( \text{nomBib} \) no es superclave de \( BibLibs \).
    
- ¿Cómo queda la descomposición de BibLibs?
  - \( \text{BibLibs2} = (\text{nomBib}, \text{numInv}, \text{ISBN}, \text{título}, \text{editorial}, \text{autores}, \text{edición}) \)
  - \( R1 = (\text{nomBib}, \text{calle}, \text{número}) \)
    
- ¿\( \text{ISBN} \to \text{título}, \text{editorial}, \text{autores}, \text{edición} \) es testigo?
  - Sí, porque no es trivial y 
  - \( \text{ISBN}^+ = \{\text{ISBN}, \text{título}, \text{editorial}, \text{edición}, \text{autores}\} \neq \text{BibLibs2} \) por lo que \( \text{ISBN} \) no es superclave de \( \text{BibLibs2} \).
    
- ¿Cómo queda la descomposición de \( \text{BibLibs2} \)?
  - \( \text{BibLibs3} = (\text{nomBib}, \text{numInv}, \text{ISBN}) \)
  - \( R2 = (\text{ISBN}, \text{título}, \text{editorial}, \text{edición}, \text{autores}) \)

- ¿Estan en FNBC?
  - R1 y R2 se comprobo en el ejercio del teorico anterior.
  - comprobemos que \( BibLibs3 \) está en FNBC a traves del siguiente algoritmo:
      \[
        \forall \alpha \subseteq R_i : \alpha^+ \cap (R_i - \alpha) = \emptyset \vee R_i \subseteq \alpha^+
      \]

Aplicamos el algoritmo de comprobacion FNBC en \( R_i = BibLibs3 \) testeando sus subconjuntos \(\alpha\):
- \(\{numInv, nomBib\}^+\)
    - \(\{numInv, nomBib\}^+ = \text{BibLibs} \supseteq \text{ BibLibs3 } = R_i \)
    - Por lo tanto, \(\{numInv, nomBib\}\) es superclave y no hace falta chequear superconjuntos.
- \(\{ISBN, numInv\}^+\)
    - \(\{ISBN, numInv\}^+ = R2 \cup \{numInv\} \nsupseteq \text{ BibLibs3 } = R_i \)
    - \(\{ISBN, numInv\}^+ \cap (\text{BibLibs3} - \{ISBN, numInv\}) = R2 \cap \{nomBib\} = \emptyset\)
- \(\{ISBN, nomBib\}^+\)
    - \(\{ISBN, nomBib\}^+ = R2 \cup R1 \nsupseteq \text{ BibLibs3 } = R_i \)
    - \(\{ISBN, nomBib\}^+ \cap (\text{BibLibs3} - \{ISBN, nomBib\}) = (R2 \cup R1) \cap \{numInv\} = \emptyset \)
- \(\text{nomBib}^+\)
    - \(\text{nomBib}^+ = \{nomBib, calle, numero\} \nsupseteq \text{ BibLibs3 } = R_i \)
    - \(\text{nomBib}^+ \cap (\text{BibLibs3} - \{nomBib\}) = \{nomBib, calle, numero\} \cap \{numInv, ISBN\} = \emptyset\)
- \(\text{numinv}^+\)
    - \(\text{numinv}^+ = \text{numinv} \nsupseteq \text{ BibLibs3 } = R_i \)
    - \(\text{numinv}^+ \cap (\text{BibLibs3} - \{numinv\}) = \emptyset\).
- \(\text{ISBN}^+\)
    - \(\text{ISBN}^+ = R2 \nsupseteq \text{ BibLibs3 } = R_i \)
    - \(\text{ISBN}^+ \cap (\text{BibLibs3} - \{ISBN\}) = \emptyset \)
- Hemos chequeado todos los casos, por lo tanto, BibLibs3 está en FNBC.

> **10)** Para \( R = (I, S, C, D, A, O) \) y \( F = \{S \to D; I \to A; IS \to C; A \to O\} \), analizar para cada descomposición si cumple la FNBC justificando su respuesta:

**a)** \( R_1 = (I, S, C, D); R_2 = (I, A, O) \).

- **Comprobemos \( R_1 = (I, S, C, D) \)**:
    - \(\{I,S\}^+\)
        - \( \{I,S\}^+ = \{S, I, D, A, C, O\} \supseteq R_1 \)
        - Por lo tanto, \(\{I, S\}\) es superclave y no hace falta chequear superconjuntos.
    
    - \(\{S\}^+\)
        - \( \{S\}^+ = \{S, D\} \nsupseteq R_1 \)
        - \( \{S\}^+ \cap (R_1 - \{S\}) = \{D\} \neq \emptyset \)
        - No se cumple ninguna de las condiciones!!
    
Por lo que esta descomposicion no esta en FNBC.

**b)** \( R_1 = (S, D); R_2 = (I, A); R_3 = (I, S, C); R_4 = (A, O) \).

- **Comprobemos \( R_1 = (S, D) \)**:
    - \(\{S\}^+\)
        - \( \{S\}^+ = \{S, D\} \supseteq R_1 \)
        - Por lo tanto, \(\{S\}\) es superclave y no hace falta chequear superconjuntos.

    - \(\{D\}^+\)
        - \( \{D\}^+ = \{D\} \nsupseteq R_1 \)
        - \( \{D\}^+ \cap (R_1 - \{D\}) = \emptyset \)

    - \( R_1 \) es FNBC

- **Comprobemos \( R_2 = (I, A) \)**:
    - \(\{I\}^+\)
        - \( \{I\}^+ = \{I, A\} \supseteq R_2 \)
        - Por lo tanto, \(\{I\}\) es superclave y no hace falta chequear superconjuntos.

    - \(\{A\}^+\)
        - \( \{A\}^+ = \{A\} \nsupseteq R_2 \)
        - \( \{A\}^+ \cap (R_2 - \{A\}) = \emptyset \)

    - \( R_2 \) es FNBC

- **Comprobemos \( R_3 = (I, S, C) \)**:
    - \(\{I, S\}^+\)
        - \( \{I, S\}^+ = \{I, S, C\} \supseteq R_3 \)
      - Por lo tanto, \(\{I, S\}\) es superclave y no hace falta chequear superconjuntos.

    - \(\{I\}^+\)
        - \( \{I\}^+ = \{I, A, O\} \nsupseteq R_3 \)
        - \( \{I\}^+ \cap (R_3 - \{I\}) = \emptyset \)
    
    - \(\{S\}^+\)
        - \( \{S\}^+ = \{S, D\} \nsupseteq R_3 \)
        - \( \{S\}^+ \cap (R_3 - \{S\}) = \emptyset \)
    
    - \(\{C\}^+\)
        - \( \{C\}^+ = \{A\} \nsupseteq R_3 \)
        - \( \{C\}^+ \cap (R_3 - \{C\}) = \emptyset \)
    
    - \(\{I, C\}^+\)
        - \( \{I, C\}^+ = \{I, C, A, O\} \nsupseteq R_3 \)
        - \( \{I, C\}^+ \cap (R_3 - \{I, C\}) = \emptyset \)
    
    - \(\{S, C\}^+\)
        - \( \{S, C\}^+ = \{S, C, D\} \nsupseteq R_3 \)
        - \( \{S, C\}^+ \cap (R_3 - \{S, C\}) = \emptyset \)

    - \( R_3 \) es FNBC

- **Comprobemos \( R_4 = (A, O) \)**:

    - \(\{A\}^+\)
        - \( \{A\}^+ = \{A, O\} \supseteq R_4 \)
        - Por lo tanto, \(\{A\}\) es superclave y no hace falta chequear superconjuntos.

    - \(\{O\}^+\)
        - \( \{O\}^+ = \{O\} \nsupseteq R_4 \)
        - \( \{O\}^+ \cap (R_4 - \{O\}) = \emptyset \)

    - \( R_4 \) es FNBC

Por lo tanto la descomposicion es FNBC

> **11)** Resolver:

**a)** Sea \( R = (A, B, C, D, E, G) \) con las dependencias funcionales \( F = \{A \to BC; D \to EG; G \to B; E \to C; B \to A\} \). ¿Está \( (D, E, G) \) en FNBC? Justifique su respuesta.

- \(\{D\}^+\)
    - \( \{D\}^+ = \{D, E, G, C, B, A\} \supseteq (D, E, G) \)
    - Por lo tanto, \(\{D\}\) es superclave y no hace falta chequear superconjuntos.

- \(\{G\}^+\)
    - \( \{G\}^+ = \{G, B, A, C\} \nsupseteq (D, E, G) \)
    - \( \{G\}^+ \cap ((D, E, G) - \{G\}) = \emptyset \)

- \(\{G, E\}^+\)
    - \( \{G, E\}^+ = \{G, E, B, A, C\} \nsupseteq (D, E, G) \)
    - \( \{G, E\}^+ \cap ((D, E, G) - \{G, E\}) = \emptyset \)
    
- \(\{E\}^+\)
    - \( \{E\}^+ = \{E, C\} \nsupseteq (D, E, G) \)
    - \( \{E\}^+ \cap ((D, E, G) - \{E\}) = \emptyset \)

Por lo que esta en FNBC.
    
**b)** Sea \( R = (A, B, C, D, E) \) con el conjunto de dependencias funcionales \( F = \{B \to EA; C \to E; DA \to B; E \to AC\} \). ¿Está \( (B, E, A) \) en FNBC? Justifique su respuesta.

- \(\{A\}^+\)
    - \( \{A\}^+ = \{A, B, C, E\} \supseteq (B, E, A) \)
    - Por lo tanto, \(\{A\}\) es superclave y no hace falta chequear superconjuntos.

- \(\{B\}^+\)
    - \( \{B\}^+ = \{A, B, C, E\} \supseteq (B, E, A) \)
    - Por lo tanto, \(\{B\}\) es superclave y no hace falta chequear superconjuntos.
    
- \(\{E\}^+\)
    - \( \{E\}^+ = \{A, B, C, E\} \supseteq (B, E, A) \)
    - Por lo tanto, \(\{E\}\) es superclave y no hace falta chequear superconjuntos.

Por lo que esta en FNBC.
