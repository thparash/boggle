import { UPDATE_TIMER, RESET_TIMER } from "./types";

let timer = null;

export const startTimer = () => dispatch => {
  dispatch({
    type: RESET_TIMER
  });

  timer = setInterval(() => {
    dispatch({
      type: UPDATE_TIMER
    });
  }, 1000);
};

export const stopTimer = () => {
  clearInterval(timer);
};
