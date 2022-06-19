import React, {useState, useEffect} from 'react';
import Nav from "./Nav"
import "../App.css"
import Header from "./Header";


export default function TruckMain({info,setInfo})
{
    const url = 'http://harvestsql-env-1.eba-jyexawm8.us-west-2.elasticbeanstalk.com/states'
    const [states, setStates] = useState([])

    useEffect(() => {
        document.body.style.backgroundImage = 'url(/images/Img46282_web_background.jpg)'
    })

    useEffect ( () =>
    {
        fetch(url)
            .then(response => response.json() )
            .then(data => {
                    setStates(data)
                }
            )
    }, [])
    return (
        <div>

            <>
                <Header cname="truck-header" headerText="Harvest App -  Truck Driver" />
                <Nav />
                <div className="content">

                    <h2>Truck Driver</h2>

                </div>
            </>
        </div>
    )
}
