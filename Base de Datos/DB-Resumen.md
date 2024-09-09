# Base de Datos

__Base de datos (BD)__: contiene datos generalmente interrelacionados.
__Esquema__: La estructura de entidades y relaciones de la BD.
__Instancia__: contenido actual de la BD en un momento del tiempo.
__Restricción de integridad__: es una propiedad que las instancias de la BD deben satisfacer. Al modificar una instancia se debe chequear que las restricciones de
integridad de la BD siguen siendo válidas.

__Procesos de diseño que veremos__:
  1. Proceso que hace un diseño de entidad-relación primero y luego traduce ese diseño de entidad-relación a un conjunto de esquemas de relación.
  2. Proceso que comienza con esquema relacional con todos los atributos atómicos del problema y un conjunto de restricciones de integridad y calcula un esquema de la base de datos. A esto se le llama normalización.

## Diseño de Entidad-Relación (ER)

Es un enfoque de _modelado conceptual de alto nivel_ que se utiliza para representar datos y sus relaciones a través de entidades, atributos y relaciones sin implementar un estructura real.

Se construye diagramáticamente usado un _diagrama de entidad-relación_.

Se utiliza para visualizar la estructura de una base de datos antes de su __traducción__ del modelo de entidad-relación a esquemas relacionales para su implementación. Sirve como un plano, mientras que el modelo relacional realiza este plano en forma de base de datos.

- __Entidad__: objeto distinguible de otros objetos. Descrito por medio de atributos.
  - __Conjunto de entidades (CE)__: conjunto de entidades del mismo tipo (i.e. Con los mismos atributos) que comparte las mismas propiedades.

- __Relación__: asociación entre varias entidades.
  - __Conjunto de relaciones (CR)__: es una relación matemática entre \( n \geq 2 \) conjuntos de entidades (CE), definida como: 
  \[
  \{ (e_1, e_2, \ldots, e_n) \mid e_1 \in E_1, e_2 \in E_2, \ldots, e_n \in E_n \}
  \] donde \( (e_1, e_2, \ldots, e_n) \) es una relación. Un atributo puede ser también una propiedad de un CR.

  - __Roles__: Los CE en un CR, no necesariamente son distintos.
  <div style="text-align: center;">
    <img src="PNGs/image-12.png" width="500">
  </div>

- __Atributo__: propiedad de una entidad; esa propiedad tiene un valor en un __dominio__: _conjunto de valores permitidos para cada atributo_.
  - Atributos __Simples__: atributos hoja, no se siguen descomponiendo.
  - Atributos __compuestos__: atributos rama, se siguen descomponiendo.
  - Atributos __uni-valorados__: toman un valor.
  - Atributos __multi-valorados__: pueden tomar varios valores.
  - Atributos __derivados__: pueden computarse de otros atributos.

- __Clave__: Es un subconjunto del conjunto de atributos comunes en una colección de entidades, que permite identificar inequívocamente cada una de las entidades pertenecientes a dicha colección. Asimismo, permiten distinguir entre sí las relaciones de un conjunto de relaciones.
Dentro de los conjuntos de entidades existen los siguientes tipos de claves:
  - __Superclave de un CE__: conjunto de uno o más atributos cuyos valores unívocamente determinan cada entidad.
  - __Clave candidata (CC) de un CE__: superclave minimal (i.e. si se quita atributo dejamos de tener superclave). Una clave candidata no necesariamente tiene cardinalidad mínima.
  - __Clave primaria__: Aunque varias claves candidatas pueden existir, una de las claves candidatas es seleccionada para ser la clave primaria. No necesariamente es la de menor cantidad de atributos.
  > __Notación__: Se indican los atributos de una clave primaria para un esquema de relación R __subrayando__ los atributos de R que forman la clave primaria.

<div style="text-align: center;">
    <img src="PNGs/image-0.png" width="600">
</div>

## Restricciones en CR's

### Correspondencias de Cardinalidades

Propósito: Diagramar conjuntos de relaciones binarios.
Sea R un CR de CE's E1 a CE's E2:

- __CR uno-uno__: Todas las entidades de E1 están asociadas con a lo sumo una entidad de E2 via R. Y viceversa.
- __CR uno-varios__: Existe alguna entidad de E1 asociada con al menos dos entidades de E2 via R. Todas las entidades de E2 están asociadas con a lo sumo una entidad de E1 via R.
- __CR varios-uno__:  Todas las entidades de E1 están asociadas con a lo sumo una entidad de E2 via R. Existe alguna entidad de E2 asociada con al menos dos entidades de E1 via R.
- __CR varios-varios__: Existe alguna entidad de E1 asociada con al menos dos entidades de E2 via R. Y viceversa.

