아까 답변 중에 시스템 오류로 이상한 문장이 섞여 나와 혼란을 드렸네요. 죄송합니다!

보여주신 터미널 화면을 보니 `G-Newby` 프로젝트 디렉토리에서 Fish Shell로 Ollama 모델 목록을 아주 잘 확인하셨습니다.

개발하시면서 자주 쓰시게 될 Ollama 핵심 명령어들을 깔끔하게 정리해 드릴게요. Fish Shell 환경에 그대로 복사해서 쓰시면 됩니다.

---

## Ollama 필수 명령어 모음

### 1. 모델 실행 및 다운로드

```fish
# Qwen 3.5 9b 모델 실행 (로컬에 없으면 자동으로 다운로드 시작)
ollama run qwen3.5:9b

# 다운로드만 먼저 받아두고 싶을 때
ollama pull qwen3.5:9b

```

> **Tip:** `ollama run`으로 모델이 실행되어 대화 창(`>>>`)이 뜨면, 대화를 나누다가 **`/exit`**를 입력하거나 `Ctrl + D`를 누르면 원래 터미널로 빠져나옵니다.

### 2. 모델 관리 (조회 및 삭제)

```fish
# 현재 로컬에 설치된 모델 목록 보기 (방금 입력하신 명령어)
ollama list

# 실행 중인 모델과 VRAM 점유 상태 확인하기
ollama ps

# 더 이상 안 쓰는 모델 삭제 (예: qwen2.5-coder:14b)
ollama rm qwen2.5-coder:14b

```

### 3. G-Newby 같은 커스텀 모델 관리 (Modelfile)

`g-newby:latest`처럼 프롬프트나 파라미터를 튜닝한 커스텀 모델을 다룰 때 쓰는 명령어입니다.

```fish
# Modelfile을 기반으로 나만의 커스텀 모델 생성/업데이트
ollama create g-newby -f ./Modelfile

# 특정 모델의 설정 정보나 시스템 프롬프트 확인하기
ollama show g-newby --modelfile

```

---

## 💡 Fish Shell 유저를 위한 꿀팁 (Abbreviation)

매번 `ollama`를 길게 치기 귀찮으시다면, Fish Shell의 강력한 기능인 Abbreviation(약어)을 설정해 두고 쓰세요. 터미널에 아래 명령어들을 한 번만 실행해 두면 됩니다.

```fish
abbr -a ol ollama list
abbr -a or ollama run
abbr -a ops ollama ps

```

이렇게 등록해 두면 터미널에 `ol`만 입력하고 스페이스바를 누르는 순간 자동으로 `ollama list`로 확장되어 아주 편하게 로컬 모델들을 제어할 수 있습니다.