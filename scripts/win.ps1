# --- Initial Language Selection ---
Clear-Host
Write-Host "=====================================================" -ForegroundColor Cyan
Write-Host "          SELECT LANGUAGE / CHON NGON NGU" -ForegroundColor White
Write-Host "=====================================================" -ForegroundColor Cyan
Write-Host " [1] Tieng Viet"
Write-Host " [2] English"
Write-Host "-----------------------------------------------------" -ForegroundColor Gray
$langChoice = Read-Host ">>> Chon / Choice (1-2)"

$lang = "EN"
if ($langChoice -eq "1") { $lang = "VI" }

# --- Translation Dictionary ---
$Msg = @{
    VI = @{
        Menu1 = "Kiem tra Do Chai Pin"
        Menu2 = "Don dep RAM"
        Menu3 = "Don dep Disk"
        Menu4 = "Quan ly Windows Update"
        Menu5 = "Quan ly Bitlocker"
        Menu6 = "Office Tool Plus"
        Menu7 = "Microsoft Activation Scripts (MAS)"
        MenuL = "Thay doi ngon ngu"
        Menu0 = "Thoat"
        Prompt = ">>> Vui long chon (1-7, L, E)"
        SubPrompt = ">>> Vui long chon (1-2, B)"
        MAS_AIO = "[*] Dang tai MAS Full..."
        OTP_Loading = "[*] Dang tai Office Tool Plus..."
        Battery = "[*] Dang tai script kiem tra do chai pin..."
        Clean_RAM_Wait = "[*] Dang toi uu hoa bo nho RAM..."
        Clean_Disk_Wait = "[*] Dang quet va don dep o cung..."
        Clean_Result = "--- KET QUA DON DEP ---"
        Clean_Total = "TONG DUNG LUONG DA DON DEP: "
        Update_Status = "Trang thai hien tai: "
        Update_On = "DANG BAT"
        Update_Off = "DANG TAT"
        Update_Menu1 = "Tat Update Windows"
        Update_Menu2 = "Bat Update Windows"
        Update_Back = "Quay lai"
        Update_Enabling = "[*] Dang bat dich vu Windows Update..."
        Update_Disabling = "[*] Dang tat dich vu Windows Update..."
        Done = "[*] Hoan tat. Nhan phim bat ky de quay lai menu..."
        Update_Header = "--- QUAN LY WINDOWS UPDATE ---"
        Bit_Header = "--- BITLOCKER MANAGER ---"
        Bit_Menu = "Quan ly Bitlocker"
        Bit_Status = "Trang thai"
        Bit_Prot = "Bao ve"
        Bit_Lock = "Khoa"
        Bit_Menu_On = "Bat Bitlocker"
        Bit_Menu_Off = "Tat Bitlocker"
        Bit_EnterDrive = "Nhap ky tu o dia de thay doi (vd: C): "
        Bit_Enabling = "[*] Dang bat Bitlocker cho o "
        Bit_Disabling = "[*] Dang tat Bitlocker cho o "
        Bit_NotFound = "[!] Khong tim thay o dia hoac khong ho tro Bitlocker."
        Bit_Warning = "[!] CANH BAO: Bat Bitlocker co the yeu cau khoi dong lai va ton thoi gian."
        Error_MAS = "[!] Loi khi tai MAS: "
        Error_Bat = "[!] Loi khi chay Battery Check: "
        Exit = "[!] Dang thoat... Chao tam biet!"
        Invalid = "[!] Lua chon khong hop le. Vui long thu lai."
    }
    EN = @{
        Menu1 = "Check Battery Wear"
        Menu2 = "Clean RAM"
        Menu3 = "Clean Disk"
        Menu4 = "Windows Update Manager"
        Menu5 = "Bitlocker Manager"
        Menu6 = "Office Tool Plus"
        Menu7 = "Microsoft Activation Scripts (MAS)"
        MenuL = "Change Language"
        Menu0 = "Exit"
        Prompt = ">>> Please choose (1-7, L, E)"
        SubPrompt = ">>> Please choose (1-2, B)"
        MAS_AIO = "[*] Loading MAS Full..."
        OTP_Loading = "[*] Loading Office Tool Plus..."
        Battery = "[*] Loading Battery Check script..."
        Clean_RAM_Wait = "[*] Optimizing RAM memory..."
        Clean_Disk_Wait = "[*] Scanning and cleaning disk..."
        Clean_Result = "--- CLEANUP RESULT ---"
        Clean_Total = "TOTAL SPACE FREE: "
        Update_Status = "Current Status: "
        Update_On = "ENABLED"
        Update_Off = "DISABLED"
        Update_Menu1 = "Disable Windows Update"
        Update_Menu2 = "Enable Windows Update"
        Update_Back = "Back"
        Update_Enabling = "[*] Enabling Windows Update services..."
        Update_Disabling = "[*] Disabling Windows Update services..."
        Done = "[*] Done. Press any key to return to menu..."
        Update_Header = "--- WINDOWS UPDATE MANAGER ---"
        Bit_Header = "--- BITLOCKER MANAGER ---"
        Bit_Menu = "Bitlocker Manager"
        Bit_Status = "Status"
        Bit_Prot = "Protection"
        Bit_Lock = "Lock Status"
        Bit_Menu_On = "Turn On Bitlocker"
        Bit_Menu_Off = "Turn Off Bitlocker"
        Bit_EnterDrive = "Enter Drive Letter to toggle (e.g. C): "
        Bit_Enabling = "[*] Enabling Bitlocker for drive "
        Bit_Disabling = "[*] Disabling Bitlocker for drive "
        Bit_NotFound = "[!] Drive not found or Bitlocker not supported."
        Bit_Warning = "[!] WARNING: Enabling Bitlocker will require a restart and might take time."
        Error_MAS = "[!] Error loading MAS: "
        Error_Bat = "[!] Error running Battery Check: "
        Exit = "[!] Exiting... Goodbye!"
        Invalid = "[!] Invalid choice. Please try again."
    }
}

