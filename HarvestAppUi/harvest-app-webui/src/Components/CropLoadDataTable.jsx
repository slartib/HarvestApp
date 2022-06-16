import React, {useState, useEffect} from 'react';
import "../App.css"



export default function FieldManagerTruckStatus()
{
    useEffect(() => {
        document.body.style.backgroundImage = 'url(/images/Img099327-Edit.jpg)'
    })

    const url = 'http://harvestsql-env-1.eba-jyexawm8.us-west-2.elasticbeanstalk.com/fieldtruckloads/MF1'
    //const url = 'http://localhost:8080/growers'
    const [loads, setLoads] = useState([])

    useEffect ( () =>
    {
        fetch(url)
            .then(response => response.json() )
            .then(data => {
                    setLoads(data)
                }
            )
    }, [])


    return (
        <div>
            <table>
                <thead>
                    <tr>
                        <th>Field</th>
                        <th>Truck</th>
                        <th>Load Num</th>
                        <th>Gross</th>
                        <th>Tare</th>
                        <th>Net</th>
                    </tr>
                </thead>
                <tbody>
                    { loads.map((load, idx) => (
                        <tr key={idx}>
                            <td>{load.id.field}</td>
                            <td>{load.id.truck}</td>
                            <td>{load.id.loadNum}</td>
                            <td>{load.gross}</td>
                            <td>{load.tare}</td>
                            <td>{load.net}</td>
                        </tr>
                    ))}
                </tbody>
            </table>
        </div>
    )
}
