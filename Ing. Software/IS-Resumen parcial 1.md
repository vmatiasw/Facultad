Capítulos del libro: 1, 3, 4, 6, 7, 8
## El proceso de desarrollo en fases
Partiendo de un conjunto de ideas abstractas
1) Se transforman las ideas abstractas en una concreta a través de
	1. [Análisis, modelado y especificación de los requisitos del software](#Análisis,-modelado-y-especificación-de-los-requisitos-del-software)
	2. [Arquitectura del software (o diseño de alto nivel)](#Arquitectura-del-software-(o-diseño-de-alto-nivel))
	3. [Diseño detallado (o diseño de bajo nivel)](#Diseño-detallado-(o-diseño-de-bajo-nivel))
2) Se materializa la idea concreta en el producto final a través de
	4. [Codificación](#Codificación)
	5. [Testing](#Testing)
	6. [Entrega e instalación](#Entrega-e-instalación)
Terminando en un producto concreto y material.
**Obs**: 
- Cada fase termina con una **salida definida**.
- El motivo de separar en fases es la **==separación de incumbencias==**: cada fase manipula distintos aspectos del desarrollo de software.
- El proceso en fases permite **==verificar la calidad y progreso==** en momentos definidos del desarrollo (al final de la fase).
- Se debe tratar de no volver atrás, mas que todo a mas de una fase de distancia y de fases de 2) a 1).
- Se han propuesto varios modelos de procesos para el desarrollo de software, y cada organización usa su propia variante.
## Indice
1. [Desafíos de la Ingeniería en Software](#Desafíos-de-la-Ingeniería-en-Software)
2. [](#)
3. [](#)
4. [](#)
5. [](#)
6. [](#)
7. [Glosario](#Glosario)

9. criterios para evaluar diseño: correcciion, eficiencia, simplicidad
10. principios fundamentales
11. Fases de un proceso: fases, ¿por que esta dividido en fases?
12. actividades basicas de analisis y especificacion de requerimientos de software: analisis, especificacion, validacion
13. metodo de analisis estructurado pasos, metricas, formulas, nombres
14. SRS correcta, completa, no ambigua, consistente,....
15. estilos de arq C y C: pipe and filter y sus restriciones,...
16. nombres y explicacion breve de ATAM
17. conceptos de diseño: abierto cerrado, cohesion, acoplamiento,... tres tipos de acoplamiento, de OO y de func
18. que son diagramas de estructura
19. que son mai mao (pasos)
20. que es y para que sirve heuristica de diseño
21. metricas, que son para que sirven
22. lisckov
23. solid, mas que todo ol
24. metodologia de diseño
25. metricas OF OO
26. PDL existencia, utilidad, como surgio
27. se toma hasta codifocacion

## Desafíos de la Ingeniería en Software

1. **==Escala==**
	- Capacidad de adaptación y respuesta de un sistema para mantener su rendimiento y eficiencia en el consumo de recursos a medida que **aumenta o disminuye** de forma significativa la demanda al sistema. (ej: cuando varia significativamente la cantidad la usuarios)
	- Dos claras dimensiones a considerar:
		- Métodos de ingeniería.
		- Administración del proyecto.
2. **==Productividad==**
	-  Minimizar según las capacidades y lo buscado el costo y/o tiempo.
3. **==Calidad==** (Estándar ISO)
	-  **Funcionalidad**: Capacidad de proveer funciones que cumplen las necesidades establecidas o implicadas.
	- **Confiabilidad**: Capacidad de realizar las funciones requeridas bajo las condiciones establecidas durante un tiempo específico.
	- **Usabilidad**: Capacidad de ser comprendido, aprendido y usado.
	- **Eficiencia**: Capacidad de proveer desempeño apropiado relativo a la cantidad de recursos usados.
	- **Mantenibilidad**: Capacidad de ser modificado con el propósito de corregir, mejorar, o adaptar.
	- **Portabilidad**: Capacidad de ser adaptado a distintos entornos sin aplicar otras acciones que las provistas a este propósito en el producto.
4. **==Consistencia y repetitividad==**
	- Capacidad para asegurar que el éxito pueda repetirse, con el fin de mantener alguna consistencia en la calidad y la productividad.
	- Objetivo: la sucesiva producción de sistemas de alta calidad y con alta productividad.
	- La consistencia permite predecir el resultado del proyecto con certeza razonable. Sin consistencia sería difícil estimar costos.
5. **==Cambio==**
	- Tolerancia y modificabilidad a la hora de adaptar el sistema a los cambios de la institución, requerimientos, dependencias, ...
	- Los métodos que no permiten cambios, aún si producen alta calidad y productividad, son poco útiles.
### Desafío clave de la IS
- La IS se enfoca mayormente en el proceso para conseguir los objetivos de calidad y productividad.
- El enfoque sistemático es realmente el proceso que se utiliza.
- La IS separa el proceso para desarrollar software del producto desarrollado (i.e. el software). Es aquí donde se distingue de las otras disciplinas informáticas.
- Premisa: El proceso es quien determina, en buena medida, la C&P
	=> un proceso adecuado permitirá obtener gran C&P.
- ==Diseñar el proceso apropiado y su control== es el desafío clave de la IS.
## Glosario

**Software** (IEEE 610.12-1990): Colección de programas, procedimientos, y la
documentación y datos asociados que determinan la operación de un sistema de computación.

**Enfoque sistemático**: metodología y prácticas existentes para solucionar un problema dentro de un dominio determinado. Esto permite repetir el proceso y da la posibilidad de predecirlo (independientemente del grupo de personas que lo lleva a cabo).

**Ingeniería de Software**: aplicación de un enfoque sistemático, disciplinado, y cuantificable al desarrollo, operación, y mantenimiento del software.