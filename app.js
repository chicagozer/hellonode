const http = require("http");

const hostname = "127.0.0.1";
const port = 3000;
const namespace = process.env.POD_NAMESPACE;
const imagetag = process.env.IMAGE_TAG;

const server = http.createServer((req, res) => {
  res.statusCode = 200;
  res.setHeader("Content-Type", "text/html");

  const html = `<html>
 <head>
    <title>Hello From Node</title>
    <meta http-equiv="refresh" content="10">
 </head>
 <body>
   <h1>Good Morning Everyone!<h1>
   <h1>Namespace: ${namespace}<h1>
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
