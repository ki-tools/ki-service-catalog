docker build -t ki-tools/service-catalog-docker .

docker tag ki-tools/service-catalog-docker:latest hafen/service-catalog-docker:latest

docker push hafen/service-catalog-docker:latest

docker run -it ki-tools/service-catalog-docker bash
