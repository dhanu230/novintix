<<<<<<< f1062d418a52f0bc3159ce6b6da1b6293b2535f5
const express = require("express");
const app = express();

const PORT = process.env.PORT || 3000;

app.get("/", (req, res) => {
    res.send("Novintix App running successfully!");
});

app.listen(PORT, () => {
    console.log(`Server started on port ${PORT}`);
});
=======
const express = require("express");
const app = express();
const PORT = process.env.PORT || 3000;

app.get("/", (req, res) => {
  res.json({ message: "Hello World!", version: "v1" });
});

app.get("/healthz", (req, res) => res.send("ok"));
app.get("/readyz", (req, res) => res.send("ready"));

app.listen(PORT, () => console.log(`App running on port ${PORT}`));
>>>>>>> fixed vulnarabilities
