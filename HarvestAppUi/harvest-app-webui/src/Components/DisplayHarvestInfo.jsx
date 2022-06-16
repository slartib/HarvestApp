import React, {useState, useEffect} from 'react';
import PropTypes from 'prop-types';
import {Link, useParams} from "react-router-dom";
import Nav from "./Nav"
import "../App.css"


export default function DisplayHarvestInfo({info, setInfo})
{
    //const [harvestInfo, setHarvestInfo ] = useState({})
    //const [editHarvestInfo, setEditHarvestInfo] = useState(true)

    if (Object.keys(info).length === 0) {
        //setEditHarvestInfo(false)
        return (
            <div>
                <p>Edit Harvest Info</p>
            </div>
        )
    }
    return (
        <div>
          <p>Harvest Info</p>
        </div>
    )
}

DisplayHarvestInfo.propTypes =
    {
        info: PropTypes.object.isRequired,
        setInfo: PropTypes.func.isRequired
    }


