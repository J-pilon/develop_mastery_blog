import React from "react"
import {Container, Row, Col, Button, Input} from "reactstrap"
import PropTypes from "prop-types"

const HomePage = (props) => {

  function createArticle(item, index) {
    const link = `/articles/${item.id}/edit`;

    return (
        <Col
          key={`article-home-${index}`}
          className="mb-3 mr-3 p-2 d-flex flex-wrap flex-column justify-content-center align-items-center border"
        >
          <h2>{item.title}</h2>

          <p>{item.body}</p>

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
              onClick={() => document.location.href=`${link}`}
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
        </Col>
    );
  }

  return (
      <div>
        <h1>Article Home</h1>

        <div>
          {props.articles.map(createArticle)}
        </div>
      </div>
  );
}

HomePage.propTypes = {
  articles: PropTypes.arrayOf(PropTypes.shape({
    title: PropTypes.string,
    body: PropTypes.string,
    id: PropTypes.number
  })).isRequired
}

export default HomePage
