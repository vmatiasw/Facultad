# Almacenamiento de tablas en archivos e índices
Este documento se enfoca en cómo se almacenan las tablas en archivos y cómo los índices mejoran el acceso a los registros en sistemas de bases de datos (SGBD). Aborda la estructura de los discos rígidos, las diferentes formas de organizar archivos y registros, el uso de índices para mejorar la eficiencia, y detalles técnicos sobre índices de múltiples niveles y árboles B+.

¿Cómo almacenar una tabla de BD relacional en un archivo?
Solución: usar enfoques de organización de archivos.
¿Cómo acceder eficientemente a registros de una tabla?
Solución: usar archivo de índice

## Organización de los discos rígidos

La superficie del plato de un disco se divide en **pistas circulares**, los cuales a su vez se dividen en **sectores** de datos, donde estos son transferidos entre el disco y la memoria principal en **bloques**.
**Sector**: unidad de datos más chica que puede ser leída o escrita.
**Bloque**: secuencia contigua de sectores de una pista.

- Suele haber en los discos rígidos entre 50 mil y 100 mil pistas circulares por plato.
- Una pista suele tener entre 500 y 1000 sectores (de tamaño típico de 512 B) para pistas internas y entre 1000 y 2000 sectores para pistas externas.
- El tamaño de un bloque va desde 512 B a varios KiB.
- El tamaño típico de un bloque va de 4 KiB a 16 KiB.
## Enfoque de registros de tamaño fijo
Los registros se almacenan secuencialmente en bloques, i.e., sea $n$ es el tamaño de cada registro, se almacena un registro $i$ desde el byte $n*(i-1)$.

Problema: Con esta idea registros pueden cruzar bloques, i.e, acceder a un registro puede requerir acceder al bloque siguiente al bloque donde comienza. Queremos evitar este costo extra.
• Solución: que cada registro esté en un bloque.

Un archivo de BD es particionado en **bloques** de tamaño fijo. Los bloques son tanto unidades de almacenamiento como de transferencia de datos.
Un **búfer** en memoria principal es usado para almacenar copias de bloques de disco.
**Meta del SGBD**: Minimizar cantidad de transferencias de bloques entre disco y memoria.
### Borrado de registros.
Métodos:
- Borrar registro $i$ y **compactar**, i.e, mover registros $i+1,…, n \text{  a  } i,…, n-1$.
- Borrar registro $i$ y **mover el último registro $n$ a $i$**.
- Usar **listas enlazadas**, no se mueven registros, pero se enlazan los registros libres en una lista.
### Organización de registros en archivos

Métodos en la ubicación de las tablas de la BD:
- Archivos con registros de solo una tabla.
- Archivos con registros de una o mas tablas (agrupamiento de tablas en archivos).
Métodos en la ubicación de los registros en un archivo:
- **Heap**: un registro puede almacenarse en cualquier lugar del archivo ==donde hay espacio==.
- **Secuencial**: almacenar registros de una tabla en ==orden secuencial según el valor de la **clave de búsqueda** de cada registro==.
	- Adecuada para aplicaciones donde se requiere el procesamiento secuencial del archivo entero.
**Obs**:
- Una **clave de búsqueda** es cualquier atributo o conjunto de atributos. No necesita ser la clave primaria o una superclave.
- Para ==minimizar el número de acceso a bloques== en procesamiento de archivos secuenciales, almacenamos los registros físicamente aproximadamente en el orden de clave de búsqueda.
#### Organización de archivos secuencial
Borrado: usar cadenas de punteros (como se vio antes).
Inserción:
1. localizar la posición donde el registro va a ser insertado.
2. Si hay espacio libre insertar allí.
3. Si no hay espacio libre, insertar el registro en bloque de overflow
4. Hace falta reorganizar el archivo cada cierto tiempo para restaurar el orden secuencial.
![400](db-p2-1.png)
A veces las consultas necesitan acceder a registros relacionados de dos tablas.
• Como veremos más adelante, esto va a ser pesado de hacer si solo se usa
organización de archivos secuencial.
#### Agrupamiento de tablas en archivos
Cada tabla se almacena en un archivo y cada archivo se usa para una tabla.
Un archivo es una secuencia de registros y un registro es una secuencia de campos.
Supondremos que el tamaño de registro es fijo, pero en realidad lleva a registros de tamaño variable.

