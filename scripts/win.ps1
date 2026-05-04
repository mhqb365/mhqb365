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
        Menu3 = "Check Battery"
        Menu4 = "Full Menu MAS"
        Menu0 = "Exit"
        Prompt = ">>> Please choose (1-4, 0)"
        MAS_Win = "[*] Loading MAS (Windows Activation)..."
        MAS_Off = "[*] Loading MAS (Office Activation)..."
        MAS_AIO = "[*] Loading Full Menu MAS..."
        Battery = "[*] Loading Battery Check script..."
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
        Menu3 = "Kiem tra do chai Pin"
        Menu4 = "Menu Day Du MAS"
        Menu0 = "Thoat"
        Prompt = ">>> Vui long chon (1-4, 0)"
        MAS_Win = "[*] Dang tai MAS (Windows Activation)..."
        MAS_Off = "[*] Dang tai MAS (Office Activation)..."
        MAS_AIO = "[*] Dang tai Menu Day Du MAS..."
        Battery = "[*] Dang tai script kiem tra pin..."
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

    Write-Host "------------------------------------------------" -ForegroundColor Gray
    Write-Host " [4] " -NoNewline -ForegroundColor Green
    Write-Host "$($S.Menu4)" -ForegroundColor White
    
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
