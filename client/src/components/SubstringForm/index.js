import React, { useState } from "react";

import { Form, Col, Button, Spinner } from "./styles";

export default function SubstringForm({ className, onSubmit }) {
  const [loding, setLoding] = useState(false);
  const [string, setString] = useState("");
  const [substring, setSubstring] = useState("");

  const handleOnChange = (evenet, set) => {
    set(evenet.target.value);
  };

  const handleOnClick = () => {
    setString("");
    setSubstring("");
    setLoding(true);
    onSubmit(string, substring).then(() => setLoding(false));
  };

  return (
    <Form className={className}>
      <Form.Row className="flex-column flex-sm-row">
        <Col>
          <Form.Control
            size="lg"
            placeholder="String"
            disabled={loding}
            value={string}
            onChange={(event) => handleOnChange(event, setString)}
          />
        </Col>
        <Col className="mt-2 mt-sm-0">
          <Form.Control
            size="lg"
            placeholder="Substring "
            disabled={loding}
            value={substring}
            onChange={(event) => handleOnChange(event, setSubstring)}
          />
        </Col>
        <Col sm="12" md="auto" className="mt-2 mt-sm-0">
          <Button
            className="btn-block px-sm-5"
            size="lg"
            readOnly
            disabled={loding}
            onClick={handleOnClick}
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
              <span>Find</span>
            )}
          </Button>
        </Col>
      </Form.Row>
    </Form>
  );
}
