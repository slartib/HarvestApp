import React from 'react';
import "../App.css"

export default function LoadInfoForm ()
{
    const grossRef = React.useRef();
    const tareRef = React.useRef();
    const netRef = React.useRef();

    return (
        <div>
            <form>
                <div>
                   <label htmlFor={"gross"}>Gross: </label>
                   <input type={"number"} step={".001"} min={"0"} max={"150000"} id={"gross"} name={"gross"} ref={grossRef}/>
                </div>
                <div>
                    <label htmlFor={"tare"}>Tare: </label>
                    <input type={"number"} step={".001"} min={"0"} max={"150000"} id={"tare"} name={"tare"} ref={tareRef}/>
                </div>
                <div>
                    <label htmlFor={"net"}>Net: </label>
                    <input type={"number"} step={".001"} min={"0"} max={"150000"} id={"net"} name={"net"} ref={netRef}/>
                </div>
            </form>
        </div>
    )
}
