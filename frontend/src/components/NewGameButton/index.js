import React from "react";
import { initializeGame } from "../../actions/boggleBoardActions";
import { stopTimer } from "../../actions/timerActions";
import { useDispatch } from "react-redux";
import "./style.css";
const NewGameButton = () => {
  const dispatch = useDispatch();

  const startNewGame = () => {
    stopTimer();
    initializeGame()(dispatch);
  };

  return (
    <button className="start-over-btn" onClick={startNewGame}>
      NEW GAME
    </button>
  );
};

export default NewGameButton;
