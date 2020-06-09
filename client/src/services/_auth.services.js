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

  logout: () => {
    return api
      .delete("/logout")
      .then((response) => token.remove())
      .catch(({ response }) => Promise.reject(response.data));
  },

  signup: (user) => {
    return api.post("/signup", { user }).catch(handleError);
  },
};

function handleError(error) {
  return Promise.reject(error.response.data.errors);
}
