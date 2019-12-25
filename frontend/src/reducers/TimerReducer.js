import { UPDATE_TIMER, RESET_TIMER } from "../actions/types";

const GAME_TIME_IN_SECONDS = 120;

const initalState = {
  seconds: GAME_TIME_IN_SECONDS
};

export default function(state = initalState, action) {
  switch (action.type) {
    case UPDATE_TIMER:
      if (state.seconds === 0) {
        return {
          ...state,
          seconds: GAME_TIME_IN_SECONDS
        };
      } else {
        return {
          ...state,
          seconds: state.seconds - 1
        };
      }
    case RESET_TIMER:
      return {
        ...state,
        seconds: GAME_TIME_IN_SECONDS
      };
    default:
      return state;
  }
}
