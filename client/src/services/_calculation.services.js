import api from "./_api";

export default {
  fecth: () => {
    return api
      .get("/calculations")
      .then((response) => response.data)
      .catch(handleError);
  },

  add: (string_a, string_b) => {
    return api
      .post("/calculations", { string_a, string_b })
      .then((response) => response.data)
      .catch(handleError);
  },

  remove: (id) => {
    return api
      .delete(`/calculations/${id}`)
      .then((response) => response.data)
      .catch(handleError);
  },
};

function handleError({ response }) {
  if (response.status === 401) {
    return Promise.reject({ 401: true });
  }
  console.log("error");
  return Promise.reject(response.data.errors);
}
