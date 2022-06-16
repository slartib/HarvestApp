import React, {useState}  from 'react';
import { Link, Outlet, Route, Routes, useLocation, useNavigate, useParams } from 'react-router-dom';
import Home from './Components/Home';
import './App.css';
import FieldManagerMain from "./Components/FieldManagerMain";
import TruckMain from "./Components/TruckMain";
import Nav from "./Components/Nav"

function App() {
  const [harvestInfo, setHarvestInfo ] = useState({})
  return (
    <div className="App">
        <div className="App-header">
          <header >
            <h2>Header</h2>
          </header>
        </div>
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
