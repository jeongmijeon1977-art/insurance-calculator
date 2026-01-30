#!/bin/bash

# 보험사 시책 계산기 - GitHub Pages 자동 배포 스크립트
# 
# 사용법:
#   1. 최초 1회: ./deploy.sh init
#   2. 매주/매달 업데이트: ./deploy.sh update "업데이트 메시지"

set -e  # 오류 발생 시 스크립트 중단

# 색상 정의
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# 도움말 출력
show_help() {
    echo "🚀 보험사 시책 계산기 배포 스크립트"
    echo ""
    echo "사용법:"
    echo "  ./deploy.sh init                           # 최초 설정"
    echo "  ./deploy.sh update \"업데이트 메시지\"        # 데이터 업데이트"
    echo "  ./deploy.sh backup                         # 백업 생성"
    echo ""
    echo "예시:"
    echo "  ./deploy.sh update \"2026년 1월 2주차 데이터 업데이트\""
}

# 초기 설정
init_deploy() {
    echo -e "${GREEN}🔧 GitHub Pages 초기 설정을 시작합니다...${NC}"
    echo ""
    
    # Git 사용자 정보 확인
    if ! git config user.name > /dev/null 2>&1; then
        echo -e "${YELLOW}Git 사용자 이름을 입력하세요:${NC}"
        read git_name
        git config user.name "$git_name"
    fi
    
    if ! git config user.email > /dev/null 2>&1; then
        echo -e "${YELLOW}Git 이메일을 입력하세요:${NC}"
        read git_email
        git config user.email "$git_email"
    fi
    
    # Git 초기화 확인
    if [ ! -d .git ]; then
        echo -e "${GREEN}Git 저장소 초기화...${NC}"
        git init
    fi
    
    # 파일 추가
    echo -e "${GREEN}파일 추가 중...${NC}"
    git add .
    git commit -m "Initial commit: 보험사 시책 계산기" || echo "이미 커밋되었습니다."
    
    # GitHub 저장소 URL 입력
    echo ""
    echo -e "${YELLOW}GitHub 저장소 URL을 입력하세요:${NC}"
    echo "예시: https://github.com/yourusername/insurance-calculator.git"
    read repo_url
    
    # Remote 설정
    if git remote get-url origin > /dev/null 2>&1; then
        echo -e "${YELLOW}기존 remote를 제거하고 새로 설정합니다...${NC}"
        git remote remove origin
    fi
    
    git remote add origin "$repo_url"
    
    # 메인 브랜치로 변경 및 푸시
    echo -e "${GREEN}GitHub에 푸시 중...${NC}"
    git branch -M main
    git push -u origin main
    
    echo ""
    echo -e "${GREEN}✅ 초기 설정이 완료되었습니다!${NC}"
    echo ""
    echo "다음 단계:"
    echo "1. GitHub 저장소 페이지 방문"
    echo "2. Settings → Pages 클릭"
    echo "3. Source: Deploy from a branch 선택"
    echo "4. Branch: main, folder: / (root) 선택"
    echo "5. Save 클릭"
    echo ""
    echo "1-2분 후 배포된 URL을 확인하세요!"
}

# 업데이트 및 배포
update_deploy() {
    local commit_message="${1:-데이터 업데이트}"
    
    echo -e "${GREEN}📤 변경사항을 GitHub에 업로드합니다...${NC}"
    echo ""
    
    # 변경사항 확인
    if ! git diff --quiet || ! git diff --cached --quiet; then
        echo -e "${GREEN}변경된 파일:${NC}"
        git status --short
        echo ""
        
        # 파일 추가
        git add .
        
        # 커밋
        git commit -m "$commit_message"
        
        # 푸시
        echo -e "${GREEN}GitHub에 푸시 중...${NC}"
        git push
        
        echo ""
        echo -e "${GREEN}✅ 업데이트가 완료되었습니다!${NC}"
        echo "1-2분 후 웹사이트에 반영됩니다."
    else
        echo -e "${YELLOW}⚠️  변경된 파일이 없습니다.${NC}"
    fi
}

# 백업 생성
create_backup() {
    echo -e "${GREEN}💾 백업을 생성합니다...${NC}"
    
    local backup_dir="backups"
    local timestamp=$(date +"%Y%m%d_%H%M%S")
    local backup_file="${backup_dir}/backup_${timestamp}.tar.gz"
    
    # 백업 디렉토리 생성
    mkdir -p "$backup_dir"
    
    # 백업 파일 생성
    tar -czf "$backup_file" index.html README.md deploy-guide.html
    
    echo -e "${GREEN}✅ 백업이 생성되었습니다: ${backup_file}${NC}"
}

# 메인 로직
case "$1" in
    init)
        init_deploy
        ;;
    update)
        update_deploy "$2"
        ;;
    backup)
        create_backup
        ;;
    help|--help|-h)
        show_help
        ;;
    *)
        echo -e "${RED}❌ 잘못된 명령어입니다.${NC}"
        echo ""
        show_help
        exit 1
        ;;
esac
