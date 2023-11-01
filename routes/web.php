<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return view('main');
});


Route::prefix('/superadmin')->group(base_path('routes/admin.php'));
Route::prefix('/patient')->group(base_path('routes/patient.php'));
Route::prefix('/doctor')->group(base_path('routes/doctor.php'));

// Route::fallback(function () {
//     return redirect()->route('home');
// });
