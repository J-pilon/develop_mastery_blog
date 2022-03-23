import React, {useRef} from "react";
import {Label, Input} from "reactstrap";
import PropTypes from "prop-types"

import { Editor } from '@tinymce/tinymce-react';


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
						apiKey="82i1zra2emdhclzhbkp2fdtnf0oafyx5yxr89bkls8cqaaur"
						textareaName="article[body]"
						initialValue="<p>This is the initial content of the editor.</p>"
						init={{
						height: 500,
						menubar: false,
						plugins: [
							'advlist autolink lists link image charmap print preview anchor',
							'searchreplace visualblocks code fullscreen',
							'insertdatetime media table paste code help wordcount'
						],
						toolbar: 'undo redo | formatselect | ' +
						'bold italic backcolor | alignleft aligncenter ' +
						'alignright alignjustify | bullist numlist outdent indent | ' +
						'removeformat | help',
						content_style: 'body { font-family:Helvetica,Arial,sans-serif; font-size:14px }'
						}}
					/>

					{/* <Input
						placeholder="body"
						name="article[body]"
						id="article_body"
					/> */}
				</Label>

				<div>
					<Input type="submit" value="Create Article" name="commit" data-disable-with="Create Article"/>
				</div>
			</form>
		</div>
	);
}

export default NewPage;
