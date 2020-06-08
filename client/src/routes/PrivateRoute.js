import React from "react";
import { Route, Redirect } from "react-router-dom";
import token from "../helpers/token";

export default function PrivateRoute({ component, ...rest }) {
  return (
    <Route
      {...rest}
      render={({ location }) => {
        const Component = component;
        return token.get() ? (
          <Component />
        ) : (
          <Redirect
            to={{
              pathname: "/login",
              state: { from: location },
            }}
          />
        );
      }}
    />
  );
}
