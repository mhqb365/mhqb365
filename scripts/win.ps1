# --- Initial Language Selection ---
Clear-Host
Write-Host "================================================" -ForegroundColor Cyan
Write-Host "  SELECT LANGUAGE / CHON NGON NGU" -ForegroundColor White
Write-Host "================================================" -ForegroundColor Cyan
Write-Host " [1] Tieng Viet"
Write-Host " [2] English"
Write-Host "------------------------------------------------" -ForegroundColor Gray
$langChoice = Read-Host ">>> Chon / Choice (1-2)"

$lang = "EN"
if ($langChoice -eq "1") { $lang = "VI" }

# --- Translation Dictionary ---
$Msg = @{
    EN = @{
        Header = ">>> cook by mhqb365.com <<<"
        Menu1 = "Active Windows - HWID"
        Menu2 = "Active Office - Ohook"
        Menu3 = "Check Battery Wear"
        Menu4 = "Windows Update"
        Menu5 = "Run massgrave.dev"
        Menu0 = "Exit"
        Prompt = ">>> Please choose (1-5, 0)"
        MAS_Win = "[*] Loading MAS (Windows Activation)..."
        MAS_Off = "[*] Loading MAS (Office Activation)..."
        MAS_AIO = "[*] Loading Full Menu MAS..."
        Battery = "[*] Loading Battery Check script..."
        Update_Status = "Current Status: "
        Update_On = "ENABLED"
        Update_Off = "DISABLED"
        Update_Menu1 = "Disable Windows Update"
        Update_Menu2 = "Enable Windows Update"
        Update_Back = "Back"
        Update_Enabling = "[*] Enabling Windows Update services..."
        Update_Disabling = "[*] Disabling Windows Update services..."
        Done = "[*] Done. Press any key to return to menu..."
        Error_MAS = "[!] Error loading MAS: "
        Error_Bat = "[!] Error running Battery Check: "
        Exit = "[!] Exiting... Goodbye!"
        Invalid = "[!] Invalid choice. Please try again."
    }
    VI = @{
        Header = ">>> cook by mhqb365.com <<<"
        Menu1 = "Kich hoat Windows - HWID"
        Menu2 = "Kich hoat Office - Ohook"
        Menu3 = "Kiem tra Do Chai Pin"
        Menu4 = "Windows Update"
        Menu5 = "Chay massgrave.dev"
        Menu0 = "Thoat"
        Prompt = ">>> Vui long chon (1-5, 0)"
        MAS_Win = "[*] Dang tai MAS (Windows Activation)..."
        MAS_Off = "[*] Dang tai MAS (Office Activation)..."
        MAS_AIO = "[*] Dang tai Menu Day Du MAS..."
        Battery = "[*] Dang tai script kiem tra pin..."
        Update_Status = "Trang thai hien tai: "
        Update_On = "DANG BAT"
        Update_Off = "DANG TAT"
        Update_Menu1 = "Tat Update Windows"
        Update_Menu2 = "Bat Update Windows"
        Update_Back = "Quay lai"
        Update_Enabling = "[*] Dang bat dich vu Windows Update..."
        Update_Disabling = "[*] Dang tat dich vu Windows Update..."
        Done = "[*] Hoan tat. Nhan phim bat ky de quay lai menu..."
        Error_MAS = "[!] Loi khi tai MAS: "
        Error_Bat = "[!] Loi khi chay Battery Check: "
        Exit = "[!] Dang thoat... Chao tam biet!"
        Invalid = "[!] Lua chon khong hop le. Vui long thu lai."
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
'@
    Write-Host $Ascii -ForegroundColor Yellow
    Write-Host "     $($S.Header)" -ForegroundColor Yellow
    Write-Host "------------------------------------------------" -ForegroundColor Gray
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

    Write-Host "------------------------------------------------" -ForegroundColor Gray
    Write-Host " [5] " -NoNewline -ForegroundColor Green
    Write-Host "$($S.Menu5)" -ForegroundColor White
    
    Write-Host "------------------------------------------------" -ForegroundColor Gray
    Write-Host " [0] " -NoNewline -ForegroundColor Red
    Write-Host "$($S.Menu0)" -ForegroundColor White
    Write-Host "------------------------------------------------" -ForegroundColor Gray
}

while ($true) {
    Show-Header
    Show-Menu
    
    $choice = Read-Host "$($S.Prompt)"
    
    switch ($choice) {
        '1' {
            Write-Host "`n$($S.MAS_Win)" -ForegroundColor Yellow
            try {
                $MAS = Invoke-RestMethod -Uri "https://get.activated.win"
                $SB = [scriptblock]::Create($MAS)
                & $SB /HWID
            } catch {
                Write-Host "$($S.Error_MAS)$($_.Exception.Message)" -ForegroundColor Red
            }
            Write-Host "`n$($S.Done)" -ForegroundColor Gray
            $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
        }
        '2' {
            Write-Host "`n$($S.MAS_Off)" -ForegroundColor Yellow
            try {
                $MAS = Invoke-RestMethod -Uri "https://get.activated.win"
                $SB = [scriptblock]::Create($MAS)
                & $SB /Ohook
            } catch {
                Write-Host "$($S.Error_MAS)$($_.Exception.Message)" -ForegroundColor Red
            }
            Write-Host "`n$($S.Done)" -ForegroundColor Gray
            $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
        }
        '3' {
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
        '4' {
            while ($true) {
                Show-Header
                $status = (Get-Service wuauserv).StartType
                $statusColor = "Green"
                $statusText = $S.Update_On
                if ($status -eq 'Disabled') {
                    $statusColor = "Red"
                    $statusText = $S.Update_Off
                }
                
                Write-Host " $($S.Update_Status)" -NoNewline
                Write-Host $statusText -ForegroundColor $statusColor
                Write-Host "------------------------------------------------" -ForegroundColor Gray
                Write-Host " [1] " -NoNewline -ForegroundColor Green
                Write-Host "$($S.Update_Menu1)" -ForegroundColor White
                Write-Host " [2] " -NoNewline -ForegroundColor Green
                Write-Host "$($S.Update_Menu2)" -ForegroundColor White
                Write-Host "------------------------------------------------" -ForegroundColor Gray
                Write-Host " [0] " -NoNewline -ForegroundColor Red
                Write-Host "$($S.Update_Back)" -ForegroundColor White
                Write-Host "------------------------------------------------" -ForegroundColor Gray
                
                $upChoice = Read-Host "$($S.Prompt)"
                
                if ($upChoice -eq '1') {
                    Write-Host "`n$($S.Update_Disabling)" -ForegroundColor Yellow
                    try {
                        Stop-Service wuauserv -Force -ErrorAction SilentlyContinue
                        Set-Service wuauserv -StartupType Disabled
                        Stop-Service bits -Force -ErrorAction SilentlyContinue
                        Set-Service bits -StartupType Disabled
                        # Use Registry for dosvc to avoid Access Denied
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
                        # Use Registry for dosvc to avoid Access Denied
                        Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Services\dosvc' -Name "Start" -Value 3 -ErrorAction SilentlyContinue
                        Start-Service wuauserv -ErrorAction SilentlyContinue
                    } catch {
                        Write-Host "[!] Error: $($_.Exception.Message)" -ForegroundColor Red
                    }
                    Write-Host "`n$($S.Done)" -ForegroundColor Gray
                    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
                }
                elseif ($upChoice -eq '0') {
                    break
                }
            }
        }
        '5' {
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
        '0' {
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
