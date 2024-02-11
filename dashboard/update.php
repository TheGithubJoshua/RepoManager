<?php
var_dump(shell_exec('whoami'));die;
$output = shell_exec('./update.sh 2>&1');
echo "<pre>$output</pre>";
?>