> __Obs:__ En todos los casos pueden existir elementos pertenecientes a E1 que no están mapeados con elementos de E2 y viceversa.
>
> __Notación__: 
> <div style="text-align: center;">
>   <img src="PNGs/image-8.png" width="500">
> </div>
>
> __Notación de intervalos o de cardinalidades__: [a..b] o [a..*] 
> <div style="text-align: center;">
>   <img src="PNGs/image-11.png" width="700">
> </div>
> Notar que el lugar donde se pone la información es al revés (o sea, del otro lado) que en correspondencia de cardinalidades.

### Restricciones de participación

Dado un conjunto de relaciones R en el cual participa un conjunto de entidades A, dicha participación puede ser de dos tipos:

- __Participación total__: (indicada por línea doble) toda entidad en el conjunto de entidades participa en al menos una relación en el conjunto de relaciones.
  <div style="text-align: center;">
    <img src="PNGs/image-9.png" width="600">
  </div>

- __Participación parcial__: (indicada por línea simple) algunas entidades no participan en alguna relación en el conjunto de relaciones.
  <div style="text-align: center;">
    <img src="PNGs/image-10.png" width="500">
  </div>

## Entidades fuertes y débiles
Cuando una entidad participa en una relación puede adquirir un papel fuerte o débil. Una entidad débil es aquella que no puede existir sin participar en la relación; es decir, aquella que no puede ser unívocamente identificada solamente por sus atributos.

Una entidad fuerte (también conocida como entidad regular) es aquella que sí puede ser identificada unívocamente. En los casos en que se requiera, se puede dar que una entidad fuerte "preste" algunos de sus atributos a una entidad débil para que esta última se pueda identificar.

__Conjunto de Entidades Débiles__: Es un CE que no tiene una clave primaria en el conjunto de sus atributos.
  Se representa con rectángulo de borde doble.
  Su existencia depende de la existencia de al menos un CE (un CE puede ser débil de varios CE fuertes) fuerte llamado __CE identificador__.
  Hay un CR varios-uno entre CE débil y CE identificador, donde el CE débil tiene participación total.
  - A este CR se le llama CR de identificación.
  - El mismo se representa con un diamante doble.
  El __discriminador__ de un CE débiles es un conjunto de atributos que
    - Permite distinguir entre todas las entidades de un CE débiles asociadas a la misma entidad fuerte.
    - Los atributos del discriminador se subrayan con línea de guiones
  La __clave primaria__ de un CE débiles se forma con la clave primaria del CE identificador más el discriminador del CE débiles.


## Especialización-Generalización

__Especialización__: hace referencia a un proceso de diseño descendiente (top-down) donde designamos __subgrupos__ dentro de un CE que son distintivos de otras entidades en el CE.

Estos subgrupos son CE de más bajo nivel que
  - tienen atributos específicos (adicionales a los atributos del CE del que se saca el subgrupo), o
  - participan de CR que no aplican al CE de más alto nivel.

Una especialización se denota con un triángulo etiquetado ISA o ES, se llama también relación de superclase – subclase.

__Herencia de atributos__: un CE de más bajo nivel hereda:
  - todos los atributos,
  - la clave primaria, y
  - participaciones en CR del CE de más alto nivel con el cual está relacionado.

__Generalización__: hace referencia a un proceso de diseño ascendiente (bottom up) que generaliza unos cuantos CE que comparten las mismas propiedades en un CE de más alto nivel.

__Restricciones de integridad__:
  - Para indicar si una entidad pertenece o no a más de un CE de nivel más bajo dentro de la generalización.
    - Disjunto: una entidad puede pertenecer a solo un CE de nivel más bajo. Usar palabra reservada disj.
    - Solapado: una entidad puede pertenecer a más de un CE de nivel más bajo.
  - __Restricción de completitud__: para indicar si una entidad en el CE de nivel más alto debe pertenecer a al menos uno de los CE de nivel más bajo en la generalización.
    - Total: una entidad debe pertenecer a un CE de nivel más bajo (usar línea doble para indicarlo).
    - Parcial: una entidad puede no pertenecer a un CE de nivel más bajo

## Reglas de Reducción a Esquemas Relacionales

- __Un CE fuerte que no involucra atributos compuestos ni atributos multi-valorados__ se mapea a un esquema relacional con los mismos atributos.
  - La clave primaria del CE se convierte en la clave primaria del esquema relacional.
  <div style="text-align: center;">
    <img src="PNGs/image-6.png" width="400">
  </div>

- __Un CE fuerte que no involucra atributos/subatributos multivalorados__ se mapea a un esquema relacional con los mismos atributos simples y los subatributos hoja de los atributos compuestos. Cada valor del atributo multivalorado mapea a una tupla separada en la tabla del esquema EM.
  - Solo nos quedamos con los atributos simples/hojas y eliminamos los compuestos/ramas.
  <div style="text-align: center;">
    <img src="PNGs/image-5.png" width="400">
  </div>