- Bueno para consultas involucrando acceder a registros relacionados de dos tablas. Se pueden agregar cadenas de punteros para enlazar registros de una relación particular.
- Malo para consultas involucrando acceder a registros no relacionados.
## Indices 
Un **archivo de índice** es usado para acceder más rápido a los datos deseados (atributos especificios) de las tablas.
Consiste de registros llamados **entradas del indice** de la forma: `<clave de búsqueda, puntero>`
**Ventaja**: Los índices ofrecen beneficios sustanciales cuando se accede a registros de
tablas.
**Desventaja**:
- Almacenamiento extra en disco, pero estos archivos son mucho más chicos que el archivo original de la tabla.
- Actualizar indices impone una sobrecarga en la modificación de la BD. Cuando un archivo se modifica, cada índice al archivo debe ser actualizado.

**Clave de búsqueda**: un atributo o conjunto de atributos usados para buscar registros en un archivo (de una tabla).

En un **índice ordenado** puede tomar la forma de:
- Una **lista de entradas** ordenada por valor de clave de búsqueda
- Un **árbol ordenado**: además de otras propiedades para el ordenamiento, en cada nodo del árbol las entradas están ordenadas por valor de clave de búsqueda.

Los índices además se clasifican en primarios y secundarios.
- **Índice primario**: Sea $f$ un archivo secuencialmente ordenado; el índice primario es el índice cuya clave de búsqueda especifica el orden secuencial del archivo $f$.
- **Índice secundario**: Sea $f$ un archivo secuencialmente ordenado; un índice secundario es un índice cuya clave de búsqueda especifica un orden diferente del orden secuencial del archivo.

Tipos de indices:
- **Índice denso** (Índice de un solo nivel): hay una entrada del índice por cada valor de la clave de búsqueda en el archivo.
	- **Actualización de índice por borrado de registro**:
		- Si el registro borrado fue el único registro en el archivo con su clave de búsqueda particular: la clave de búsqueda es borrada del índice también.
		- sino:
			- Si la entrada del índice almacena punteros a todos los registros con el mismo valor de clave de búsqueda: se borra el puntero al registro borrado de la entrada del indice.
			- Sino:
				- Si el registro borrado es el primer registro con el valor de la clave de búsqueda, se actualiza la entrada del índice para que apunte al siguiente registro.
				- Sino: COMPLETAR?
	- **Actualización de índice por inserción de registro**: 
		- Primero se hace búsqueda usando el valor de clave de búsqueda que aparece en el registro a ser insertado
		- Si el valor de la clave de búsqueda no aparece en el índice: insertar una entrada de índice con valor de clave de búsqueda en el índice en la posición apropiada.
		- Sino:
			- Si la entrada del índice almacena punteros a todos los registros con el mismo valor de clave de búsqueda: el sistema agrega un puntero al nuevo registro en la entrada del índice.
			- Sino: la entrada del índice almacena un puntero a solo el primer registro con el valor de la clave de búsqueda. Se coloca el registro siendo insertado luego de los otros registros con los mismos valores de clave de búsqueda.

| ![300](db-p2-2.png) | ![360](db-p2-3.png) |
| ------------------- | ------------------- |

