import { SUBMIT_CORRECT_WORDS, RESET_SCORE_BOARD } from "../actions/types";

const initalState = {
  correctWords: [],
  score: 0
};

export default function(state = initalState, action) {
  switch (action.type) {
    case SUBMIT_CORRECT_WORDS:
      return {
        ...state,
        correctWords: [...state.correctWords, action.payload],
        score: state.score + action.payload.length
      };
    case RESET_SCORE_BOARD:
      return {
        ...state,
        correctWords: [],
        score: 0
      };
    default:
      return state;
  }
}
