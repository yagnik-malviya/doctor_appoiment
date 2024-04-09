<?php

use App\Http\Controllers\doctor\AppoimentController;
use App\Http\Controllers\doctor\AuthController;
use App\Http\Controllers\doctor\DashboardController;
use App\Http\Controllers\doctor\PatientController;
use App\Http\Controllers\doctor\PrescriptionController;
use Illuminate\Support\Facades\Route;


Route::group(['namespace' => 'doctor', 'as' => 'doctor.'], function () {


    Route::match(['get','post'],'login',[AuthController::class,'login'])->name('login');

    Route::match(['get','post'],'forgot_password',[AuthController::class,'forgot_password'])->name('forgot_password');
    Route::match(['get','post'],'reset_password',[AuthController::class,'reset_password'])->name('reset_password');


    Route::middleware(['preventBackHistory','doctor'])->group(function (){
        Route::match(['get','post'],'profile',[AuthController::class,'profile'])->name('profile');
        Route::get('/logout', [AuthController::class, 'logout'])->name('logout');

        Route::get('/', [DashboardController::class, 'dashboard'])->name('dashboard');
        Route::get('test', [DashboardController::class, 'test'])->name('test');

        Route::group(['namespace' => 'patient', 'prefix' => 'patient', 'as' => 'patient.'], function () {
            Route::match(['get', 'post'], 'list', [PatientController::class, 'list'])->name('list');
            Route::match(['get', 'post'], 'add', [PatientController::class, 'add'])->name('add');
            Route::match(['get', 'post'], 'edit/{id}', [PatientController::class, 'edit'])->name('edit');
            Route::match(['get', 'post'], 'delete/{id}', [PatientController::class, 'delete'])->name('delete');
        });

        Route::group(['namespace' => 'appointment', 'prefix' => 'appointment', 'as' => 'appoiment.'], function () {
            Route::match(['get', 'post'], 'list', [AppoimentController::class, 'list'])->name('list');
            Route::match(['get', 'post'], 'add', [AppoimentController::class, 'add'])->name('add');
            Route::match(['get', 'post'], 'edit/{id}', [AppoimentController::class, 'edit'])->name('edit');
            Route::match(['get', 'post'], 'delete/{id}', [AppoimentController::class, 'delete'])->name('delete');
            Route::match(['get', 'post'], 'changestatus', [AppoimentController::class, 'changestatus'])->name('changestatus');
        });

        Route::group(['namespace' => 'prescription', 'prefix' => 'prescription', 'as' => 'prescription.'], function () {
            Route::match(['get', 'post'], 'add', [PrescriptionController::class, 'add'])->name('add');
        });
    });


});
