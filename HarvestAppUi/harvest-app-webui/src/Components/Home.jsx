import React, { useEffect} from 'react';
import PropTypes from 'prop-types';
import {Link} from "react-router-dom";
import "../App.css";
import Header from "./Header";
import Nav from "./Nav";


export default function Home()
{
    useEffect(() => {
        document.body.style.backgroundImage = 'url(/images/Img099327-Edit.jpg)'
    })
    return (
        <>
            <Header cname="App-header" headerText="Harvest App - Home" />
            <Nav />
            <div className="content">
                <h2>Home</h2>
                <h3>Grower: MFarms</h3>
                <div className={"home-buttons-container"}>
                    <div className={"home-button-left"} >
                        <Link  to="/fieldmanager">Field Manager</Link>
                        <h5>Field: MF1</h5>
                    </div>
                    <div className={"home-button-right"}>
                        <Link  to="/truck">Truck Driver</Link>
                        <h5>Truck: MT1</h5>
                    </div>
                </div>
            </div>
        </>
    )
}

