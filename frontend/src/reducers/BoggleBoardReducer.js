import {
  INITIALIZE_GAME,
  SET_USER_INPUT,
  START_GAME_INITIALIZATION
} from "../actions/types";

const initalState = {
  letters: [],
  foundWords: {},
  loading: true,
  userInput: ""
};

export default function(state = initalState, action) {
  switch (action.type) {
    case START_GAME_INITIALIZATION:
      return {
        ...state,
        loading: true
      };
    case INITIALIZE_GAME:
      return {
        ...state,
        letters: action.payload.letters,
        foundWords: action.payload.foundWords,
        loading: false
      };
    case SET_USER_INPUT:
      return {
        ...state,
        userInput: action.payload
      };
    default:
      return state;
  }
}
