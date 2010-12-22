#!/usr/bin/php
<?php
/*
 * list_metrics.php
 *
 *  List all of the available metrics.
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

// Create the CloudWatch access object
$cw = new AmazonCloudWatch();

// Get the metrics
$res = $cw->list_metrics();
if ($res->isOK())
{
 $metrics     = $res->body->ListMetricsResult->Metrics->member;
 $metricsRows = array();

 // Build array of available metrics
  foreach ($metrics as $metric)
  {
    $metricsRows[] = 
      array('MetricName' => (string) $metric->MetricName,
      'Namespace'   => (string) $metric->Namespace,
      'Name'        => (string) $metric->Dimensions->member->Name,
      'Value'       => (string) $metric->Dimensions->member->Value);
  }

  // Sort the metrics
  usort($metricsRows, 'CmpMetrics');

  // Display a header and then the metrics
  printf("%-16s  %-20s  %-16s  %-16s\n",
   "Namespace", "Metric Name", "Name", "Value");

  printf("%-16s  %-20s  %-16s  %-16s\n",
   "=========", "============", "====", "=====");

  foreach ($metricsRows as $metricsRow)
  {
    printf("%-16s  %-20s  %-16s  %-16s\n",
     $metricsRow['Namespace'],
     $metricsRow['MetricName'],
     $metricsRow['Name'],
     $metricsRow['Value']);
  }
}
else
{
  $error = $res->body->Error->Message;
  exit("Could not list metrics: ${error}\n");
}

function CmpMetrics($m1, $m2)
{
  $k1 = $m1['Namespace'] . $m1['MetricName'] . $m1['Name'];
  $k2 = $m2['Namespace'] . $m2['MetricName'] . $m2['Name'];

  return strcmp($k1, $k2);
}

?>
