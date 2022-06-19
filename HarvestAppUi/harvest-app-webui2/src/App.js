import React from 'react';
import './App.css';
import SampleForm from "./Components/SampleForm";
import { Route, Routes } from 'react-router-dom';
import Home from './Components/Home';
import FieldManagerMain from "./Components/FieldManagerMain";
import TruckMain from "./Components/TruckMain";

function App() {
  return (
    <div className="App">
        <Routes>
            <Route path="/" element={<Home /> } />} />
            <Route path="/fieldmanager" element={<FieldManagerMain />} />
            <Route path="/truck" element={<TruckMain />} />
        </Routes>
    </div>
  );
}

export default App;
