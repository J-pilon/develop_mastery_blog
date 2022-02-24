import React from 'react';
import PropTypes from 'prop-types';
import GetURLSearchParams from '../util/get-url-search-params';

const Paginator = (props) => {

    const { link, lastPage } = props;

    const { page, items_limit } = GetURLSearchParams(window.location);

    const itemsLimitParam = items_limit || 10;
    const pageNumber = page || 1;
    
    function submitHandler(e) {
        e.preventDefault;
        window.location.href = `${link}?page=1&items_limit=${e.target.value}`;
    }

  return (
    <div className="paginator-container">
        <div className="paginator-btn-container">
            <a 
                className="paginator-btn"
                style={{"pointerEvents": itemsLimitParam !== 0 ? "auto" : "none"}}
                href={`${link}?page=1&items_limit=${itemsLimitParam}`}
            >
                first page
            </a>

            <a 
                className="paginator-btn paginator-btn-margin-left"
                style={{"pointerEvents": pageNumber > 1 ? "auto" : "none"}}
                href={`${link}?page=${pageNumber - 1}&items_limit=${itemsLimitParam}`}
            >
                prev page
            </a>
        </div>

        <form onChange={submitHandler}>
            <select name="paginator">
                <option selected disabled>--Select limit of items--</option>
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
                href={`${link}?page=${pageNumber + 1}&items_limit=${itemsLimitParam}`}
            >
                next page
            </a>
            
            <a 
                className="paginator-btn paginator-btn-margin-left"
                style={{"pointerEvents": itemsLimitParam !== 0 ? "auto" : "none"}}
                href={`${link}?page=${lastPage}&items_limit=${itemsLimitParam}`}
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
