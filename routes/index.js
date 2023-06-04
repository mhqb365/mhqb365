const express = require("express");
const batteryRouter = express.Router();

batteryRouter.get("/", async (req, res, next) => {
  res.send(`<pre>Simple way to check your laptop battery\n
If you use Windows, put this code to PowerShell: irm mhqb365.com/battery/win | iex\n
If you use MacOS, coming soon\n
If you use Linux, coming soon\n

----------
Change log:
4/6/2023: Release for Windows


From mhqb365.com with ❤️</pre>`);
});

batteryRouter.get("/win", async (req, res, next) => {
  const script = `powercfg /batteryreport /xml /output batteryreport.xml
    $battery = [xml](Get-Content batteryreport.xml)
  
    $health = [pscustomobject]@{
      DesignCapacity = $battery.BatteryReport.Batteries.Battery.DesignCapacity;
      FullChargeCapacity = $battery.BatteryReport.Batteries.Battery.FullChargeCapacity;
      Max =  $battery.BatteryReport.Batteries.Battery.FullChargeCapacity / $battery.BatteryReport.Batteries.Battery.DesignCapacity * 100;
      Fair = 100 - $battery.BatteryReport.Batteries.Battery.FullChargeCapacity / $battery.BatteryReport.Batteries.Battery.DesignCapacity * 100
    }
  
    Write-Host "Design Capacity: $($health.DesignCapacity) mWh"
    Write-Host "Full Charge Capacity: $($health.FullChargeCapacity) mWh"
    Write-Host "Dung luong toi da: $($health.Max)%"
    Write-Host "Do chai pin: $($health.Fair)%"`;
  const stringBuf = Buffer.from(script);
  res.send(stringBuf);
});

batteryRouter.get("/mac", async (req, res, next) => {
  const script = `a=$(ioreg -l -w0 | grep Capacity) && echo $a > a.xml`;
  // const stringBuf = Buffer.from(script);
  res.send(script);
});

module.exports = batteryRouter;
