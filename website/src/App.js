import logo from './logo.svg';
import './App.css';
import MysteryButton from './components/MysteryButton';

function App() {
  return (
    <div className="App">
        <h1>
          Joseph's test website <span style={{fontSize: "6px"}}>of doom</span>
        </h1>
      <header className="App-header">
        <p>
          Welcome to my website
        </p>
        <img src={logo} className="App-logo" alt="logo" />
        <p style={{fontSize: "22px", padding: "0px", margin: "0px"}}>
          ^ Guess the bananas name ^
        </p>
        <MysteryButton></MysteryButton>
      </header>
    </div>
  );
}

export default App;
