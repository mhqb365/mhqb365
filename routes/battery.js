const express = require("express");
const batteryRouter = express.Router();
const fs = require("fs");
const { dirname } = require("path");
const appDir = dirname(require.main.filename);

batteryRouter.get("/", async (req, res, next) => {
  res.sendFile(appDir + "/public/battery-calculator/bBattery.html");
});

batteryRouter.get("/win", async (req, res, next) => {
  const bBatteryWinScript = fs.readFileSync(appDir + "/storage/bBattery.ps1");
  const stringBuf = Buffer.from(bBatteryWinScript);
  res.send(stringBuf);
});

batteryRouter.get("/mac", async (req, res, next) => {
  const bBatteryMacScript = `a=$(ioreg -l -w0 | grep Capacity) && echo $a > a.xml`;
  res.send(bBatteryMacScript);
});

module.exports = batteryRouter;
