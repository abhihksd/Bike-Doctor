import { useState } from "react"
import { useNavigate } from "react-router-dom"
import "../CSS/UpdateForm.css";
export default function UpdatePass(){
    const [msg,setMsg]=useState("")
    const[user,setUser]=useState("") 
    const[oldpass,setOldPass]=useState("") 
    const[newpass,setNewPass]=useState("") 
    const nav=useNavigate()
    const udpateFun=(e)=>{
        e.preventDefault()
        const reqOption={
            method:"PUT",
            headers:{"content-type":"application/json"},
            body:JSON.stringify({
                username:user,
                oldpassword:oldpass,
                newpassword:newpass
            })
        }
        fetch("http://localhost:9000/update",reqOption)
        .then((resp)=>resp.text())
        .then((data)=>{setMsg(data)})
    }
    if(msg=="updated")
    nav("/login")

    const handleReset = () => {
        setUser('');
        setOldPass('');
        setNewPass('');
        setMsg('');
      };

    return (
        <div>
            {/* <form action="">
                <input type="text" placeholder="enter username" />
                <input type="text" placeholder="enter old password" />
                <input type="text" placeholder="enter new password" />
                <input type="button" value="Update" />
                <input type="reset" value="Reset" />
            </form>
            <p>{msg}</p> */}
             <div className="update-password-form">
      <form onSubmit={UpdatePass}>
        <div className="mb-3">
          <label htmlFor="username" className="form-label">
            Username:
          </label>
          <input
            type="text"
            id="username"
            className="form-control"
            placeholder="Enter username"
            value={user}
            onChange={(e) => setUser(e.target.value)}
            required
          />
        </div>

        <div className="mb-3">
          <label htmlFor="oldPassword" className="form-label">
            Old Password:
          </label>
          <input
            type="password"
            id="oldPassword"
            className="form-control"
            placeholder="Enter old password"
            value={oldpass}
            onChange={(e) => setOldPass(e.target.value)}
            required
          />
        </div>

        <div className="mb-3">
          <label htmlFor="newPassword" className="form-label">
            New Password:
          </label>
          <input
            type="password"
            id="newPassword"
            className="form-control"
            placeholder="Enter new password"
            value={newpass}
            onChange={(e) => setNewPass(e.target.value)}
            required
          />
        </div>

        <div className="d-grid gap-2">
          <button type="submit" className="btn btn-primary">
            Update
          </button>
          <button type="button" className="btn btn-secondary" onClick={handleReset}>
            Reset
          </button>
        </div>
      </form>

      <p className="mt-3">{msg}</p>
    </div>
        </div>
    )
}