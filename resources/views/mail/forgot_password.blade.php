<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Forgot Password</title>
</head>
<body>
    <p>Dear {{$details['name']}},</p>
    <h4>Your Forgate Password Link :</h4>
    <a href="{{$details['link']}}">Click for forget Password</a>
</body>
</html>
