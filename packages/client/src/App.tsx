import { useComponentValue } from "@latticexyz/react";
import { SyncState } from "@latticexyz/network";
import { useMUD } from "./MUDContext";
import { GameBoard } from "./GameBoard";
import { setup } from "./mud/setup";
import React, { useState } from "react";

const {
  // components,
  systemCalls: {genRole},
  // network,
} = await setup();

export const App = () => {
    const [roleInput, setRoleInput] = useState<{
    name: string;
    description: string;
    age: number;
    karma: number;
  }>({
    name: "",
    description: "",
    age: 0,
    karma: 0,
  });
  const generateRole = async () => {
    const { description, name, karma, age } = roleInput;
    console.log("gen a new role", await genRole(name, description, age, karma));
  };
  return (
    <div className="">
      <br></br> 
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
        }}/>
      <br></br>
      <br></br>
      <button className="text-white" onClick={generateRole}>Generate A Role</button>
    </div>
  );
};
