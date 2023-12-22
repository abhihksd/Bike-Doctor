import { useReducer, useState } from "react";
import img from "../img/reg.avif"
export default function Register() {
    const[msg,setMsg]=useState("")
  const init = {
    name: { value: "", valid: false, touched: false, error: "" },
    email: { value: "", valid: false, touched: false, error: "" },
    phone: { value: "", valid: false, touched: false, error: "" },
    username: { value: "", valid: false, touched: false, error: "" },
    password: { value: "", valid: false, touched: false, error: "" },
    formvalid:false
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

  const validateData = (key, val) => {
    let valid = true;
    let error = "";
    switch (key) {
      case "name":
        var pattern = /^[a-zA-Z\s9]{1,20}$/;
        if (!pattern.test(val)) {
          valid = false;
          error = "only alphabet allowed";
        }
        break;
       case "username":
            pattern=/^[a-zA-z._-]{6,15}$/
            if(!pattern.test(val)){
                valid=false;
                error="error";
            }
            break;
            case "email":
                pattern=/^[\w.#-]{4,20}@[A-Za-z]{4,10}\.[a-z]{2,3}/
                if(!pattern.test(val)){
                    valid=false;
                    error="email error";
                }
                break;
                case "phone":
                    pattern=/^[0-9]{10}/
                    if(!pattern.test(val)){
                        valid=false;
                        error="can only contain numbers"
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
    for(let k in user){
      if(user[k].valid===false){
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
    fetch("http://localhost:9000/insertcust",reqOption)
    .then(resp=>resp.text())
    .then(data=>setMsg(data))
  };
  
  const [user, dispatch] = useReducer(reducer, init);
  return (

    <div className="row">
    <div className="col">
        {/* <p> this is the left side</p> */}
       
    </div>
    <div className="col" style={{margin:"50px"}}>
      <form action="" className="row">
      <div className="App">
      <h1 className="App">Registration</h1> 
<img  src={img} style={{width:"200px", height:"200px"  }} alt="pic"/>
</div>

        {/* input for name */}
        <input
          type="text"
          name="name"
          placeholder="enter name"
          value={user.name.value}
          required
          onChange={(e) => {
            handleChange("name", e.target.value);
          }}
        />{" "}
        <br />

        {/* error message for name */}
        <div
          style={{
            display: user.name.touched && !user.name.valid ? "block" : "none", color:"red",
          }}
        >
          {user.name.error}
        </div>

          {/* email */}
          <input type="text" name="email" placeholder="enter email"  value={user.email.value} onChange={(e)=>{handleChange("email",e.target.value)}} />
          <div style={{display:user.email.touched && !user.email.valid?"block":"none" , color:"red",}}>{user.email.error}</div> <br />

          {/* phone number */}
          <input type="text" name="phone" placeholder="enter phone number" maxLength={10}  value={user.phone.value} onChange={(e)=>{handleChange("phone",e.target.value)}} />
          <div style={{display:user.phone.touched && !user.phone.valid?"block":"none"}}></div> <br />

          {/* input for username */}
          <input type="text" name="username" placeholder="enter username" value={user.username.value} onChange={(e) => {handleChange("username", e.target.value);}}
        />{" "}
        
        {/* error message for username */}
        <div style={{display: user.username.touched && !user.username.valid ? "block" : "none",}}>{user.username.error}</div><br />

         {/* input for password */}
         <input type="text" name="password" placeholder="enter password" onChange={(e)=>{handleChange("password",e.target.value)}}  />
         
         <div style={{display:user.password.touched && !user.password.valid? "block":"none"}}>{user.password.error}</div>
        {/* submit button */}
        <br />
        <input type="submit" value="submit" className="btn btn-primary" disabled={!user.formValid}    onClick={(e)=>{submitData(e)}}/>
        {/* Reset button */}
        <input type="reset" className="btn btn-danger" value="reset"/>
      </form>
          {/* <div><p>{msg}</p></div> */}
          {/* <div><p>{JSON.stringify(user)}</p></div> */}
    </div>
    <div className="col">
        {/* <p>This is the riht side</p> */}
    </div>
    </div>
  );
}
