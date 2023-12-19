import { Form } from "react-bootstrap/";
import '../CSS/LoginForm.css'
export default function LoginForm() {
  return (
    <div className="form-div">
      <Form className="col">
        <input type="text" placeholder="Enter Username" className="row" />

        <input type="text" placeholder="Enter Password" className="row"/>

        <input type="button" value="Login" />

        <input type="button" value="Reset" />
      </Form>
    </div>
  );
}
