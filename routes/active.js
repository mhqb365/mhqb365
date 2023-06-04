const express = require("express");
const activeRouter = express.Router();
const fs = require("fs");
const { dirname } = require("path");
const appDir = dirname(require.main.filename);

activeRouter.get("/", async (req, res, next) => {
  const activeScript = fs.readFileSync(
    appDir + "/storage/active-script-v1.8.cmd"
  );
  res.send(activeScript);
});

module.exports = activeRouter;

// curl localhost:8000/battery/mac | bash
