<?php

$password = 'tanaka';

$hashed_pw = password_hash($password, PASSWORD_DEFAULT);

echo $hashed_pw;

echo '<pre>';
var_dump(password_verify('tanaka', $hashed_pw));
echo '</pre>';
