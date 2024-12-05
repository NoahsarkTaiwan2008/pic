@echo off
echo Uploading to GitHub...

REM 檢查變更狀態
git status
IF ERRORLEVEL 1 (
    echo Failed to check status. Ensure you are in the correct repository.
    exit /b 1
)

REM 添加變更
git add .
IF ERRORLEVEL 1 (
    echo Failed to stage changes.
    exit /b 1
)

REM 提交變更
git commit -m "update"
IF ERRORLEVEL 1 (
    echo Nothing to commit or commit failed.
    exit /b 1
)

REM 推送變更
git push
IF ERRORLEVEL 1 (
    echo Push failed. Check your network or credentials.
    exit /b 1
)

echo Finished.
