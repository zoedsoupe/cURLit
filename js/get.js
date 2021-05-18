const reqOpts = {
  method: "GET",
  redirect: "follow"
};

fetch("your_endpoint", reqOpts)
  .then((resp) => resp.text())
  .then((res) => console.log(res))
  .catch((err) => console.error("ERROR", err));
