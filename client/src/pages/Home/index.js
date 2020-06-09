import React, { useState, useEffect } from "react";
import { useHistory } from "react-router-dom";
import {
  Container,
  Wrap,
  Toast,
  SubstringForm,
  HistoryList,
  Spinner,
} from "./styles";

import { calculationService } from "../../services";

export default function Home() {
  const [records, setRecords] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState("");

  let history = useHistory();

  const handleUnauthorized = (error) => {
    if (error[401]) {
      history.push("/login");
    } else {
      return Promise.reject(error);
    }
  };

  useEffect(() => {
    setLoading(true);
    calculationService
      .fecth()
      .then((data) => {
        setLoading(false);
        setRecords(data);
      })
      .catch(handleUnauthorized)
      .catch((error) => {
        setError(error);
      });
  }, []);

  const handleSubmit = (string, substring) => {
    return calculationService
      .add(string, substring)
      .then((data) => {
        setRecords([data, ...records]);
      })
      .catch(handleUnauthorized)
      .catch((error) => {
        setError(error);
      });
  };

  const handleRemove = (id) => {
    return calculationService
      .remove(id)
      .then(() => calculationService.fecth())
      .then((data) => {
        setRecords(data);
      })
      .catch(handleUnauthorized)
      .catch((error) => {
        setError(error);
      });
  };

  return (
    <Container>
      <section className="my-5">
        <header>
          <h1 className="text-center">Subsequences</h1>
        </header>
        <Wrap>
          <SubstringForm onSubmit={handleSubmit} />
        </Wrap>
        <Wrap>
          {loading && (
            <div className="text-center">
              <Spinner animation="border" variant="secondary" />
            </div>
          )}
          <HistoryList records={records} onRemove={handleRemove} />
        </Wrap>
      </section>
      <Toast
        onClose={() => setError("")}
        show={error}
        style={{
          position: "absolute",
          bottom: 40,
          right: 40,
        }}
      >
        <Toast.Header>
          <strong className="mr-auto">Error</strong>
        </Toast.Header>
        <Toast.Body>Woohoo, you're reading this text in a Toast!</Toast.Body>
      </Toast>
    </Container>
  );
}
