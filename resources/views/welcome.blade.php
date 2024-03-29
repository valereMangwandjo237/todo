
@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        @include('include.nav')
        <div class="text-center m-5">
            <p>
                Cette application permet la gestion des todolists.<br>
                Pour cela, vous devez vous <a href="{{route('login')}}">connectez</a> pour gerer vos taches
            </p>
        </div>
    </div>
</div>
@endsection
