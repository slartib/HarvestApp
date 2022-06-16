import React, {useState, useEffect} from 'react';
import PropTypes from 'prop-types';
import {Link, useParams} from "react-router-dom";
import Nav from "./Nav"
import "../App.css"
import DisplayHarvestInfo from "./DisplayHarvestInfo";


export default function TruckMain({info,setInfo})
{
    useEffect(() => {
        document.body.style.backgroundImage = 'url(/images/Img46282_web_background.jpg)'
    })

    return (
        <div>
            <div className="truck-header">
                <header >
                    <h2>Header</h2>
                </header>
            </div>
            <Nav />
            <div className="content">

                <h2>Truck Driver</h2>
                <DisplayHarvestInfo info={info} setInfo={setInfo}/>
            </div>
        </div>
    )
}
