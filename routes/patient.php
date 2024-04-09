<?php

use App\Http\Controllers\patient\AppoimentController;
use App\Http\Controllers\patient\AuthController;
use App\Http\Controllers\patient\DashboardController;
use App\Http\Controllers\patient\PrescriptionController;
use Illuminate\Support\Facades\Route;


Route::group(['namespace' => 'patient', 'as' => 'patient.'], function () {


    Route::match(['get', 'post'], 'login', [AuthController::class, 'login'])->name('login');
    Route::match(['get', 'post'], 'register', [AuthController::class, 'register'])->name('register');

    Route::match(['get', 'post'], 'forgot_password', [AuthController::class, 'forgot_password'])->name('forgot_password');
    Route::match(['get', 'post'], 'reset_password', [AuthController::class, 'reset_password'])->name('reset_password');

    Route::middleware(['preventBackHistory','patient'])->group(function (){
        Route::match(['get', 'post'], 'profile', [AuthController::class, 'profile'])->name('profile');
        Route::get('/logout', [AuthController::class, 'logout'])->name('logout');

        Route::get('/', [DashboardController::class, 'dashboard'])->name('dashboard');

        Route::group(['namespace' => 'appointment', 'prefix' => 'appointment', 'as' => 'appoiment.'], function () {
            Route::match(['get', 'post'], 'list', [AppoimentController::class, 'list'])->name('list');
            Route::match(['get', 'post'], 'add', [AppoimentController::class, 'add'])->name('add');
            Route::match(['get', 'post'], 'edit/{id}', [AppoimentController::class, 'edit'])->name('edit');
            Route::match(['get', 'post'], 'delete/{id}', [AppoimentController::class, 'delete'])->name('delete');
            Route::match(['get', 'post'], 'changestatus', [AppoimentController::class, 'changestatus'])->name('changestatus');
            Route::match(['get', 'post'], 'change_category', [AppoimentController::class, 'change_category'])->name('change_category');
        });

        Route::group(['namespace' => 'prescription', 'prefix' => 'prescription', 'as' => 'prescription.'], function () {
            Route::match(['get', 'post'], 'add', [PrescriptionController::class, 'add'])->name('add');
        });

    });
});
