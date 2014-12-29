class TopKMultithreadWandOperatorLocks : public TopKMultithreadOperator{

	protected:
		// Un objeto wand para que cada hebra resuelva la consulta
		Wand **arr_wands;
		
	public:
		// Clase anidada que administrará las variables compartidas
		class WandThreadData{
			public:
			
				WandThreadData(){}
			
				~WandThreadData(){
					wands.clear();
				}
			
				unsigned int id;
				unsigned int k;

				// Un objeto wand para cada hebra
				vector<Wand*> wands;
				
				// Controla el acceso concurrente al heap
				mutex *shared_mutex;

				// Umbral que es compartido por todos los hilos
				double *shared_threshold;

				// Vector de resultados
				vector<ResultObject> *shared_res;
				vector<unsigned int> *shared_res_indices;
				
				ScoringComparator *shared_score_comp;		
		};
				
		TopKMultithreadWandOperatorLocks(PartitionedInvertedIndex *_indice, map<unsigned int, unsigned int> *_mapa_docs, map<unsigned int, float> **_mapas_ubs, unsigned int _k = 10);
		virtual ~TopKMultithreadWandOperatorLocks();
		
		// Método que hara la resolución de la query
		virtual void execute(QueryObject *query, vector<ResultObject*> &result);
		virtual void executeSingleThread(QueryObject *query, vector<ResultObject*> &result);
		virtual void reset();		
};