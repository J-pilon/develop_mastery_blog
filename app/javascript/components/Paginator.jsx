import React from 'react';
import PropTypes from 'prop-types';

const Paginator = (props) => {

    const { link, lastPage } = props;

    const pageNumber = parseInt(new URLSearchParams(window.location.search).get("page"));

  return (
    <div className="paginator-container">
        <div className="paginator-btn-container">
            <a 
                className="paginator-btn"
                href={`${link}?page=1`}
            >
                first page
            </a>

            <a 
                className="paginator-btn paginator-btn-margin-left"
                style={{"pointerEvents": pageNumber > 1 ? "auto" : "none"}}
                href={`${link}?page=${pageNumber - 1}`}
            >
                prev page
            </a>
        </div>

        <div className="paginator-btn-container">
            <a 
                className="paginator-btn"
                style={{"pointerEvents": pageNumber < lastPage ? "auto" : "none"}}
                href={`${link}?page=${pageNumber + 1}`}
            >
                next page
            </a>
            
            <a 
                className="paginator-btn paginator-btn-margin-left"
                href={`${link}?page=${lastPage}`}
            >
                last page
            </a>
        </div>
    </div>
  )
}

Paginator.propTypes = {
    link: PropTypes.string.isRequired,
    lastPage: PropTypes.number.isRequired,
}

export default Paginator
