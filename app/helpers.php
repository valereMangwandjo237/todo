<?php

use Illuminate\Support\Facades\Route;

if (!function_exists('isRouteActive')) {
    function isRouteActive($routeName, $class)
    {
        return Route::currentRouteName() === $routeName ? 'light' : $class;
    }
}