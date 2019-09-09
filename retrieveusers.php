<?php 

    include('connection.php');

    $sql = "SELECT u.username, u.password, GROUP_CONCAT(tg.name SEPARATOR ',') as toolgroups FROM users as u LEFT JOIN toolgroups tg ON u.userid = tg.owner GROUP BY u.username";

    $response = array();
    $response["users"] = array();
    
    $result = $conn->query($sql);
    if ($result->num_rows > 0) {
        $response["flag"] = "success";
        while($row = $result->fetch_assoc()) {
            $row['toolgroups'] = explode(',', $row['toolgroups']);
            array_push($response["users"], $row);
        }
    } else {
        $response["flag"] = "failure";
    }
    echo json_encode($response);

?>
