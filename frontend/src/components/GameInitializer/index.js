import React, { useEffect } from "react";
import BoggleBoard from "../BoggleBoard";
import ScoreBoard from "../ScoreBoard";
import InputBox from "../InputBox";
import NewGameButton from "../NewGameButton";
import ScoreBox from "../ScoreBox";
import GameLoader from "../GameLoader";
import Timer from "../Timer";
import { initializeGame } from "../../actions/boggleBoardActions";
import { useSelector, useDispatch } from "react-redux";
import "./style.css";
const GameInitializer = () => {
  const loading = useSelector(state => state.boggleBoard.loading);
  const dispatch = useDispatch();

  useEffect(() => {
    initializeGame()(dispatch);
  }, [dispatch]);

  return (
    <div className="initializer">
      <div className="header">
        <h1 className="title">Boggle</h1>
      </div>
      {loading ? (
        <GameLoader />
      ) : (
        <div className="main">
          <BoggleBoard />
          <ScoreBoard />
          <ScoreBox />
          <Timer />
          <InputBox />
          <NewGameButton />
          <p className="game-instruction">
            This is a Boggle game with a traditional 4x4 board.A player gets 2
            minutes to find as many words as possible. The game keeps track of
            scores, and the score is generated based on number of characters in
            the valid words entered by the player.
          </p>
        </div>
      )}
    </div>
  );
};

export default GameInitializer;
