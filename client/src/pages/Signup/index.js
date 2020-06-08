import React, { useState } from "react";
import { useHistory } from "react-router-dom";

import {
  Container,
  Wrap,
  Card,
  UserForm,
  Link,
  Button,
  Spinner,
} from "./styles";

import { authService } from "../../services";

export default function Signup() {
  const [loding, setLoding] = useState(false);
  const [error, setError] = useState("");
  let history = useHistory();

  const handleSubmit = (email, password, password_confirmation) => {
    setLoding(true);
    authService
      .signup({ email, password, password_confirmation })
      .then(() => {
        setLoding(false);
        history.push("/login");
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
                <small>Create new User</small>
              </h1>
            </Card.Title>
            <UserForm
              onSubmit={handleSubmit}
              passwordConfirmation={true}
              error={error}
              loding={loding}
              buttonValue="Create"
            />
            <Button
              variant="danger"
              className="mt-3 btn-block"
              as={Link}
              disabled={loding}
              to="/login"
            >
              {loding ? (
                <Spinner
                  as="span"
                  animation="border"
                  size="sm"
                  role="status"
                  aria-hidden="true"
                />
              ) : (
                <span>Cancel</span>
              )}
            </Button>
          </Card.Body>
        </Card>
      </Wrap>
    </Container>
  );
}
