import "tailwindcss/tailwind.css";
import "react-toastify/dist/ReactToastify.css";

import ReactDOM from "react-dom/client";
import { mount as mountDevTools } from "@latticexyz/dev-tools";
import { App } from "./App";
import { setup } from "./mud/setup";
import { MUDProvider } from "./MUDContext";
import { ToastContainer } from "react-toastify";
import React, { useState } from "react";

const {
  // components,
  systemCalls: {genRole},
  // network,
} = await setup();

const rootElement = document.getElementById("react-root");
if (!rootElement) throw new Error("React root not found");
const root = ReactDOM.createRoot(rootElement);


// TODO: figure out if we actually want this to be async or if we should render something else in the meantime
setup().then((result) => {
  // const [roleInput, setRoleInput] = useState<{
  //   name: string;
  //   description: string;
  //   age: number;
  //   karma: number;
  // }>({
  //   name: "",
  //   description: "",
  //   age: 0,
  //   karma: 0,
  // });
  
  const generateRole = async () => {
    // console.log("test")
    // const { description, name, karma, age } = roleInput;
    // console.log(description, name, karma, age);
    console.log("gen a new role", await genRole("leeduckgo", "aha", 18, 100));
  };

  root.render(
    // <MUDProvider value={result}>
      
    //   <ToastContainer position="bottom-right" draggable={false} theme="dark" />
    // </MUDProvider>
    <div >
      <App />
      {/* <br></br>
      <p className="text-white">Role Name:</p>
      <input 
        type="text" 
        id="name"                 
        onChange={(e) => {
        setRoleInput({ ...roleInput, name: e.target.value})
      }}/>


      <br></br>
      <p className="text-white">Description:</p>
      <input 
        type="text" 
        id="description"              
        onChange={(e) => {
        setRoleInput({ ...roleInput, description: e.target.value})
      }}/>
      <br></br>
      <p className="text-white">Age:</p>
      <input
        type="text" 
        id="age"               
        onChange={(e) => {
        setRoleInput({ ...roleInput, age: parseInt(e.target.value)})
      }}/>
      <br></br>
      <p className="text-white">Karma:</p>
      <input 
        type="text" 
          id="karma"        
          onChange={(e) => {
            setRoleInput({ ...roleInput, karma: parseInt(e.target.value)})
        }}/> */}
      {/* <br></br>
      <br></br>
      <button className="text-white" onClick={generateRole}>Generate A Role</button> */}
    </div>
  );
  mountDevTools();
});
