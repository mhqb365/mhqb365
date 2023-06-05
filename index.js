const express = require("express");
const activeRouter = require("./routes/active");
const app = express();
const port = 8000;

app.use(express.static("public"));
app.use("/active", activeRouter);

app.listen(port, () => {
  console.log(`mhqb365.com run at ${port}`);
});
