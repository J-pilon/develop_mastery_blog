import React, { useState } from 'react';
import PropTypes from 'prop-types';

const Paginator = (props) => {

    const { link, lastPage } = props;

    let itemsPerPageParam = parseInt(new URLSearchParams(window.location.search).get("items_per_page")) || 10;
    const pageNumber = parseInt(new URLSearchParams(window.location.search).get("page"));

    function submitHandler(e) {
        e.preventDefault;

        itemsPerPageParam = e.target.value;
        window.location.href = `${link}?items_per_page=${itemsPerPageParam}`
    }

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

        <form onChange={submitHandler}>
            <select name="paginator">
                <option selected disabled>--Select items per page--</option>
                <option value={0}>all</option>
                <option value={5}>5</option>
                <option value={10}>10</option>
                <option value={25}>25</option>
                <option value={50}>50</option>
            </select>
        </form>

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