- __Un atributo multivalorado M simple de un CE__ E es representado por un esquema separado EM.
  - EM tiene atributos correspondientes a la clave primaria de E y un atributo correspondiente al atributo multivalorado M.
  - Todos los atributos de EM forman su clave primaria.
  - Se pone una restricción de clave foránea desde EM que referencia a la clave primaria de E.
  <div style="text-align: center;">
    <img src="PNGs/image-7.png" width="400">
  </div>

- __Los atributos derivados__ no son explícitamente representados en el modelo de datos relacional. Si se los necesita, una forma de computarlos es por medio de consultas.

- __Un CR varios-varios__ es representado con un esquema con atributos para las claves primarias de los dos CE participantes y todos los atributos descriptivos del CR (que no son multivalorados).
  - La clave primaria del esquema del CR es la unión de las claves primarias de los CEs que participan en el CR.
  - Para cada CE que participa en el CR se crea restricción de clave foránea que referencia clave primaria de CE.
  <div style="text-align: center;">
    <img src="PNGs/image-13.png" width="400">
  </div>

- __Un CR varios a uno o uno a varios que es total en el lado varios__ puede ser representado agregando atributos extra en el CE del lado varios, conteniendo la clave primaria del lado uno.
  - La clave primaria del CR es la clave primaria del CE del lado varios.
  - Se crea restricción de clave foránea de CR que referencia a clave primaria de CE de lado varios.
  - Si la participación es parcial en el lado varios, aplicar la regla anterior puede resultar en valores nulos. Esto sucede cuando a una entidad del CE del lado varios no le corresponde ninguna entidad del CE del lado uno.
  <div style="text-align: center;">
    <img src="PNGs/image-14.png" width="500">
  </div>

- __Un CR uno a uno con participación total en ambos lados__ puede ser mapeado agregando al esquema resultante de traducir uno de los CE participantes los atributos de la clave primaria del otro CE.
  - La clave primaria de cualquier CE puede ser elegida como la clave primaria del CR.
  - Se crea restricción de clave foránea de esquema relacional asociado al CR que referencia clave primaria de otro CE (el que no se tomo de base para hallar el esquema asociado al CR).
  <div style="text-align: center;">
    <img src="PNGs/image-15.png" width="600">
  </div>

- __Un CE débiles__ se mapea a una tabla que incluye columnas para la clave primaria del CE identificador más los atributos (no multivalorados) del CE débiles (achatando jerarquías de atributos compuestos si es necesario).
  - La clave primaria del CE identificador más el discriminador del CE débil forman la clave primaria del esquema relacional de la traducción.
  - Para atributos de esquema de CE débil que provienen de CE identificadora se agrega restricción de clave foránea desde esquema de CE débil a CE identificador.
  - El CR identificador no se mapea.
  <div style="text-align: center;">
    <img src="PNGs/image-16.png" width="500">
  </div>

- __Cuando el CE generalización no está relacionado con otros CE__ hay tres posibles guias:

1. __Si es una generalización total y disjunta__: Formar una tabla para cada CE especialización con los atributos locales y heredados; no formar tabla para la generalización.
  <div style="text-align: center;">
    <img src="PNGs/image-17.png" width="700">
  </div>

2. __Si es una generalización no total y disjunta__: Formar una tabla para cada CE especialización con los atributos locales y heredados del CE generalización.
    - No va a haber redundancia entre los CE especializaciones.
    - No hay que consultar dos tablas para obtener toda la información de una especialización.
  <div style="text-align: center;">
    <img src="PNGs/image-18.png" width="700">
  </div>

3. __Si es una generalización no disjunta__: Formar una tabla para el CE de nivel más alto (la generalización); Formar una tabla para cada CE especialización que incluye la clave primaria del CE generalización y los atributos locales.
  <div style="text-align: center;">
    <img src="PNGs/image-19.png" width="700">
  </div>


## Diseño relacional

Es un método para estructurar una base de datos, a partir de un modelado E/R, utilizando relaciones (o tablas) que representan los datos y sus relaciones. 
Cada tabla tiene un nombre único, filas (tuplas o registros) y columnas (atributos), y las tablas pueden estar vinculadas a través de claves (primarias y foráneas).
Es una implementación lógica del modelo E/R, centrándose en el esquema real (tablas y relaciones) y aplicando restricciones. 

__Esquema relacional__: lista de nombres de atributos (Nombre esquema = lista de atributos).
__Instancia__: Datos que se almacenan en tablas para los esquemas de la misma.
Las columnas representan atributos (o propiedades) para los elementos de la tabla (tuplas).

<div style="text-align: center;">
    <img src="PNGs/image-1.png" width="500">
