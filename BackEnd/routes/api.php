<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\api\CategoryController as CategoryIndex;
use App\Http\Controllers\api\MovieController as MovieIndex;
use App\Http\Controllers\api\NotificationController as NotificationIndex;
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::get('/categories', [CategoryIndex::class, 'index']);
Route::get('/category/{categoryId}', [CategoryIndex::class, 'detail']);
Route::get('/movies',[MovieIndex::class, 'index']);
Route::get('/home',[MovieIndex::class, 'home']);
Route::get('/movie/{movieId}',[MovieIndex::class, 'detail']);
Route::get('/notifications', [NotificationIndex::class, 'index']);
