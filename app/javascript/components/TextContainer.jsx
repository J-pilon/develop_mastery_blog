import React, {useState} from "react";
import PropTypes from "prop-types";
import { IoIosArrowDown, IoIosArrowUp } from "react-icons/io";


const TextContainer = (props) => {

    const { title, body, link } = props;

    const [view, setView] = useState(false);

    // const bodyArray = body.split("");
    // const amountOfCharsFirstSentence = bodyArray.indexOf("." || "?" || "!") + 1;
    // const firstSentence = bodyArray.splice(0,amountOfCharsFirstSentence).join("");

    // const bodyParagraph = view ? body : `${firstSentence}...`;

    function showFullTextBody() {
        setView(!view);
    }

    return (
        <div 
            className="title-container-sizing"
          >
            <div className="title-container-sizing flex-row-space-between title-bottom-border">
                <h2
                    className="clickable-link"
                    onClick={() => document.location.href = link}
                >{title}</h2>

                <div
                    className="flex-align-self-end"
                    onClick={showFullTextBody}
                >
                    {view ? <IoIosArrowDown/> : <IoIosArrowUp/>}
                </div>
            </div>
            
            <p dangerouslySetInnerHTML={{__html: body}}></p>
        </div>
    );
}

TextContainer.propTypes = {
    title: PropTypes.string.isRequired,
    body: PropTypes.string.isRequired,
    link: PropTypes.string.isRequired,
}

export default TextContainer;
