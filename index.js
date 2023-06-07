const express = require("express");
const activeRouter = require("./routes/kms");
const app = express();
const port = 8000;
const cors = require("cors");

app.use(cors());
app.use(express.static("public"));
app.use("/kms", activeRouter);

app.listen(port, () => {
  console.log(`mhqb365.com run at ${port}`);
});
