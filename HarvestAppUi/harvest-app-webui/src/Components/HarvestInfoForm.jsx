import React, {useState, useEffect} from 'react';
import PropTypes from 'prop-types';
import {Link, useParams} from "react-router-dom";
import Nav from "./Nav"
import "../App.css"


export default function HarvestInfoForm({info, setInfo})
{
    const handleOnClick = (e) => {
        const formInfo = {}

        setInfo(formInfo)
    }

    return (
        <div>
            <form>
                <label for="grower">Grower:</label>

            </form>
        </div>
    )
}

HarvestInfoForm.propTypes =
    {
        info: PropTypes.object.isRequired,
        setInfo: PropTypes.func.isRequired
    }
