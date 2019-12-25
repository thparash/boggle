import { UPDATE_TIMER } from "./types";

let timer = null;

export const startTimer = () => dispatch => {
  timer = setInterval(() => {
    dispatch({
      type: UPDATE_TIMER
    });
  }, 1000);
};

export const stopTimer = () => {
  clearInterval(timer);
};
