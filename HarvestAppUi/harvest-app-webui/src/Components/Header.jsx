import React from 'react';
import PropTypes from 'prop-types';
import "../App.css"

export default function Header ({cname, headerText})
{
    return (
    <div className={cname}>
        <header >
            <h2>{headerText}</h2>
        </header>
    </div>
)
}

Header.propTypes =
    {
        cname: PropTypes.string.isRequired,
        headerText: PropTypes.string.isRequired
    }
