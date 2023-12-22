import logo from "./logo.svg";
import "./App.css";
import Register from "./Components/RegistrationForm";
import { Link, Route, Routes } from "react-router-dom";
import LoginForm from "./Components/LoginForm";
import Home from "./Components/Home";
import { useSelector } from "react-redux";
import LogoutComp from "./LogoutComp";
import UpdatePass from "./Components/UpdatePass";
import log from "./img/logo.jpg"

function App() {
  return (
   <div>
    <header className="App-header" style={{minHeight:mystate.loggedIn?"0vh":"10vh"}}>
      <div style={{display:mystate.loggedIn?"none":"block" }}>
      <ul className="nav-bar">
        {/* <li className="nav-item" ><Link to='/home'>HOME</Link></li> */}
        {/* <li className="nav-item"><img src={log} style={{width:"10vh", height:"10vh"}} alt="logo" /></li> */}
        <li className="nav-item"><Link to='/register' style={{ marginLeft: '1250px' }}>Register</Link></li>
        <li className="nav-item"><Link to='/login' style={{ marginRight: '50px' }}  >Login</Link></li>
{/* >>>>>>> Stashed changes */}
      </ul>
      </div>
    </header>
    <div>
      <Routes>
        <Route path="/home" element={<Home/>}>
          <Route path="logout" element={<LogoutComp/>}></Route>
          <Route path="update" element={<UpdatePass/>}></Route>
        </Route>
        <Route path="/register" element={<Register/>} />
        <Route path="/login" element={<LoginForm/>} />
        
        
        
      </Routes>
    </div>
   </div>
  );
}

export default App;
