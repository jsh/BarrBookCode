#!/usr/bin/php
<?php
/*
 * launch_ec2_lamp.php
 *
 * Launch an EC2 lamp instance, then allocate and assign it a 
 * public IP address.
 *
 * Copyright 2009-2010 Amazon.com, Inc. or its affiliates. All Rights
 * Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License"). You
 * may not use this file except in compliance with the License. A copy
 * of the License is located at
 *
 *       http://aws.amazon.com/apache2.0/
 *
 * or in the "license.txt" file accompanying this file. This file is
 * distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS
 * OF ANY KIND, either express or implied. See the License for the
 * specific language governing permissions and limitations under the
 * License.
 *
 * Modified by Jeffrey S. Haemer <jeffrey.haemer@gmail.com>
 */

error_reporting(E_ALL);

require_once('AWSSDKforPHP/sdk.class.php');

// Create the EC2 access object
$ec2 = new AmazonEC2();

// Run an instance
$options = array('KeyName' => "testkey",
		 'InstanceType' => "m1.small",
		 'Placement.AvailabilityZone' => "us-east-1a");

$res = $ec2->run_instances("ami-2cb05345", 1, 1, $options);

if (!$res->isOK())
{
  exit("Could not launch instance: "      .
       $res->body->Errors->Error->Message . "\n");
}

// Get the Id and Availability Zone of the instance
$instances        = $res->body->instancesSet;
$instanceId       = (string)$instances->item->instanceId;
$availabilityZone = (string)$instances->item->placement->availabilityZone;

print("Launched instance ${instanceId} " .
      "in availability zone ${availabilityZone}.\n");

// Wait for the instance's state to change to running
// before attaching volumes
do
{
  $options    = array('InstanceId.1' => $instanceId);
  $res       = $ec2->describe_instances($options);
  $instances = $res->body->reservationSet->item->instancesSet;
  $state     = $instances->item->instanceState->name;
  $running   = ($state == 'running');

  if (!$running)
  {
    print("Instance is currently in " .
	  "state ${state}, waiting 10 seconds\n");
    sleep(10);
  }
}
while (!$running);

// Allocate an Elastic IP address
$res = $ec2->allocate_address();
if (!$res->isOK())
{
  exit("Could not allocate public IP address.\n");
}

// Get the allocated Elastic IP address
$publicIP = (string)$res->body->publicIp;
print("Assigned IP address ${publicIP}.\n");

// Associate the Elastic IP address with the instance
$res = $ec2->associate_address($instanceId, $publicIP);
if (!$res->IsOK())
{
  exit("Could not associate IP address ${publicIP} " .
       "with instance ${instanceId}.\n");
}

print("Associated IP address ${publicIP} " .
      "with instance ${instanceId}.\n");
?>
