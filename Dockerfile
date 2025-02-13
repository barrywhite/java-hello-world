# Build stage
FROM maven:3.9-eclipse-temurin-17 AS builder
WORKDIR /app
COPY . .

# Cache dependencies
RUN mvn dependency:go-offline -Dmaven.test.skip=true

# Copy source code and build
RUN mvn clean package -DskipTests -Dmaven.test.skip=true

# Runtime stage
FROM eclipse-temurin:17-jre-jammy
WORKDIR /app
COPY --from=builder /app/target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-Xmx512m", "-Xms256m", "-jar", "app.jar"]