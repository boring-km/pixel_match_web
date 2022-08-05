# pixel_match_web

- 웹에서 픽셀 이미지를 보면서 이게 무슨 그림인지 빨리 맞추는 게임
- 기반 프로젝트: https://github.com/boring-km/color-from-image

## Page Link
- [https://boring-km.github.io/pixel_match_web](https://boring-km.github.io/pixel_match_web)

## 구현해야 할 기능들

### 이미지 관련
- 외부 파일 저장소에 있는 파일을 불러온다.
  - 만약 로딩 속도가 좀 길어진다면 먼저 프로젝트에 직접 리소스를 넣는 방식부터 시작해본다.
- 이미지 로딩 (원본 or 최적화된 이미지)
- 이미지에서 pixel color 추출 및 타일 형태로 그리기

### 데이터 관련
- 문제를 저장할 때 이미지 저장 경로와 해당 이미지 경로와 매핑되는 정답 데이터를 보관해야 한다. (현재는 Firebase NoSQL이 유력)
- 정답을 맞추었을 때 그에 따른 보상을 줄 수 있는 기능을 구현한다.
