<div class="container text-center">
    <div class="row justify-content-center">
        <div class="col-auto">
            <a href="{{route('index')}}" class="btn btn-success">Acceuil</a>
        </div>
        <div class="col-auto">
            <a href="{{route('index')}}"  class="btn btn-{{isRouteActive('index', 'secondary')}}">Toutes les Taches</a>
        </div>
        <div class="col-auto">
            <a href="{{route('todos.create')}}" class="btn btn-{{isRouteActive('todos.create', 'primary')}}">+Creer une tache</a>
        </div>
        <div class="col-auto">
            <a href="{{route('todos.undone')}}"  class="btn btn-{{isRouteActive('todos.undone', 'warning')}}">En cours</a>
        </div>
        <div class="col-auto">
            <a href="{{route('todos.done')}}" class="btn btn-{{isRouteActive('todos.done', 'dark')}}">Terminées</a>
        </div>
    </div>
</div>