import React, { useEffect, useState } from "react";
import { useSelector } from "react-redux";
import Box from "../Box";
import GameLoader from "../GameLoader";
import "./style.css";

function BoggleBoard() {
  const letters = useSelector(state => state.boggleBoard.letters);
  const loading = useSelector(state => state.boggleBoard.loading);
  const userInput = useSelector(state => state.boggleBoard.userInput);
  const [userTypedLetters, setUserTypedLetters] = useState([]);

  useEffect(() => {
    setUserTypedLetters(userInput.split(""));
  }, [userInput]);

  const renderColorForBox = letter => {
    return userTypedLetters.includes(letter.value) ? "box typed-letter" : "box";
  };

  const renderBoxes = () => {
    const boxes = letters.map((letter, index) => (
      <Box key={index} letter={letter} className={renderColorForBox(letter)} />
    ));

    return <div className="wrapper">{boxes}</div>;
  };

  return loading ? <GameLoader /> : renderBoxes();
}

export default BoggleBoard;
