import React, { useEffect } from "react";
import { resetScoreBoard } from "../../actions/scoreBoardActions";
import "./style.css";
import { useSelector, useDispatch } from "react-redux";
const ScoreBoard = () => {
  const correctWords = useSelector(state => state.scoreBoard.correctWords);
  const dispatch = useDispatch();

  useEffect(() => {
    resetScoreBoard()(dispatch);
  }, [dispatch]);

  const renderCorrectWords = () => {
    return correctWords.map((word, index) => <li key={index}>{word}</li>);
  };
  return (
    <div className="score-board">
      <h5>CORRECT WORDS</h5>
      <ul className="correct-words">{renderCorrectWords()}</ul>
    </div>
  );
};

export default ScoreBoard;
