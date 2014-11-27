class TopKMultithreadWandOperatorLocal {
	private:
		unsigned int k; // Variable que controla el tamaño del heap
		unsigned int max_particiones; // Máximo de particiones del índice invertido (se usa 16)
		PartitionedInvertedIndex *indice; // Indice invertido particionado
	
	// Clase anidada que se utiliza para ordenar los documentos dentro del heap
	class Comparador : public std::binary_function<const ResultObject*, const ResultObject*, bool> {
		public:
			Comparador(){ }
			inline bool operator()(const ResultObject *a, const ResultObject *b){
				if (a->getScore() == b->getScore()){
					return a->getDocId() > b->getDocId();
				}
				return a->getScore() > b->getScore();
			}
	};
	
	Comparador *comp; // Objeto Comparador
	
	//parts x terms > 256
	// Variables que se utilizan como buffer de las listas invertidas
	const static unsigned int n_buffers = 1024;
	const static unsigned int buffer_size = 256;
	unsigned int **buffers;

	public:
		double milis_init; //tiempo preparacion de threads antes de procesar la query
		double milis_threads; //tiempo de los threads en procesar la query (desde create hasta join)
		double milis_merge; //tiempo que se demora en el merge de documento
		double milis_inner; //tiempo interno del thread mas largo (en el proceso de paralelización)
		
		unsigned int inserts; // Variable que se utiliza para contar las inserciones de documentos al heap
		double initial_threshold; // Valor del threshold inicial
	
		static double *milis_each_thread; // Variable que se utiliza para guardar los tiempos de cuánto se demoró cada thread
		
		pthread_t t[max_threads]; // Arreglo de pthread_t para los hilos de ejecución
		int pids[max_threads]; // Arreglo donde se guardarán los identificadores de los arreglos
		unsigned int *indices; 
		
		static TopKWandOperator **arr_ops; // Arreglo de operadores. Cada uno de los threads tendrá un operador (1thread)
		static vector<ResultObject*> **arr_results; // vectores de resultados, por thread
		static map<unsigned int, float> **mapas_ubs; // Variable que mapea cada término a su upper_bound
		static QueryObject ***query_terms; //Este es un arreglo de punteros a cada query 
		
		static unsigned int partes; // Partes en la que se dividirá cada query
		
		TopKMultithreadWandOperatorLocal(PartitionedInvertedIndex *_indice, map<unsigned int, unsigned int> *_mapa_docs, map<unsigned int, float> **_mapas_ubs, unsigned int _k = 10, unsigned int _max_terms = 128);
		~TopKMultithreadWandOperatorLocal();

		// Método que se encargará de resolver la query. Los resultados quedarán en la variable result
		virtual void execute(QueryObject *query, vector<ResultObject*> &result); 
};