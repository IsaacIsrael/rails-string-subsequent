import React from "react";

import { ListGroup, Col, String, Substring, Button } from "./styles";

export default function HistoryList({ records = [], onRemove }) {
  return (
    <ListGroup className="mt-5">
      {records.map((record) => (
        <ListGroup.Item
          key={record.id}
          variant={record.result ? "success" : "danger"}
          className="d-flex flex-column flex-sm-row align-items-center"
        >
          <Col>
            <String>
              {record.string_a
                .split("")
                .map((char, index) =>
                  record.substrings && record.substrings.includes(index) ? (
                    <span key={index}>{char}</span>
                  ) : (
                    char
                  )
                )}
            </String>
          </Col>
          <Col className="mt-2 mt-sm-0">
            <Substring>{record.string_b}</Substring>
          </Col>
          <Col md="auto" className="mt-2 mt-sm-0">
            <Button
              className="btn-block"
              variant="outline-dark"
              onClick={() => onRemove(record.id)}
            >
              <span>Remove</span>
            </Button>
          </Col>
        </ListGroup.Item>
      ))}
    </ListGroup>
  );
}
