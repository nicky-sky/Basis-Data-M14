
[cite_start]-- secara global ke seluruh database (*.*), kecuali hak GRANT OPTION [cite: 111, 194-196].
GRANT ALL
ON *.*
TO 'user1'@'domain1.com' IDENTIFIED BY 'pw1';

[cite_start]-- Mengecek hasil penambahan user di tabel user (Scope Columns & Privilege Columns)[cite: 15, 205].
SELECT host, user, select_priv, update_priv 
FROM mysql.user 
WHERE user='user1';


[cite_start]-- Memberikan hak akses spesifik (hanya SELECT dan UPDATE) pada database 'test' saja [cite: 211-214].
GRANT SELECT, UPDATE
ON test.*
TO 'user1'@'domain1.com' IDENTIFIED BY 'pw1';

[cite_start]-- Mengecek hasil di tabel db untuk melihat hak akses level database[cite: 31, 217].
SELECT host, db, user, select_priv, update_priv 
FROM mysql.db 
WHERE user='user1';



[cite_start]-- Opsi 1: Hak akses SELECT dan UPDATE pada tataran tabel (TOKO.BUKU) [cite: 232-234].
GRANT SELECT, UPDATE
ON TOKO.BUKU
TO 'user1'@'domain1.com' IDENTIFIED BY 'pw1';

[cite_start]-- Opsi 2: Hak akses spesifik hanya pada kolom 'Judul_Buku' dan 'Copyright' [cite: 235-237].
GRANT SELECT, UPDATE (Judul_Buku, Copyright)
ON TOKO.BUKU
TO 'user1'@'domain1.com' IDENTIFIED BY 'pw1';


[cite_start]-- Menampilkan daftar hak akses (Grants) yang dimiliki user1[cite: 239, 243].
SHOW GRANTS FOR 'user1'@'domain1.com';

[cite_start]-- Mengganti password user1 menjadi 'pw3'[cite: 254, 256].
SET PASSWORD FOR 'user1'@'domain1.com' = PASSWORD('pw3');

[cite_start]-- Me-refresh tabel privileges agar perubahan segera dimuat ulang oleh server [cite: 259-260].
FLUSH PRIVILEGES;

[cite_start]-- MENCABUT (REVOKE) semua hak akses global dari user1[cite: 264, 274].
REVOKE ALL PRIVILEGES, GRANT OPTION
FROM 'user1'@'domain1.com';

[cite_start]-- MENCABUT hak akses tertentu saja (misal SELECT & UPDATE pada database test) [cite: 276-278].
REVOKE SELECT, UPDATE, GRANT OPTION
ON test.*
FROM 'user1'@'domain1.com';

[cite_start]-- MENGHAPUS akun user dari sistem selamanya[cite: 281, 285].
DROP USER 'user1'@'domain1.com';