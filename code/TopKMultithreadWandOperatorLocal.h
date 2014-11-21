#ifndef _TOPK_MULTITHREAD_WAND_OPERATOR_LOCAL_H
#define _TOPK_MULTITHREAD_WAND_OPERATOR_LOCAL_H

#include <iostream>
#include <stdio.h>
#include <stdlib.h>
#include <vector>
#include <algorithm>
#include <pthread.h>

#include "TopKWandOperator.h"

#include "Wand.h"
#include "WandFrecs.h"
#include "WandTfidf.h"
#include "WandBM25.h"

#include "MultiListOperator.h"
#include "PartitionedInvertedIndex.h"
#include "PayloadList.h"
#include "InvertedList.h"
#include "BufferedList.h"

#include "NanoTimer.h"

using namespace std;

class TopKMultithreadWandOperatorLocal : public MultiListOperator{
	private:
		unsigned int max_terms;		
		unsigned int k;
		unsigned int max_particiones;
		PartitionedInvertedIndex *indice;
		
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
	
	Comparador *comp;
	
	//parts x terms > 256
	const static unsigned int n_buffers = 1024;
	const static unsigned int buffer_size = 256;
	unsigned int **buffers;

	public:
	
		//tiempo preparacion de threads
		double milis_init;
		//tiempo threads (desde create hasta join)
		double milis_threads;
		//tiempo merge
		double milis_merge;
		//tiempo interno del thread mas largo
		double milis_inner;
		
		unsigned int inserts;
		double initial_threshold;
		
		//Esto es estatico para los arreglos, pero el numero real de threads esta limitado por max_particiones
		static const unsigned int max_threads = 128;
	
		static double *milis_each_thread;
		
		pthread_t t[max_threads];
		int pids[max_threads];
		unsigned int *indices;
		
		//arreglo de operadores y vectores de resultados, por thread
		static TopKWandOperator **arr_ops;
		static vector<ResultObject*> **arr_results;
		
		static map<unsigned int, float> **mapas_ubs;
		
		//Este es un arreglo de punteros a cada query 
		//query_terms[thread][parte] es el puntero a ese QueryObject
		static QueryObject ***query_terms;
		
		static unsigned int partes;
		
		TopKMultithreadWandOperatorLocal(PartitionedInvertedIndex *_indice, map<unsigned int, unsigned int> *_mapa_docs, map<unsigned int, float> **_mapas_ubs, unsigned int _k = 10, unsigned int _max_terms = 128);
		~TopKMultithreadWandOperatorLocal();
		virtual void execute(QueryObject *query, vector<ResultObject*> &resul);
		
		void setInitialThreshold(double _initial_threshold){ initial_threshold = _initial_threshold;}
		unsigned int getInserts(){ return inserts;}
};

#endif