</div>

> __Notación__: __r(R)__ significa r es una relación con esquema de relación R. O sea, las columnas de r tienen como nombres los atributos de R.

__Dominio del atributo__: conjunto de valores permitidos para cada atributo.
Los valores de los atributos deben ser __atómicos__ (indivisibles).
O sea que en las consultas o restricciones de integridad no vamos a dividir el valor de un atributo en partes. Simplificando la descripción de consultas o restricciones de integridad.

__Superclaves__: Sea K ⊆ R , R esquema de relación; K es una superclave de R si los valores para K son suficientes para identificar una tupla única en cada posible relación r(R).

__Clave candidata__: Una superclave K __minimal__. Para todo atributo de K si se lo quito a K dejo de tener una superclave.

__Clave primaria__: La clave candidata elegida.
> __Notación__: Se indican los atributos de una clave primaria para un esquema de relación R __subrayando__ los atributos de R que forman la clave primaria.

__Restricción de clave foránea (o de integridad referencial)__: Los valores de uno o más atributos en una tupla de la __relación referenciante__ aparecen en uno o más atributos de una tupla en la __relación referenciada__. Los atributos referenciados de la relación referenciada suelen formar una __clave candidata__ del esquema de la relación referenciada.

<div style="text-align: center;">
    <img src="PNGs/image-2.png" width="500">
</div>

__Redundancia de datos__: Repetición/duplicación de datos que son el mismo y por lo tanto mantenerse iguales. Debemos diseñar un esquema de la BD que no contenga redundancia de
datos. __Una solución__: Obtener un buen diseño descomponiendo el esquema que contiene todos los atributos en esquemas más chicos. La __teoría de normalización__ trabaja con esta idea y trata con cómo diseñar buenos esquemas de BD relacionales.

__Criterios para tener un diseño de calidad:__

- Evitar problemas de redundancia de información.
- Evitar problemas de comprensibilidad.
- Evitar problemas de incompletitud como:
  - Restricciones de integridad incompletas.
  - Relaciones entre atributos no contempladas por esquemas de BD.
- Evitar problemas de ineficiencia como:
  - Chequeo ineficiente de restricciones de integridad.
  - Consultas ineficientes por tener un esquema inadecuado de BD.

### Proceso de diseño

__Fases__:
1. Identificar el esquema universal K.
2. A partir de K y para el problema actual definir un conjunto de restricciones de integridad I, que servirán de guía para hacer un buen diseño.
3. Se aplica un algoritmo llamado de normalización que calcula un esquema de BD relacional a partir de K y de I.
<div style="text-align: center;">
    <img src="PNGs/image-20.png" width="500">
</div>

> La __teoría de normalización__ estudia cómo descomponer esquemas universales para eliminar sus problemas.
> No se enfoca principalmente en modelado o diseño; sino en encontrar las restricciones de integridad necesarias (i.e. dependencias funcionales) y el esquema universal.

#### 1) Esquema universal

__Esquema universal__: Es el conjunto de todos los atributos (atómicos) del problema actual.
Usualmente tiene problemas de calidad, como redundancia de información. Por lo que se debe descomponer el esquema universal para eliminarlos.

__Descomposición__: Sea \( R \) un esquema de relación. Un conjunto de esquemas de relación \( \{ R_1, \ldots, R_n \} \) es una descomposición de \( R \) si y solo si \( R = R_1 \cup \ldots \cup R_n \).

1. El esquema \( R \) tiene atributos redundantes \( J \).
2. Encontramos la propiedad del tipo \( K \to J \).
3. Usamos \( K \to J \) para descomponer \( R \) en: \( K \cup J \) y \( R_1 = R - J \).

__\( A \to B, C, ... \) (determinacion)__: Sea \( R \)  una relacion con valores redundantes \( J \)  que se pueden inferir por un valor \( K \) , se dice que un valor de \( K \)  __determina unívocamente__ uno o mas valores de \( J \)  si se puede descomponer eliminando la redundancia y lo indicamos de la siguiente forma: \( A \to B, C, ... \).

__Dependencias funcionales__: Propiedades del tipo \( \alpha \to \beta \), con \( \alpha \) y \( \beta \) conjuntos de atributos.
En otras palabras, \( \alpha \) es un determinante funcional de \( \beta \) si para cada valor de \( \alpha \) en una tabla, hay un único valor posible correspondiente de \( \beta \).

#### 2) Conjunto de restricciones de integridad

Una vez que tenemos el esquema universal \( K \), el siguiente paso es definir un conjunto de restricciones de integridad \( I \) para el conjunto de tablas legales.

