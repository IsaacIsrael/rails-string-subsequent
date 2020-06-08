import React from "react";
import { BrowserRouter as Router, Switch, Route } from "react-router-dom";

export default function Routes() {
  return (
    <Router>
      <Switch>
        <Route exact path="/" children={<h1>Home</h1>} />
        <Route exact path="/signup" children={<h1>Sign Up</h1>} />
        <Route exact path="/login" children={<h1>Login</h1>} />
        <Route path="*" children={<h1>404</h1>} />
      </Switch>
    </Router>
  );
}
