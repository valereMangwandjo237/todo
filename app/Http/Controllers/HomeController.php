<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        $user = Auth::user();
        
        if($user){
            $todos = $user->todos()->get();
            return view('home', compact("todos"));
        }
        abort(502);
    }

    public function undone()
    {
        $user = Auth::user();
        
        if($user){
            $todos = $user->todos()->where('is_do', 0)->get();
            return view('home', compact("todos"));
        }
        abort(502);
    
    }

    public function done()
    {
        $user = Auth::user();
        
        if($user){
            $todos = $user->todos()->where('is_do', 1)->get();
            return view('home', compact("todos"));
        }
        abort(502);
    
    }
}