__Restricciones de integridad__: Reglas que el esquema de la base de datos debe cumplir para asegurar la consistencia y validez de los datos.
- Pueden incluir:
  - Dependencias Funcionales (DFs),
  - Reglas de Integridad de Entidad: Cada entidad debe tener una clave primaria única,
  - Reglas de Integridad Referencial: Las claves foráneas deben hacer referencia a claves primarias válidas en otras relaciones.
- Necesitan ser chequeadas cada vez que cambia la base de datos. Y esto tiene su costo computacional. Cuantas menos restricciones de integridad necesiten ser chequeadas, mejor.

__Tablas legales__: Tablas con las que la empresa quiere poder trabajar; donde las tuplas cumplen con ciertas propiedades obligatorias (reglas y restricciones definidas por el negocio o la aplicación)  y tienen significado dentro del contexto del problema que está modelando la base de datos.

Sea \( R \) un esquema relacional, \( \alpha \subseteq R \) y \( \beta \subseteq R \). La dependencia funcional \( \alpha \to \beta \) se cumple en \( R \) si y solo si, para todas las relaciones legales \( r(R) \), cada vez que dos tuplas \( t_1 \) y \( t_2 \) de \( r \) coinciden en los atributos \( \alpha \), también coinciden en los atributos \( \beta \). Formalmente:

\[
t_1[\alpha] = t2[\alpha] \implies t_1[\beta] = t_2[\beta]
\]

> No necesito dar todas las DF que se cumplen en el problema del mundo real, debido al costo computacional de las restricciones de integridad, __necesito un subconjunto de las DF lo menor posible tal que todas las demás DF se puedan derivar de ese subconjunto__.

__Trivialidad__: \(\alpha \to \beta\) es __trivial__ si y solo si \( \beta \subseteq \alpha \).


__Axiomas de Armstrong__: (Conjunto de reglas de inferencia al derivar)
  1. __Reflexividad__: Si \( \beta \subseteq \alpha \), entonces \( \alpha \to \beta \).
  2. __Aumentatividad__ (o Augmentación): Si \( \alpha \to \beta \), entonces \( \gamma\alpha \to \gamma\beta \) para cualquier conjunto de atributos \( \gamma \).
  3. __Transitividad__: Si \( \alpha \to \beta \) y \( \beta \to \gamma \), entonces \( \alpha \to \gamma \).

y se puede inferir de ellas las siguientes:
  - __Unión__: Si \( \alpha \to \beta \) y \( \alpha \to \gamma \), entonces \( \alpha \to \beta \gamma \).
  - __Descomposición__: Si \( \alpha \to \beta \gamma \), entonces \( \alpha \to \beta \) y \( \alpha \to \gamma \).
  - __Pseudotransitividad__: Si \( \alpha \to \beta \) y \( \gamma \beta \to \delta \), entonces \( \alpha \gamma \to \delta \).


__\( F \vdash f \) (deduccion)__: Indica que \( f \) se deduce de \( F \).
Dado un esquema relacional \( R \), una dependencia funcional \( f \) con atributos en \( R \) se deduce de un conjunto de dependencias funcionales \( F \) con atributos en \( R \) si existe una lista de dependencias funcionales \( f_1, f_2, \ldots, f_n \) tales que \( f_n = f \) y para todo \( 1 \leq i \leq n \):

1. \( f_i \in F \), o
2. \( f_i \) se obtiene aplicando la regla de reflexividad, o
3. \( f_i \) se obtiene aplicando las propiedades de aumentatividad o transitividad a pasos anteriores en la lista.

__F+ (Cierre (o clausura) de un conjunto de DFs F)__: todas las dependencias que se deducen de F. Sirve para:
- Calcular F+ y ver si f está en F+; Si está, no se agrega a F; Si no está, hay que agregarla.
  > En la práctica, calcular la clausura \( F^+ \) suele ser inviable debido al gran número de atributos en un esquema universal. Una razón es que para un conjunto de atributos \( \alpha \), existen \( 2^{|\alpha|} \) dependencias triviales. Además, si \( \alpha \to \beta \) está en \( F \), hay \( 2^{|R|} \) maneras de aplicar la aumentatividad a \( \alpha \to \beta \) (donde \( R \) es el esquema universal) y algunas de estas aplicaciones ni cambiarán el resultado.
- Intentar deducir f de F y si lo logramos: no se agrega f a F. 
  > Si no lo logramos no quiere decir que no se pueda, no nos dice nada.
