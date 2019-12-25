import React from "react";
import GameInitializer from "./components/GameInitializer";
import { Provider } from "react-redux";
import store from "./store";
import "./App.css";

function App() {
  return (
    <Provider store={store}>
      <div className="App">
        <GameInitializer />
      </div>
    </Provider>
  );
}

export default App;
