import React from "react";
import { useSelector } from "react-redux";
import "./style.css";

const ScoreBox = () => {
  const correctWords = useSelector(state => state.scoreBoard.correctWords);
  const foundWords = useSelector(state => state.boggleBoard.foundWords);
  const score = useSelector(state => state.scoreBoard.score);

  const renderWordsRemaining = () => {
    return `${Object.keys(foundWords).length - correctWords.length}`;
  };

  return (
    <div className="score-box">
      <h4>
        YOUR SCORE: <span className="score">{score} points</span>
      </h4>
      <h4>
        WORDS FOUND: <span className="score">{correctWords.length} </span>
        WORDS REMAINING:
        <span className="score"> {renderWordsRemaining()} </span>
      </h4>
    </div>
  );
};

export default ScoreBox;
