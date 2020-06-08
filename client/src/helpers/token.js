const TOKEN_KEY = "@subsequence-app-token";

export default {
  set: (token) => localStorage.setItem(TOKEN_KEY, token),
  remove: () => localStorage.removeItem(TOKEN_KEY),
  get: () => localStorage.getItem(TOKEN_KEY),
};