- **índice disperso** (Índice de un solo nivel (Cont.)): contiene registros de índice para solo algunos valores de clave de búsqueda. Requiere a los registros de la tabla ordenados secuencialmente por clave de búsqueda del índice.
	Comparación con indices densos: Requieren ==menos espacio y menos sobrecarga de mantenimiento== para inserciones y borrados en la tabla. Pero generalmente son ==más lentos== para localizar registros.
	- **Actualización de índice por borrado de registro**:
		- Si el índice no contiene una entrada con el valor de clave de búsqueda del registro borrado: nada necesita hacerse en el índice.
		- Sino:
			- Si el registro borrado era el único registro con su clave de búsqueda $B$:
				- Si el próximo valor de clave de búsqueda tiene una entrada en el índice: la entrada para $B$ es borrada del índice.
				- Sino: se reemplaza el registro de índice correspondiente con un registro de índice para el próximo valor de clave de búsqueda (en el orden de clave de búsqueda).
			- Sino:
				- Si la entrada del índice para la clave de búsqueda apunta al registro siendo borrado: se actualiza la entrada del índice para apuntar al próximo registro con el mismo valor de clave de búsqueda.
				- Sino: COMPLETAR?
	- **Actualización de índice por inserción de registro**:
		- Asumimos que el índice almacena una entrada para cada bloque.
		- Si el sistema crea un nuevo bloque: inserta el primer valor de la clave de búsqueda (en orden de clave de búsqueda) apareciendo en el nuevo bloque en el índice.
		- sino:
			- Si el nuevo registro tiene el menor valor de clave de búsqueda en su bloque: el sistema actualiza la entrada del índice apuntando al bloque.
			- Sino: el sistema no hace cambios al índice.
![600](db-p2-4.png)
- **Índices secundarios**: Cada registro del índice apunta a un bucket que contiene punteros a todos los registros actuales con el valor particular de clave de búsqueda.
	Los índices secundarios deben ser densos.
	Evaluación: Escaneo secuencial usando índice primario es eficiente. Escaneo secuencial usando índice secundario es costoso.
		Cada acceso a registro de tabla puede requerir recoger un nuevo bloque de disco.
		Recoger un bloque requiere entre 5 y 10 msec, versus 100 nanosecs para acceso a memoria.
![500](db-p2-5.png)
- **Índice de multinivel**: trata el índice primario mantenido en disco como archivo secuencial y construir un índice disperso en el mismo.
	Soluciona: Si el índice primario no cabe en memoria, entonces el acceso pasa a ser costoso, para ello se utiliza un indice multinivel.
	Costo: Índices de los dos niveles deben ser actualizados al insertar y borrar en la tabla.
	- **Índice externo**: índice disperso del índice primario.
	- **Índice interno**: archivo del índice primario.
![300](db-p2-6.png)
- **Índices con clave de búsqueda compuesta**:
	- La estructura del índice es la misma como la de cualquier otro índice; la única diferencia es que la clave de búsqueda del índice contiene una lista de atributos.
	- **Clave de búsqueda compuesta**: 
		- Una clave de búsqueda conteniendo más de un atributo.
		- Puede representarse como una tupla de valores de la forma: $(a_{1},…,a_{n})$, donde los atributos individuales son: $A_{1},…, A_{n}$.
		- El orden de los valores de la clave de búsqueda es el ==orden lexicográfico==.

## Acceso a múltiples claves de búsqueda

Usar múltiples índices para ciertos tipos de consultas.
Ejemplo:
```sql
select ID
from instructor
where dept_name = 'Finance' and salary = 80000;
```
Posibles estrategias para procesar consultas usando índices en atributos simples:
- .
	1. Usar índice en dept_name para encontrar instructores con nombre de departamento ‘Finance’;
	2. testear salary = 80000.
- .
	1. Usar índice en salary para encontrar instructores con salary de 80000;
	2. testear dept_name = ‘Finance’.
- .
	1. Usar índice en dept_name para encontrar punteros a todos los registros pertenecientes al departamento de finanzas.
	2. Similarmente usar índice en salario para hallar punteros a registros con salario de 80000.
	3. Tomar la intersección de ambos conjuntos de punteros obtenidos.
