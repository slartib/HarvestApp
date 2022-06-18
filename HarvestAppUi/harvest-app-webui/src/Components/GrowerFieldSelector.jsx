import React, {useState, useEffect} from 'react';
import PropTypes from 'prop-types';
import {Link, useParams} from "react-router-dom";
import Nav from "./Nav"
import "../App.css"


export default function GrowerFieldSelector()
{
    const url = 'http://harvestsql-env-1.eba-jyexawm8.us-west-2.elasticbeanstalk.com/growers'
    //const url = 'http://localhost:8080/growers'
    const [growers, setGrowers] = useState([])

    const handleChange = (e) => {
        const formInfo = {}


    }

    useEffect ( () =>
    {
        fetch(url)
            .then(response => response.json() )
            .then(data => {
                    setGrowers(data)
                }
            )
    }, [])

    console.log(growers)
    return (
        <div className="grower-field_selector-container">
            <select name="growers" id="growers" onChange={handleChange}>
            { growers.map((grower, idx) => (
                <option value={idx} id={idx.toString()} key={idx} >{grower.name}</option>
            ))}
            </select>
        </div>    )
}


