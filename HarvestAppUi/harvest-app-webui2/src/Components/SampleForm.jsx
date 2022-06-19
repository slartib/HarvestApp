import React, {useState, useEffect} from 'react';
import "../App.css"

export default function SampleForm ()
{
    const url = 'http://harvestsql-env-1.eba-jyexawm8.us-west-2.elasticbeanstalk.com/growers'
    //const url = 'http://localhost:8080/growers'
    const [growers, setGrowers] = useState([])



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
            <select name="growers" id="growers" >
                { growers.map((grower, idx) => (
                    <option value={idx} id={idx.toString()} key={idx} >{grower.name}</option>
                ))}
            </select>
            <input type={"text"} />
        </div>    )
}

