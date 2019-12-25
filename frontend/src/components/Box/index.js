import React from "react";
import "./style.css";
const Box = ({ letter, className }) => {
  return <div className={className}>{letter.value}</div>;
};

export default Box;
