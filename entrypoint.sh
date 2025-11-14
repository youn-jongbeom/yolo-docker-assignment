#!/bin/bash

# Docker run 명령의 첫 번째 인자(이미지 URL)를 변수에 저장
IMAGE_URL=$1

# 1. URL에서 이미지를 'input.jpg'라는 이름으로 다운로드
#    [cite_start](과제 3페이지 로그에서 'input.jpg'로 예측 수행) [cite: 35, 39]
wget "$IMAGE_URL" -O input.jpg

# [cite_start]2. Darknet detector 실행 (튜토리얼 2페이지 명령어 기반) [cite: 19]
#    data/dog.jpg 대신 다운로드한 input.jpg를 사용
./darknet detector test cfg/coco.data cfg/yolov3.cfg yolov3.weights input.jpg [cite: 19]