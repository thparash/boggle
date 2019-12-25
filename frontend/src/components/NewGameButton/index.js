import React from "react";
import { initializeGame } from "../../actions/boggleBoardActions";
import { useDispatch } from "react-redux";
import "./style.css";
const NewGameButton = () => {
  const dispatch = useDispatch();

  const startNewGame = () => {
    initializeGame()(dispatch);
  };

  return (
    <button className="start-over-btn" onClick={startNewGame}>
      NEW GAME
    </button>
  );
};

export default NewGameButton;
