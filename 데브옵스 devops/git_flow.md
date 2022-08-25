### Git Strategy

- 브랜치 전략
    - 기본적으로 git-flow의 브랜치 전략을 따르며, 아래의 브랜치 이름을 사용한다.
    - 참고: https://danielkummer.github.io/git-flow-cheatsheet/index.ko_KR.html
    - `[master]` 배포될 버전을 유지하는 브랜치
    - `[develop]` 개발 진행 브랜치
    - `[release/xxx]` QA 버전이 배포될 브랜치이며, QA의 버그 수정이 이루어지는 브랜치
    - `[feature/xxx]` 기본적으로 develop 브랜치에서 분기되며, 기능 개발 시 사용하는 브랜치
    - `[hotfix/xxx]` 기본적으로 main 브랜치에서만 분기되며, 배포된 버전에서 긴급한 수정 사항을 반영하기 위한 브랜치
    - `[support]` 사용하지 않음

- 커밋 전략
    - 커밋은 애플리케이션 구동 시 문제가 없는 수준에서 최소 단위로 커밋한다.
    - 커밋 메세지는 `[유형] 작업에 대한 요약 설명` 형태로 작성하고 필요에 따라 body를 작성할 수 있다.
    - 신규 기능 추가 시 `[ADD]` 타입을 prefix로 사용한다.
    - 기능 수정 시 `[UPDATE]` 타입을 prefix로 사용한다.
    - 기능 삭제 시 `[DELETE]` 타입을 prefix로 사용한다.
    - 버그 수정 시 `[FIX]` 타입을 prefix로 사용한다.
    - 동작 변경 없이 코드 구조만 개선 시 `[REFACT]` 타입을 prefix로 사용한다.
    - README 등 문서 작업 발생 시, `[DOC]` 타입을 prefix로 사용한다.
    - 환경설정, 라이브러리 버전 변경 등 기타 작업 발생 시, `[CHORE]` 타입을 prefix로 사용한다.