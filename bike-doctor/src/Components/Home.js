import { Link, Outlet, Routes,Route } from "react-router-dom";
import { useSelector } from "react-redux";
import bike from "../img/logo.png"
import "../CSS/Home.css"
export default function Home(){
    const mystate=useSelector((state)=>state.logged);
    return (
        <div>
            
            <ul className="nav-navbar App-header2">
            <img className="App-logo2" src={bike} style={{marginRight:"1050px"}} ></img>
                <li className="nav-item">
                    <Link to="history" className="nav-link" >
                        Order history
                    </Link>
                </li>
                <li className="nav-item">
                    <Link to="logout" className="nav-link">Logout</Link>
                </li>
                <li className="nav-item">
                    <Link to="update" className="nav-link">Update</Link>
                </li>
            </ul>
            <h1>HOME PAGE!!</h1>
            <h2>Welcome {localStorage.getItem("user")}</h2>
            {/* <p>Login Status: {mystate.loggedIn.toString()}</p> */}
            
            
            <Outlet/>
        </div>
        
    )
}