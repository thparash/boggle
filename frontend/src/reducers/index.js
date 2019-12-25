import { combineReducers } from "redux";
import BoggleBoardReducer from "./BoggleBoardReducer";
import ScoreBoardReducer from "./ScoreBoardReducer";
import TimerReducer from "./TimerReducer";

export default combineReducers({
  boggleBoard: BoggleBoardReducer,
  scoreBoard: ScoreBoardReducer,
  timer: TimerReducer
});
