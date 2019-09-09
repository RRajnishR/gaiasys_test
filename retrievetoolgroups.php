<?php 

    include('connection.php');

    $sql = "SELECT tg.tgid as id, tg.name as name, GROUP_CONCAT(t.name SEPARATOR ',') as tools, u.username as owner from toolgroups as tg LEFT JOIN tools as t ON t.tgroup = tg.tgid INNER JOIN users as u ON u.userid = tg.owner GROUP BY tg.name";

    $response = array();
    $response["toolgroups"] = array();
    
    $result = $conn->query($sql);
    if ($result->num_rows > 0) {
        $response["flag"] = "success";
        while($row = $result->fetch_assoc()) {
            $row['tools'] = explode(',', $row['tools']);
            array_push($response["toolgroups"], $row);
        }
    } else {
        $response["flag"] = "failure";
    }
    echo json_encode($response);

?>
