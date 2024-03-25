<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Akash</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css" integrity="sha256-mmgLkCYLUQbXn0B1SRqzHar6dCnv9oZFPEC1g1cwlkk=" crossorigin="anonymous" />
    <style>
        .main_section{
            width: 100vw;
            height: 100vh;
            background: #0000006b;
            z-index: 1;
            overflow: hidden;
        }
        .bg-overlay{
            background: #0000006b;
        }

        .card{
            box-shadow: 0 0 13px -1px #fff;
        }
        a{
            text-decoration: none;
        }

    </style>
</head>
<body>
    <img src="{{asset('public/image/backgroung.jpg')}}" alt="" class="position-absolute w-100 h-100 z-0">
    <div class="main_section border border-dark d-flex justify-content-center align-items-center position-relative">
        <div class="position-relative d-lg-flex z-1">

            <a href="{{route('admin.dashboard')}}" class="card mx-lg-3 my-lg-0 my-3 bg-light position-relative overflow-hidden border-0">
                <img src="{{asset('public/image/backgroung.jpg')}}" alt="" class="position-absolute w-100 h-100 z-0">
                <div class="position-relative z-1 p-5 bg-overlay text-light">
                    <h3 class="mb-4">Super Admin <i class="fa fa-user mx-4" ></i></h3>
                    <button class="btn btn-light w-100">Super Admin</button>
                </div>
            </a>

            <a href="{{route('doctor.dashboard')}}" class="card mx-lg-3 my-lg-0 my-3 bg-light position-relative overflow-hidden border-0">
                <img src="{{asset('public/image/backgroung.jpg')}}" alt="" class="position-absolute w-100 h-100 z-0">
                <div class="position-relative z-1 p-5 bg-overlay text-light">
                    <h3 class="mb-4">Doctor <i class="fa fa-user mx-4" ></i></h3>
                    <button class="btn btn-light w-100">Doctor</button>
                </div>
            </a>

            <a  href="{{route('patient.dashboard')}}" class="card mx-lg-3 my-lg-0 my-3 bg-light position-relative overflow-hidden border-0">
                <img src="{{asset('public/image/backgroung.jpg')}}" alt="" class="position-absolute w-100 h-100 z-0">
                <div class="position-relative z-1 p-5 bg-overlay text-light">
                    <h3 class="mb-4">Patient <i class="fa fa-user mx-4" ></i></h3>
                    <button class="btn btn-light w-100">Patient</button>
                </div>
            </a>


        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
</body>
</html>
