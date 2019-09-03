<?php
/**
 * Created by PhpStorm.
 * User: roshanrijal
 * Date: 2019-09-03
 * Time: 07:22
 */

$con=mysqli_connect("localhost","root","root", "apiexample", 8088) or die('{"success":false,"message":"Database Error"}');
$action = $_POST['action'];
switch ($action){
    case "register":
        //todo : insert user
        $username = $_POST['username'];
        $password = $_POST['password'];
        $sql = "INSERT INTO user(username, password) value ('".$username."', '".$password."')";
        $res = mysqli_query($con, $sql);
        $response['success'] = $res;
        $response['username'] = $username;
        echo json_encode($response);
        break;
    case "login":
        $username = $_POST['username'];
        $password = $_POST['password'];
        $sql = "SELECT * From user where username='$username' and password='$password'";
        $res = mysqli_query($con, $sql);
        $response = array();
        $response["success"]  = false;
        $re = array();
        while ($row = mysqli_fetch_assoc($res)){
            $response["success"] = true;
            $response["user"] = $row["username"];
            array_push($re, $row);
        }
        echo json_encode($response);




}