# 1. 기본 이미지 설정 (Ubuntu 20.04)
FROM ubuntu:20.04

# 2. 작업 디렉토리 설정
WORKDIR /darknet

# 3. 필수 패키지 설치 (git, make, build-essential, wget)
#    ca-certificates는 https URL에서 이미지를 다운로드하기 위해 필요합니다.
RUN apt-get update && apt-get install -y \
    git \
    make \
    build-essential \
    wget \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# [cite_start]4. Darknet 소스 코드 클론 (튜토리얼 2페이지 참고) [cite: 15]
[cite_start]RUN git clone https://github.com/pjreddie/darknet . [cite: 15]

# [cite_start]5. Darknet 빌드 (튜토리얼 2페이지 참고) [cite: 16]
[cite_start]RUN make [cite: 16]

# [cite_start]6. YOLOv3 가중치 파일 다운로드 (튜토리얼 2페이지 참고) [cite: 18]
[cite_start]RUN wget https://data.pjreddie.com/files/yolov3.weights [cite: 18]

# 7. 실행 스크립트 복사 및 실행 권한 부여
COPY entrypoint.sh .
RUN chmod +x entrypoint.sh

# 8. 컨테이너 실행 시 entrypoint.sh 스크립트 실행
ENTRYPOINT ["./entrypoint.sh"]