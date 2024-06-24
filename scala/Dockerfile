ARG SBT_VERSION=1.10.0
ARG SCALA_VERSION=3.3.3

FROM sbtscala/scala-sbt:eclipse-temurin-alpine-21.0.2_13_${SBT_VERSION}_${SCALA_VERSION} AS builder

WORKDIR /app

COPY project project

COPY build.sbt .

RUN sbt update

COPY . .

RUN sbt assembly

FROM eclipse-temurin:21-jre-ubi9-minimal AS runtime

ARG SCALA_VERSION

WORKDIR /app

COPY --from=builder /app/target/scala-${SCALA_VERSION}/main.jar /app

CMD [ "java", "-jar", "/app/main.jar" ]
