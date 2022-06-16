import React, {useState}  from 'react';
import { Route, Routes } from 'react-router-dom';
import Home from './Components/Home';
import './App.css';
import FieldManagerMain from "./Components/FieldManagerMain";
import TruckMain from "./Components/TruckMain";
import Nav from "./Components/Nav"
import Header from "./Components/Header"

function App() {
  const [harvestInfo, setHarvestInfo ] = useState({})
  return (
    <div className="App">
        <Header cname="App-header" headerText="Harvest App - Home" />
        <Nav />
        <Routes>
            <Route path="/" element={<Home info={harvestInfo} setInfo={setHarvestInfo}/> } />} />
            <Route path="/fieldmanager" element={<FieldManagerMain info={harvestInfo} setInfo={setHarvestInfo} />} />
            <Route path="/truck" element={<TruckMain info={harvestInfo} setInfo={setHarvestInfo} />} />
        </Routes>
    </div>
  );
}

export default App;
