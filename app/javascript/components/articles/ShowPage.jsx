import React from "react";

const ShowPage = (props) => {
    return (
        <div>
            <h1>{props?.article?.title}</h1>

            <p>{props?.article?.body}</p>
        </div>
    );
}

export default ShowPage;
