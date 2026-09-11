FROM maven:3.8.5-openjdk-17 AS build
COPY . .
RUN mvn clean package

# Usamos un servidor Tomcat compatible con Jakarta EE 10
FROM tomcat:10.1-jdk17

# Eliminamos la página por defecto de Tomcat
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# Copiamos el archivo WAR generado en la fase de compilación a la raíz de Tomcat
COPY --from=build /target/Tarea05-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war

# Exponemos el puerto
EXPOSE 8080
CMD ["catalina.sh", "run"]