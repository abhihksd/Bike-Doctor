import { useReducer, useState } from "react";
import { Form, FormGroup, FormLabel, Button, Image } from 'react-bootstrap';
import img from "../img/reg.avif"
import { useNavigate } from "react-router-dom";


export default function Register() {
  const nav = useNavigate();
    const[msg,setMsg]=useState("")
  const init = {
    name: { value: "", valid: false, touched: false, error: "" },
    email: { value: "", valid: false, touched: false, error: "" },
    phone: { value: "", valid: false, touched: false, error: "" },
    username: { value: "", valid: false, touched: false, error: "" },
    password: { value: "", valid: false, touched: false, error: "" },
    formValid:false
    
  };
  const reducer = (state, action) => {
    switch (action.type) {
      case "update":
        const { key, value, touched, valid, error,formValid } = action.data;
        return { ...state, [key]: { value, touched, valid, error },formValid };
      case "reset":
        return init;
      default:
        return init;
    }
  };
  const handleReset = () => {
    dispatch({ type: "reset" });
  };

  const validateData = (key, val) => {
    let valid = true;
    let error = "";
    switch (key) {
      case "name":
        // var pattern = /^[a-zA-Z\s]{1,20}$/;
        var pattern =/^[A-Z]{1}[a-z]{1,} [A-Z]{1}[a-z]{1,}$/   //First Alphabet of First and Last NAME should be capital  
        if (!pattern.test(val)) {
          valid = false;
          error = "only alphabet allowed";
        }
        break;
       case "username":
            pattern=/^[a-zA-Z0-9._-]{6,15}$/   //range from 6 to 15 
            if(!pattern.test(val)){
                valid=false;
                error="error";
            }
            break;
            case "email":
                pattern=/^[\w.#-]{4,20}@[A-Za-z]{4,10}\.[a-z]{2,3}/  //
                if(!pattern.test(val)){
                    valid=false;
                    error="email error";
                }
                break;
                case "phone":
                    pattern=/^[897]{1}[0-9]{9}/
                    if(!pattern.test(val)){
                        valid=false;
                        error="can only contain numbers"
                    }
                    break;
                    case "password":
                      pattern=/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/
                      if(!pattern.test(val)){
                        valid=false; 
                        error="pass needs a lower upper and uppercase and digit "
                      }
                      break;
      default:
        valid = true;
        error = "";
    }
    return { valid: valid, error: error };
  };

  const handleChange = (key, value) => {
    const { valid, error } = validateData(key, value);
    console.log(user.name.valid);
    let formValid=true
    for(let k in user)
    {
      if(user[k].valid==false )
      {
        formValid=false;
        break;
      }
    }
    dispatch({
      type: "update",
      data: { key, value, touched: true, valid, error,formValid },
    });
  };
  const submitData = (e) => {
    e.preventDefault();
    const reqOption={
        method: "POST",
        headers:{'content-type':'application/json'},
        body:JSON.stringify({
            name:user.name.value,
            email:user.email.value,
            phone:user.phone.value,
            username:user.username.value,
            password:user.password.value

        })
    }
    // fetch("http://localhost:9000/insertcust",reqOption)
    // .then(resp=>resp.text())
    // .then((data)=>{setMsg(data)
    //   if({msg}=="success")
    //   {
    //     nav("/login");
    //   }
    //   })
    //   window.alert(msg)
    //   if({msg}=="success")
    //   {
    //     nav("/login");
    //   }
    fetch("http://localhost:9000/insertcust", reqOption)
  .then((resp) => resp.text())
  .then((data) => {
    setMsg(data);
    if (data === "success") { // Check the updated value of data
      alert("success");
      nav("/login");
    }
  });
    
  };
  const checkusername=()=>{
    const reqOption={
      method: "POST",
      headers:{'content-type':'application/json'},
      body:JSON.stringify({
          username:user.username.value,
      })
  }

    fetch("http://localhost:9000/check",reqOption)
    .then(res=>res.text())
    .then(data=>{
      setCheck(data)
      console.log(data)
      if(data=="Invalid")
      user.username.valid=false
    if(data=="Valid")
    user.username.valid=true
    })

  }
  
  const[check,setCheck]=useState(" ") 
  const [user, dispatch] = useReducer(reducer, init);
  console.log(user);


  return (
    <div className="row"> 
     
  <div className="col">
    
    <Image src={img} style={{ width: "500px", height: "500px", margin: "0 auto" }} alt="Logo" />
  </div>
  

  <div className="col" style={{marginTop:"50px"}} >
    <Form className="login-form"  onReset={handleReset} >
    <FormLabel ><h1 style={{textAlign:"center"}}>Register</h1></FormLabel>
      {/* Input for name */}
      <FormGroup>
        <FormLabel>Full Name</FormLabel>
        <input
          type="text"
          name="name"
          placeholder="Enter name"
          value={user.name.value}
          onChange={(e) => {
            handleChange("name", e.target.value);
          }}
          className={`form-control ${user.name.touched && !user.name.valid ? 'is-invalid' : ''}`}
        />
        {/* Error message for name */}
        <div className="invalid-feedback">{user.name.error}</div>
      </FormGroup>

      {/* Input for email */}
      <FormGroup>
        <FormLabel>Email</FormLabel>
        <input
          type="text"
          name="email"
          placeholder="Enter email"
          value={user.email.value}
          onChange={(e) => {
            handleChange("email", e.target.value);
          }}
          className={`form-control ${user.email.touched && !user.email.valid ? 'is-invalid' : ''}`}
        />
        {/* Error message for email */}
        <div className="invalid-feedback">{user.email.error}</div>
      </FormGroup>

      {/* Input for phone */}
      <FormGroup>
        <FormLabel>Phone</FormLabel>
        <input
          type="text"
          name="phone"
          placeholder="Enter phone number"
          maxLength={10}
          value={user.phone.value}
          onChange={(e) => {
            handleChange("phone", e.target.value);
          }}
          className={`form-control ${user.phone.touched && !user.phone.valid ? 'is-invalid' : ''}`}
        />
        {/* Error message for phone */}
        <div className="invalid-feedback">{user.phone.error}</div>
      </FormGroup>

      {/* Input for username */}
      <FormGroup>
        <FormLabel>Username</FormLabel>
        <input
          type="text"
          name="username"
          placeholder="Enter username"
          value={user.username.value}
          onChange={(e) => {
            handleChange("username", e.target.value);
          }}
          onBlur={()=>{
            checkusername()
          }}
          className={`form-control ${user.username.touched && !user.username.valid ? 'is-invalid' : ''}`}
        />
        {/* Error message for username */}
        <div className="invalid-feedback">{user.username.error}</div>
        <div className="check-div" style={{display:user.username.touched?'block':'none'}} >{check}</div>
      </FormGroup>

      {/* Input for password */}
      <FormGroup>
        <FormLabel>Password</FormLabel>
        <input
          type="text"
          name="password"
          placeholder="Enter password"
          onChange={(e) => {
            handleChange("password", e.target.value);
          }}
          className={`form-control ${user.password.touched && !user.password.valid ? 'is-invalid' : ''}`}
        />
        {/* Error message for password */}
        <div className="invalid-feedback">{user.password.error}</div>
      </FormGroup>

      {/* Submit and Reset buttons */}
      <Button variant="primary" type="submit" disabled={!user.formValid}   onClick={(e) => submitData(e)}>Submit</Button>
      <Button variant="danger" type="reset" >Reset</Button>
      <p style={{color:msg=="success"?"green":"red"}}  >{msg}</p>
      
    </Form>
  </div>

  <div className="col">
  
  </div>
</div>
  );
}
