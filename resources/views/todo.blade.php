
@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        @include('include.nav')
        <div class="card m-4" style="width: 80%;">
            <div class="card-body">
            <h4 class="card-title">
                {{$todo->title}}
                @if ($todo->is_do)
                    <span class="badge bg-primary text-dark">Terminé</span>
                @else
                    <span class="badge bg-warning text-dark">Non terminé</span>
                @endif
            </h4>
            <h6 class="card-subtitle mb-2 text-muted">{{$todo->created_at->diffForHumans()}}</h6>
            <p class="card-text">
                {{$todo->description}}
            </p>
            <div class="row">
                <div class="col-auto">
                    <a href="{{ route('todos.edit', $todo) }}" class="btn btn-success">Editer</a>
                </div>
                <div class="col-auto">
                    <form action="{{ route('todos.destroy', $todo) }}" method="post" id="deleteForm">
                        @csrf
                        @method('DELETE')
                        <button type="submit" class="btn btn-danger" onclick="return confirm('Êtes-vous sûr de vouloir supprimer cette tache ?');">Supprimer</button>
                    </form>
                </div>
            </div>
            
            </div>
        </div>
    </div>
</div>
@endsection
