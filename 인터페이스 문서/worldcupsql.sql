-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.6.7-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- worldcupgame 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `worldcupgame` /*!40100 DEFAULT CHARACTER SET utf8mb3 */;
USE `worldcupgame`;

-- 테이블 worldcupgame.communityinfo 구조 내보내기
CREATE TABLE IF NOT EXISTS `communityinfo` (
  `communityIdx` int(11) NOT NULL COMMENT '커뮤니티 글 번호',
  `memberIdx` int(11) NOT NULL COMMENT '회원정보 테이블 - 회원번호',
  `communityTitle` varchar(30) NOT NULL COMMENT '커뮤니티 글 제목',
  `communityContents` text NOT NULL COMMENT '커뮤니티 글 내용',
  `file` varchar(30) DEFAULT NULL COMMENT '파일 경로',
  `pubDate` datetime NOT NULL COMMENT '게시 날짜',
  PRIMARY KEY (`communityIdx`),
  KEY `FK_communityinfo_memberinfo` (`memberIdx`),
  CONSTRAINT `FK_communityinfo_memberinfo` FOREIGN KEY (`memberIdx`) REFERENCES `memberinfo` (`memberIdx`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='커뮤니티 정보 테이블';

-- 테이블 데이터 worldcupgame.communityinfo:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `communityinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `communityinfo` ENABLE KEYS */;

-- 테이블 worldcupgame.gamecomment 구조 내보내기
CREATE TABLE IF NOT EXISTS `gamecomment` (
  `gameIdx` int(11) NOT NULL COMMENT '게임정보테이블 - 게임번호',
  `name` varchar(20) NOT NULL COMMENT '댓글 단 사용자 이름',
  `comment` varchar(100) NOT NULL COMMENT '댓글',
  `commentDate` datetime NOT NULL COMMENT '댓글 단 날짜',
  KEY `FK_gamecomment_gamesinfo` (`gameIdx`),
  CONSTRAINT `FK_gamecomment_gamesinfo` FOREIGN KEY (`gameIdx`) REFERENCES `gamesthumbnailinfo` (`gameIdx`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='게임 댓글 테이블\r\n게임별 사용자 댓글';

-- 테이블 데이터 worldcupgame.gamecomment:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `gamecomment` DISABLE KEYS */;
/*!40000 ALTER TABLE `gamecomment` ENABLE KEYS */;

-- 테이블 worldcupgame.gamedatainfo 구조 내보내기
CREATE TABLE IF NOT EXISTS `gamedatainfo` (
  `gameIdx` int(11) NOT NULL COMMENT '게임정보테이블',
  `elementIdx` int(11) NOT NULL AUTO_INCREMENT COMMENT '요소번호',
  `elementSelectCount` int(11) NOT NULL DEFAULT 0 COMMENT '요소선택횟수',
  `elementWinCount` int(11) NOT NULL DEFAULT 0 COMMENT '요소승리횟수',
  `elementTitle` varchar(20) NOT NULL COMMENT '요소이름',
  `elementImg` varchar(30) NOT NULL COMMENT '요소이미지경로',
  PRIMARY KEY (`elementIdx`,`gameIdx`) USING BTREE,
  KEY `FK_gameinfo_gamesinfo` (`gameIdx`),
  CONSTRAINT `FK_gameinfo_gamesinfo` FOREIGN KEY (`gameIdx`) REFERENCES `gamesthumbnailinfo` (`gameIdx`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='특정 게임 데이터 테이블';

-- 테이블 데이터 worldcupgame.gamedatainfo:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `gamedatainfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `gamedatainfo` ENABLE KEYS */;

-- 테이블 worldcupgame.gameplaydata 구조 내보내기
CREATE TABLE IF NOT EXISTS `gameplaydata` (
  `gameIdx` int(11) NOT NULL COMMENT '게임정보테이블 - 게임번호',
  `playMemberIdx` int(11) NOT NULL COMMENT '회원정보테이블 - 회원번호',
  `gameRecord` text NOT NULL COMMENT '게임기록',
  `playDate` datetime NOT NULL COMMENT '플레이 날짜',
  KEY `FK_usergamerecords_gamesinfo` (`gameIdx`),
  KEY `FK_usergamerecords_memberinfo` (`playMemberIdx`) USING BTREE,
  CONSTRAINT `FK_usergamerecords_gamesinfo` FOREIGN KEY (`gameIdx`) REFERENCES `gamesthumbnailinfo` (`gameIdx`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_usergamerecords_memberinfo` FOREIGN KEY (`playMemberIdx`) REFERENCES `memberinfo` (`memberIdx`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='게임 플레이 데이터 테이블';

-- 테이블 데이터 worldcupgame.gameplaydata:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `gameplaydata` DISABLE KEYS */;
/*!40000 ALTER TABLE `gameplaydata` ENABLE KEYS */;

-- 테이블 worldcupgame.gamesthumbnailinfo 구조 내보내기
CREATE TABLE IF NOT EXISTS `gamesthumbnailinfo` (
  `gameIdx` int(11) NOT NULL AUTO_INCREMENT COMMENT '게임번호',
  `regMemberIdx` int(11) NOT NULL COMMENT '게임등록 사용자 회원정보 ',
  `gameTitle` varchar(20) NOT NULL COMMENT '게임이름',
  `gameImg` varchar(30) NOT NULL COMMENT '게임이미지 경로',
  `regDate` datetime NOT NULL COMMENT '등록날짜',
  PRIMARY KEY (`gameIdx`) USING BTREE,
  KEY `FK_gamesinfo_memberinfo` (`regMemberIdx`),
  CONSTRAINT `FK_gamesinfo_memberinfo` FOREIGN KEY (`regMemberIdx`) REFERENCES `memberinfo` (`memberIdx`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='게임 썸네일 정보 테이블';

-- 테이블 데이터 worldcupgame.gamesthumbnailinfo:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `gamesthumbnailinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `gamesthumbnailinfo` ENABLE KEYS */;

-- 테이블 worldcupgame.memberinfo 구조 내보내기
CREATE TABLE IF NOT EXISTS `memberinfo` (
  `memberIdx` int(11) NOT NULL AUTO_INCREMENT COMMENT '회원번호',
  `Id` varchar(10) NOT NULL DEFAULT '' COMMENT '아이디',
  `password` varchar(16) NOT NULL DEFAULT '' COMMENT '비밀번호',
  `name` varchar(8) NOT NULL DEFAULT '' COMMENT '이름',
  `age` int(11) NOT NULL COMMENT '나이',
  `addr` varchar(20) NOT NULL DEFAULT '' COMMENT '주소',
  `joinDate` datetime NOT NULL COMMENT '가입일',
  PRIMARY KEY (`memberIdx`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='회원 정보 테이블';

-- 테이블 데이터 worldcupgame.memberinfo:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `memberinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `memberinfo` ENABLE KEYS */;

-- 테이블 worldcupgame.noticeinfo 구조 내보내기
CREATE TABLE IF NOT EXISTS `noticeinfo` (
  `noticeIdx` int(11) NOT NULL AUTO_INCREMENT COMMENT '공지사항번호',
  `memberIdx` int(11) NOT NULL COMMENT '회원정보테이블 - 회원번호',
  `noticeTitle` varchar(30) NOT NULL COMMENT '공지사항 제목',
  `noticeContents` text NOT NULL COMMENT '공지사항 내용',
  `file` varchar(30) DEFAULT NULL COMMENT '파일 경로',
  `pubDate` datetime NOT NULL COMMENT '게시 날짜',
  PRIMARY KEY (`noticeIdx`),
  KEY `FK_noticeinfo_memberinfo` (`memberIdx`),
  CONSTRAINT `FK_noticeinfo_memberinfo` FOREIGN KEY (`memberIdx`) REFERENCES `memberinfo` (`memberIdx`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='공지사항 정보 테이블';

-- 테이블 데이터 worldcupgame.noticeinfo:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `noticeinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `noticeinfo` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