$S = $Msg[$lang]

function Show-Header {
    Clear-Host
    $Ascii = @'
        .__           __                .__   
__  _  _|__| ____   _/  |_  ____   ____ |  |  
\ \/ \/ /  |/    \  \   __\/  _ \ /  _ \|  |  
 \     /|  |   |  \  |  | (  <_> |  <_> )  |__
  \/\_/ |__|___|  /  |__|  \____/ \____/|____/
                \/                            
        >>> cook by mhqb365.com <<<
'@
    Write-Host $Ascii -ForegroundColor Yellow
    Write-Host "-----------------------------------------------------" -ForegroundColor Gray
}

function Show-Menu {
    Write-Host " [1] " -NoNewline -ForegroundColor Green
    Write-Host "$($S.Menu1)" -ForegroundColor White
    
    Write-Host " [2] " -NoNewline -ForegroundColor Green
    Write-Host "$($S.Menu2)" -ForegroundColor White

    Write-Host " [3] " -NoNewline -ForegroundColor Green
    Write-Host "$($S.Menu3)" -ForegroundColor White
    
    Write-Host " [4] " -NoNewline -ForegroundColor Green
    Write-Host "$($S.Menu4)" -ForegroundColor White

    Write-Host " [5] " -NoNewline -ForegroundColor Green
    Write-Host "$($S.Menu5)" -ForegroundColor White

    Write-Host "-----------------------------------------------------" -ForegroundColor Gray

    Write-Host " [6] " -NoNewline -ForegroundColor Green
    Write-Host "$($S.Menu6)" -ForegroundColor White

    Write-Host " [7] " -NoNewline -ForegroundColor Green
    Write-Host "$($S.Menu7)" -ForegroundColor White

    Write-Host "-----------------------------------------------------" -ForegroundColor Gray
    
    Write-Host " [L] " -NoNewline -ForegroundColor Yellow
    Write-Host "$($S.MenuL)" -ForegroundColor White

    Write-Host " [E] " -NoNewline -ForegroundColor Red
    Write-Host "$($S.Menu0)" -ForegroundColor White
    Write-Host "-----------------------------------------------------" -ForegroundColor Gray
}

