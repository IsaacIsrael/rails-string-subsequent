import React, { useState } from "react";

import { Form, Button, Spinner } from "./styles";

export default function UserForm({
  passwordConfirmation = false,
  onSubmit,
  error = {},
  loding,
  buttonValue = "Login",
}) {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [password_confirmation, setPasswordConfirmation] = useState("");

  const handleOnChange = (evenet, set) => {
    set(evenet.target.value);
  };

  const handleOnClick = () => {
    onSubmit(email, password, password_confirmation);
  };

  return (
    <Form>
      <Form.Group controlId="formGroupEmail">
        <Form.Label>Email address</Form.Label>
        <Form.Control
          type="email"
          placeholder="Enter email"
          disabled={loding}
          value={email}
          onChange={(event) => handleOnChange(event, setEmail)}
          isInvalid={error["email"]}
        />
        <Form.Control.Feedback type="invalid">
          {error["email"]}
        </Form.Control.Feedback>
      </Form.Group>
      <Form.Group controlId="formGroupPassword">
        <Form.Label>Password</Form.Label>
        <Form.Control
          type="password"
          placeholder="Password"
          disabled={loding}
          value={password}
          onChange={(event) => handleOnChange(event, setPassword)}
          isInvalid={error["password"]}
        />
        <Form.Control.Feedback type="invalid">
          {error["password"]}
        </Form.Control.Feedback>
      </Form.Group>
      {passwordConfirmation && (
        <Form.Group controlId="formGroupPassword">
          <Form.Label>Password Confirmation</Form.Label>
          <Form.Control
            type="password"
            placeholder="Password Confirmation"
            disabled={loding}
            value={password_confirmation}
            onChange={(event) => handleOnChange(event, setPasswordConfirmation)}
            isInvalid={error["password_confirmation"]}
          />
          <Form.Control.Feedback type="invalid">
            {error["password_confirmation"]}
          </Form.Control.Feedback>
        </Form.Group>
      )}
      <Button className="btn-block " disabled={loding} onClick={handleOnClick}>
        {loding ? (
          <Spinner
            as="span"
            animation="border"
            size="sm"
            role="status"
            aria-hidden="true"
          />
        ) : (
          <span>{buttonValue}</span>
        )}
      </Button>
    </Form>
  );
}
