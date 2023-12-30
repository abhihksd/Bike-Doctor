import { Form,Button,Image } from "react-bootstrap/";
import "../CSS/LoginForm.css";
import { Component, useReducer, useState } from "react";
import { useNavigate } from "react-router-dom";
import { useDispatch, useSelector } from "react-redux";
import { login } from "../loggedSlice";
import img from "../img/img3.avif"

export default function LoginForm() {

const dispatch=useDispatch()
// const mystate=useSelector((state)=>state.logged)

  const [user, setUser] = useState("");
  const [pass, setPass] = useState("");
  const [msg, setMsg] = useState("");

  const nav = useNavigate();
  const loginFun = (e) => {
    e.preventDefault();
    const reqOption = {
      method: "POST",
      headers: { "content-type": "application/json" },
      body: JSON.stringify({
        username: user,
        password: pass,
      }),
    };
   
    console.log(user + "" + pass);
    fetch("http://localhost:9000/login", reqOption)
      .then((resp) => resp.text())
      .then((data) => {
        setMsg(data);
        if (  data === "success") {
          // setLoggedInUser(user); 
          dispatch(login())
          nav("/home");
        }
      })

  };
  localStorage.setItem("user",user);

  const resetForm = () => {
    setUser('');
    setPass('');
    setMsg('');
  };
  return (
    <div className="form-container">
      <Form className="login-form">
        <h3 style={{textAlign:"center"}}>Login</h3>
        <Form.Group controlId="formUsername" className="mb-3">
          <Form.Label>Username</Form.Label>
          <Form.Control
            type="text"
            placeholder="Enter Username"
            value={user}
            onChange={(e) => setUser(e.target.value)}
          />
        </Form.Group>

        <Form.Group controlId="formPassword" className="mb-3">
          <Form.Label>Password</Form.Label>
          <Form.Control required
            type="password"
            placeholder="Enter Password"
            value={pass}
            onChange={(e) => setPass(e.target.value)}
          />
        </Form.Group>

        <Button variant="primary" type="button" onClick={loginFun} className="mb-3 ">
          Login
        </Button>

        <Button variant="primary" type="button" onClick={resetForm}  className="mb-3 btn-danger">
          Reset
        </Button>
        <p className="login-message">{msg}</p>
      </Form>
      <Image className="image-container" src={img}></Image>
      
    </div>
  );
}