Supongamos que tenemos un índice en la clave de búsqueda
combinada (dept_name, salary).
• Con la cláusula where anterior el índice en (dept_name, salary)
puede ser usado para recoger solo registros que satisfacen ambas
condiciones.
• Además se puede manejar eficientemente:
where dept_name = ‘Finance’ and salary < 80000
• Pero no se puede manejar eficientemente:
where dept_name < ‘Finance’ and salary = 80000
o Puede recolectar varios registros que satisfacen la primera, pero no la
segunda condición.

## Índices árbol $B^+$

**Ventajas**: Usando índices ordenados con forma de árbol balanceado no hace falta reorganizar el archivo de la tabla para mantener el desempeño.
El índice se reorganiza con cambios pequeños locales frente a inserciones y borrados.

- Como las conexiones entre nodos son hechas mediante punteros, los
  bloques lógicamente cercanos no necesitan estar físicamente
  cercanos.
- Si hay $K$ valores de clave de búsqueda en la tabla, la altura del árbol B+
  no es mayor a $\lceil \log_{\lceil n/2 \rceil}(K) \rceil$.
  - Entonces las consultas pueden ser realizadas eficientemente.
  - El $n$ es la cantidad máxima de punteros que tiene un nodo.
- Borrados e inserciones a la tabla pueden ser manejados
  eficientemente, porque el índice puede ser reestructurado en tiempo
  logarítmico.


![500](db-p2-7.png)
Un árbol $B^+$ satisface las siguientes propiedades:
- Todos los caminos desde la raíz a una hoja son de la misma longitud.
- Cada nodo que no es la raíz o una hoja tiene entre $\lceil \frac{n}{2} \rceil$ y $n$ hijos.
- Un nodo hoja tiene entre $\lceil \frac{n-1}{2} \rceil$ y $n - 1$ valores.
- Si la raíz no es una hoja, tiene al menos 2 hijos.
- Si la raíz es una hoja, puede tener entre 0 y $n - 1$ valores.

### Estructura de nodo de árbol $B^+$

Nodo típico:

| $P_{1}$ | $K_{1}$ | $P_{2}$ | $\dots$ | $P_{n-1}$ | $K_{n-1}$ | $P_{n}$ |
| ------- | ------- | ------- | ------- | --------- | --------- | ------- |

Los $K_{i}$ son valores de clave de búsqueda.
Los $P_{i}$ son:
- Para nodos no hoja: punteros a hijos
- Para nodos hoja: punteros a registros o buckets de registros.
Las claves de búsqueda en un nodo están ordenadas:
$$K_{1} < K_{2} < K_{3} < \dots < K_{n-1}$$
Los rangos de valores en cada hoja no se solapan, excepto cuando hay valores de clave de búsqueda duplicados, en cuyo caso un valor puede estar presente en más de una hoja.
Asumir inicialmente que no hay claves duplicadas; manejar duplicaciones después

**Propiedades de un nodo hoja**:
Para $i = 1, 2, …, n-1$, el puntero $P_{i}$ apunta al registro del archivo con el valor de clave de búsqueda $K_{i}$.
Si $L_{i}, L_{j}$ son nodos hoja y $i < j$, los valores de la clave de búsqueda de $L_{i}$ son menores o iguales a los valores de la clave de búsqueda de $L_{j}$.
$P_{n}$ apunta al próximo nodo hoja en el orden de clave de búsqueda.

### Nodos no hoja en árboles $B^+$
Los nodos no hoja forman un índice disperso multinivel en los nodos hoja.

Para un nodo no hoja con $n$ punteros:
- Todas las claves de búsqueda en el subárbol al cual $P_{1}$ apunta son menores que $K_{1}$.
- Para $2 \leq i \leq n – 1$ : todas las claves de búsqueda en el subárbol al cual $P_{i}$ apunta tienen valores mayores o iguales a $K_{i-1}$ y menores que $K_{i}$.
- Todas las claves de búsqueda en el subárbol al cual $P_{n}$ apunta tiene valores mayores o iguales que $K_{n-1}$.

### Consultas en árboles $B^+$
![500](db-p2-8.png)

### Manejando duplicados

