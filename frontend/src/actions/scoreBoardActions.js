import { SUBMIT_CORRECT_WORDS, RESET_SCORE_BOARD } from "./types";

export const submitCorrectWords = input => dispatch => {
  dispatch({
    type: SUBMIT_CORRECT_WORDS,
    payload: input
  });
};

export const resetScoreBoard = () => dispatch => {
  dispatch({
    type: RESET_SCORE_BOARD
  });
};
