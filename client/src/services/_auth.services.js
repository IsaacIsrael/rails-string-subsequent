import api from "./_api";
import token from "../helpers/token";

export default {
  login: () => {
    return new Promise((resolve, reject) => {
      setTimeout(() => resolve(), 2000);
    });
    // .then((response) => {

    //   // token.set(response.headers.authorization);
    //   // return response;
    // })
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
