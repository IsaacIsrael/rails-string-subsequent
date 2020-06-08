import React from "react";
import { BrowserRouter as Router, Switch, Route } from "react-router-dom";

import { Signup } from "../pages";

export default function Routes() {
  return (
    <Router>
      <Switch>
        <Route exact path="/" children={<h1>Home</h1>} />
        <Route exact path="/signup" component={Signup} />
        <Route exact path="/login" children={<h1>Login</h1>} />
      </Switch>
    </Router>
  );
}
