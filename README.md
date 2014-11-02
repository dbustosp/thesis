thesis
======

Trabajo con el que se espera poder aspirar al grado de Magíster en Ingeniería Informática.

Título de la tesis de magíster: Desarrollo de estrategias de planificación para motores de búsqueda verticales.

I. Se aborda importantes conceptos de Information Retrieval.  

- Estrategias de evaluación de queries como Term at a time (TAAT) y Document at a time (DAAT)
- Se explica el concepto de ranking y se muestran algunas funciones de scoring utilizadas frecuentemente en el área de information retrieval como por ejemplo: TF-IDF y Okapi BM25.
- Operaciones sobre listas invertidas al momento de resolver una query: OR, AND y WAND. 
- También se explica el método WAND que tiene como objetivo recuperar eficientemente el conjunto de los top K documentos que mejor satisfacen una query que llega al motor de búsqueda. La paralelización de esta estrategia es parte del trabajo previo de esta tesis.

II. Se desarrolla dos versiones de WAND paralelo. 
La primera utiliza heaps locales para cada thread (P threads), de esta forma cada thread resuelve la parte de la query que le corresponde  y se obtiene los top-K mejores documentos en forma local, luego un thread master hace el merge entre los P*K mejores documentos, dejando los K documentos con mejor score. 
La segunda utiliza una estrategia de heap global, donde todos los threads resuelven su parte de la query. Cada vez que se encuentra un documento con un puntaje mayor al de la punta del heap (documento con puntaje menor dentro del heap), se reemplaza este documento por el nuevo y se hace un heapify. Se debe utilizar un lock para manejar el acceso a la memoria compartida (heap y otros recursos) por parte de los threads. 

III. Se crea un predictor de tiempo de respuesta de las queries basado en datos previamente calculados desde el índice invertido. Fueron 42 variables independientes que se tomaron en cuenta, un ejemplo de esta variable es el tamaño de la lista invertida de la query. 
El predictor es creado con el objetivo de hacer más eficiente la planificación de las queries que llegan al motor de búsqueda.

IV. Se crean estrategias de scheduling de queries que llegan al motor de búsqueda. 

Se desarrolla también una estrategia base, la cual sirve de comparación. 

V. Se desarrolla un nuevo modelo de planificación basado en Unidades de Trabajo.
