# Ingeniería del Software I - Práctico N◦ 1

FaMAF, Universidad Nacional de Córdoba
Libro: An Integrated Approach to Software Engineering de Jalote

## 1. ¿Qué es la ingeniería del software?

Consiste en la aplicación de un enfoque _sistemático_, disciplinado, y _cuantificable_ al desarrollo, operación, y mantenimiento del software. Busca brindar __procesos__ de desarrollo de software que conlleven un desarrollo __productivo__ (en términos _monetarios_ y de _tiempo_) y un producto de __calidad__ (con respecto a las características del proyecto).

> _Enfoque sistemático:_ metodología y prácticas existentes para solucionar un problema dentro de un dominio determinado. Esto permite __replicar__ el proceso y da la posibilidad de __predecir__ su desarrollo (independientemente del grupo de personas que lo lleva a cabo).

---

## 2. ¿En qué difieren la ingeniería de software de otras ingenierías más tradicionales, como la ingeniería mecánica o la ingeniería civil?

- __Fallas:__ Las fallas en software son mas frecuentes (lo que hace poco confiable al software) y no son en general consecuencia del uso y el deterioro. Ocurren como consecuencia de errores (o “bugs”) introducidos durante el desarrollo, existen desde el comienzo, sólo que se manifiestan tarde.
- __Cambios en producción:__ En producción se puede cambiar fácilmente (fácilmente != sin efectos secundarios no deseados) la semántica de los productos de software para corregir errores, mejorar el producto o adaptarlo a cambios en el entorno. Los productos de software suelen ser _interdependientes_ entre si directa o indirectamente, al ser cambiantes muchas veces el software de un producto debe actualizarse por cambios en el entorno del que depende, lo que causa un ciclo de cambios entre productos de software.

## 3. Si el objetivo principal es hacer al software mantenible, liste algunas de las cosas que usted haría y algunas de las cosas que no haría durante la implementación y el testing

### Haría

- Código entendible y practico (modular,...), hecho para ser leído.
- Separar en componentes las partes del proyecto y basado en ello, el código en carpetas y archivos.
- Documentar el código.
- Testear antes de subir un nuevo cambio.

### No haría

- Lo contrario a lo anterior.

## 4. Liste algunos de los problemas que surgirán si los métodos que usted utiliza para desarrollar aplicaciones pequeñas son utilizados para desarrollar grandes aplicaciones

- __Difícil búsqueda de código__ si:
  - Se utilizaron pocas y mal divididas carpetas/archivos para mucho código.
  - No se subieron commits con nombres representativos.
  _<u>Consecuencias</u>:_ Esto causa una __corrección o extensibilidad mas costosa__ del código.
- __Fallas en producción__ si:
  - No se testea bien (completo y siempre).
  - Se depende se software externo poco confiable.
  - No se utilizo programación defensiva.
    _<u>Consecuencias</u>:_ Esto causa __trabajo extra__ que suele venir con __mas presión__ para los trabajadores (lo que puede llevar a __descontento laboral__ en un contexto donde la mano de obra necesaria puede ser limitada y cara) para corregir los errores en vez de las tareas planeadas generando __retrasos__, y puede causar __perdida de clientes y ganancias__ (por coste de confianza y/u oportunidad).

## 5. Clasifique los seis atributos de calidad fundamentales mencionados en el capitulo 1

> Los atributos de calidad de software pueden clasificarse en __externos__ (observables por los usuarios del software) e __internos__ (concernientes a los desarrolladores).

Externos: Funcionalidad, confiabilidad, usabilidad, eficiencia.

Internos: Mantenibilidad, portabilidad, eficiencia.

## 6. En el capitulo 1 se explica que una medida comúnmente utilizada para la calidad es defectos por KLOC en el software entregado. Para un producto de software dado, ¿como puede medirse su calidad? ¿como puede ser estimada su calidad antes de ser entregado?

> __LOC:__ Lines Of Code

- Por tests pasados, cada uno de ellos verifica que cumple una función pedida. (funcionalidad)
- El uso satisfactorio del producto por parte de 6 usuarios al azar. (usabilidad)
- Probarlo en uso (ej: una beta) en diferentes entornos controlados o semi controlados con recursos variables probando su desempeño. (portabilidad, eficiencia y confiabilidad)
- Pedir una nueva característica no esperada y medir el tiempo y los cambios para su realización. (mantenibilidad)

##