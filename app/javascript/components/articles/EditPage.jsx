import React from "react";
import {Label, Input} from "reactstrap";

const EditPage = (props) => {

	return (
		<div className="d-flex flex-column justify-content-center align-items-center">
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

				<Label>
					Body

					<Input
						name="article[body]"
						defaultValue={props.article.body}
					/>
				</Label>

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

export default EditPage;