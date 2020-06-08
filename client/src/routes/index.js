import React from "react";
import { BrowserRouter as Router, Switch, Route } from "react-router-dom";
import PrivateRoute from "./PrivateRoute";

import { Signup, Login } from "../pages";

export default function Routes() {
  return (
    <Router>
      <Switch>
        <PrivateRoute exact path="/" children={<h1>Home</h1>} />
        <Route exact path="/signup" component={Signup} />
        <Route exact path="/login" component={Login} />
      </Switch>
    </Router>
  );
}
