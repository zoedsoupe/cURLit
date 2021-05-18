import http from "http";

const URL = "your_endpoint";

http.get(URL, (res) => {
  const { statusCode } = res;
  const contentType = res.headers["content-type"];

  if (statusCode !== 200)
    throw new Error(`Request Failed.\n Status: ${statusCode}`);

  res.setEncoding("utf-8");
  
  let rawData = "";
  res.on("data", (chunk) => { rawData += chunk });

  res.on("end", () => console.log(rawData));

}).on("error", (err) => console.error(`An error: ${err.message}`));
