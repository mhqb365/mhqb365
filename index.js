const express = require("express");
const app = express();
const port = 8000;
const cors = require("cors");

app.use(cors());
app.use(express.static("public"));

app.listen(port, () => {
  console.log(`mhqb365.com run at ${port}`);
});
