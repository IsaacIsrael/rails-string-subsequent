import axios from "axios";
import token from "../helpers/token";

const api = axios.create({
  baseURL: "/api",
});

api.interceptors.request.use(async (config) => {
  if (token.get()) {
    config.headers.Authorization = token.get();
  }

  return config;
});

api.interceptors.response.use(
  async (response) => response,
  async (error) => {
    if (error.config.url !== "/api/login" && error.response.status === 401) {
      token.remove();
    }
    return Promise.reject(error);
  }
);

export default api;
