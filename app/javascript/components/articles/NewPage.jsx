import React, {useState} from "react";
import {Label, Input} from "reactstrap";
import PropTypes from "prop-types"


const NewPage = (props) => {

	return(
		<div className="d-flex flex-column justify-content-center align-items-center">
			<form 
				className="w-50 h-50 d-flex flex-column align-items-center p-3 border"
				action="/articles"
				method="post"
			>

				<input type="hidden" name="authenticity_token" value={document.querySelector("[name=csrf-token]").content}/>

				<Label>
					Enter the articles title:

					<Input
						placeholder="title"
						name="article[title]"
						id="article_title"
					/>
				</Label>

				<Label>
					Enter the articles body:

					<Input
						placeholder="body"
						name="article[body]"
						id="article_body"
					/>
				</Label>

				<div>
					<Input type="submit" value="Create Article" name="commit" data-disable-with="Create Article"/>
				</div>
			</form>
		</div>
	);
}

export default NewPage;
