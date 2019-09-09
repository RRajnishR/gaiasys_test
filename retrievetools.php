<?php 

    include('connection.php');
    $sql = "SELECT t.toolid as id, t.name, t.purchase_date, t.cost_price, tg.name as toolgroup FROM tools as t INNER JOIN toolgroups as tg ON t.tgroup = tg.tgid";
    $response = array();
    $response["tools"] = array();
    $result = $conn->query($sql);
    if ($result->num_rows > 0) {
        $response["flag"] = "success";
        while($row = $result->fetch_assoc()) {
            array_push($response["tools"], $row);
        }
    } else {
        $response["flag"] = "failure";
    }
    echo json_encode($response);

?>
