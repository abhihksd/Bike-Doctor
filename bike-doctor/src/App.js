import logo from "./logo.svg";
import bike from "./img/logo.png"
import "./App.css";
import Register from "./Components/RegistrationForm";
import { Link, Route, Routes } from "react-router-dom";
import LoginForm from "./Components/LoginForm";
import Home from "./Components/Home";
import { useSelector } from "react-redux";
import LogoutComp from "./LogoutComp";
import UpdatePass from "./Components/UpdatePass";
import OrderHis from "./Components/OrderHistory";
import Welcome from "./Components/Welcome";

function App() {
  const mystate=useSelector(state=>state.logged)
  return (
   <div>
    <header className="App-header" style={{minHeight:mystate.loggedIn?"0vh":"auto"}}>
      <div  style={{display:mystate.loggedIn?"none":"block", }}>
      <ul className="nav-bar">
        {/* <li className="nav-item" ><Link to='/home'>HOME</Link></li> */}
        <li className="nav-item"><img className="App-logo"  src={bike}></img></li>
        <li className="nav-item"><Link to='/register'   >Register</Link></li>
        <li className="nav-item"><Link to='/login'>Login</Link></li>
      </ul>
      </div>
    </header>
    <div>
      <Routes>
        <Route path="/" element={<Welcome/>} ></Route>
        <Route path="/home" element={<Home/>}>
          <Route path="logout" element={<LogoutComp/>}></Route>
          <Route path="update" element={<UpdatePass/>}></Route>
          <Route path="/home/history" element={<OrderHis/>}></Route>
          {/* <Route path="history" element={<OrderHis/>} ></Route> */}
        </Route>
        <Route path="/register" element={<Register/>} />
        <Route path="/login" element={<LoginForm/>} />
        
        
        
      </Routes>
     
    </div>
    
   </div>
  );
}

export default App;
