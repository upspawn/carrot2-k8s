# Build Stage
FROM alpine:3.14 AS build

# Carrot2 version as an argument for flexibility
ARG CARROT2_VERSION=4.5.1
ENV CARROT2_VERSION=${CARROT2_VERSION}

# Metadata as described in best practices
LABEL org.opencontainers.image.title="Carrot2 Text Clustering Server" \
      org.opencontainers.image.description="A Docker image to run Carrot2 Text Clustering Server on Kubernetes" \
      org.opencontainers.image.url="https://github.com/your-username/carrot2-k8s" \
      org.opencontainers.image.source="https://github.com/your-username/carrot2-k8s" \
      org.opencontainers.image.version="${CARROT2_VERSION}" \
      org.opencontainers.image.licenses="Apache-2.0"

# Install curl and unzip
RUN apk --no-cache add curl unzip

# Download and unzip Carrot2
RUN curl -L -o carrot2.zip https://github.com/carrot2/carrot2/releases/download/release%2F${CARROT2_VERSION}/carrot2-${CARROT2_VERSION}.zip && \
    unzip carrot2.zip && \
    mv carrot2-${CARROT2_VERSION} /carrot2

# Final Stage
FROM openjdk:11-jre-slim

# Copy only the dcs directory from build stage
COPY --from=build /carrot2/dcs /carrot2

# Working directory
WORKDIR /carrot2

# Expose port 8080
EXPOSE 8080

# Command to run
CMD ["./dcs"]
