<?php
putenv('TMPDIR=/tmp/');
error_reporting(E_ALL);
ini_set('display_errors', 1);
if (isset($_FILES["upload"]) && $_FILES["upload"]["error"] === UPLOAD_ERR_OK) {
    // Set the target directory for file upload
    $target_dir = "../debs/";

    // Get the basename of the uploaded file
    $target_file = $target_dir . basename($_FILES["upload"]["name"]);

    // Move the uploaded file to the target directory
    if (move_uploaded_file($_FILES["upload"]["tmp_name"], $target_file)) {
        echo "The file ". basename( $_FILES["upload"]["name"]). " has been uploaded.";

        // Execute the update script
        $output = shell_exec('./update.sh 2>&1');
        echo "<pre>$output</pre>";
    } else {
        echo "Sorry, there was an error uploading your file.";
    }
}
?>


