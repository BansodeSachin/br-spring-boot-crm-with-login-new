# br-spring-boot-crm-with-login-new

#Command to clean and prepare .jar file in target folder:
mvn clean install

#Commands to build and run docker:
docker build -t bansodesachin/br-simple-lender-backend-new2:latest .
docker run -p 8084:8084 bansodesachin/br-simple-lender-backend-new2:latest


#Commands to Push docker image to docker repository:
docker login
docker push bansodesachin/br-simple-lender-backend-new2:latest