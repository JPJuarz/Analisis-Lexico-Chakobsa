# Analisis-Lexico-Chakobsa
#### Juan Pablo Juárez Ortiz - A01708685

## Descripción Automatas y Expresiones Regulares
**Automata**

En el área de la computación, el poder identificar y procesar diferentes lenguajes es algo fundamental y crítico por lo que en este proyecto lo que fue hecho fue desarrollar un analizador léxico cuyo objetivo es reconocer un conjunto específico de palabras pertenecientes al idioma Chakobsa. 
El lenguaje que se estudiará no corresponde a todo el idioma Chakobsa sino a una pequeña parte compuesta por 5 diferentes palabras pertenecientes a este. Estas palabras son: **mahdi, maqbara, matar, maula** y **midri**. Por esto mismo, el sistema tiene que ser capaz de aceptar solamente estas palabras y rechazar cualquier otra cadena que no coincida exactamente con estos patrones. Esto incluye lo que son entradas con letras fuera del alfabeto definido o combinaciones incorrectas de símbolos.

Para esto mismo se utilizara lo que es un autómata finito determinista (DFA) el cual es un modelo matemático utilizado para reconocer patrones dentro de cadenas de texto. Se compone de 5 diferentes componentes los cuales son un conjunto finito de estados, un alfabeto de símbolos de entrada, una función de transición, un estado inicial y un conjunto de estados de aceptación.
El funcionamiento del autómata consiste en iniciar en un estado inicial y procesar una cadena símbolo por símbolo. En cada paso, el autómata cambia de estado según la función de transición que sea definida y al finalizar la cadena, si el estado en el que termina pertenece al conjunto de estados de aceptación regresara si la cadena es aceptada o rechazada.

Formalmente, estas son las partes que definen a un DFA:
- Q: conjunto finito de estados
- q0: el estado inicial de Q
- F: el conjunto de estados de aceptación
- Σ (Sigma): el alfabeto finito o completo (Todos los símbolos válidos)
- δ (delta): la función de transición

**Expresiones Regulares**

Además del uso de autómatas, también se usará lo que es una expresión regular o Regex como una forma alternativa de representar el mismo lenguaje. Estas permiten describir patrones de una manera más compacta mediante operadores y símbolos. Existe una equivalencia directa entre los DFA y las expresiones regulares, ya que cualquier lenguaje reconocido por un autómata finito puede representarse mediante una expresión regular y viceversa. 

Finalmente, la implementación de este modelo se realizará mediante ambos python y prolog, permitiendo simular el comportamiento del autómata y validar su correcto funcionamiento a través de diferentes pruebas. De esta manera, se integran conceptos teóricos con una aplicación práctica para resolver un problema de reconocimiento de patrones dentro de un lenguaje definido.


## Contexto - Dune
El idioma utilizado para este autómata es el idioma “Chakobsa” originario de los Fremen en la novela Dune. Este es una construcción lingüística ficticia creada por Frank Herbert el cual no es un sistema completamente formal con reglas gramaticales explícitas, sino es más como un conjunto de términos, expresiones y nombres propios que reflejan la cultura, religión y entorno, los cuales todos son cosas importantes para el desarrollo de los Fremen como personajes. 
Muchas de las palabras tienen inspiración en lenguas reales, por lo que es descrito como “una lengua especializada del desierto fuertemente influenciada por el árabe antiguo” (Herbert, 2005), lo que lo hace mucho más culturalmente acertado y a la vez lo hace sentirse más expresivo o real. A través de esta lengua, Herbert justamente logra transmitir de mejor manera la identidad de los Fremen como un pueblo el cual tuvo que adaptarse a condiciones extremas y al que su manera de comunicación fue una de las herramientas más importantes para su supervivencia dentro de esas condiciones (Herbert, 2005).

## DFA
Antes de crear el DFA, utilicé la página automataverse.com como apoyo para diseñar y validar la estructura del autómata. Esta herramienta permitió construir el diagrama de estados de manera bastante más intuitiva, facilitando lo que era la identificación de las transiciones necesarias para cada una de las palabras del lenguaje y ayudándome a ver el funcionamiento de este en cuanto a el rechazo de strings. 

