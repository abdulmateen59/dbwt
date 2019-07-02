<?php

include 'vendor/autoload.php';


const HOST = 'db'; // the IP of the database
const DBNAME = 'web_project'; // the database name to be used
const USERNAME = 'user'; // the username to be used with the database
const PASSWORD = 'test'; // the password to be used with the username

ini_set('display_errors', '1');

try {
    $database = SimplePDO::getInstance();
    $database->query("SELECT * FROM `rss_sources`");
	$result = $database->resultSet();
	foreach ($result as $key => $value) {
		$source_id = $value['id'];
		$news_data = get_feeds_xml($value['link']);
		foreach ($news_data->channel->item as $value) {
			$feedData = array( 'source_id' => $source_id, 
				'title' => $value->title, 
				'desc' => $value->description, 
				'link' => $value->link, 
				'pub_date' => date("Y-m-d H:i:s",strtotime($value->pubDate)), 
				'updated_date' => date("Y-m-d H:i:s"), 
				'status' => 1
			);

			$results = select_feed($database,$value->link);
			if (count($results) > 1){
				echo "data exists need update";
				update_feed($database,$feedData);
			}else{
				insert_feed($database,$feedData);
			}
			
			echo "<br> Data Updated <br>";
		}
	}
	
} catch( PDOException $e ) {
	print($e);
    //Do whatever you'd like with the error here
}


function get_feeds_xml($link){
	$xmlData = file_get_contents($link);
	$xml=simplexml_load_string($xmlData);
	return $xml;
}

function select_feed($database,$link){
	$database->query("SELECT * FROM `rss_feeds` WHERE link = :link");
	$database->bind(':link', $link);
	return $database->single();
}

function insert_feed($database,$data){
	$database->query("INSERT INTO `rss_feeds` (`source_id`, `title`, `description`, `link`, `pub_date`, `updated_date`, `status`) VALUES (:source_id, :title, :desc, :link, :pub_date, :updated_date, :status)");
	$database->bind(':source_id', $data['source_id']);
	$database->bind(':title', $data['title']);
	$database->bind(':desc', $data['desc']);
	$database->bind(':link', $data['link']);
	$database->bind(':pub_date', $data['pub_date']);
	$database->bind(':updated_date', $data['updated_date']);
	$database->bind(':status', $data['status']);
	$database->execute();
}

function update_feed($database,$data){
	$database->query("UPDATE `rss_feeds` SET `source_id` = :source_id, `title` = :title, `description` = :desc, `pub_date` = :pub_date, `updated_date` = :updated_date, `status` = :status WHERE `link` = :link");
	$database->bind(':source_id', $data['source_id']);
	$database->bind(':title', $data['title']);
	$database->bind(':desc', $data['desc']);
	$database->bind(':link', $data['link']);
	$database->bind(':pub_date', $data['pub_date']);
	$database->bind(':updated_date', $data['updated_date']);
	$database->bind(':status', $data['status']);
	$database->execute();
}
?>