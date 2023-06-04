const express = require("express");
const batteryRouter = require("./routes");
const app = express();
const port = 8000;

app.use(express.static("public"));
app.use("/battery", batteryRouter);

app.listen(port, () => {
  console.log(`mhqb365.com run at ${port}`);
});
