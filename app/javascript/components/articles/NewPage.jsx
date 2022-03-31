import React from "react";
import {Label, Input} from "reactstrap";

import { Editor } from '@tinymce/tinymce-react';
import { articleBodyEditorSpecs } from '../../util/tinymceEditorSpecs';

const NewPage = (props) => {

	return(
		<div className="d-flex flex-column justify-content-center align-items-center">
			<form 
				className="w-50 h-50 d-flex flex-column align-items-center p-3 border"
				action="/articles"
				method="post"
			>

				<input type="hidden" name="authenticity_token" value={document.querySelector("[name=csrf-token]").content}/>

				<input type="hidden" name="article[user_id]" value="1"/>


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

					<Editor
						apiKey={process.env.TINY_MCE_API_KEY}
						textareaName="article[body]"
						initialValue="<p>What would you like to say?</p>"
						init={articleBodyEditorSpecs}
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
