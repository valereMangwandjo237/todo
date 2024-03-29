@extends('layouts.app')

@section('content')
<div class="container">

    @include('include.nav')
    <form action="{{route('todos.update', $todo)}}" method="POST">
        @csrf
        @method("PUT")

        <div class="mb-3">
            <label for="title" class="form-label">Titre</label>
            <input type="text" required class="form-control @error('title') is-invalid @enderror" name="title" id="title" value="{{$todo->title}}">
            @error('title')
                <span class="danger">{{ $message }}</span>
            @enderror
        </div>
        <div class="mb-3">
            <label for="description" class="form-label">description</label>
            <textarea required class="form-control @error('description') is-invalid @enderror" id="description" name="description" rows="3">{{$todo->description}}</textarea>
            @error('description')
                <span class="danger">{{ $message }}</span>
            @enderror
        </div>
        <div class="col-12">
            <div class="form-check">
              <input class="form-check-input" type="checkbox" id="is_do" name="is_do" {{ $todo->is_do ? 'checked' : '' }}>
              <label class="form-check-label" for="is_do">
                Terminée
              </label>
            </div>
        </div>
        <div class="col-12">
            <button type="submit" class="btn btn-success">Editer</button>
            <a href="{{route('index')}}" class="btn btn-dark">Acceuil</a>
        </div>
    </form>
    
</div>
@endsection