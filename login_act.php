<?php

//最初にSESSIONを開始！！ココ大事！！
session_start();

//POST値を受け取る
$email = $_POST['email'];
$password_hash = $_POST['password_hash'];


//1.  DB接続します
require_once('funcs.php');
$pdo = db_conn();

//2. データ登録SQL作成
//gs_user_tableに、nameがあるか確認する。passはハッシュ化する
$stmt = $pdo->prepare('SELECT * FROM user_data_04 WHERE email = :email');
$stmt->bindValue(':email', $email, PDO::PARAM_STR);
$status = $stmt->execute();

//3. SQL実行時にエラーがある場合STOP
if ($status === false) {
    sql_error($stmt);
}

//4. 抽出データ数を取得
//$stmt->fetch()はデータベースのデータを取得することを意味しているので、実行しないとデータが取得できません。
$val = $stmt->fetch();

if ($val['email'] != '') {
    //Login成功時 該当レコードがあればSESSIONに値を代入
    $_SESSION['chk_ssid']  = session_id();
    header('Location: select.php');
} else {
    //Login失敗時(Logout経由)
    header('Location: login.php');
}

exit();

//if(password_verify($lpw, $val['lpw'])){ //* PasswordがHash化の場合はこっちのIFを使う
if ($val['email'] != '' && password_verify($password_hash, $val['password_hash'])) {
    //Login成功時 該当レコードがあればSESSIONに値を代入
    $_SESSION['chk_ssid']  = session_id();

    header('Location: select.php');
} else {
    //Login失敗時(Logout経由)
    header('Location: login.php');
}

exit();
