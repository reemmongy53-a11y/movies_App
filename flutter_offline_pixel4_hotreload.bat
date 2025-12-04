@echo off
REM ======= Flutter Offline + Pixel 4 Emulator + Hot Reload =======

REM ===== Pause في البداية عشان نشوف أي خطأ لو شغلتيه دبل كليك =====
pause

echo ===== Cleaning Flutter project =====
flutter clean
if errorlevel 1 (
    echo Error during flutter clean
    pause
)

echo ===== Getting packages offline =====
flutter pub get --offline
if errorlevel 1 (
    echo Error during flutter pub get
    pause
)

echo ===== Removing old Gradle caches =====
rmdir /s /q %USERPROFILE%\.gradle\caches
if errorlevel 1 (
    echo Error removing Gradle caches
    pause
)

echo ===== Starting Pixel 4 Emulator =====
start "" "F:\Android\emulator\emulator.exe" -avd "Pixel_4_API_33"
if errorlevel 1 (
    echo Error starting Emulator
    pause
)

echo ===== Waiting for Emulator to fully boot =====
:waitLoop
adb -s emulator-5554 shell getprop sys.boot_completed 2>nul | find "1" >nul
if errorlevel 1 (
    timeout /t 2 >nul
    goto waitLoop
)

echo ===== Emulator booted, running Flutter project offline with hot reload =====
REM تشغيل Flutter مع hot reload (r لتحديث الكود داخل CMD)
flutter run --offline
if errorlevel 1 (
    echo Error during flutter run
    pause
)

REM ===== Pause في النهاية =====
pause