- Para saber si \( \alpha \to \beta \) es deducible de \( F \). Si tenemos las dependencias de \( F^+ \) con el lado izquierdo \( \alpha \), este conjunto es mucho más pequeño que \( F^+ \) (porque hay \( 2^n \) tales \( \alpha \)).
Por lo tanto, para responder si \( F \vdash \alpha \to \beta \), podríamos contestar \( \alpha \to \beta \in \{ \alpha \to \phi \mid F \vdash \alpha \to \phi \} \).
- Para obtener solo el conjunto de dependencias funcionales \( \alpha \to A \) (deducibles de \( F \)) donde \( A \) es un atributo:
  1. Primero, consideramos el conjunto \( \{ A \in R \mid F \vdash \alpha \to A \} \). Esto representa todos los atributos \( A \) que están relacionados con \( \alpha \) mediante una dependencia funcional deducida de \( F \).
  2. Si se cumple que \( \beta \subseteq \{ A \in R \mid F \vdash \alpha \to A \} \), entonces, aplicando la regla de unión finitas veces a todos los atributos de \( \beta \), obtenemos que \( F \vdash \alpha \to \beta \).
  - De esta manera, llegamos a un conjunto conocido como __cierre de un conjunto de atributos__, que es el conjunto a la derecha de la inclusión.

__\( \alpha^+_F \) (cierre de \( \alpha \) bajo \( F \))__: Sea \( R \) el esquema universal y \( F \) el conjunto de dependencias funcionales del problema del mundo real (con atributos en el esquema universal). Sea \( \alpha \subseteq R \). El cierre de \( \alpha \) bajo \( F \) se define como:

\[ \alpha^+_F = \{ A \in R \mid F \vdash \alpha \to A \} \]

__Proposición__:
  1. \( F \vdash \alpha \to \alpha^+_F \)
     - __Prueba__: Esta proposición se demuestra aplicando la regla de unión finitas veces.
  2. \( F \vdash \alpha \to \beta \) si y solo si \( \beta \subseteq \alpha^+_F \)
   
Para decidir si es util agregar \( \alpha \to \beta \) a \( F \) (osea, no es redundante, agrega nueva información), utilizamos la proposición anterior:
  1. Si \( \beta \subseteq \alpha^+_F \): La respuesta es sí; por lo tanto, no es necesario agregar \( \alpha \to \beta \) a \( F \).
  2. Si no, \( \alpha \to \beta \) no se deduce de \( F \), por lo tanto, agregamos \( \alpha \to \beta \) a \( F \).
  - Entonces, Se necesita un algoritmo para calcular \( \alpha^+_F \).
  <div style="text-align: center;">
      <img src="PNGs/image-21.png" width="500">
  </div>

__Superclave__: Dado un esquema relacional \( R \) y un conjunto de dependencias funcionales \( F \), un conjunto de atributos \( \alpha \) es una superclave de \( R \) si y solo si \( \alpha \to R \) está en \( F^+ \).

__Clave Candidata__: Un conjunto de atributos \( \alpha \) es una clave candidata de \( R \) si y solo si:
- \( \alpha \) es una superclave de \( R \).
- Para todo atributo \( A \) en \( \alpha \), el conjunto \( \alpha - \{A\} \) no es una superclave de \( R \).

__Verificación de Superclave__:
- Para verificar que \( \alpha \) es una superclave de \( R \):
  - Calcula \( \alpha^+ \) (el cierre de \( \alpha \) bajo \( F \)).
  - Chequea si \( \alpha^+ \) contiene todos los atributos de \( R \).

Si \( R \) es un esquema con redundancia de información en un conjunto de atributos \( \beta \) y la dependencia funcional \( \alpha \rightarrow \beta \) (donde \( \alpha \) y \( \beta \) son disjuntos) se cumple en \( R \):

- Si \( \alpha \) no determina todos los atributos de \( R \),
  - La dependencia \( \alpha \rightarrow \beta \) puede ser usada para eliminar redundancia de información por medio de la descomposición de \( R \):
  - Para eliminar la redundancia de información, se saca \( \beta \) de \( R \) y se crea un esquema con los atributos de \( \alpha \cup \beta \).
  - Al hacer esto, desaparece la redundancia de información para los atributos de \( \beta \).
- Si \( \alpha \rightarrow \beta \) es no trivial, y \( \alpha \) no determina todos los atributos de \( R \):
  - Entonces existen 2 tuplas distintas de \( R \) que coinciden en \( \alpha \).
  - Entonces para esas tuplas se van a repetir los valores de \( \beta \).
  - Por lo tanto, tenemos redundancia de información en esas tuplas para los atributos de \( \beta \), a menos que \( \beta \) sea clave candidata para el conjunto de atributos de un concepto del problema.
- Sea \( R \), \( F \) (conjunto de dependencias funcionales). Decir que \( \alpha \) no determina todos los atributos de \( R \) es lo mismo que decir:
  - Que \( \alpha \rightarrow R \) no se deduce de \( F \).
  - O, equivalentemente, que \( \alpha \) no es superclave de \( R \).
- Juntando todo, consideramos las dependencias \( \alpha \rightarrow \beta \) que cumplen:
  - \( \alpha \rightarrow \beta \) es no trivial, y
  - \( \alpha \) no es superclave de \( R \).

