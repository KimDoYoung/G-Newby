# Open Web UI 설치

## 개요

- [Open web ui](https://github.com/open-webui/open-webui)를 docker로 설치
- G-Newby를 모델로 등록

## docker compose 

1.  data/docker에 compose file 수정

```yml
  # 2. Open WebUI (3000)
  open-webui:
    image: ghcr.io/open-webui/open-webui:main
    container_name: open-webui
    restart: always
    ports:
      - "3000:8080"
    volumes:
      - open-webui_data:/app/data
    environment:
      - 'OLLAMA_BASE_URL=http://172.17.0.1:11434'
      - 'WEBUI_SECRET_KEY=t3600_omen_secret_kalpa987!' # 임의의 키 설정
  # /var/lib/docker/volumes/open-webui_data/_data
volumes:
  open-webui_data:
```

2. ollama가 어디서든 접속가능하게 수정

```bash
# 1. 파일 생성
sudo mkdir -p /etc/systemd/system/ollama.service.d/
echo "[Service]
Environment=\"OLLAMA_HOST=0.0.0.0\"
Environment=\"OLLAMA_ORIGINS=*\"" | sudo tee /etc/systemd/system/ollama.service.d/override.conf

# 2. 시스템에 반영
sudo systemctl daemon-reload
sudo systemctl restart ollama
```
3. 방화벽 수정

3. localhost:3000으로 접속 모델 등록

```bash
# 컨테이너를 완전히 삭제 후 새로 생성
docker-compose up -d --force-recreate open-webui
# 시스템 설정 새로고침
sudo systemctl daemon-reload

# Ollama 서비스 재시작
sudo systemctl restart ollama

# 11434 포트가 0.0.0.0으로 바뀌었는지 확인
ss -tnlp | grep 11434
```



