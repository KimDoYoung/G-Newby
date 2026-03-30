# G-Newby

## 개요

- 노트북과 PC에 localLLM을 설치하여 GWT/GXT Coding machine을 만든다.
- 마치 새로운 신입 사원이 들어와서 GWT/GXt 프로젝트에 투입되어서 코딩을 하고, 이런저런 요구사항을 해결한다.

## 장비

- 장비 두 개인데 1개는 desktop 이고 1대는 notebook이다.

1. Desktop : E5-1620(Dell), 64G ram, 4060 16G vram
2. Notebook: OMEN (hp) 32 ram, 3080 16G vram
3. OS는 모두 CachyOS 를 설치

## 현 상황

- Asset-ERP라는 자산운용사를 위한 全社的 SaaS ERP 제품이 있음.
- Asset-ERP는 [GWT](https://www.gwtproject.org/)와 [GXT](https://docs.sencha.com/gxt/4.x/) 로 작성되었다.
- Asset-OMS는 Asset-ERP과 같은 기술적 구조를 갖는다.
- Asset-OMS는 Asset-ERP의 기본구조 즉 고객사관리, 로그인 처리, 메뉴체계 등을 차용하여 개발하는 Order Management System이다.
- 현재 개발인력은 3~5인으로 구성되어 있다

## Asset-ERP와 Asset-OMS의 기술스택

- java1.8, maven, mybatis, gxt 4.0.2, gwt 2.9.0,

## 참고 - GXT demos

- [GXT demo explorer](https://github.com/sencha/gxt-demo-explorer)
- [GXT Dashboard](https://github.com/sencha/gxt-demo-edash)
- [GXT large grid demo](https://github.com/sencha/gxt-demo-grids)
