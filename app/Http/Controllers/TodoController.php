<?php

namespace App\Http\Controllers;

use App\Http\Requests\TodoRequest;
use App\Models\Todo;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class TodoController extends Controller
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
     * Display a listing of the resource.
     */
    public function index()
    {
        return redirect()->route('index');
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view("create");
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(TodoRequest $request)
    {
        $request->validated();

        Todo::create([
            'title' => $request->title,
            'description' => $request->description,
            'user_id' => Auth::user()->id
        ]);

        session()->flash('status', '#Tache crée avec succèss!');

        return redirect()->route('index');
    }

    /**
     * Display the specified resource.
     */
    public function show(Todo $todo)
    {
        return view("todo", compact("todo"));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Todo $todo)
    {
        return view("edit", compact("todo"));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(TodoRequest $request, Todo $todo)
    {
        $request->validated();
        
        $todo->title = $request["title"];
        $todo->description = $request["description"];

        $todo->is_do = isset($request["is_do"]) ? 1 : 0;

        if($todo->is_do == 1){
            $todo->updated_at = Carbon::now();
        }

        $todo->save();

        session()->flash('status', '#Tache modifiée avec succèss!');

        return redirect()->route('index');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Todo $todo)
    {
        $todo->delete();

        session()->flash('status', '#Tache supprimé avec succèss!');

        return redirect()->route('index');
    }
}
