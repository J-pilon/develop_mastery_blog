import React from "react";

const ShowPage = (props) => {
    return (
        <div>
            <h1>{props.article.title}</h1>

            <p>{props.article.body}</p>
        </div>
    );
}

ShowPage.propTypes = {
	article: PropTypes.shape({
	  title: PropTypes.string,
	  body: PropTypes.string,
	}).isRequired
  }

export default ShowPage;
