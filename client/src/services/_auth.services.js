import api from "./_api";
import token from "../helpers/token";

export default {
  login: (user) => {
    return api
      .post("/login", { user })
      .then((response) => {
        token.set(response.headers.authorization);
      })
      .catch(({ response }) => Promise.reject(response.data));
  },

  logout: (user) => {
    return new Promise((resolve, reject) => {
      setTimeout(() => resolve(), 2000);
    });
  },

  signup: (user) => {
    return api.post("/signup", { user }).catch(handleError);
  },
};

function handleError(error) {
  return Promise.reject(error.response.data.errors);
}
