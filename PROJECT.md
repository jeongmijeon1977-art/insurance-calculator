# 📁 프로젝트 구조

```
webapp/
├── index.html              # 메인 계산기 페이지 (140KB)
├── start.html              # 시작 페이지 (배포 안내)
├── deploy-guide.html       # 상세 배포 가이드 (웹)
├── README.md               # 전체 문서
├── QUICKSTART.md           # 5분 빠른 시작
├── deploy.sh               # 자동 배포 스크립트 (Linux/Mac)
├── deploy.bat              # 자동 배포 스크립트 (Windows)
└── .gitignore              # Git 제외 파일 목록
```

## 📋 파일 설명

### 필수 파일
- **index.html**: 보험사 시책 계산기 메인 페이지
  - DB손보, 흥국화재, 메리츠화재, KB손보, 이달주력사 지원
  - 사원별 월납보험료 조회 및 시책금 자동 계산
  - 관리자 페이지 내장 (시책 설정, 인별 데이터 관리)
  - A4 가로 인쇄 최적화

### 문서 파일
- **start.html**: 배포 완료 안내 페이지 (로컬 테스트용)
- **deploy-guide.html**: 상세 배포 가이드 (웹 페이지 형식)
- **README.md**: 전체 사용 설명서 (GitHub 메인 페이지)
- **QUICKSTART.md**: 5분 빠른 시작 가이드

### 배포 도구
- **deploy.sh**: Linux/Mac용 자동 배포 스크립트
- **deploy.bat**: Windows용 자동 배포 스크립트
- **.gitignore**: Git에서 제외할 파일 목록

## 🚀 사용 방법

### 1. 로컬 테스트
```bash
# Python 3가 설치되어 있다면
python3 -m http.server 8000

# 브라우저에서 열기
open http://localhost:8000/start.html
```

### 2. GitHub Pages 배포
[QUICKSTART.md](QUICKSTART.md) 또는 [deploy-guide.html](deploy-guide.html) 참고

### 3. 자동 배포 스크립트 사용

**Linux/Mac:**
```bash
chmod +x deploy.sh
./deploy.sh init          # 최초 설정
./deploy.sh update "메시지"  # 업데이트
```

**Windows:**
```cmd
deploy.bat init      # 최초 설정
deploy.bat update    # 업데이트
```

## 📊 기능 목록

### 계산기 페이지
- ✅ 5개 보험사 지원
- ✅ 사원별 검색 (본부, 지점, 이름)
- ✅ 주차별 시책금 자동 계산
- ✅ 월시책, 주간시상, 자체시상, 연속가동 등 모두 지원
- ✅ 다음 구간 시뮬레이션
- ✅ A4 가로 인쇄 최적화
- ✅ 일괄 인쇄 기능

### 관리자 페이지
- ✅ 시책 설정 (지급률, 시상금 등)
- ✅ 인별 데이터 관리 (엑셀 붙여넣기)
- ✅ 데이터 백업/복원 (JSON)
- ✅ 비밀번호 보호

## 🔄 업데이트 워크플로우

### 방법 1: 웹에서 직접 (추천)
1. 배포된 사이트 접속
2. 관리자 페이지에서 데이터 수정
3. 브라우저 localStorage에 자동 저장
4. 완료! ✅

### 방법 2: GitHub에서 파일 수정
1. GitHub에서 index.html 편집
2. Commit changes
3. 1-2분 후 자동 배포
4. 완료! ✅

### 방법 3: Git 명령어
```bash
# 파일 수정 후
git add .
git commit -m "업데이트 메시지"
git push
```

## ⚠️ 중요 사항

### 데이터 백업
브라우저 localStorage는 삭제될 수 있으므로 정기적으로 백업하세요!

**백업 방법:**
1. 관리자 페이지 → "📥 시책 데이터 다운로드"
2. 관리자 페이지 → "📥 인별 데이터 다운로드"
3. JSON 파일 안전하게 보관

**복원 방법:**
1. 관리자 페이지 → "📤 시책 데이터 불러오기"
2. 관리자 페이지 → "📤 인별 데이터 불러오기"

### 관리자 비밀번호
- 기본 비밀번호: `admin1234`
- 최초 로그인 후 반드시 변경하세요
- localStorage에 저장됨

## 🌐 배포 옵션

### 1. GitHub Pages (추천!)
- ✅ 완전 무료
- ✅ 자동 배포
- ✅ 무제한 방문자
- ✅ HTTPS 자동

### 2. Cloudflare Pages
- ✅ 무료
- ✅ 초고속 CDN
- ✅ GitHub 연동

### 3. Netlify
- ✅ 무료
- ✅ 드래그 앤 드롭
- ✅ 쉬운 설정

## 📱 모바일 지원

- 반응형 디자인으로 모바일 지원
- 단, 인쇄 기능은 PC 브라우저 권장

## 🆘 문제 해결

### localStorage 초기화
```javascript
localStorage.clear();
location.reload();
```

### 비밀번호 재설정
```javascript
localStorage.setItem('admin_password', 'admin1234');
location.reload();
```

### Git 오류
```bash
git status
git pull --rebase
git push
```

## 📚 추가 자료

- [README.md](README.md) - 전체 문서
- [QUICKSTART.md](QUICKSTART.md) - 빠른 시작
- [deploy-guide.html](deploy-guide.html) - 상세 가이드
- [GitHub Pages 공식 문서](https://docs.github.com/pages)

## 💡 팁

### 도메인 변경
GitHub Pages Settings에서 Custom domain 설정 가능
예: `calculator.yourcompany.com`

### 자동 업데이트
GitHub Actions를 사용하면 정기적으로 자동 배포 가능

### 데이터 버전 관리
Git으로 데이터 변경 이력 추적 가능

## 🎉 완료!

이제 보험사 시책 계산기를 온라인에서 사용할 수 있습니다!

배포 후 URL을 팀원들에게 공유하세요.

---

© 2026 보험사 시책 계산기
