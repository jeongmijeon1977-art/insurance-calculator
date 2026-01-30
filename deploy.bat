@echo off
REM 보험사 시책 계산기 - GitHub Pages 자동 배포 스크립트 (Windows)
REM 
REM 사용법:
REM   1. 최초 1회: deploy.bat init
REM   2. 매주/매달 업데이트: deploy.bat update

setlocal EnableDelayedExpansion

REM 도움말 출력
if "%1"=="" goto :show_help
if "%1"=="help" goto :show_help
if "%1"=="--help" goto :show_help
if "%1"=="-h" goto :show_help

if "%1"=="init" goto :init_deploy
if "%1"=="update" goto :update_deploy
if "%1"=="backup" goto :create_backup

echo [31m잘못된 명령어입니다.[0m
echo.
goto :show_help

:show_help
echo 🚀 보험사 시책 계산기 배포 스크립트
echo.
echo 사용법:
echo   deploy.bat init                  # 최초 설정
echo   deploy.bat update                # 데이터 업데이트
echo   deploy.bat backup                # 백업 생성
echo.
echo 예시:
echo   deploy.bat update
goto :eof

:init_deploy
echo [32m🔧 GitHub Pages 초기 설정을 시작합니다...[0m
echo.

REM Git 초기화
if not exist .git (
    echo [32mGit 저장소 초기화...[0m
    git init
)

REM 파일 추가
echo [32m파일 추가 중...[0m
git add .
git commit -m "Initial commit: 보험사 시책 계산기"

REM GitHub 저장소 URL 입력
echo.
echo [33mGitHub 저장소 URL을 입력하세요:[0m
echo 예시: https://github.com/yourusername/insurance-calculator.git
set /p repo_url="URL: "

REM Remote 설정
git remote remove origin 2>nul
git remote add origin "%repo_url%"

REM 메인 브랜치로 변경 및 푸시
echo [32mGitHub에 푸시 중...[0m
git branch -M main
git push -u origin main

echo.
echo [32m✅ 초기 설정이 완료되었습니다![0m
echo.
echo 다음 단계:
echo 1. GitHub 저장소 페이지 방문
echo 2. Settings - Pages 클릭
echo 3. Source: Deploy from a branch 선택
echo 4. Branch: main, folder: / (root) 선택
echo 5. Save 클릭
echo.
echo 1-2분 후 배포된 URL을 확인하세요!
goto :eof

:update_deploy
echo [32m📤 변경사항을 GitHub에 업로드합니다...[0m
echo.

REM 변경사항 확인
git status --short

REM 업데이트 메시지 입력
set /p commit_msg="커밋 메시지를 입력하세요 (Enter=기본값): "
if "%commit_msg%"=="" set commit_msg=데이터 업데이트

REM 파일 추가 및 커밋
git add .
git commit -m "%commit_msg%"

REM 푸시
echo [32mGitHub에 푸시 중...[0m
git push

echo.
echo [32m✅ 업데이트가 완료되었습니다![0m
echo 1-2분 후 웹사이트에 반영됩니다.
goto :eof

:create_backup
echo [32m💾 백업을 생성합니다...[0m

REM 백업 디렉토리 생성
if not exist backups mkdir backups

REM 타임스탬프 생성
for /f "tokens=2-4 delims=/ " %%a in ('date /t') do (set mydate=%%c%%a%%b)
for /f "tokens=1-2 delims=/:" %%a in ('time /t') do (set mytime=%%a%%b)
set timestamp=%mydate%_%mytime%

REM 백업 파일 생성
set backup_file=backups\backup_%timestamp%.zip
powershell Compress-Archive -Path index.html,README.md,deploy-guide.html -DestinationPath %backup_file% -Force

echo [32m✅ 백업이 생성되었습니다: %backup_file%[0m
goto :eof
