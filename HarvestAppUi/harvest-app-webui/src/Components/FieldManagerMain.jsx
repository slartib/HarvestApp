import React, {useEffect} from 'react';
import "../App.css"
import Header from "./Header";
import Nav from "./Nav";
import FieldManagerTruckStatus from "./FieldManagerTruckStatus";
import CropLoadDataTable from "./CropLoadDataTable"


export default function FieldManagerMain()
{
    useEffect(() => {
        document.body.style.backgroundImage = 'url(/images/Img099327-Edit.jpg)'
    })
    return (
        <>
            <Header cname="App-header" headerText="Harvest App - Field Manager" />
            <Nav />
            <div className="content">
                <h2>Field Manager</h2>
                <div className={"field-truck-container"}>
                    <h2>Truck Status</h2>
                    <h2>Loads</h2>
                    <FieldManagerTruckStatus/>
                    <CropLoadDataTable />
                </div>
            </div>
        </>
    )
}
