const express = require("express");
const activeRouter = express.Router();
const fs = require("fs");
const path = require("path");

activeRouter.get("/", async (req, res, next) => {
  const options = {
    root: path.join(__dirname)
};
  const activeScript = "active-script-v1.8.cmd";
  // const stringBuf = Buffer.from(activeScript);
  res.sendFile(activeScript, options);
});

module.exports = activeRouter;
