# Práctico 3: Procesamiento de Consultas
> A partir de ahora la forma de estudiar la materia la cambiare e iré intercalando en un mismo archivo entre el teórico necesario para los ejercicios y su resolución.
## Indice
- [Ejercicio 1](#Ejercicio-1)
- [Ejercicio 2](#Ejercicio-2)


---
## Tablas y sus esquemas
- **Esquemas**: $R = (A_{1}::T_{1}, …, A_{n}:: T_{n})$ donde $T_{i}$ es tipo para atributos de $A_{i}$ y el dominio de $R$ es el producto cartesiano de sus tipos ($\text{Dom}(R) = T_1 \times \dots \times T_n$). Todo atributo debe tener tipo pero no necesariamente nombre (podemos tener $R = (A_{1}::T_{1}, \text{ \_}::T_{1})$).
- **Tablas**: $r(A_{1}::T_{1}, …, A_{n}:: T_{n})$ significa que la tabla $r$ tiene esquema $R = (A_{1}::T_{1}, …, A_{n}:: T_{n})$. Se puede indicar, habiendo definido $R$, de forma resumida como $r(A_{1},…,A_{n})$.

![400](db-p2-14.png)
Donde los **campos** son nombres, y tienen un tipo $T$ que puede ser Int, String, DateTime, etc.
Para cada **columna** $j$, los valores $v_{ij}$ (con $i \in \{0, …, M\}$) deben tener el tipo $T_{j}$ .

**Esquema**: El encabezado de la tabla (exceptuando el nombre) y usualmente lo notaremos como: $R ::= nombre(campo_{1}::T_{1},\dots,campo_{n}::T_{n})$

**Tabla**: Un esquema y una lista de tuplas que respetan ese esquema. Es decir, cada tupla de la tabla tiene tipo $\text{Dom}(R) = T_1 \times \dots \times T_n$.

**Tupla**: Una fila de la tabla donde:
 **$t \in nombre$** es una tupla de la tabla nombre. (La tupla t en este caso representa un registro en la tabla.)
**$v_{1},\dots, v_{n}$** es la tupla con $n$ valores. 
**$t.campo_{i}$** es el valor de una tupla correspondiente a el campo $campo_{i}$

**Concatenación de tuplas**: $(t;t') = (a_{1},\dots,a_{n},b_{1},\dots,b_{m})$
**Añadir tupla a una tabla**: $(t:r)$ <!-- TODO: Completar -->

## Ejercicio-1
> Definir una implementación para el operador producto cartesiano. Evaluar su costo en términos de transferencias de bloques y accesos de bloques.

**Definición matemática**: $A \times B = \{ (a, b) \mid a \in A \text{ y } b \in B \}$

**Esquema**:
Sean los esquemas $r :: N_{1} :: T_{1}, \dots , N_{n} :: T_{n}$ y   $r :: N'_{1} :: T'_{1}, \dots , N'_{m} :: T'_{m}$ 
El esquema del producto cartesiano es:  $r \times s :: (r :: N_{1} :: T_{1}, \dots , N_{n} :: T_{n}, r :: N'_{1} :: T'_{1}, \dots , N'_{m} :: T'_{m})$ 

**Definición de operador lógico**:

*Idea 1*:
$\Pi_{A,B}[] = []$
$\Pi_{A,B} (t:r) = [(t.A, y) \mid y \in r.B] : \Pi_{A,B} \ r$

Donde: $r$ una tabla, $t$ es una tupla, y $t.A, t.C$ son atributos de $t$

*Idea 2*: (filminas)
$[] \times s = []$
$(t:r) \times s= \text{ (juntar s t) ++ } (r \times s)$

donde:

$++ : [a] \to [a] \to [a]$
$[] \text{ ++ } l' = l'$
$(x:l) \text{ ++ } l' = x:(l \text{ ++ } l')$

$juntar \text{ t } [] = []$
$juntar \text{ (u:s) t} = (t ; u) : \text{(juntar s t)}$

$(t;t') = (t.campo_{1},\dots,t.campo_{n},t'.campo'_{1},\dots,t'.campo'_{m})$ <!-- TODO: Esta bien? -->


**Implementación para el operador producto cartesiano**:
1. 
**Costo en términos de transferencias de bloques y accesos de bloques**:


---
## Ordenamiento externo
El **ordenamiento externo** es un conjunto de algoritmos que trabajan con datos que son demasiado grandes para caber completamente en la memoria principal (RAM). Por lo tanto, se utilizan archivos de disco y técnicas que minimizan el número de lecturas/escrituras en el disco.

- La idea básica es **dividir y conquistar**: dividir los datos en pequeñas partes que sí caben en la memoria, ordenarlas, y luego fusionar los datos ordenados.
- **M**: Es la cantidad de bloques de datos que pueden caber en la memoria RAM. Cada bloque puede ser una parte de los datos que se va a ordenar.
- **Corridas ordenadas**: Cada vez que se cargan los datos en bloques de tamaño M en la memoria y se ordenan, el resultado se escribe a un archivo temporal en disco. Estos archivos temporales se llaman **corridas ordenadas** o **runs**.

**Fase 1: Crear corridas ordenadas**
Dado un búfer de memoria con capacidad para **M bloques**, se generan las corridas ordenadas de la siguiente manera:
```pascal
i = 0
repeat
   Leer M bloques de la tabla en memoria
   
   Ordenar esos bloques en memoria
   
   Escribir los datos ordenados en el archivo de ejecución temporal Ri
   
   i = i+1
until el fin de la tabla
```
Este proceso se repite hasta que toda la tabla ha sido leída, ordenada en partes, y escrita en archivos temporales.
Al final del proceso, el valor de `i` será el número total de corridas ordenadas creadas, llamado **N**.

**Fase 2: Mezcla de corridas ordenadas**
En esta fase, se combina el contenido de las corridas ordenadas para obtener un archivo completamente ordenado.

**Si N < M**: Esto significa que el número de corridas (N) es menor que el número de bloques que puede manejar la memoria (M). Esto permite cargar un bloque de cada corrida `Ri` en memoria simultáneamente
```pascal
repeat
    Entre todos los bloques que están en memoria (uno de cada corrida `Ri`), se selecciona la primera tupla en orden de acuerdo con el criterio de ordenamiento
    
    Escribir la tupla al búfer de salida y borrarla del bloque del búfer donde estaba (correspondiente a la corrida `Ri` de donde fue tomada)
    
    if búfer de salida está lleno
    then escribirlo a disco, borrar contenido de búfer de salida.
    
    if búfer de corrida Ri está vacío y no fin de archivo Ri
    then leer el próximo bloque de la corrida Ri en el bloque de búfer de memoria correspondiente a esa corrida

until todos los bloques de búfer de las corridas estén vacíos
```

**Si N $\leq$ M**: Dado que no es posible cargar todas las corridas en memoria al mismo tiempo, se requieren **varias pasadas** (o ciclos de combinación) para reducir progresivamente el número de corridas.

1. **División en grupos**: Se agrupan las corridas en grupos contiguos de M-1 corridas. (de esta forma la memoria se utiliza para manejar M-1 bloques de entrada y un bloque de salida)
2. **Combinación de corridas**: Cada grupo de M-1 corridas es **combinado** (usando el algoritmo anterior), dando lugar a una nueva corrida.
	- La misma reduce el número de corridas por un factor de M-1 y crea corridas más largas por el mismo factor.
- Hacer los dos pasos anteriores (1 y 2) constituye una **pasada**.
3. **Repetición**: Si el número de corridas resultantes de esa pasada es mayor a M, se realiza otra pasada de la misma manera, pero con las corridas creadas en la primera pasada.
	- Observar que cada pasada reduce el número de secuencias en M-1.
	- Se repiten las pasadas hasta que número de corridas generadas sea menor que M.
4. **Última combinación**: Una vez que el número de corridas es menor que **M**, se realiza una última pasada para generar el archivo completamente ordenado.
## Ejercicio-2
> Para el operador físico de ordenación externa: escribir un algoritmo en pseudocódigo para la implementación de la combinación de corridas cuando N > M.

Esto significa que el número de corridas (N) es mayor que el número de bloques que puede manejar la memoria (M).


---
## Ejercicio-3
Sea la siguiente tabla:
cliente(<u>cid</u>, cnombre, teléfono, dirección, edad)
Se tiene la siguiente información de cliente:
• cliente tiene 1400 tuplas y
• En cliente se tienen 70 valores distintos para la edad.
• La edad más grande es 87 y la más baja es de 18.
• La edad se asume equi-distribuida.
• Asumir que cliente tiene un índice primario en edad.
Además, asumir que un bloque tiene tamaño de 4096 bytes.
Sea la consulta: $\sigma_{\text{edad} > 30} (\text{cliente})$
1. Si para el índice primario en edad se usa un árbol B+: ¿Cómo calcularías la cantidad de tuplas de ese índice que entran por bloque? ¿Cómo calcularías la cantidad de nodos en total que se necesitan para ese árbol B+?
2. Indicar el algoritmo más conveniente para implementar la selección explicando su comportamiento de manera precisa. Tiene que ser un operador eficiente.
3. Calcular el costo del algoritmo del ítem 2 en transferencias de bloques.