const express = require("express");
const app = express();
const PORT = process.env.PORT || 3000;

app.get("/", (req, res) => {
  res.json({ message: "Hello World!", version: "v1" });
});

app.get("/healthz", (req, res) => res.send("ok"));
app.get("/readyz", (req, res) => res.send("ready"));

app.listen(PORT, () => console.log(`App running on port ${PORT}`));
