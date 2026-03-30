## G-Newby 시작 가이드

두 장비 모두 CachyOS (Arch 기반) + 16GB VRAM이라 로컬 LLM 환경으로 꽤 좋은 조건입니다. 단계별로 정리해드립니다.

---

## 1단계 — LLM 실행 엔진 설치

CachyOS에서 가장 쉽고 강력한 선택은 **Ollama**입니다.

```bash
curl -fsSL https://ollama.com/install.sh | sh
```

설치 후 서비스 시작:

```bash
sudo systemctl enable --now ollama
```

---

## 2단계 — 모델 선택 (16GB VRAM 기준)

GWT/GXT 코딩에 적합한 모델:

| 모델 | 크기 | 특징 |
|------|------|------|
| `deepseek-coder-v2:16b` | ~9GB | 코딩 특화, 추천 |
| `qwen2.5-coder:14b` | ~8GB | 코딩 특화, 한국어도 가능 |
| `codestral:22b` | ~13GB | 고성능, VRAM 빠듯 |

```bash
ollama pull qwen2.5-coder:14b
```

---

## 3단계 — IDE 연동 (코딩 어시스턴트화)

**Continue.dev** (VS Code / JetBrains 플러그인) 추천:

```bash
# VS Code 기준
# 확장 프로그램에서 "Continue" 설치 후
# config.json 에서 ollama 모델 연결
```

또는 **Cursor IDE**에서 로컬 모델 연결도 가능합니다.

---

## 4단계 — GWT/GXT 컨텍스트 주입

신입사원처럼 동작하게 하려면 **시스템 프롬프트**에 프로젝트 컨텍스트를 넣어야 합니다:

```
당신은 GWT/GXT 프로젝트에 투입된 Java 개발자입니다.
- GWT 2.x / GXT (Sencha) 기반 프로젝트
- 기존 코드 스타일을 따르며 요구사항을 구현합니다
- 모르는 것은 모른다고 하고, 확인이 필요한 것은 질문합니다
```

---

## 추천 시작 순서

```
Ollama 설치 → qwen2.5-coder:14b 다운 → Continue.dev 연동 → 테스트
```

---

GWT/GXT 프로젝트 코드가 이미 있나요? 있다면 **RAG(코드베이스 인덱싱)** 설정도 같이 잡아드릴 수 있습니다.

## Aider

- claude code나 gemini cli 같이 local LLM을 이용해서 cli작업을 할 수 있게 해 준다.

### 예시: 여러 파일을 한 번에 생성 지시

aider --model ollama/qwen2.5-coder:14b \
      XxxView.java XxxPresenter.java XxxMapper.xml

> @패턴파일 참고해서 AssetCategory CRUD 페이지 4개 파일 만들어줘

```

- 파일 여러 개를 **동시에** 생성/수정
- VS Code에서 결과물 확인하는 식으로 병행 가능

---

## 현실적인 조합 제안
```

Continue.dev  →  질문/탐색/단일 파일 작업  (VS Code 안)
Aider         →  페이지 단위 파일 세트 생성 (터미널)
