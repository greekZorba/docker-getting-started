#FROM을 기반으로 생성한다. ex) Mongo, redis, ubuntu
FROM centos:7

RUN useradd -u 8877 jinhakkim
USER jinhakkim

#WORKDIR을 사용하면 해당 디렉토리 위치로 이동
#WORKDIR /app

# 복사
COPY HelloDocker.txt .

#CMD : 쉘 명령어 실행
CMD cat ./HelloDocker.txt

# docker build -t(태깅을 다는 옵션) 서비스이름/이미지이름:버전 빌드할 디렉토리

# 무한루프
# CMD while true; do sleep 3; cat name.txt; done;

# 컨테이너에 접속해서 관리
# docker exec -it {컨테이너id} bash
# -it : 컨테이너에 명령을 넣고 실시간으로 터미널에서 받아봄(명령형으로 실행)

# docker run 이미지 이름 : 로컬에 없다면 자동으로 pull 받음
# docker run -p 80:80 : 포트를 바인딩해줌

# docker rmi <이미지 id> : 도커 이미지 삭제
# docker rmi -f <이미지 id> : 도커 이미지 삭제(컨테이너에 있더라도 강제삭제)

# docker run -v <호스트폴더 위치>:<도커폴더 위치>: 볼륨 마운트 -> 호스트와 도커 컨테이너를 연결시켜줌
# ex) docker run -v ${PWD}/data:/data/db mongo

# docker exec -it <컨테이너id> mongo : 바로 몽고를 실행