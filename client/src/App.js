// import logo from './logo.svg';
import "./App.css";
import { BrowserRouter as Router, Route, Link } from "react-router-dom";
import OtherPage from "./OtherPage";
import Fibonacci from "./Fibonacci";

function App() {
  return (
    <Router>
      <div className="App">
        <header className="App-header">
          {/* <img src={logo} className="App-logo" alt="logo" /> */}
          <h1 className="App-title">Fibonacci Calculator 🖩</h1>
          <Link to="/otherpage">Other Page</Link>
          <div>
            <Route exact path="/" component={Fibonacci} />
            <Route path="/otherpage" component={OtherPage} />
          </div>
        </header>
      </div>
    </Router>
  );
}

export default App;
