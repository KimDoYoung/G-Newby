#!/bin/bash

# 색상 정의
BLUE='\033[0;34m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${BLUE}==========================================${NC}"
echo -e "${GREEN}   Ollama 관리 매니저 (OMEN Environment)   ${NC}"
echo -e "${BLUE}==========================================${NC}"
echo "1) 설치된 모델 목록 확인 (ollama list)"
echo "2) 현재 VRAM 로드된 모델 확인 (ollama ps)"
echo "3) Ollama 서비스 상태 확인 (systemctl status ollama.service)"
echo "4) Ollama 서비스 재시작 (sudo systemctl restart ollama.service)"
echo "5) 실시간 로그 모니터링 (journalctl)"
echo "6) NVIDIA GPU 사용량 확인 (smi)"
echo "q) 종료"
echo -e "${BLUE}------------------------------------------${NC}"

read -p "번호를 입력하세요: " choice

case $choice in
    1)
        CMD="ollama list"
        ;;
    2)
        CMD="ollama ps"
        ;;
    3)
        CMD="systemctl status ollama.service"
        ;;
    4)
        CMD="sudo systemctl restart ollama.service"
        ;;
    5)
        CMD="journalctl -u ollama.service -f"
        ;;
    6)
        CMD="nvidia-smi"
        ;;
    q)
        echo "종료합니다."
        exit 0
        ;;
    *)
        echo "잘못된 입력입니다."
        exit 1
        ;;
esac

# 명령어 출력 및 실행
echo -e "${YELLOW}실행할 명령어:${NC} $CMD"
echo -e "${BLUE}------------------------------------------${NC}"
eval $CMD
