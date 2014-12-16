class TopKMultithreadWandOperatorLocal {
	private:
		// Variable que controla el tamaño del heap
		unsigned int k; 
		// Indice invertido particionado
		PartitionedInvertedIndex *indice; 
	
		// Clase anidada que se utiliza para ordenar los documentos dentro del heap
		class Comparador : public std::binary_function<const ResultObject*, 
							const ResultObject*, bool> {
			public:
				Comparador(){ }
				inline bool operator()(const ResultObject *a, const ResultObject *b){
					if (a->getScore() == b->getScore()){
						return a->getDocId() > b->getDocId();
					}
					return a->getScore() > b->getScore();
				}
		};

		// Objeto Comparador
		Comparador *comp; 
	

	public:		
		// Valor del threshold inicial. Controlara los documentos que deberian 
		// ser parte de los top-K. 
		double initial_threshold; 
			
		// Arreglo de pthread_t para los hilos de ejecucion
		pthread_t t[max_threads];

		// Arreglo donde se guardaran los identificadores de los arreglos
		int pids[max_threads]; 

		unsigned int *indices; 
		
		// Arreglo de operadores. Cada uno de los threads tendra un operador (1thread)
		static TopKWandOperator **arr_ops; 
		
		// Vector en donde se guardaran los resultados por thread
		static vector<ResultObject*> **arr_results; 
		
		// Variable que mapea cada termino t a su respectivo upper_bound global
		static map<unsigned int, float> **mapas_ubs; 

		// Arreglo de punteros a cada query
		static QueryObject ***query_terms;  
		
		 // Partes en la que se dividira cada query
		static unsigned int partes;
		
		// Constructor
		TopKMultithreadWandOperatorLocal(PartitionedInvertedIndex *_indice, 
			map<unsigned int, unsigned int> *_mapa_docs, 
			map<unsigned int, float> **_mapas_ubs, 
			unsigned int _k = 10, 
			unsigned int _max_terms = 128);
		
		// Destructor
		~TopKMultithreadWandOperatorLocal();

		// Metodo que se encarga de resolver la query. Los resultados 
		// quedaran en la variable result
		virtual void execute(QueryObject *query, vector<ResultObject*> &result); 
};