#### 3) Normalizacion

Un esquema \( R \) está en __Forma Normal de Boyce-Codd (FNBC)__ con respecto a un conjunto \( F \) de dependencias funcionales (DFs) si para todas las DFs en \( F^+ \) de la forma \( \alpha \rightarrow \beta \), donde \( \alpha \subseteq R \) y \( \beta \subseteq R \), al menos una de las siguientes propiedades se cumple:

- \( \alpha \rightarrow \beta \) es trivial (i.e., \( \beta \subseteq \alpha \)).
- \( \alpha \) es una superclave de \( R \) (i.e., \( \alpha \rightarrow R \in F^+ \)).

Es decir, cumple la propiedad de no tener redundancia de información proveniente de DFs. La propiedad expresa la negación de la existencia de DFs que cumplen: \( \alpha \rightarrow \beta \) es no trivial, y \( \alpha \) no es superclave de \( R \) .

Sea \( R \) el esquema universal, \( F \) el conjunto de dependencias funcionales. Una descomposición \( \{ R_1, \dots, R_n \} \) de \( R \) está en FNBC con respecto a \( F \) si y solo si cada \( R_i \) está en FNBC con respecto a \( F \).

__¿Cómo comprobar que un esquema \( R \) con respecto a \( F \) no está en FNBC?__

- Una DF de \( F^+ \) que no cumple la condición de FNBC se llama __violación__ o __DF testigo__.
  - Es una DF \( \alpha \rightarrow \beta \) no trivial en \( F^+ \) tal que \( \alpha \rightarrow R \notin F^+ \).
  
- Para probar que \( R \) no está en FNBC con respecto a \( F \), basta con encontrar una DF testigo en \( F^+ \).
  - A veces (pero no siempre) la DF testigo está en \( F \).

__¿Cómo comprobar que un esquema \( R \) con respecto a \( F \) está en FNBC?__

Chequear todos los \( \alpha \rightarrow \beta \) de \( F^+ \) con atributos en \( R \) es demasiado costoso.

__Comprobación de FNBC__: Sea \( R_U \) universal, con DFs \( F \) y sea \( R_i \) que forma parte de la descomposición de \( R_U \); para probar que \( R_i \) está en FNBC se puede hacer la siguiente comprobación:

  \[
  \forall \alpha \subseteq R_i : \alpha^+ \cap (R_i - \alpha) = \emptyset \vee R_i \subseteq \alpha^+
  \]

La primera condición del V significa: todas las DF con lado izquierdo \( \alpha \) son triviales.

__Prueba:__

- Supongamos que \( R_i \) está en FNBC y \( \neg (R_i \subseteq \alpha^+) \):
  - Toda \( \alpha \rightarrow \beta \) en \( F^+ \) con atributos en \( R_i \) es trivial.
  - Esto implica que para todo \( \beta \): \( \beta \cap (R_i - \alpha) = \emptyset \)
  - Se obtiene: \( \alpha^+ \cap (R_i - \alpha) = \emptyset \) (tomando \( \beta = \alpha^+ \))
  - Luego se cumple: \( \forall \alpha \subseteq R_i : \alpha^+ \cap (R_i - \alpha) = \emptyset \vee R_i \subseteq \alpha^+ \)

- Supongamos que \( \forall \alpha \subseteq R_i : \alpha^+ \cap (R_i - \alpha) = \emptyset \vee R_i \subseteq \alpha^+ \):
  - Sea \( \alpha \rightarrow \beta \) en \( F^+ \) con atributos en \( R_i \) y \( \neg (R_i \subseteq \alpha^+) \)
  - Entonces se tiene que \( \beta \subseteq \alpha^+ \)
  - Entonces: \( \beta \cap (R_i - \alpha) \subseteq \alpha^+ \cap (R_i - \alpha) = \emptyset \)
  - Luego \( \beta \subseteq \alpha \) y \( \alpha \rightarrow \beta \) es trivial.

Si \( \alpha \subseteq R_i \) viola la condición:

\[ \forall \alpha \subseteq R_i : \alpha^+ \cap (R_i - \alpha) = \emptyset \vee R_i \subseteq \alpha^+ \]

entonces la siguiente dependencia funcional es testigo:

\[ \alpha \rightarrow \alpha^+ \cap (R_i - \alpha) \]


__Algoritmo de normalización en FNBC__

Sea R esquema universal, F conjunto de DFs halla una descomposicion de R que está en FNBC.

  <div style="text-align: center;">
      <img src="PNGs/image-22.png" width="500">
  </div>

