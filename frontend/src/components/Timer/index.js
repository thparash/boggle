import React from "react";
import { useSelector } from "react-redux";
import { stopTimer } from "../../actions/timerActions";
import "./style.css";
const Timer = () => {
  const secondsRemaining = useSelector(state => state.timer.seconds);

  const renderTimer = () => {
    if (secondsRemaining === 0) {
      stopTimer();
      return <span className="warning">TIME OVER</span>;
    }
    return secondsRemaining + " SECONDS";
  };
  return (
    <div className="timer">
      <h4>TIME REMAINING:</h4>
      <span className="time">{renderTimer()}</span>
    </div>
  );
};

export default Timer;
