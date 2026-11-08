# WODLog

개인용 크로스핏 운동 기록 앱입니다. Flutter 기반으로 Android와 iOS에서 실행하며,
기록과 통계는 우선 기기 안에 저장합니다.

## 개발 환경

- Flutter stable
- Dart SDK (Flutter와 함께 설치)
- Xcode (iOS 빌드)
- Android Studio 및 Android SDK (Android 빌드)

## 시작하기

```sh
flutter pub get
flutter run
```

## 현재 구현

- 네이티브 앱의 로컬 SQLite와 웹 미리보기의 브라우저 로컬 DB에 기록 저장 (운동 기록 서버 없음)
- 날짜별 운동 세션 생성, 수정, 삭제 및 과거 날짜 기록
- CrossFit 동작 카탈로그 검색, 별칭 검색, 사용자 지정 운동 입력
- 근력 블록, 종목, 세트 기록과 벤치마크 WOD 및 자유 형식 WOD 결과 기록
- 같은 운동의 이전 세션과 세트·반복·중량 볼륨 비교
- 카탈로그 동작 그룹별 최근 7일과 직전 7일 운동량 비교
- 24개 UI 로캘과 지역별 날짜·숫자 표시
- GitHub Pages iPhone 웹 미리보기와 홈 화면 추가 지원

## 진행 중

- 회사에서 사용할 iPhone Safari 미리보기의 Pages 배포 검증
- JSON 백업/복원 및 kg/lb 단위 설정
- Galaxy APK 다운로드 경로와 실기기 검증
- WOD 사진 온디바이스 OCR (기본 기록 흐름 다음 우선순위)
- 24개 로캘 레이아웃·RTL 및 문구 최종 점검

웹 미리보기는 [iPhone Safari에서 열기](https://rsy-dev.github.io/WODLog/)로 테스트합니다. Safari 공유 메뉴에서 **Add to Home Screen**을 선택하세요. 웹과 네이티브 앱 기록은 서로 동기화되지 않습니다.

Android 우선 출시 및 광고 준비 항목은 [`docs/android-first-release.md`](docs/android-first-release.md)에 정리합니다.

세부 범위와 단계별 완료 조건은 Notion의 [개발 로드맵](https://app.notion.com/p/407ef63c537b81b78a0bd93019c3560e?pvs=204)을 참고합니다.
