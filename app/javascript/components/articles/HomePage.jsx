import React from "react";
import { Button, Input } from "reactstrap";
import PropTypes from "prop-types";
import TextContainer from "../TextContainer";
import Paginator from "../Paginator";
import ErrorBlock from "../ErrorBlock";

const HomePage = (props) => {

  function createArticle(item, index) {
    const link = `/articles/${item.slug}`;

    return (
        <div
          lg={3}
          key={`article-home-${index}`}
          className="item-container-sizing item-container-padding flex-row-space-between"
        >
          <TextContainer
            link={link}
            title={item.title}
            body={item.body}
          />


          <div className="btn-nowrap btn-margin-left">
            <form 
              action={`/articles/${item.id}`} 
              method="post"
            >
              <Input 
                type="hidden" 
                name="authenticity_token" 
                value={document.querySelector("[name=csrf-token").content} 
              />

              <Button
                className="btn-margin-right bg-primary"
                onClick={() => document.location.href =`${link}/edit`}
              >
                Edit
              </Button>

              <Button 
                className="bg-danger"
                type="submit" 
                formMethod="post" 
                name="_method" 
                value="delete" 
                data-confirm="Are you sure?"
              >
                Delete
              </Button>
            </form>
          </div>
        </div>
    );
  }

  return (
      <div>
        <h1>Article Home</h1>

        <div>
          {props.articles.map(createArticle)}
        </div>

        <div>
          <Paginator
            link="/articles"
            lastPage={props.lastPage}
          />
        </div>
      </div>
  );
}

HomePage.propTypes = {
  articles: PropTypes.arrayOf(PropTypes.shape({
    title: PropTypes.string,
    body: PropTypes.string,
    id: PropTypes.number,
  })).isRequired,
  lastPage: PropTypes.number.isRequired,
}

export default HomePage
