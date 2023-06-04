const express = require("express");
const batteryRouter = express.Router();

batteryRouter.get("/", async (req, res, next) => {
  res.send(`<p>Chào mừng đến với b-Battery, cách đơn giản để kiểm tra tình trạng pin laptop<br />
<br />
Nếu bạn dùng Windows, bấm tổ hợp phím Windows + X và chọn Windows PowerShell rồi dán dòng lệnh này vào: <br />
<br />
<code>irm mhqb365.com/battery/win | iex</code><br />
<br />
Nếu bạn dùng MacOS, đang phát triển<br />
Nếu bạn dùng Linux, đang phát triển<br/ >
<br/ >
----------
<br />
Nhật ký:<br />
4/6/2023: Phiên bản cho Windows, hiện tại chỉ xem được 4 thông số (dung lượng thiết kế, dung lượng hiện tại, % dung lượng tối đa, % độ chai pin)
<br /><br />
From mhqb365.com with ❤️</p>`);
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
