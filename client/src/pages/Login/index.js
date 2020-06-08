import React, { useState } from "react";
import { useHistory } from "react-router-dom";

import { Container, Wrap, Card, UserForm, Link, Alert } from "./styles";

import { authService } from "../../services";

export default function Login() {
  const [error, setError] = useState("");
  const [loding, setLoding] = useState(false);

  let history = useHistory();

  const handleSubmit = (email, password) => {
    setLoding(true);
    authService
      .login({ email, password })
      .then((response) => {
        setLoding(false);
        history.push("/");
      })
      .catch((error) => {
        setLoding(false);
        setError(error);
      });
  };

  return (
    <Container>
      <Wrap>
        <Card style={{ width: "24rem" }}>
          <Card.Body>
            <Card.Title className="text-center">
              <h1>
                <small>Login</small>
              </h1>
            </Card.Title>
            {error && <Alert variant="danger">{error}</Alert>}
            <UserForm onSubmit={handleSubmit} loding={loding} />
            <div className="mt-3">
              <Link to="/signup">Create a free acount</Link>
            </div>
          </Card.Body>
        </Card>
      </Wrap>
    </Container>
  );
}
