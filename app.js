const newrelic = require('newrelic');

const http = require("http");

const hostname = "127.0.0.1";
const port = 3000;
const namespace = process.env.POD_NAMESPACE;
const imagetag = process.env.IMAGE_TAG;
const service = process.env.SERVICE_NAME;

const server = http.createServer((req, res) => {
  res.statusCode = 200;
  res.setHeader("Content-Type", "text/html");
  const host = req.headers.host;

  const html = `<html>
 <head>
    <title>Hello From Node</title>
    <meta http-equiv="refresh" content="10">
 </head>
 <body>
   <h1>Good Evening Everyone!!<h1>
   <h1>Host Header: ${host}<h1>
   <h1>Namespace: ${namespace}<h1>
   <h1>Service: ${service}<h1>
   <h1>Tag: ${imagetag}<h1>
   <h1>uptime: ${process.uptime()}<h1>
 </body>
</html>`;

  res.end(html);
});

server.listen(port, () => {
  console.log(
    `Namespace:${namespace} Tag:${imagetag} Server running at http://${hostname}:${port}/`
  );
});
