import { Form } from "react-bootstrap/";
import "../CSS/LoginForm.css";
import { Component, useReducer, useState } from "react";
import { useNavigate } from "react-router-dom";

export default function LoginForm() {
  const [user, setUser] = useState("");
  const [pass, setPass] = useState("");
  const [msg, setMsg] = useState("");
  const nav = useNavigate();
  const login = (e) => {
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
    //   .then((data) => setMsg(data))
      
    //   .then(()=> {
    //     if (msg == "success") nav("/home");
    //   })
      .then((data)=>{
        setMsg(data)
        if(msg=="success") nav("/home")
    })


  };
  return (
    <div className="form-div">
      <Form className="col">
        <input
          type="text"
          placeholder="Enter Username"
          className="row"
          onChange={(e) => {
            setUser(e.target.value);
          }}
        />

        <input
          type="text"
          placeholder="Enter Password"
          className="row"
          onChange={(e) => {
            setPass(e.target.value);
          }}
        />

        <input
          type="button"
          value="Login"
          onClick={(e) => {
            login(e);
          }}
        />

        <input type="button" value="Reset" />
      </Form>
      <p>Login: {msg}</p>
    </div>
  );
}
