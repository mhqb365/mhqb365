const express = require("express");
const kmsRouter = express.Router();
const { dirname } = require("path");
const appDir = dirname(require.main.filename);

kmsRouter.get("/", async (req, res, next) => {
  res.sendFile(appDir + "/storage/kms.v1.8.bat");
});

module.exports = kmsRouter;
