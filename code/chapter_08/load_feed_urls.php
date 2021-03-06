#!/usr/bin/php
<?php
/*
 * load_feed_urls.php
 *
 * Load the given URLs into the FEED_QUEUE. URLs can
 * be listed on the command line or specified via
 * -f and a file name.
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
require_once('include/book.inc.php');

// Create the feed queue, if necessary, and grab its URL
$sqs = new AmazonSQS();
$res = $sqs->create_queue(FEED_QUEUE);
if ($res->isOK())
{
  $feedQueueUrl = urlFromQueueObject($res);
}

// Make sure that at least one argument was given
if ($argc < 2)
{
  exit('Usage: ' . $argv[0] . " [URL] [-f FILE] ...\n");
}

// Create the SQS access object
$sqs = new AmazonSQS();

// Process each argument

for ($i = 1; $i < $argc; $i++)
{
  if ($argv[$i] == '-f')
  {
    $urls = file($argv[++$i]);

    foreach ($urls as $url)
    {
      loadURL($sqs, $feedQueueUrl, trim($url));
    }
  }
  else
  {
    loadURL($sqs, $feedQueueUrl, $argv[$i]);
  }
}

function loadURL($sqs, $queue, $url)
{
  // Create message
  $message  = json_encode(array('FeedURL' => $url));

  // Post message
  $res = $sqs->send_message($queue, $message);

  if ($res->isOK())
  {
    print("Posted '${message}' to queue '${queue}'\n");
  }
  else
  {
    $error = $res->body->Error->Message;
    print("Could not post message to queue: ${error}\n");
  }
}

?>
