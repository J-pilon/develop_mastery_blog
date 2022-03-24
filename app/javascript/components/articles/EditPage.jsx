import React from "react";
import {Label, Input} from "reactstrap";
import PropTypes from "prop-types";

import ErrorBlock from "../ErrorBlock";
import { Editor } from '@tinymce/tinymce-react';


const EditPage = (props) => {

	return (
		<div className="d-flex flex-column justify-content-center align-items-center">
			<ErrorBlock
				message={props.error}
			/>

			<form 
				className="w-50 h-50 d-flex flex-column align-items-center p-3 border"
				action={`/articles/${props.article.id}`} 
				method="post"
			>

				<Input 
					type="hidden"
					name="_method"
					value="put"
				/>

				<Input 
					type="hidden" 
					name="authenticity_token" 
					value={document.querySelector("[name=csrf-token").content} 
				/>

				<Label>
					Title

					<Input
						name="article[title]"
						defaultValue={props.article.title}
					/>
				</Label>

				{/* <Label>
					Body

					<Input
						name="article[body]"
						defaultValue={props.article.body}
					/>
				</Label> */}

				<Editor
					apiKey="82i1zra2emdhclzhbkp2fdtnf0oafyx5yxr89bkls8cqaaur"
					textareaName="article[body]"
					initialValue={props.article.body}
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

				<div>
					<Input 
						type="submit" 
						name="commit" 
						data-disable-with="Create Article" 
					/>
				</div>
			</form>
		</div>
	);
}

EditPage.propTypes = {
	article: PropTypes.shape({
	  title: PropTypes.string,
	  body: PropTypes.string,
	  id: PropTypes.number
	}).isRequired,
	error: PropTypes.string,
  }

export default EditPage;