# 베이스 이미지 설정
FROM node:18
# 작업 디렉토리 설정
WORKDIR /usr/src/app
# 애플리케이션 의존성 복사
COPY package*.json ./
# 의존성 설치
RUN npm install
# 애플리케이션 소스 코드 복사
COPY . .
# 애플리케이션 실행
CMD ["node", "app.js"]
# 컨테이너가 외부와 통신할 포트 정의
EXPOSE 3000
