# 💰 보험사 시책 계산기

완전 통합 버전 보험사 시책 계산기 - 2026년 1월

## 🌐 온라인에서 사용하기

이 계산기는 GitHub Pages를 통해 호스팅됩니다.

**배포된 사이트 URL**: `https://[사용자명].github.io/[저장소명]/`

## 📋 주요 기능

- ✅ 5개 보험사 지원 (DB손보, 흥국화재, 메리츠화재, KB손보, 이달주력사)
- ✅ 사원별 월납보험료 조회
- ✅ 주차별 시책금 자동 계산
- ✅ 관리자 페이지 (시책 설정 및 인별 데이터 관리)
- ✅ 엑셀 데이터 붙여넣기 지원
- ✅ A4 가로 인쇄 최적화
- ✅ 일괄 인쇄 기능

## 🔄 데이터 업데이트 방법

### 방법 1: 관리자 페이지에서 직접 수정
1. 계산기 페이지에서 "⚙️ 관리자 페이지" 클릭
2. 비밀번호 입력 (기본: admin1234)
3. **시책 설정** 또는 **인별 데이터 관리** 탭에서 데이터 수정
4. 브라우저 localStorage에 자동 저장됨

### 방법 2: HTML 파일 수정 후 재배포
1. `index.html` 파일을 다운로드
2. 원하는 에디터로 열기
3. JavaScript 데이터 섹션 수정
4. GitHub에 push하여 자동 배포

## 📤 GitHub에 업로드하는 방법

### 초기 설정 (최초 1회만)

```bash
# 1. GitHub에서 새 저장소 생성
# - 저장소명: insurance-calculator (원하는 이름)
# - Public으로 설정

# 2. 로컬에서 Git 초기화
git init
git add .
git commit -m "Initial commit: 보험사 시책 계산기"

# 3. GitHub 저장소 연결
git remote add origin https://github.com/[사용자명]/[저장소명].git
git branch -M main
git push -u origin main

# 4. GitHub Pages 활성화
# - GitHub 저장소 페이지 → Settings → Pages
# - Source: Deploy from a branch
# - Branch: main, folder: / (root)
# - Save 클릭
```

### 매주/매달 업데이트 방법

```bash
# 1. 수정된 파일 저장
git add index.html

# 2. 커밋 메시지 작성
git commit -m "2026년 1월 2주차 데이터 업데이트"

# 3. GitHub에 푸시 (자동 배포됨)
git push
```

배포는 자동으로 진행되며, 1-2분 후면 웹사이트에 반영됩니다!

## 🔗 링크 공유 방법

GitHub Pages 배포 후:
1. 저장소 → Settings → Pages에서 배포된 URL 확인
2. 예시: `https://yourusername.github.io/insurance-calculator/`
3. 이 URL을 팀원들에게 공유하면 됩니다!

## 🔒 관리자 기능

- 기본 비밀번호: `admin1234`
- 최초 로그인 후 반드시 비밀번호를 변경하세요
- 시책 설정 및 인별 데이터는 브라우저 localStorage에 저장됩니다

## 💡 사용 팁

### 데이터 백업
1. 관리자 페이지 → 시책 설정 → "📥 시책 데이터 다운로드"
2. 관리자 페이지 → 인별 데이터 관리 → "📥 인별 데이터 다운로드"
3. JSON 파일로 백업 저장

### 데이터 복원
1. 다운로드한 JSON 파일 보관
2. 필요시 "📤 데이터 불러오기"로 복원

## 📱 모바일 지원

- 반응형 디자인으로 모바일에서도 사용 가능
- 단, 인쇄 기능은 PC 브라우저 권장

## 🆘 문제 해결

### localStorage 초기화
브라우저 개발자 도구 (F12) → Console에서:
```javascript
localStorage.clear();
location.reload();
```

### 데이터가 사라진 경우
- 백업한 JSON 파일을 "불러오기" 기능으로 복원

## 📧 문의

데이터 업데이트나 기능 개선이 필요하면 GitHub Issues에 등록해주세요.

---

© 2026 보험사 시책 계산기 | 완전 통합 버전
