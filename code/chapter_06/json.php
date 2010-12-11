#!/usr/bin/php
<?php
// example json code from Barr, Chapter 6

$values = array(1, "one",
  array(1, 2, 3),
  array(1, 2, array('a' => 'Uno', 'b' => 'Dos'))
);

print("Array encodes to this:\n");
print("\t" . json_encode($values) . "\n");

$encoded = json_encode($values);
$decoded = json_decode($encoded, true);

print("Encoded array decodes to this:\n");
print("\t" . '$decoded[1]: ');
print($decoded[1] . "\n");
print("\t" . '$decoded[3][2][\'a\']: ');
print($decoded[3][2]['a'] . "\n");

?>
