
import React from "react";
import Car from "./Car"; 

class Model extends Car {
  constructor(name, mod) {
    super(name);
    // this.model = mod;
  }

//   show() {
//     return this.present() + ", it is a " + this.model;
//   }
}

const Comp = () => {
  const myCar = new Model("Ford", "Mustang");
  return <h2>{myCar.newMe()}</h2>;
};

export default Comp;
