import React from 'react';
import PropTypes from 'prop-types';


import "../App.css"
import GrowerFieldSelector from "./GrowerFieldSelector";


export default function HarvestInfo({info, setInfo})
{
    //const [harvestInfo, setHarvestInfo ] = useState({})
    //const [editHarvestInfo, setEditHarvestInfo] = useState(true)

    if (Object.keys(info).length === 0) {
        //setEditHarvestInfo(false)
        return (
            <div>
                <GrowerFieldSelector info={info} setInfo={setInfo}/>
            </div>
        )
    }
    return (
        <div>
          <p>Harvest Info</p>
        </div>
    )
}

HarvestInfo.propTypes =
    {
        info: PropTypes.object.isRequired,
        setInfo: PropTypes.func.isRequired
    }


