# 🚀 빠른 시작 가이드

보험사 시책 계산기를 5분 안에 온라인에 공유하는 방법

## 📝 준비물

- ✅ GitHub 계정 (없으면 [github.com](https://github.com)에서 무료 가입)
- ✅ HTML 파일 (`index.html`)

---

## 🎯 가장 쉬운 방법 (Git 명령어 불필요!)

### 1단계: GitHub 저장소 만들기

1. [GitHub](https://github.com)에 로그인
2. 우측 상단 "+" 클릭 → "New repository"
3. Repository name: `insurance-calculator` (원하는 이름)
4. **Public** 선택 (필수!)
5. "Create repository" 클릭

### 2단계: 파일 업로드

1. 생성된 저장소 페이지에서 **"uploading an existing file"** 클릭
2. `보험사_시책_계산기_A4가로_최종 (7).html` 파일을 드래그 앤 드롭
3. 파일 이름을 **`index.html`**로 변경 (중요!)
4. 아래 "Commit changes" 클릭

### 3단계: GitHub Pages 활성화

1. 저장소 상단 **"Settings"** 클릭
2. 왼쪽 메뉴에서 **"Pages"** 클릭
3. Source: **"Deploy from a branch"** 선택
4. Branch: **"main"** 선택, folder: **"/ (root)"** 선택
5. **"Save"** 클릭
6. 1-2분 대기 후 페이지 새로고침

### 4단계: URL 확인 및 공유

- 상단에 표시되는 URL이 공유 링크입니다!
- 예: `https://yourusername.github.io/insurance-calculator/`
- 이 URL을 팀원들에게 공유하세요! 🎉

---

## 🔄 매주/매달 데이터 업데이트 방법

### 방법 1: 웹에서 직접 수정 (가장 쉬움!)

1. 배포된 웹사이트 접속
2. "⚙️ 관리자 페이지" 클릭
3. 비밀번호 입력 (기본: `admin1234`)
4. **인별 데이터 관리** 탭 선택
5. 엑셀에서 데이터 복사 → 붙여넣기
6. "💾 데이터 파싱 및 저장" 클릭
7. "💾 전체 저장" 클릭
8. 완료! ✅

### 방법 2: GitHub에서 파일 수정

1. GitHub 저장소에서 `index.html` 클릭
2. 연필 아이콘 (Edit) 클릭
3. 내용 수정
4. "Commit changes" 클릭
5. 1-2분 후 자동 배포 완료! ✅

---

## 💾 중요: 데이터 백업

브라우저 localStorage는 삭제될 수 있으므로 정기적으로 백업하세요!

### 백업 방법

1. 관리자 페이지 → "📥 시책 데이터 다운로드"
2. 관리자 페이지 → "📥 인별 데이터 다운로드"
3. JSON 파일을 안전한 곳에 보관

### 복원 방법

1. 관리자 페이지 → "📤 시책 데이터 불러오기"
2. 관리자 페이지 → "📤 인별 데이터 불러오기"
3. 백업한 JSON 파일 선택

---

## 🎓 고급 사용자: Git 명령어 사용

### 초기 설정 (최초 1회)

```bash
# 파일이 있는 디렉토리로 이동
cd /path/to/your/project

# Git 초기화
git init
git add .
git commit -m "Initial commit: 보험사 시책 계산기"

# GitHub 저장소 연결 (YOUR_USERNAME와 YOUR_REPO 변경)
git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO.git
git branch -M main
git push -u origin main
```

### 업데이트 (매주/매달)

```bash
# 파일 수정 후
git add .
git commit -m "2026년 1월 2주차 데이터 업데이트"
git push
```

### 자동 배포 스크립트 사용

**Linux/Mac:**
```bash
# 최초 설정
./deploy.sh init

# 업데이트
./deploy.sh update "업데이트 메시지"

# 백업
./deploy.sh backup
```

**Windows:**
```cmd
# 최초 설정
deploy.bat init

# 업데이트
deploy.bat update

# 백업
deploy.bat backup
```

---

## ❓ 자주 묻는 질문

### Q1. 비용이 얼마나 드나요?
**A.** 완전 무료입니다! GitHub Pages는 무료로 무제한 방문자를 지원합니다.

### Q2. 회사 전체가 동시에 사용해도 되나요?
**A.** 네! 동시 접속자 제한이 없습니다.

### Q3. 데이터는 안전한가요?
**A.** 데이터는 각 사용자의 브라우저에 저장되며, 서버로 전송되지 않습니다. 단, 정기적으로 백업하세요!

### Q4. 관리자 비밀번호를 잊어버렸어요!
**A.** 브라우저 개발자 도구 (F12) → Console에서 실행:
```javascript
localStorage.setItem('admin_password', 'admin1234');
location.reload();
```

### Q5. 모바일에서도 사용할 수 있나요?
**A.** 네! 반응형 디자인으로 모바일에서도 사용 가능합니다. 단, 인쇄는 PC 권장.

### Q6. 도메인을 변경할 수 있나요?
**A.** 네! GitHub Pages Settings에서 Custom domain 설정 가능합니다.
예: `calculator.yourcompany.com`

---

## 🆘 도움말

### 배포가 안 될 때

1. 파일 이름이 `index.html`인지 확인
2. 저장소가 **Public**인지 확인
3. GitHub Pages가 활성화되었는지 확인
4. 1-2분 기다린 후 다시 시도

### localStorage 초기화

브라우저 개발자 도구 (F12) → Console:
```javascript
localStorage.clear();
location.reload();
```

### Git 오류 해결

```bash
# 인증 오류
git config --global credential.helper store

# Push 오류
git pull --rebase
git push

# 충돌 해결
git status  # 충돌 파일 확인
# 파일 수정 후
git add .
git rebase --continue
```

---

## 📚 더 자세한 가이드

- [배포 가이드 (deploy-guide.html)](deploy-guide.html) - 상세한 단계별 가이드
- [README.md](README.md) - 전체 문서
- [GitHub Pages 공식 문서](https://docs.github.com/pages)

---

## 🎉 축하합니다!

이제 보험사 시책 계산기를 온라인에서 사용할 수 있습니다!

배포된 URL을 팀원들에게 공유하고, 매주/매달 데이터를 업데이트하세요.

**문의사항이 있으시면 GitHub Issues에 남겨주세요!**

---

© 2026 보험사 시책 계산기