while ($true) {
    Show-Header
    Show-Menu
    
    $choice = Read-Host "$($S.Prompt)"
    
    switch ($choice) {
        '1' {
            Write-Host "`n$($S.Battery)" -ForegroundColor Yellow
            try {
                $BatteryScript = Invoke-RestMethod -Uri "https://raw.githubusercontent.com/mhqb365/bBattery/refs/heads/master/bBattery.ps1"
                $SB = [scriptblock]::Create($BatteryScript)
                & $SB
            } catch {
                Write-Host "$($S.Error_Bat)$($_.Exception.Message)" -ForegroundColor Red
            }
            Write-Host "`n$($S.Done)" -ForegroundColor Gray
            $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
        }
        '2' {
            Write-Host "`n$($S.Clean_RAM_Wait) " -NoNewline -ForegroundColor Yellow
            $before = (Get-CimInstance Win32_OperatingSystem).FreePhysicalMemory

            $arch = $env:PROCESSOR_ARCHITECTURE
            $rammapExe = "RAMMap.exe"
            if ($arch -eq "AMD64") { $rammapExe = "RAMMap64.exe" }
            elseif ($arch -eq "ARM64") { $rammapExe = "RAMMap64a.exe" }

            $rammapPath = Join-Path $env:TEMP $rammapExe
            if (-not (Test-Path $rammapPath)) {
                try {
                    Invoke-WebRequest -Uri "https://live.sysinternals.com/$rammapExe" -OutFile $rammapPath -UseBasicParsing
                } catch {
                    Write-Host "`n[!] Cannot download $rammapExe. Fallback to GC..." -ForegroundColor Red
                }
            }

            if (Test-Path $rammapPath) {
                $argsList = @("-Ew", "-Es", "-Em", "-Et", "-E0")
                $spinner = @('-', '\', '|', '/')
                $counter = 0
                foreach ($arg in $argsList) {
                    $p = Start-Process -FilePath $rammapPath -ArgumentList "-AcceptEula $arg" -WindowStyle Hidden -PassThru
                    while (-not $p.HasExited) {
                        Write-Host "`b$($spinner[$counter % 4])" -NoNewline -ForegroundColor Cyan
                        $counter++
                        Start-Sleep -Milliseconds 100
                    }
                }
                Write-Host "`b*" -ForegroundColor Green
            } else {
                [System.GC]::Collect()
                [System.GC]::WaitForPendingFinalizers()
                Write-Host "Done" -ForegroundColor Green
            }

            $after = (Get-CimInstance Win32_OperatingSystem).FreePhysicalMemory
            $freed = [Math]::Max(0, [Math]::Round(($after - $before) / 1024, 2))
            
            Write-Host "`n$($S.Clean_Result)" -ForegroundColor Cyan
            Write-Host " - System RAM: +$freed MB free" -ForegroundColor Green
            Write-Host "`n$($S.Done)" -ForegroundColor Gray
            $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
        }
        '3' {
            Write-Host "`n$($S.Clean_Disk_Wait)" -ForegroundColor Yellow

            $targets = @{
                "Windows Temp" = "C:\Windows\Temp"
                "User Temp" = $env:TEMP
                "Prefetch" = "C:\Windows\Prefetch"
                "Windows Update Cache" = "C:\Windows\SoftwareDistribution\Download"
                "Windows Logs" = "C:\Windows\Logs"
                "System32 LogFiles" = "C:\Windows\System32\LogFiles"
                "Windows Error Reporting" = "C:\ProgramData\Microsoft\Windows\WER"
            }
            $total = 0
            Write-Host "`n$($S.Clean_Result)" -ForegroundColor Cyan
            foreach ($key in $targets.Keys) {
                $path = $targets[$key]
                $size = 0
                if (Test-Path $path) {
                    Write-Progress -Activity "Scanning Disk" -Status "Scanning $key..."
                    $items = Get-ChildItem -Path $path -Recurse -ErrorAction SilentlyContinue
                    $totalItems = @($items).Count
                    $current = 0
                    foreach ($item in $items) {
                        $current++
                        if (($current % 20 -eq 0) -or ($current -eq $totalItems)) {
                            $percent = if ($totalItems -gt 0) { [Math]::Min(100, [Math]::Round(($current / $totalItems) * 100)) } else { 0 }
                            Write-Progress -Activity "Cleaning Disk ($key)" -Status "Processing: $($item.Name)" -PercentComplete $percent
                        }
                        if ($item.PSIsContainer -eq $false) {
                            try {
                                Remove-Item $item.FullName -Force -ErrorAction Stop
                                $size += $item.Length
                            } catch {
                                # File đang bận, bỏ qua không cộng vào dung lượng đã dọn
                            }
                        }
                    }
                    Write-Progress -Activity "Cleaning Disk ($key)" -Completed
                }
                $mb = [Math]::Round($size / 1MB, 2)
                Write-Host " - $($key): " -NoNewline
                Write-Host "$mb MB" -ForegroundColor Green
                $total += $size
            }
            $totalMB = [Math]::Round($total / 1MB, 2)
            Write-Host "-----------------------------------------------------" -ForegroundColor Gray
            Write-Host "$($S.Clean_Total) " -NoNewline
            Write-Host "$totalMB MB" -ForegroundColor Cyan
            Write-Host "`n$($S.Done)" -ForegroundColor Gray
            $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
        }
        '4' {
            while ($true) {
                Show-Header
                Write-Host "         $($S.Update_Header)" -ForegroundColor Cyan
                Write-Host "-----------------------------------------------------" -ForegroundColor Gray
                $status = (Get-Service wuauserv).StartType
                $statusColor = "Green"
                $statusText = $S.Update_On
                if ($status -eq 'Disabled') {
                    $statusColor = "Red"
                    $statusText = $S.Update_Off
                }
                
                Write-Host " $($S.Update_Status)" -NoNewline
                Write-Host $statusText -ForegroundColor $statusColor
                Write-Host "-----------------------------------------------------" -ForegroundColor Gray
                Write-Host " [1] " -NoNewline -ForegroundColor Green
                Write-Host "$($S.Update_Menu1)" -ForegroundColor White
                Write-Host " [2] " -NoNewline -ForegroundColor Green
                Write-Host "$($S.Update_Menu2)" -ForegroundColor White
                Write-Host "-----------------------------------------------------" -ForegroundColor Gray
                Write-Host " [B] " -NoNewline -ForegroundColor Red
                Write-Host "$($S.Update_Back)" -ForegroundColor White
                Write-Host "-----------------------------------------------------" -ForegroundColor Gray
                
                $upChoice = Read-Host "$($S.SubPrompt)"
                
                if ($upChoice -eq '1') {
                    Write-Host "`n$($S.Update_Disabling)" -ForegroundColor Yellow
                    try {
                        Stop-Service wuauserv -Force -ErrorAction SilentlyContinue
                        Set-Service wuauserv -StartupType Disabled
                        Stop-Service bits -Force -ErrorAction SilentlyContinue
                        Set-Service bits -StartupType Disabled
                        Stop-Service dosvc -Force -ErrorAction SilentlyContinue
                        Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Services\dosvc' -Name "Start" -Value 4 -ErrorAction SilentlyContinue
                    } catch {
                        Write-Host "[!] Error: $($_.Exception.Message)" -ForegroundColor Red
                    }
                    Write-Host "`n$($S.Done)" -ForegroundColor Gray
                    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
                }
                elseif ($upChoice -eq '2') {
                    Write-Host "`n$($S.Update_Enabling)" -ForegroundColor Yellow
                    try {
                        Set-Service wuauserv -StartupType Manual
                        Set-Service bits -StartupType Manual
                        Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Services\dosvc' -Name "Start" -Value 3 -ErrorAction SilentlyContinue
                        Start-Service wuauserv -ErrorAction SilentlyContinue
                    } catch {
                        Write-Host "[!] Error: $($_.Exception.Message)" -ForegroundColor Red
                    }
                    Write-Host "`n$($S.Done)" -ForegroundColor Gray
                    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
                }
                elseif ($upChoice -eq 'b') {
                    break
                }
            }
        }
        '5' {
            while ($true) {
                Show-Header
                Write-Host "           $($S.Bit_Header)" -ForegroundColor Cyan
                Write-Host "-----------------------------------------------------" -ForegroundColor Gray
                
                try {
                    $volumes = Get-BitLockerVolume
                    if ($null -eq $volumes) {
                        Write-Host " $($S.Bit_NotFound)" -ForegroundColor Red
                    } else {
                        Write-Host (" {0,-7} {1,-15} {2,-15}" -f "Drive", "Protection", "LockStatus")
                        Write-Host " ------- --------------- ---------------"
                        foreach ($vol in $volumes) {
                            $pColor = if ($vol.ProtectionStatus -eq 'On') { "Green" } else { "Red" }
                            $lColor = if ($vol.LockStatus -eq 'Unlocked') { "Green" } else { "Yellow" }
                            
                            Write-Host (" {0,-7} " -f $vol.MountPoint) -NoNewline
                            Write-Host ("{0,-15} " -f $vol.ProtectionStatus) -ForegroundColor $pColor -NoNewline
                            Write-Host ("{0,-15}" -f $vol.LockStatus) -ForegroundColor $lColor
                        }
                    }
                } catch {
                    Write-Host "[!] Error: $($_.Exception.Message)" -ForegroundColor Red
                }

                Write-Host "-----------------------------------------------------" -ForegroundColor Gray
                Write-Host " [1] " -NoNewline -ForegroundColor Green
                Write-Host "$($S.Bit_Menu_Off)" -ForegroundColor White
                Write-Host " [2] " -NoNewline -ForegroundColor Green
                Write-Host "$($S.Bit_Menu_On)" -ForegroundColor White
                Write-Host "-----------------------------------------------------" -ForegroundColor Gray
                Write-Host " [B] " -NoNewline -ForegroundColor Red
                Write-Host "$($S.Update_Back)" -ForegroundColor White
                Write-Host "-----------------------------------------------------" -ForegroundColor Gray
                
                $bitChoice = Read-Host "$($S.SubPrompt)"
                
                if ($bitChoice -eq '1' -or $bitChoice -eq '2') {
                    $drive = Read-Host "$($S.Bit_EnterDrive)"
                    $drive = $drive.ToUpper().Replace(":", "")
                    $target = Get-BitLockerVolume -MountPoint "$($drive):" -ErrorAction SilentlyContinue
                    
                    if ($null -eq $target) {
                        Write-Host "$($S.Bit_NotFound)" -ForegroundColor Red
                    } else {
                        if ($bitChoice -eq '1') {
                            if ($target.ProtectionStatus -eq 'Off') {
                                Write-Host "[!] Bitlocker is already OFF for drive $($drive):" -ForegroundColor Yellow
                            } else {
                                Write-Host "`n$($S.Bit_Disabling) $($drive):..." -ForegroundColor Yellow
                                manage-bde -off "$($drive):"
                            }
                        } else {
                            if ($target.ProtectionStatus -eq 'On') {
                                Write-Host "[!] Bitlocker is already ON for drive $($drive):" -ForegroundColor Yellow
                            } else {
                                Write-Host "`n$($S.Bit_Warning)" -ForegroundColor Cyan
                                Write-Host "$($S.Bit_Enabling) $($drive):..." -ForegroundColor Yellow
                                manage-bde -protectors -add "$($drive):" -tpm | Out-Null
                                $desktopPath = [System.Environment]::GetFolderPath('Desktop')
                                $keyFile = "$desktopPath\BitLocker_Recovery_Key_$($drive).txt"
                                $rpOutput = manage-bde -protectors -add "$($drive):" -rp
                                $rpOutput | Out-File -FilePath $keyFile -Encoding utf8
                                manage-bde -on "$($drive):" -UsedSpaceOnly -SkipHardwareTest
                            }
                        }
                    }
                    Write-Host "`n$($S.Done)" -ForegroundColor Gray
                    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
                }
                elseif ($bitChoice -eq 'b') {
                    break
                }
            }
        }
        '6' {
            Write-Host "`n$($S.OTP_Loading)" -ForegroundColor Yellow
            try {
                powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "iex (irm https://officetool.plus)"
            } catch {
                Write-Host "[!] Error: $($_.Exception.Message)" -ForegroundColor Red
            }
            Write-Host "`n$($S.Done)" -ForegroundColor Gray
            $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
        }
        '7' {
            Write-Host "`n$($S.MAS_AIO)" -ForegroundColor Yellow
            try {
                $MAS = Invoke-RestMethod -Uri "https://get.activated.win"
                $SB = [scriptblock]::Create($MAS)
                & $SB
            } catch {
                Write-Host "$($S.Error_MAS)$($_.Exception.Message)" -ForegroundColor Red
            }
            Write-Host "`n$($S.Done)" -ForegroundColor Gray
            $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
        }
        'l' {
            Clear-Host
            Write-Host "=====================================================" -ForegroundColor Cyan
            Write-Host "          SELECT LANGUAGE / CHON NGON NGU" -ForegroundColor White
            Write-Host "=====================================================" -ForegroundColor Cyan
            Write-Host " [1] Tieng Viet"
            Write-Host " [2] English"
            Write-Host "-----------------------------------------------------" -ForegroundColor Gray
            $langChoice = Read-Host ">>> Chon / Choice (1-2)"
            $lang = "EN"
            if ($langChoice -eq "1") { $lang = "VI" }
            $S = $Msg[$lang]
        }
        'e' {
            Write-Host "`n$($S.Exit)" -ForegroundColor Cyan
            Start-Sleep -Seconds 1
            return
        }
        default {
            Write-Host "$($S.Invalid)" -ForegroundColor Red
            Start-Sleep -Seconds 1
        }
    }
}