module fastMetaNars.entity.ClassicalSentence;

import fastMetaNars.TruthValue;
import fastMetaNars.TermOrCompoundTermOrVariableReferer;

// https://github.com/opennars/opennars/blob/1.6.5_devel17_TonyAnticipationStrategy/nars_core/nars/entity/Sentence.java
/**
 * A Sentence is an abstract class, mainly containing a Term, a TruthValue, and
 * a Stamp.
 * 
 * It is used as the premises and conclusions of all inference rules.
 */
struct ClassicalSentence {
	static ClassicalSentence makeJudgement(TermOrCompoundTermOrVariableReferer term, TruthValue truth) {
		ClassicalSentence result;
		result.term = term;
		result.truth = truth;
		result.punctation = EnumPunctation.JUDGEMENT;
		return result;
	}

	TermOrCompoundTermOrVariableReferer term; // the content of a sentence is a term

	EnumPunctation punctation;

	TruthValue truth; // The truth value of Judgment, or desire value of Goal
	
	// TODO< Stamp stamp > // Partial record of the derivation path


	// called punctation for classical NARS reasons
	enum EnumPunctation {
		JUDGEMENT,
		QUESTION,
		GOAL,
		QUEST,
	}

	// TODO TODO TODO< overload comparision whic does roughtly the same as in openNARS >


	final @property isJudgement() {
		return punctation == EnumPunctation.JUDGEMENT;
	}

	final @property isQuestion() {
		return punctation == EnumPunctation.QUESTION;
	}

	final @property isGoal() {
		return punctation == EnumPunctation.GOAL;
	}

	final @property isQuest() {
		return punctation == EnumPunctation.QUEST;
	}


}

