# Usamos un servidor Tomcat compatible con Jakarta EE 10
FROM tomcat:10.1-jdk17

# Eliminamos la página por defecto de Tomcat
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# Copiamos tu proyecto y lo renombramos a ROOT.war
COPY producto-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war

# Exponemos el puerto
EXPOSE 8080

# Iniciamos Tomcat
CMD ["catalina.sh", "run"]
