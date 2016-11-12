--liquibase formatted sql
--changeset jackelynoliveira:usuario-load-dml
INSERT INTO USUARIO(USERNAME, PASSWORD, VERSION) VALUES('usr', '123', 1);