Algunas aclaraciones sobre el algoritmo anterior si se implementa automáticamente:
- Para buscar un esquema que no está en FNBC, se puede usar el algoritmo de comprobación de que un esquema está en FNBC:
\[ \forall \alpha \subseteq R_i : \alpha^+ \cap (R_i - \alpha) = \emptyset \vee R_i \subseteq \alpha^+ \]

- Este algoritmo encontrará un \( \alpha \) que no cumple la condición. A partir de ese \( \alpha \), se puede obtener la dependencia funcional testigo:
\[ \alpha \rightarrow \alpha^+ \cap (R_i - \alpha) \]


## Lenguajes de Consultas

__Consulta__: en una base de datos es una expresión que describe una colección de datos deseada. Para expresar consultas se usan __lenguajes de consulta__.

Para consultar los datos en modelo relacional es muy usado en la industria
el lenguaje de consultas SQL.

Para el modelo relacional existen lenguajes de consulta puros como
álgebra relacional, cálculo de tuplas, etc.
__álgebra de tablas__: variación más expresiva del álgebra relacional

__sistema gestor de BD (SGBD) relacionales__: se compone de Gestor de almacenamiento, Procesamiento de consultas y Gestor de transacciones.

## Gestión del almacenamiento

Los datos deben ser organizados en archivos con estructuras apropiadas
de modo que su acceso, modificación y retorno sea eficiente.
• A nivel físico se explica cómo los registros de datos son almacenados en
archivos.
• Para acceso, modificación y almacenamiento eficiente a los datos se
pueden usar índices (unas estructuras de acceso especiales).
• A nivel lógico se describen los datos almacenados en la BD y las relaciones
entre ellos.
• El gestor de almacenamiento provee una interfaz para los datos a nivel
físico para ser usada por los programas de aplicación y consultas enviadas
al sistema. Se ocupa de: acceso al almacenamiento, organización en
archivos de los datos, indexado.

## Procesamiento de consultas

El sistema gestor de BD procesa consultas para el modelo relacional.

1. Parseo de la consulta y su traducción (p.ej. a álgebra relacional o álgebra de tablas)
2. Optimización: Encontrar la manera “más eficiente” (o plan) para obtener la información descrita por la consulta.
3. Evaluación (siguiendo el plan optimizado)
<div style="text-align: center;">
    <img src="PNGs/image-3.png" width="400">
</div>

## Transacciones

> __Preguntas importantes__:
> o ¿Qué pasa si falla el SGBD?
> o ¿Qué pasa si más de un usuario actualiza concurrentemente los mismos datos?

__Transacción__: una colección de operaciones que realiza una función lógica simple en una aplicación de BD. Una transacción es una unidad de ejecución que accede y posiblemente actualiza varios ítems de datos. Son __atómicas__ (i.e: o todas las operaciones de la transacción son reflejadas en la BD o ninguna lo es).


__Componente de manejo de transacciones__: asegura que BD permanezca en un estado consistente (correcto) a pesar de fallas del sistema (e.g. fallas de energía, caídas de sistema operativo) y fallas de transacciones.

__Planificaciones__: secuencias que indican el orden cronológico en el cual las instrucciones de transacciones concurrentes son ejecutadas.

__Gestor de concurrencia de transacciones__: controla la interacción entre transacciones concurrentes para asegurar la consistencia de la BD.

## Retorno de la información

__Retorno de la información__: proceso de retornar documentos a partir de una colección de documentos en respuesta a una consulta. Los documentos suelen estar en lenguaje natural no estructurado. Los resultados de una búsqueda pueden ser una lista de identificadores de documentos y también algunas piezas de texto. Los documentos suelen retornarse en orden decreciente de puntaje de relevancia.

__Sistemas de retorno de información (SRI)__: típicamente permiten expresiones de consulta formadas usando palabras clave y conectivos proposicionales.

Sistemas de retorno de la información que trabajan con colecciones de archivos almacenados en una PC.
Sistemas de retorno de la información que trabajan con la búsqueda en la web

## Bot de chat conversacional inteligente

__Bot de chat conversacional inteligente__: aplicación de software que usa la Inteligencia Artificial (IA) y el Procesamiento de Lenguaje Natural (PLN) para comprender los requerimientos de un ser humano y ayudarlo a cumplirlos.  Los bots de chat de texto solo se comunican a través de palabras
escritas. Los bots de chat multimedia, pueden incluir además de
texto otras medias como imágenes, videos, voz.

Los bots de chat conversacionales de texto funcionan a partir de
consultas claras y concisas llamadas prompts.
• Para obtener las mejores respuestas se deben diseñar buenos
prompts y para eso se recomienda seguir una cierta estructura para
su construcción que estudiaremos en clase.
• También estudiaremos la base de los bots de chats de texto que son:
procesamiento de lenguaje natural, modelos grandes de lenguaje,
arquitectura de motores de chat.