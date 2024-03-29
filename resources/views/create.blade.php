@extends('layouts.app')

@section('content')
<div class="container">

    @include('include.nav')
    <form action="{{route('todos.store')}}" method="POST">
        @csrf

        <div class="mb-3">
            <label for="title" class="form-label">Titre</label>
            <input type="text" class="form-control @error('title') is-invalid @enderror" 
                    name="title" id="title" required placeholder="Entrer un titre"
                    value="{{old('title')}}">
            @error('title')
                <span class="danger">{{ $message }}</span>
            @enderror
        </div>
        <div class="mb-3">
            <label for="description" class="form-label">description</label>
            <textarea class="form-control @error('description') is-invalid @enderror" id="description" name="description" rows="3" required>{{old('description')}}</textarea>
            @error('description')
                <span class="danger">{{ $message }}</span>
            @enderror
        </div>
        
        <span class="m-7 danger">Tous les champs sont obligatoires !</span>

        <div class="col-12">
            <button type="submit" class="btn btn-primary">Créer</button>
            <a href="{{route('index')}}" class="btn btn-dark">Acceuil</a>
        </div>
    </form>
    
</div>
@endsection