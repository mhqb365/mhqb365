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
    Time = $battery.BatteryReport.ReportInformation.ScanTime;
    Brands = $battery.BatteryReport.Batteries.Battery.Id;
    Manufacturer = $battery.BatteryReport.Batteries.Battery.Manufacturer;
    ManufactureDate = $battery.BatteryReport.Batteries.Battery.ManufactureDate;
    SerialNumber = $battery.BatteryReport.Batteries.Battery.SerialNumber;
    DesignCapacity = $battery.BatteryReport.Batteries.Battery.DesignCapacity;
    FullChargeCapacity = $battery.BatteryReport.Batteries.Battery.FullChargeCapacity;
    MaxCapacity = $battery.BatteryReport.Batteries.Battery.FullChargeCapacity / $battery.BatteryReport.Batteries.Battery.DesignCapacity * 100
    FailureCapacity = 100 - ($battery.BatteryReport.Batteries.Battery.FullChargeCapacity / $battery.BatteryReport.Batteries.Battery.DesignCapacity * 100);
    CycleCount = $battery.BatteryReport.Batteries.Battery.CycleCount;
  }
  
  Write-Host "Thoi gian kiem tra: $($health.Time)"
  Write-Host "Nha san xuat: $($health.Brands) - $($health.Manufacturer)"
  Write-Host "Ngay san xuat: $($health.ManufactureDate)"
  Write-Host "So serial: $($health.SerialNumber)"
  Write-Host "Dung luong thiet ke ban dau: $($health.DesignCapacity) mWh"
  Write-Host "Dung luong khi duoc sac day: $($health.FullChargeCapacity) mWh"
  Write-Host "% dung luong toi da: $($health.MaxCapacity)%"
  Write-Host "% do chai pin: $($health.FailureCapacity)%"
  Write-Host "So lan sac: $($health.CycleCount)"`;
  const stringBuf = Buffer.from(script);
  res.send(stringBuf);
});

batteryRouter.get("/mac", async (req, res, next) => {
  const script = `a=$(ioreg -l -w0 | grep Capacity) && echo $a > a.xml`;
  // const stringBuf = Buffer.from(script);
  res.send(script);
});

module.exports = batteryRouter;
