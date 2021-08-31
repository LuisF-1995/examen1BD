-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: dhtube1
-- ------------------------------------------------------
-- Server version	8.0.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `avatar`
--

DROP TABLE IF EXISTS `avatar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `avatar` (
  `ID_AVATAR` smallint NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(100) DEFAULT NULL,
  `URL` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ID_AVATAR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avatar`
--

LOCK TABLES `avatar` WRITE;
/*!40000 ALTER TABLE `avatar` DISABLE KEYS */;
/*!40000 ALTER TABLE `avatar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `canal`
--

DROP TABLE IF EXISTS `canal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `canal` (
  `ID_CANAL` int NOT NULL AUTO_INCREMENT,
  `NOMBRE_CANAL` varchar(150) DEFAULT NULL,
  `DESCRIPCION_CANAL` text,
  `FECHA_CREACION_CANAL` date DEFAULT NULL,
  `FK_USUARIO_CANAL` bigint DEFAULT NULL,
  PRIMARY KEY (`ID_CANAL`),
  KEY `FK_USUARIO_CANAL` (`FK_USUARIO_CANAL`),
  CONSTRAINT `FK_USUARIO_CANAL` FOREIGN KEY (`FK_USUARIO_CANAL`) REFERENCES `usuario` (`ID_USUARIO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `canal`
--

LOCK TABLES `canal` WRITE;
/*!40000 ALTER TABLE `canal` DISABLE KEYS */;
/*!40000 ALTER TABLE `canal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `etiqueta`
--

DROP TABLE IF EXISTS `etiqueta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `etiqueta` (
  `CODIGO` int NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`CODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etiqueta`
--

LOCK TABLES `etiqueta` WRITE;
/*!40000 ALTER TABLE `etiqueta` DISABLE KEYS */;
/*!40000 ALTER TABLE `etiqueta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `etiqueta_video`
--

DROP TABLE IF EXISTS `etiqueta_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `etiqueta_video` (
  `ID_ETIQUETA_VIDEO` smallint NOT NULL AUTO_INCREMENT,
  `FK_VIDEO_PUBLICADO2` bigint DEFAULT NULL,
  `FK_ETIQUETA` int DEFAULT NULL,
  PRIMARY KEY (`ID_ETIQUETA_VIDEO`),
  KEY `FK_VIDEO_PUBLICADO2` (`FK_VIDEO_PUBLICADO2`),
  KEY `FK_ETIQUETA` (`FK_ETIQUETA`),
  CONSTRAINT `FK_ETIQUETA` FOREIGN KEY (`FK_ETIQUETA`) REFERENCES `etiqueta` (`CODIGO`),
  CONSTRAINT `FK_VIDEO_PUBLICADO2` FOREIGN KEY (`FK_VIDEO_PUBLICADO2`) REFERENCES `video_publicado` (`ID_VIDEO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etiqueta_video`
--

LOCK TABLES `etiqueta_video` WRITE;
/*!40000 ALTER TABLE `etiqueta_video` DISABLE KEYS */;
/*!40000 ALTER TABLE `etiqueta_video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist`
--

DROP TABLE IF EXISTS `playlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlist` (
  `ID_PLAYLIST` smallint NOT NULL AUTO_INCREMENT,
  `NOMBRE_PLAYLIST` varchar(150) DEFAULT NULL,
  `FECHA_CREACION_PLAYLIST` date DEFAULT NULL,
  `FK_USUARIO_PLAYLIST` bigint DEFAULT NULL,
  `ESTADO_PLAYLIST` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID_PLAYLIST`),
  KEY `FK_USUARIO_PLAYLIST` (`FK_USUARIO_PLAYLIST`),
  CONSTRAINT `FK_USUARIO_PLAYLIST` FOREIGN KEY (`FK_USUARIO_PLAYLIST`) REFERENCES `usuario` (`ID_USUARIO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist`
--

LOCK TABLES `playlist` WRITE;
/*!40000 ALTER TABLE `playlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `playlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist_video`
--

DROP TABLE IF EXISTS `playlist_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlist_video` (
  `ID_AVATAR` smallint NOT NULL AUTO_INCREMENT,
  `FK_PLAYLIST` smallint DEFAULT NULL,
  `FK_VIDEO_PUBLICADO` bigint DEFAULT NULL,
  PRIMARY KEY (`ID_AVATAR`),
  KEY `FK_PLAYLIST` (`FK_PLAYLIST`),
  KEY `FK_VIDEO_PUBLICADO` (`FK_VIDEO_PUBLICADO`),
  CONSTRAINT `FK_PLAYLIST` FOREIGN KEY (`FK_PLAYLIST`) REFERENCES `playlist` (`ID_PLAYLIST`),
  CONSTRAINT `FK_VIDEO_PUBLICADO` FOREIGN KEY (`FK_VIDEO_PUBLICADO`) REFERENCES `video_publicado` (`ID_VIDEO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist_video`
--

LOCK TABLES `playlist_video` WRITE;
/*!40000 ALTER TABLE `playlist_video` DISABLE KEYS */;
/*!40000 ALTER TABLE `playlist_video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reaccion`
--

DROP TABLE IF EXISTS `reaccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reaccion` (
  `ID_REACCION` smallint NOT NULL AUTO_INCREMENT,
  `NOMBRE_REACCION` varchar(50) DEFAULT NULL,
  `ICONO` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ID_REACCION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reaccion`
--

LOCK TABLES `reaccion` WRITE;
/*!40000 ALTER TABLE `reaccion` DISABLE KEYS */;
/*!40000 ALTER TABLE `reaccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `ID_USUARIO` bigint NOT NULL AUTO_INCREMENT,
  `E_MAIL` varchar(100) DEFAULT NULL,
  `CONTRASENA` varchar(150) DEFAULT NULL,
  `NOMBRE_USUARIO` varchar(150) DEFAULT NULL,
  `FECHA_NAC` date DEFAULT NULL,
  `PAIS` varchar(100) DEFAULT NULL,
  `CODIGO_POSTAL` int DEFAULT NULL,
  `FK_AVATAR` smallint DEFAULT NULL,
  PRIMARY KEY (`ID_USUARIO`),
  KEY `FK_AVATAR` (`FK_AVATAR`),
  CONSTRAINT `FK_AVATAR` FOREIGN KEY (`FK_AVATAR`) REFERENCES `avatar` (`ID_AVATAR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_video`
--

DROP TABLE IF EXISTS `usuario_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_video` (
  `ID_REGISTRO` int NOT NULL AUTO_INCREMENT,
  `FK_ID_USUARIO` bigint DEFAULT NULL,
  `FK_ID_VIDEO` bigint DEFAULT NULL,
  `ESTADO` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID_REGISTRO`),
  KEY `FK_ID_USUARIO` (`FK_ID_USUARIO`),
  KEY `FK_ID_VIDEO` (`FK_ID_VIDEO`),
  CONSTRAINT `FK_ID_USUARIO` FOREIGN KEY (`FK_ID_USUARIO`) REFERENCES `usuario` (`ID_USUARIO`),
  CONSTRAINT `FK_ID_VIDEO` FOREIGN KEY (`FK_ID_VIDEO`) REFERENCES `video_publicado` (`ID_VIDEO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_video`
--

LOCK TABLES `usuario_video` WRITE;
/*!40000 ALTER TABLE `usuario_video` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario_video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video_publicado`
--

DROP TABLE IF EXISTS `video_publicado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `video_publicado` (
  `ID_VIDEO` bigint NOT NULL AUTO_INCREMENT,
  `TITULO_VIDEO` varchar(150) DEFAULT NULL,
  `DESCRIPCION` text,
  `TAMANO` float(6,3) DEFAULT NULL,
  `NOMBRE_ARCHIVO` varchar(200) DEFAULT NULL,
  `DURACION_VIDEO` int DEFAULT NULL,
  `IMAGEN` varchar(200) DEFAULT NULL,
  `NUMERO_REPRODUCCIONES` bigint DEFAULT NULL,
  `NUMERO_LIKES` bigint DEFAULT NULL,
  `NUMERO_DISLIKES` bigint DEFAULT NULL,
  `FECHA_HORA_POST` datetime DEFAULT NULL,
  `FK_REACCIONES` smallint DEFAULT NULL,
  `FK_USUARIO` bigint DEFAULT NULL,
  `ESTADO_VIDEO` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID_VIDEO`),
  KEY `FK_REACCIONES` (`FK_REACCIONES`),
  KEY `FK_USUARIO` (`FK_USUARIO`),
  CONSTRAINT `FK_REACCIONES` FOREIGN KEY (`FK_REACCIONES`) REFERENCES `reaccion` (`ID_REACCION`),
  CONSTRAINT `FK_USUARIO` FOREIGN KEY (`FK_USUARIO`) REFERENCES `usuario` (`ID_USUARIO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video_publicado`
--

LOCK TABLES `video_publicado` WRITE;
/*!40000 ALTER TABLE `video_publicado` DISABLE KEYS */;
/*!40000 ALTER TABLE `video_publicado` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-08-30 22:06:36
