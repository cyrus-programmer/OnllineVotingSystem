<?php

class DBServices
{
    public
    function getPartyDetails($conn)
    {
        try {
            $query = "SELECT party_id, party_name,leader_name, win_status  FROM party";
            $sql = $conn->query($query);
            $count = $sql->rowCount();
            $result = $sql->fetchAll(PDO::FETCH_OBJ);
            if ($count > 0) {
                $response = $result;
                header('Content-Type: application/json');
                echo json_encode($response);
            }
        } catch (Exception $e) {
            header('Content-Type: application/json');
            echo json_encode($e);
        }
    }

    function loginCheck($conn, $cnic, $password)
    {
        try {
            $query = "SELECT * FROM login WHERE identity_number = ?";
            $sql = $conn->prepare($query);
            $sql->execute([$cnic]);
            $count = $sql->rowCount();
            $result = $sql->fetch(PDO::FETCH_ASSOC);
            if ($count == 1) {
                if ($cnic == $result["identity_number"] && $password == $result["password"]) {
                    $response["success"] = true;
                    $response["cnic"] = $result["identity_number"];
                    $response["type"] = $result["type"];
                    header('Content-Type: application/json');
                    echo json_encode($response);
                }
            }
        } catch (Exception $e) {
            header('Content-Type: application/json');
            echo json_encode($e);
        }
    }
    function vote($conn, $cnic, $party_id)
    {
        try {
            $query = "SELECT district_id FROM voter WHERE identity_number = ?";
            $sql = $conn->prepare($query);
            $sql->execute([$cnic]);
            $count = $sql->rowCount();
            $result = $sql->fetch(PDO::FETCH_ASSOC);
            if ($count == 1) {
                $query = "UPDATE party_member SET no_of_votes = no_of_votes+1 WHERE district_id = ? AND party_id = ?";
                $sql = $conn->prepare($query);
                $sql->execute([$result["district_id"], $party_id]);
                $query = "UPDATE voter SET vote_status = 1 WHERE identity_number = ?";
                $sql = $conn->prepare($query);
                $sql->execute([$cnic]);
                $response["Message"] = "Voted Successfully";
                header('Content-Type: application/json');
            echo json_encode($response);
            }
        } catch (Exception $e) {
            header('Content-Type: application/json');
            echo json_encode($e);
        }
    }
    function register($conn, $cnic, $password)
    {
        try {
            $query = "SELECT * FROM voter WHERE identity_number = ?";
            $sql = $conn->prepare($query);
            $sql->execute([$cnic]);
            $count = $sql->rowCount();
            $result = $sql->fetch(PDO::FETCH_ASSOC);
            if($count==1){
            $query = "INSERT INTO login(identity_number, password, type) VALUES (?,?,?)";
            $sql = $conn->prepare($query);
            $sql->execute([$cnic, $password, "voter"]);
            $response["Success"] = true;
            $response["Message"] = "Successfully Registered";
            header('Content-Type: application/json');
            echo json_encode($response);
            }
        } catch (Exception $e) {
            //throw $th;
            $response["Message"] = $e;
            header('Content-Type: application/json');
            echo json_encode($response);
        }
    }
    function getPersonDetails($conn, $cnic){
        try {
            $query = "SELECT Name, identity_number,vote_status, district_name  FROM voter JOIN district using (district_id) where identity_number = ?";
            $sql = $conn->prepare($query);
            $sql->execute([$cnic]);
            $count = $sql->rowCount();
            $result = $sql->fetchAll(PDO::FETCH_OBJ);
            if ($count == 1) {
                $response = $result;
                header('Content-Type: application/json');
                echo json_encode($response);
            }
        } catch (Exception $e) {
            header('Content-Type: application/json');
            echo json_encode($e);
        }
    }
    function calculateMNA($conn, $district_id){
        try {
            $query = "select Name, party_id as winner from party_member as p, voter as v where p.voter_id = v.voter_id AND p.district_id = ? order by no_of_votes Desc Limit 1";
            $sql = $conn->prepare($query);
            $sql->execute([$district_id]);
            $result = $sql->fetch();
            header('Content-Type: application/json');
            echo json_encode($result);
        } catch (Exception $e) {
            //throw $th;
            header('Content-Type: application/json');
            echo json_encode($e);
        }
    }
    function calculateLeadingParty($conn, $province_id){
        try {
            $query = "select party_name from provinceresult as p, party as pt where p.party_id = pt.party_id AND p.province_id = ? order by no_of_votes Desc Limit 1";
            $sql = $conn->prepare($query);
            $sql->execute([$province_id]);
            $result = $sql->fetch();
            header('Content-Type: application/json');
            echo json_encode($result["party_name"]);
        } catch (Exception $e) {
            //throw $th;
            header('Content-Type: application/json');
            echo json_encode($e);
        }
    }
    function addPartyLead($conn, $province_id, $party){
        try {
            $query2 = "update province set leadingparty = ? where province_id = ?";
            $sql3 = $conn->prepare($query2);
            $sql3->execute([$province_id]);
        } catch (Exception $e) {
            //throw $th;
            header('Content-Type: application/json');
            echo json_encode($e);
        }
    }
    function calculateDistricts($conn){
        try {
            $query = "select district_id from district";
            $sql = $conn->query($query);
            $count = $sql->rowCount();
            $result = $sql->fetchAll(PDO::FETCH_OBJ);
            $response = $result;
            $response["count"] = $count;
            header('Content-Type: application/json');
            echo json_encode($response);
        } catch (Exception $e) {
            //throw $th;
            header('Content-Type: application/json');
            echo json_encode($e);
        }
    }
    function calculateLeader($conn){
            try {
                $query = "select party_name as winner from party order by no_of_seats Desc Limit 1";
                $sql = $conn->query($query);
                $result = $sql->fetch();
                header('Content-Type: application/json');
                echo json_encode($result["winner"]);
            } catch (Exception $e) {
                //throw $th;
                header('Content-Type: application/json');
                echo json_encode($e);
            }
        
    }
    function calculateProvinces($conn){
        try {
            $query = "select province_id from province";
            $sql = $conn->query($query);
            $count = $sql->rowCount();
            $result = $sql->fetchAll(PDO::FETCH_OBJ);
            $response = $result;
            $response["count"] = $count;
            header('Content-Type: application/json');
            echo json_encode($response);
        } catch (Exception $e) {
            //throw $th;
            header('Content-Type: application/json');
            echo json_encode($e);
        }
    }
    function addMNA($conn, $party_id, $district_id, $mna){
        try {
            $query2 = "update district set mna = ? where district_id = ?";
            $query = "update party set no_of_seats = no_of_seats+1 where party_id = ?";
            $query3 = "select province_id from district where district_id = ?";
            $sql3 = $conn->prepare($query2);
            $sql3->execute([$district_id]);
            $result=$sql3->fetch();
            $province_id = $result["province_id"];
            $query4 = "update provinceResult set no_of_seats = no_of_seats+1 where province_id = ? AND party_id = ?";
            $sql4 = $conn->prepare($query4);
            $sql4->execute([$province_id,$party_id]);
            $sql = $conn->prepare($query);
            $sql->execute([$party_id]);
            $sql2 = $conn->prepare($query2);
            $sql2->execute([$mna, $district_id]);
        } catch (Exception $e) {
            //throw $th;
            header('Content-Type: application/json');
            echo json_encode($e);
        }
    }
    function checkResult($conn){
        try {
            $query = "select count(voter_id) as voter from voter";
            $query2 = " select count(vote_status) as votes from voter where vote_status = 1";
            $sql = $conn->query($query);
            $sql1 = $conn->query($query2);
            $result1= $sql->fetch();
            $result2 = $sql1->fetch();
            $voters = $result1['voter'];
            $votes = $result2['votes'];
            if ($voters==$votes){
                $response["Result"] = true;
            } else{
                $response["Result"] = false;
            }
            header('Content-Type: application/json');
            echo json_encode($response);
        } catch (Exception $e) {
            header('Content-Type: application/json');
            echo json_encode($e);
        }
    }
}
