<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::get('/delay/{seconds}', function (Request $request, $seconds) {
    $out = new \Symfony\Component\Console\Output\ConsoleOutput();
    $out->writeln("Delay $seconds seconds");
    sleep(intval($seconds));
    $out->writeln("Delay finished");
    return "Delay $seconds seconds";
});
