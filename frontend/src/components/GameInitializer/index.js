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
        </div>
      )}
    </div>
  );
};

export default GameInitializer;
