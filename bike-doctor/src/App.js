import logo from "./logo.svg";
import "./App.css";
import Register from "./Components/RegistrationForm";
import { Link, Route, Routes } from "react-router-dom";
import LoginForm from "./Components/LoginForm";

function App() {
  return (
   <div>
    <header className="App-header">
      <ul>
        <li><Link to='/register'>Register</Link></li>
        <li><Link to='/login'>Login</Link></li>
      
      
      </ul>
    </header>
    <div>
      <Routes>
        <Route path="/register" element={<Register/>} />
        <Route path="/login" element={<LoginForm/>} />
      </Routes>
    </div>
   </div>
  );
}

export default App;
