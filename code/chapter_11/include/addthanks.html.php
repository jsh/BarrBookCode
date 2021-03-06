<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!--
 Copyright 2009-2010 Amazon.com, Inc. or its affiliates. All Rights
 Reserved.
 
 Licensed under the Apache License, Version 2.0 (the "License"). You
 may not use this file except in compliance with the License. A copy
 of the License is located at
 
       http://aws.amazon.com/apache2.0/
 
 or in the "license.txt" file accompanying this file. This file is
 distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS
 OF ANY KIND, either express or implied. See the License for the
 specific language governing permissions and limitations under the
 License.
-->
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
  <head>
    <title>CloudList Classified Ad System -- Add Item</title>
    <link rel="stylesheet" type="text/css" media="all" href="css/styles.css" />
  </head>
  <body>
    <h1>CloudList Classified Ad System -- Add Item</h1>
    <?php if ($success): ?>
    <p>New item accepted. Thanks!</p>
    <?php else: ?>
      <p>New item not accepted!</p>
    <?php endif ?>
    <p><a href="add_form.php">Add another...</a></p>
    <p><a href="cloudlist.php">Home</a></p>
  </body>
</html>