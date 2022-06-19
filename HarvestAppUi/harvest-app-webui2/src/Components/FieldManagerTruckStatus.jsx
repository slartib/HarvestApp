import React, {useState, useEffect} from 'react';
import "../App.css"



export default function FieldManagerTruckStatus()
{
    useEffect(() => {
        document.body.style.backgroundImage = 'url(/images/Img099327-Edit.jpg)'
    })

    const url = 'http://harvestsql-env-1.eba-jyexawm8.us-west-2.elasticbeanstalk.com/fieldtruckstates/MF1'
    //const url = 'http://localhost:8080/growers'
    const [truckStatus, setTruckStatus] = useState([])

    useEffect ( () =>
    {
        fetch(url)
            .then(response => response.json() )
            .then(data => {
                    setTruckStatus(data)
                }
            )
    }, [])

    return (
        <div>
            <table>
               <thead>
                    <tr>
                        <th>Grower</th>
                        <th>Field</th>
                        <th>Truck</th>
                        <th>Truck Status</th>
                    </tr>
               </thead>
                <tbody>
                    { truckStatus.map((truck, idx) => (
                        <tr key={idx}>
                            <td>{truck.grower}</td>
                            <td>{truck.id.field}</td>
                            <td>{truck.id.truck}</td>
                            <td>{truck.currentState}</td>
                        </tr>
                    ))}
                </tbody>
            </table>
        </div>
    )
}
