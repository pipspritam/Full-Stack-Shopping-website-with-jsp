<!DOCTYPE html>
<html lang="en">

<head>
    <link rel="stylesheet" href="../css/up.css">
    <title>Photo Upload</title>
</head>

<body>
    <form class="container" method="post" action="fileUpload.jsp" enctype="multipart/form-data">
        <h2>Product has been Added</h2>
        <div class="input-box">Select A File To Upload :<input type="file" name="uploadfile"></div>
        <div class="btn-div">
            <input class="btn" type="submit" name="Submit" value="Upload">
            <input class="btn" type="reset" value="Cancel" name="Reset">
        </div>

    </form>
</body>

</html>