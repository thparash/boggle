import React, { useState } from "react";
import { setUserInput } from "../../actions/boggleBoardActions";
import { submitCorrectWords } from "../../actions/scoreBoardActions";
import { useSelector, useDispatch } from "react-redux";

import "./style.css";

const InputBox = () => {
  const userInput = useSelector(state => state.boggleBoard.userInput);
  const foundWords = useSelector(state => state.boggleBoard.foundWords);
  const seconds = useSelector(state => state.timer.seconds);
  const [isValidWord, setIsValidWord] = useState(true);
  const dispatch = useDispatch();

  const submit = event => {
    if (event.key === "Enter") {
      const userInput = event.target.value;

      // add the word to scoreboard if valid
      if (foundWords[userInput]) {
        setIsValidWord(true);
        submitCorrectWords(userInput)(dispatch);
      } else {
        setIsValidWord(false);
      }
      setUserInput("")(dispatch);
    }
  };

  const isDisabled = () => (seconds === 0 ? true : false);

  return (
    <input
      type="text"
      className={isValidWord ? "input-box" : "input-box not-valid-word"}
      value={userInput}
      disabled={isDisabled() ? "disabled" : ""}
      placeholder={
        isDisabled()
          ? "TIME OVER - START A NEW GAME"
          : isValidWord
          ? "ENTER A WORD HERE..."
          : "INVALID WORD - ENTER VALID WORD"
      }
      onChange={event => setUserInput(event.target.value)(dispatch)}
      onKeyDown={submit}
    />
  );
};

export default InputBox;
