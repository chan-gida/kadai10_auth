<?php
//1. POSTデータ取得
$name   = $_POST['name'];
$email  = $_POST['email'];
$password_hash  = $_POST['password_hash'];
$address = $_POST['address'];
$balcony_orientation = $_POST['balcony_orientation'];

//2. DB接続します
require_once('funcs.php');
$pdo = db_conn();

//３．データ登録SQL作成
$stmt = $pdo->prepare('INSERT INTO user_data_04(name,email,password_hash,address,balcony_orientation,indate)VALUES(:name,:email,:password_hash,:address,:balcony_orientation,sysdate());');
$stmt->bindValue(':name', $name, PDO::PARAM_STR);
$stmt->bindValue(':email', $email, PDO::PARAM_STR);
$stmt->bindValue(':password_hash', $password_hash, PDO::PARAM_STR);
$stmt->bindValue(':address', $address, PDO::PARAM_STR);
$stmt->bindValue(':balcony_orientation', $balcony_orientation, PDO::PARAM_STR);
$status = $stmt->execute(); //実行

//４．データ登録処理後
if ($status == false) {
    sql_error($stmt);
} else {
    redirect('index.php');
}
