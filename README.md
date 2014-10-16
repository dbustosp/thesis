thesis
======

Trabajo con el que se espera poder aspirar al grado de Magíster en Ingeniería Informática.

Título de la tesis de magíster: Desarrollo de estrategias de planificación para motores de búsqueda verticales.

I. Se aborda importantes conceptos de Information Retrieval.  

- Estrategias de evaluación de queries como Term at a time (TAAT) y Document at a time (DAAT)
- Se explica el concepto de ranking y se muestran algunas funciones de scoring utilizadas frecuentemente en el área de information retrieval como por ejemplo: TF-IDF y Okapi BM25.
- Operaciones sobre listas invertidas al momento de resolver una query: OR, AND y WAND. 
- También se explica el método WAND que tiene como objetivo recuperar eficientemente el conjunto de los top K documentos que mejor satisfacen una query que llega al motor de búsqueda. La paralelización de esta estrategia es parte del trabajo previo de esta tesis.

II. Se crea un predictor de tiempo de respuesta de las queries, basado en una regresión múltiple. El predictor es creado con el objetivo de hacer más eficiente la planificación de las queries que llegan al sistema de Recuperación de Información.

III. Se crean estrategias de scheduling de queries que llegan al motor de búsqueda. Se desarrolla también una estrategia base, la cual sirve de comparación.

IV. Se desarrolla un nuevo modelo de planificación basado en Unidades de Trabajo.

