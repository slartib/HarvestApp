import React from 'react';
import { Link } from 'react-router-dom';

export default function Nav() {
    return (
        <div className="navbar">
            <nav>
                <Link to="/">Home</Link>
                <Link to="/fieldmanager">Field Manager</Link>
                <Link to="/truck">Truck Driver</Link>
            </nav>
        </div>
    );
}
