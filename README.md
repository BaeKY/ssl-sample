# ssl-sample

## Prerequisites

- docker가 설치되어 있어야 한다.
  - [Orbstack](https://orbstack.dev/download) 사용 권장 아래 명령어로 설치 가능

    ```Bash
    brew install orbstack
    ```

- `/etc/hosts` 파일에 대한 이해?

## How to run?

> M2-Pro MacBook 기준으로 설명한다.

1. `./nginx.conf` 파일에서 필요한 값을 치환한다.
   1. `<YOUR_DOMAIN_HERE>`: 노출할 도메인 이름이다. (ex - client-dev.mytestserver)
   2. `<YOUR_TARGET_PORT_HERE>`: 포워딩 타겟 포트를 치환한다.
2. 내 로컬머신의 `/etc/hosts`을 수정한다

    ```Bash
    sudo vi /etc/hosts

    # vim 에디터로 /etc/hosts 파일에 아래와 같은 내용을 추가한다.
    
    ...중략...
    127.0.0.1       <YOUR_DOMAIN_HERE>


    # 예를들면... 아래와 같이

    ...중략...
    127.0.0.1       client-dev.mytestserver
    ```

3. `./ssl/README.md`에 참조된 링크를 읽고 인증서를 생성한다.
4. 생성한 인증서를 내 로컬 머신이 신뢰하도록 한다.

    ```Bash
    # 내부 개발용 TLS 인증서의 Root CA를 Trust 목록에 추가한다.
    # 아래 스크립트는 MacOS 기준 설정 명령어다. 해당 프로젝트의 Root에서 수행한다.
    sudo security add-trusted-cert -d -r trustRoot -k /Library/Keychains/System.keychain ./ssl/ca.pem
    ```

5. Run!

    ```Bash
    ./container-cmd.sh up

    # 중지하고 싶으면 아래와 같이 입력한다
    # ./container-cmd.sh down
    ```
