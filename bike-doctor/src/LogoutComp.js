import { useDispatch, useSelector } from "react-redux";
import { useNavigate } from "react-router-dom";
import {logout} from "./loggedSlice"

export default function LogoutComp(){
    const dispatch=useDispatch()
    const navigate=useNavigate('/login')
    dispatch(logout())
    const mystate=useSelector(state=>state.logged)
    navigate("/login")
    return (
        <div>
            <p>Logged Out Successfull</p>
            <p>Login Status:{ mystate.loggedIn.toString()}</p>
            
        </div>
    )
}