import {
  INITIALIZE_GAME,
  SET_USER_INPUT,
  START_GAME_INITIALIZATION
} from "./types";
import { startTimer } from "./timerActions";

export const initializeGame = () => async dispatch => {
  dispatch({
    type: START_GAME_INITIALIZATION
  });

  let response = await fetch("http://localhost:3000/api/v1/boggle/new");
  let data = await response.json();
  const foundWords = data.words;
  const cells = data.board.cells;
  let letters = [];

  for (let row = 0; row < cells.length; row++) {
    for (let col = 0; col < cells[row].length; col++) {
      letters.push(cells[row][col]);
    }
  }

  dispatch({
    type: INITIALIZE_GAME,
    payload: { letters, foundWords }
  });

  startTimer()(dispatch);
};

export const setUserInput = input => dispatch => {
  dispatch({
    type: SET_USER_INPUT,
    payload: input
  });
};
