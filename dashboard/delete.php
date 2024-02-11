<?php
    // The directory where files are located
    $dir = "../debs/"; // Ensure this directory exists

    if(isset($_POST['fileToDelete'])) {
        $fileToDelete = $dir . basename($_POST['fileToDelete']);

        // Security check to ensure the file exists in the specified directory and is not traversing directories
        if(file_exists($fileToDelete) && is_file($fileToDelete)) {
            // Attempt to delete the file
            if(unlink($fileToDelete)) {
                echo "File successfully deleted.";
            } else {
                echo "Error deleting the file.";
            }
        } else {
            echo "Error: File does not exist.";
        }
    } else {
        echo "No file selected to delete.";
    }
?>