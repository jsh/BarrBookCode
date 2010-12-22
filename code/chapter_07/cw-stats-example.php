#!/usr/bin/php
# This is pulled right out of the on-line documentation
#   http://docs.amazonwebservices.com/AWSSDKforPHP/latest/#m=AmazonCloudWatch/get_metric_statistics
#
<?php

error_reporting(E_ALL);

require_once('AWSSDKforPHP/sdk.class.php');

// Get metrics
$cw = new AmazonCloudWatch();

$opt = array();

$response = $cw->get_metric_statistics('AWS/EC2', 'CPUUtilization', '17 December 2010', '20 December 2010', 1800, 'Average', 'Percent');

// Success?
var_dump($response->isOK());

print_r($response);

?>
