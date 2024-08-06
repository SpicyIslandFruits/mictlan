<?php
$name = isset($_GET['name']) ? htmlspecialchars($_GET['name']) : '';
$iframeUrl = $name ? "/nbviewer/{$name}" : '';
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Notebook Viewer</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
            background-color: #f5f5f5;
            color: #333;
        }

        .container {
            width: 100%;
            max-width: 800px;
            padding: 20px;
            box-sizing: border-box;
        }

        h1 {
            text-align: center;
            color: #2c2c2c;
            margin-bottom: 30px;
        }

        form {
            display: flex;
            margin-bottom: 30px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        input[type="text"] {
            flex-grow: 1;
            padding: 12px 15px;
            font-size: 16px;
            border: 1px solid #ddd;
            border-right: none;
            outline: none;
        }

        input[type="submit"] {
            padding: 12px 20px;
            font-size: 16px;
            background-color: #2c2c2c;
            color: white;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #1a1a1a;
        }

        .iframe-container {
            width: 100%;
            height: 600px;
            border: 1px solid #ddd;
            background-color: white;
            overflow: hidden;
        }

        iframe {
            width: 100%;
            height: 100%;
            border: none;
        }
    </style>
</head>

<body>
    <div class="container">
        <h1>Notebook Viewer</h1>
        <form action="" method="get">
            <input type="text" name="name" placeholder="Enter notebook name" value="<?php echo $name; ?>" required>
            <input type="submit" value="View">
        </form>

        <?php if ($iframeUrl): ?>
            <div class="iframe-container">
                <iframe src="<?php echo $iframeUrl; ?>"></iframe>
            </div>
        <?php endif; ?>
    </div>
</body>

</html>