<img width="1844" height="986" alt="image" src="https://github.com/user-attachments/assets/f8ad7b09-f13a-4c42-af8d-0f67ddfea77d" />

Una vez hecho creado el DFA desde automataverse, pude formalizarlo en un diagrama más entendible y completo. Una característica importante del DFA construido es que no permite ningun tipo de ambigüedades. Desde cada estado sólo existe una transición posible por símbolo (hay dos excepciones en q1 y en q2). En caso de que se reciba un símbolo que no corresponde a ninguna transición definida, el autómata rechaza automáticamente la cadena.

<img width="1961" height="905" alt="image" src="https://github.com/user-attachments/assets/7c366cde-1a33-4e0b-8e0f-e3aea3ed9a29" />


## Regex
La expresión regular equivalente al autómata es:

M(idri | A(hdi | qbara | tar | ula))

Esta expresión resume de una manera mucho más resumida y compacta el lenguaje dado. Se puede observar como todas las palabras comienzan con la letra M, seguida de dos posibles estructuras: La secuencia idri, formando la palabra midri o la letra A, seguida de una de las siguientes opciones:

- hdi → mahdi
- qbara → maqbara
- tar → matar
- ula → maula

El uso de expresiones regulares permite representar el mismo conjunto de palabras sin necesidad de visualizar todos los estados del autómata, lo que puede acabar siendo más útil para validaciones rápidas.


## Implementación

La implementación del autómata se realizó a través de SWI Prolog y para confirmarla se realizó el regex en Python. Para hacer las siguientes pruebas voy a poner una lista de instrucciones para seguir:

**En Prolog**

1. Descargar o copiar codigo
2. Abrir código en VSCode (o pegarlo)
3. Descargar la extensión de Prolog 
4. Abajo en la derecha donde dice Perl, picarle y cambiarlo a Prolog
5. Guardar el codigo
6. Abrir SWI Prolog
7. Dar click en consult y seleccionar el archivo donde esta el codigo
8. Ejecutar la función parse([input list]). 

Dentro del código vienen algunos ejemplos pero aquí voy a poner todos los que deben de ser aceptados y un ejemplo de un código que debería de ser rechazado.

Aceptados
- parse([m,a,h,d,i]).
- parse([m,a,q,b,a,r,a]).
- parse([m,a,t,a,r]).
- parse([m,a,u,l,a]).
- parse([m,i,d,r,i]).

Rechazado
- parse([m,a,h,c]).
- parse([m,a,u,a,l).

**En Python**

1. Descargar o copiar codigo
2. Abrir código en VSCode (o pegarlo)
3. Correr codigo

Dentro del código igualmente vienen varios ejemplos pero también los voy a poner justo debajo.

Aceptados
- parse("mahdi")
- parse("maqbara")
- parse("matar")
- parse("maula")
- parse("midri")

Rechazados
- parse("mahd")    
- parse("matra")   


## Análisis

La complejidad temporal del DFA utilizado es O(n), donde n representa la longitud de la cadena de entrada. Esto se debe a que el autómata: Recorre la cadena una sola vez, realiza una transición por cada símbolo, cada transición toma un tiempo constante.

En comparación con otras alternativas:

Regex:
Aunque pueden representar el mismo lenguaje, su rendimiento depende del motor que las implemente. En algunos casos pueden ser menos eficientes debido al backtracking.

Autómatas no deterministas (NFA):
Son más fáciles de construir, pero su ejecución puede implicar múltiples caminos simultáneos, lo que aumenta la complejidad.

El uso de un DFA es el método más óptimo en este caso, ya que garantiza un tiempo de ejecución lineal y un comportamiento completamente determinista, lo cual justamente es ideal para análisis léxico.


## Referencias
AutomataVerse. (2026). Visualize Automata. Recuperado de https://www.automataverse.com/

Herbert, F. (2005). Dune. Ace Books.
