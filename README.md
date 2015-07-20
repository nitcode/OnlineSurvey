# OnlineSurvey
This is an web application which helps in fetching data from experts using highcharts library. It is developed using Spring, Hibernate, JQuery and MySql. <br />
## QuickStart
Create dynamic web project in maven, navigate to the folder where you want to save the project and enter following command using terminal: <br/>
`mvn archetype:generate -DgroupId=com.online.survey -DartifactId=OnlineSurvey -DarchetypeArtifactId=maven-archetype-webapp -DinteractiveMode=false` <br/>
Convert maven project to support eclise using following command in project directory and later import project in eclipse <br/>
`mvn eclipse:eclipse -Dwtpversion=2.0` <br/>
## Update Pom.xml
```xml
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/maven-v4_0_0.xsd">
  <modelVersion>4.0.0</modelVersion>
  <groupId>com.online.survey</groupId>
  <artifactId>OnlineSurvey</artifactId>
  <packaging>war</packaging>
  <version>1.0-SNAPSHOT</version>
  <name>OnlineSurvey Maven Webapp</name>
  <url>http://maven.apache.org</url>
  
  <properties>
		<spring.version>4.0.5.RELEASE</spring.version>
		<hibernate.version>4.3.5.Final</hibernate.version>
		<log4j.version>1.2.17</log4j.version>
		<jdk.version>1.6</jdk.version>
		<context.path>OnlineSurvey</context.path>
	</properties>
  
  <developers>
		<developer>
			<id>Nitin Sharma</id>
			<email>nitin.sunny2005@gmail.com</email>
			<timezone>+1:00</timezone>
		</developer>
	</developers>
  
  <build>
		<finalName>${pom.artifactId}</finalName>
		<plugins>
			<plugin>
				<artifactId>maven-compiler-plugin</artifactId>
				<configuration>
					<source>${jdk.version}</source>
					<target>${jdk.version}</target>
				</configuration>
			</plugin>
		</plugins>
	</build>
  
  <dependencies>
    <dependency>
			<groupId>log4j</groupId>
			<artifactId>log4j</artifactId>
			<version>${log4j.version}</version>
		</dependency>

		<dependency>
			<groupId>org.springframework</groupId>
			<artifactId>spring-orm</artifactId>
			<version>${spring.version}</version>
		</dependency>
		
		<dependency>
			<groupId>org.springframework</groupId>
			<artifactId>spring-jdbc</artifactId>
			<version>${spring.version}</version>
		</dependency>
		
		<dependency>
			<groupId>org.springframework</groupId>
			<artifactId>spring-web</artifactId>
			<version>${spring.version}</version>
		</dependency>
		
		<dependency>
			<groupId>org.hibernate</groupId>
			<artifactId>hibernate-entitymanager</artifactId>
			<version>${hibernate.version}</version>
		</dependency>
		
		<dependency>
			<groupId>org.springframework</groupId>
			<artifactId>spring-webmvc</artifactId>
			<version>${spring.version}</version>
		</dependency>
		
		<dependency>
			<groupId>jstl</groupId>
			<artifactId>jstl</artifactId>
			<version>1.2</version>
		</dependency>
		
		<dependency>
      <groupId>com.google.guava</groupId>
      <artifactId>guava</artifactId>
      <version>12.0</version>
    </dependency>
		
		<dependency>
			<groupId>mysql</groupId>
			<artifactId>mysql-connector-java</artifactId>
			<version>5.1.6</version>
		</dependency>
    
		<dependency>
        <groupId>javax.servlet</groupId>
        <artifactId>javax.servlet-api</artifactId>
        <version>3.1.0</version>
        <scope>provided</scope>
    </dependency>
    
  </dependencies>
</project>

```
Navigate to the project location and run following command in project directory: <br/>
`mvn eclipse:eclipse -Dwtpversion=2.0` <br/>
## Create Database
As we are using 20 different data-sets,create 20 tables one for each data-set and import the data. You can find all the data-sets in resources folder. For example, GraphPlot1 for dataset-1 as shown below:
```Sql
CREATE TABLE `GraphPlot1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last` varchar(45) DEFAULT NULL,
  `vo2_breadth` varchar(45) DEFAULT NULL,
  `vco2_breadth` varchar(45) DEFAULT NULL,
  `vo2_kg` varchar(45) DEFAULT NULL,
  `vo2` varchar(45) DEFAULT NULL,
  `vco2` varchar(45) DEFAULT NULL,
  `rer` varchar(45) DEFAULT NULL,
  `hr` varchar(45) DEFAULT NULL,
  `peto2` varchar(45) DEFAULT NULL,
  `petco2` varchar(45) DEFAULT NULL,
  `o2plus` varchar(45) DEFAULT NULL,
  `ve` varchar(45) DEFAULT NULL,
  `bf` varchar(45) DEFAULT NULL,
  `br` varchar(45) DEFAULT NULL,
  `ve_vo2` varchar(45) DEFAULT NULL,
  `ve_vco2` varchar(45) DEFAULT NULL,
  `o2delay` varchar(45) DEFAULT NULL,
  `co2delay` varchar(45) DEFAULT NULL,
  `vt` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) 

```
To store results, create table User_Results as shown below:

```Sql
CREATE TABLE `user_results` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data_set` varchar(45) DEFAULT NULL,
  `session_id` varchar(150) DEFAULT NULL,
  `vo2` varchar(45) DEFAULT NULL,
  `vco2` varchar(45) DEFAULT NULL,
  `ve` varchar(45) DEFAULT NULL,
  `power` varchar(45) DEFAULT NULL,
  `title` varchar(45) DEFAULT NULL,
  `expertname` varchar(45) DEFAULT NULL,
  `experience` varchar(80) DEFAULT NULL,
  `testsnumber` varchar(80) DEFAULT NULL,
  `email` varchar(95) DEFAULT NULL,
  PRIMARY KEY (`id`)
) 
```
