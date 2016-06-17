#include "Inference.h"

void Inference::sampleConceptsInParallel(vector<shared_ptr<ClassicalConcept>> &concepts, ReasonerInstance &reasonerInstance, mt19937 &gen) {
	// TODO< parallelize this >
	for (auto iterationConcept : concepts) {
		// random numbers need to be generated before entering this

		std::uniform_real_distribution<float> distribution(0, 1);
		float randomValues[2];
		randomValues[0] = distribution(gen);
		randomValues[1] = distribution(gen);

		sampleConcept(iterationConcept, randomValues, reasonerInstance);
	}
}

void Inference::sampleConcept(shared_ptr<ClassicalConcept> concept, float randomValues[2], ReasonerInstance &reasonerInstance) {
	shared_ptr<ClassicalTask> task = concept->tasks.reference(randomValues[0]);
	shared_ptr<ClassicalBelief> belief = concept->beliefs.reference(randomValues[1]);

	inference(task, belief, reasonerInstance);
}

void Inference::inference(shared_ptr<ClassicalTask> task, shared_ptr<ClassicalBelief> belief, ReasonerInstance &reasonerInstance) {
	UnifiedTerm unifiedTermOfTask = reasonerInstance.accessTermByIndex(task->unifiedTerm);
	UnifiedTerm unifiedTermOfBelief = reasonerInstance.accessTermByIndex(belief->unifiedTerm);

	// TODO< TODO's and decide if we append the "before tree" to the results here >
	vector<UnifiedTerm> derivedTerms = derive(reasonerInstance, TODO, TODO, reasonerInstance.configuration.k);
}