Con claves de búsqueda duplicadas (tanto en nodos hoja como internos):
  - No podemos garantizar que $K_1 < K_2 < K_3 < \dots < K_{n-1}$
  - Pero podemos garantizar que $K_1 \leq K_2 \leq K_3 \leq \dots \leq K_{n-1}$
  
Las claves de búsqueda en el subárbol al cual $P_i$ apunta
  - son $\leq K_i$, pero no necesariamente $< K_i$.
  - Para ver por qué, supongamos que el mismo valor de la clave de búsqueda $V$ está presente en dos nodos hoja $L_i$ y $L_{i+1}$.
		Entonces, en el nodo padre $K_i$ debe ser igual a $V$.

Modificamos el procedimiento de búsqueda como sigue:
  - Recorrer $P_i$ incluso si $V = K_i$
  - Tan pronto como alcanzamos un nodo hoja $C$, chequear si $C$ tiene solo valores
    de clave de búsqueda menores que $V$.
    - Si es así, sea $C =$ hermano derecho de $C$ antes de chequear si $C$ contiene $V$.
  
Procedimiento `printAll`
  - Usa búsqueda modificada para encontrar la primera ocurrencia de $V$.
  - Recorre las hojas consecutivas para encontrar todas las ocurrencias de $V$.

### Consultas en árboles B+

- Si hay $K$ valores de clave de búsqueda en el archivo, la altura del árbol no es mayor a $\lceil \log_{\lceil n/2 \rceil}(K) \rceil$.
- Un nodo tiene generalmente el mismo tamaño que un bloque de disco, típicamente 4 KiB.
- Ejemplo: Con 1 millón de valores de clave de búsqueda y $n = 100$
  - A lo más $\log_{50}(1,000,000) = 4$ nodos son accedidos en una búsqueda.
- Resulta útil usar la fórmula de cambio de base para calcular logaritmos: $$\log_b(x) = \frac{\log_a(x)}{\log_a(b)}$$
## Indexando strings

**Problema:** Creando índices árbol B+ en atributos de valor string da lugar a dos problemas:
  - Los strings pueden ser de longitud variable y
  - Los strings pueden ser largos, dando lugar a menor cantidad de punteros por nodo y llevando a aumentar la altura del árbol.
  
- Notar que:
  - Un nodo debe ser subdividido si está lleno sin importar cuántas entradas de búsqueda contenga.
  - Nodos pueden ser combinados o sus entradas redistribuidas dependiendo de qué fracción del espacio en los nodos es usado, en lugar de basarse en el número máximo de entradas que un nodo puede contener.
  
- **Solución:** La cantidad de punteros de un nodo puede ser aumentada usando una técnica llamada **compresión de prefijos**.
  - En los nodos no hoja no almacenamos el valor entero de la clave de búsqueda.
  - Solo almacenamos un prefijo de cada valor de clave de búsqueda que es suficiente para distinguir entre los valores de las claves de búsqueda en los subárboles que separa.
  
- **Ejemplo:** Si tenemos un índice en nombres, el valor de la clave de búsqueda en un nodo no hoja puede ser un prefijo de un nombre.
  - Puede ser suficiente almacenar ‘Silb’ en un nodo no hoja en lugar de ‘Silberschatz’ si el valor más cercano en los dos subárboles que separa son ‘Silas’ y ‘Silver’ respectivamente.

## Organización de archivo con árbol $B^+$

- El problema de la degradación de archivo de índice secuencial se resuelve usando índice de árbol B+.
- El problema de la degradación de un archivo de datos se resuelve usando una organización de archivo de árbol B+.
- Los nodos hoja en una organización de archivo de árbol B+ almacenan registros en lugar de punteros.
- Los nodos hoja son todavía requeridos que estén la mitad llenos.
  - Como los registros ocupan más espacio que los punteros, el máximo número de registros que pueden ser almacenados en un nodo hoja es menor que el número de punteros en un nodo no hoja.
- La inserción y borrado son manejados de la misma manera que la inserción y borrado de entradas en índices de árbol B+.


![500](db-p2-9.png)
