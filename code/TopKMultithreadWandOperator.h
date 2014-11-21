#ifndef _TOPK_MULTITHREAD_WAND_OPERATOR_H
#define _TOPK_MULTITHREAD_WAND_OPERATOR_H

#include "TopKMultithreadOperator.h"

#include "Wand.h"
#include "WandScorer.h"

using namespace std;

class TopKMultithreadWandOperator : public TopKMultithreadOperator{

	protected:
	
		Wand **arr_wands;
		
	public:
	
		class WandThreadData{
		public:
		
			WandThreadData(){}
		
			~WandThreadData(){
				wands.clear();
			}
		
			unsigned int id;
			unsigned int k;
			vector<Wand*> wands;
		
			mutex *shared_mutex;
			double *shared_threshold;
			vector<ResultObject> *shared_res;
			vector<unsigned int> *shared_res_indices;
			ScoringComparator *shared_score_comp;
			unsigned int *shared_inserts;
		
		};
		
		double milis_threads;
		double milis_inner;
		double milis_init;
		double milis_merge;
		
		TopKMultithreadWandOperator(PartitionedInvertedIndex *_indice, map<unsigned int, unsigned int> *_mapa_docs, map<unsigned int, float> **_mapas_ubs, Scorer *_scorer, unsigned int _k = 10);
		virtual ~TopKMultithreadWandOperator();
		
		virtual void execute(QueryObject *query, vector<ResultObject*> &result);
		virtual void executeSingleThread(QueryObject *query, vector<ResultObject*> &result);
		virtual void reset();
		
		
};



#endif //_TOPK_MULTITHREAD_WAND_OPERATOR_LOCKS_H



