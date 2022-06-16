import React, {useState, useEffect} from 'react';
import PropTypes from 'prop-types';
import {Link, useParams} from "react-router-dom";
import "../App.css";
import DisplayHarvestInfo from "./DisplayHarvestInfo"

export default function Home({info,setInfo})
{
    useEffect(() => {
        document.body.style.backgroundImage = 'url(/images/Img099327-Edit.jpg)'
    })
    return (
        <div className="content">
            <h2>Home</h2>
            <DisplayHarvestInfo info={info} setInfo={setInfo}/>
        </div>
    )
}

Home.propTypes = {
    info: PropTypes.object.isRequired,
    setInfo: PropTypes.func.isRequired
}
