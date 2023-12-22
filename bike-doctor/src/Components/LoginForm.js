// import { Form,Button } from "react-bootstrap/";
// import "../CSS/LoginForm.css";
// import { Component, useReducer, useState } from "react";
// import { useNavigate } from "react-router-dom";
// import { useDispatch, useSelector } from "react-redux";
// import { login } from "../loggedSlice";
// import img from "../img/img3.avif"
// export default function LoginForm() {

// const dispatch=useDispatch()
// const mystate=useSelector((state)=>state.logged)

//   const [user, setUser] = useState("");
//   const [pass, setPass] = useState("");
//   const [msg, setMsg] = useState("");

//   const nav = useNavigate();
//   const loginFun = (e) => {
//     e.preventDefault();
//     const reqOption = {
//       method: "POST",
//       headers: { "content-type": "application/json" },
//       body: JSON.stringify({
//         username: user,
//         password: pass,
//       }),
//     };
//     console.log(user + "" + pass);
//     fetch("http://localhost:9000/login", reqOption)
//       .then((resp) => resp.text())
//     //   .then((data) => setMsg(data))
      
//     //   .then(()=> {
//     //     if (msg == "success") nav("/home");
//     //   })
//       .then((data)=>{
//         setMsg(data)
//         if(msg=="success") {
//             dispatch(login())
//             nav("/home")}
//     })
    

//   };

//   const resetForm = () => {
//     setUser('');
//     setPass('');
//     setMsg('');
//   };
//   return (
//     // <div className="form-div">
//     //   <Form className="col">
//     //     <input
//     //       type="text"
//     //       placeholder="Enter Username"
//     //       className="row"
//     //       onChange={(e) => {
//     //         setUser(e.target.value);
//     //       }}
//     //     />

//     //     <input
//     //       type="text"
//     //       placeholder="Enter Password"
//     //       className="row"
//     //       onChange={(e) => {
//     //         setPass(e.target.value);
//     //       }}
//     //     />

//     //     <input
//     //       type="button"
//     //       value="Login"
//     //       onClick={(e) => {
//     //         loginFun(e);
//     //       }}
//     //     />

//     //     <input type="button" value="Reset" />
//     //   </Form>
//     //   <p>Login: {msg}</p>
//     // </div>
//     <div className="form-container">
//       <Form className="login-form">
//         <Form.Group controlId="formUsername" className="mb-3">
//           <Form.Label>Username</Form.Label>
//           <Form.Control
//             type="text"
//             placeholder="Enter Username"
//             value={user}
//             onChange={(e) => setUser(e.target.value)}
//           />
//         </Form.Group>

//         <Form.Group controlId="formPassword" className="mb-3">
//           <Form.Label>Password</Form.Label>
//           <Form.Control
//             type="password"
//             placeholder="Enter Password"
//             value={pass}
//             onChange={(e) => setPass(e.target.value)}
//           />
//         </Form.Group>

//         <Button variant="primary" type="button" onClick={loginFun} className="mb-3">
//           Login
//         </Button>

//         <Button variant="secondary" type="button" onClick={resetForm} className="mb-3 btn-danger">
//           Reset
//         </Button>
//       </Form>
//       <div>
//             <img src={img} alt="pic"/>
//         </div>
//       {/* <p className="login-message">{msg}</p> */}
//     </div>
//   );
// }

import React, { useState } from 'react';
import { Form, Button } from 'react-bootstrap';
import 'bootstrap/dist/css/bootstrap.min.css';
import '../CSS/LoginForm.css'; // Import your custom CSS file
import { useDispatch, useSelector } from 'react-redux';
import { useNavigate } from 'react-router-dom';
import { login } from '../loggedSlice';
import img from '../img/img3.avif';

export default function LoginForm() {
  const dispatch = useDispatch();
  const mystate = useSelector((state) => state.logged);

  const [user, setUser] = useState('');
  const [pass, setPass] = useState('');
  const [msg, setMsg] = useState('');

  const nav = useNavigate();

  const loginFun = (e) => {
    e.preventDefault();
    const reqOption = {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        username: user,
        password: pass,
      }),
    };

    fetch('http://localhost:9000/login', reqOption)
      .then((resp) => resp.text())
      .then((data) => {
        setMsg(data);
        if (data === 'success') {
          dispatch(login());
          nav('/home');
        }
      });
  };

  };

  return (
    <div className="form-container">
      <Form className="login-form d-flex flex-column align-items-center">
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
          <Form.Control
            type="password"
            placeholder="Enter Password"
            value={pass}
            onChange={(e) => setPass(e.target.value)}
          />
        </Form.Group>

        <div className="justify-content-between w-100">
          <Button variant="primary" type="button" style={{marginLeft:"55px"}} onClick={loginFun} className="mb-3">
            Login
          </Button>

          <Button variant="primary" style={{marginLeft:"60px"}} type="button" onClick={resetForm} className="mb-3 btn-danger ">
            Reset
          </Button>
        </div>
      </Form>
      <div>
        <img src={img} alt="pic" />
      </div>
      {/* <p className="login-message">{msg}</p> */}
    </div>
  );
}

