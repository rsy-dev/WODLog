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

- 기기 안의 Drift/SQLite에 운동 기록 저장 (계정 및 앱 서버 없음)
- 오늘 세션 생성, 수정, 삭제 및 운동 내역 조회
- 근력 블록, 종목, 세트 기록과 WOD 결과 기록
- 24개 UI 로캘과 지역별 날짜·숫자 표시
- 기록 흐름을 간결하게 유지하는 미니멀 UI

## 진행 중

- WOD 사진의 온디바이스 OCR과 확인 가능한 기록 초안
- JSON 백업/복원 및 kg/lb 단위 설정
- iPhone TestFlight 베타와 Galaxy APK 다운로드 경로
- 실기기 설치 및 핵심 기록 흐름 검증

Android 우선 출시 및 광고 준비 항목은 [`docs/android-first-release.md`](docs/android-first-release.md)에 정리합니다.

세부 범위와 단계별 완료 조건은 Notion의 [개발 로드맵](https://app.notion.com/p/407ef63c537b81b78a0bd93019c3560e?pvs=204)을 참고합니다.
