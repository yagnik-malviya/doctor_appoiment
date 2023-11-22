<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <title>Dashboard</title>
  <meta content="" name="description">
  <meta content="" name="keywords">
  <!-- Favicons -->
  <link href="{{asset('public/admin/img/favicon.png')}}" rel="icon">
  <link href="{{asset('public/admin/img/apple-touch-icon.png')}}" rel="apple-touch-icon">
  {{-- Google Fonts --}}
  <link href="https://fonts.gstatic.com" rel="preconnect">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
  {{-- Boostrap CSS Files --}}
  <link href="{{asset('public/admin/vendor/bootstrap/css/bootstrap.min.css')}}" rel="stylesheet">
  <link href="{{asset('public/admin/vendor/bootstrap-icons/bootstrap-icons.css')}}" rel="stylesheet">
  <link href="{{asset('public/admin/vendor/remixicon/remixicon.css')}}" rel="stylesheet">
  <link href="{{asset('public/admin/css/style.css')}}" rel="stylesheet">
  {{-- Yajra Table --}}
 <link href="{{asset('public/admin/css/bootstrap5.min.css')}}" rel="stylesheet">
</head>
<body>
    {{-- Loader --}}
    <div class="d-none" id="loader" style="width: 100vw; height: 100vh; display: flex; align-items: center; justify-content: center; position: fixed; z-index: 999;background: #0000002e">
        <div style="width: 200px; height: 200px;">
            <img src="{{asset('public/admin/img/loader.gif') }}" alt="" style="width: 100%; height: 100%;">
        </div>
    </div>
    {{-- Header --}}
    @include('admin.layout.header')
    {{-- Sidebar --}}
    @include('admin.layout.sidebar')
    {{-- Content --}}
    @yield('content')
    {{-- Footer --}}
    @include('admin.layout.footer')
    {{-- Script --}}
  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>
  {{-- Js Table --}}
  <script src="{{asset('public/admin/js/ajax.js')}}"></script>
  <script src="{{asset('public/admin/vendor/bootstrap/js/bootstrap.bundle.min.js')}}"></script>
  <script src="{{asset('public/admin/js/main.js')}}"></script>
  {{-- Yajra Table --}}
  <script src="{{asset('public/admin/js/dataTables.min.js')}}"></script>
  <script src="{{asset('public/admin/js/bootstrap5.min.js')}}"></script>
  @stack('js')
</body>
</html>
