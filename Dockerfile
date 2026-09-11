# Usamos directamente un servidor Tomcat compatible con Jakarta EE 10 y Java 17
FROM tomcat:10.1-jdk17

# Eliminamos la página por defecto de Tomcat
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# Copiamos tu archivo WAR ya compilado directamente a la raíz de Tomcat como ROOT.war
COPY Tarea05-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war

# Exponemos el puerto
EXPOSE 8080
CMD ["catalina.sh", "run"]
