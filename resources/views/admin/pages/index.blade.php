@extends("admin.pages.app")

@section("title", __("Dashboard"))

@section("content")
    <div class="container py-5" >
        <h2 class="mb-4">{{ __("Dashboard") }}</h2>
        <div class="row g-4">

            <div class="col-md-3">
                <a href="{{ route("admin.users.index") }}">
                    <div class="card p-4 text-center shadow-sm">
                        <h6 class="text-muted">{{ __("Users Count") }}</h6>
                        <h2 class="text-primary">{{ $usersCount }}</h2>
                    </div>
                </a>
            </div>

            <div class="col-md-3">
                <a href="{{ route("admin.admins.index") }}">
                    <div class="card p-4 text-center shadow-sm">
                        <h6 class="text-muted">{{ __("Admins Count") }}</h6>
                        <h2 class="text-success">{{ $adminsCount }}</h2>
                    </div>
                </a>
            </div>

        </div>
    </div>





@endsection
