import React, {useState, useEffect} from 'react';
import PropTypes from 'prop-types';
import {Link, useParams} from "react-router-dom";
import "../App.css"
import DisplayHarvestInfo from "./DisplayHarvestInfo";


export default function FieldManagerMain({info,setInfo})
{
    useEffect(() => {
        document.body.style.backgroundImage = 'url(/images/Img099327-Edit.jpg)'
    })
    return (
        <div className="content">
            <h2>Field Manager</h2>
            <DisplayHarvestInfo info={info} setInfo={setInfo}/>
        </div>
    )
}
