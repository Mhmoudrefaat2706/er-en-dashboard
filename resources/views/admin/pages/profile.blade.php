@extends('admin.pages.app')

@section('content')
<div class="container py-5">
    <h2>الملف الشخصي للمشرف</h2>

    @if(session('success'))
        <div class="alert alert-success">{{ session('success') }}</div>
    @endif

   <form action="{{ route('admin.profile.update') }}" method="POST">
    @csrf
    @method('PUT')

        <div class="mb-3">
            <label for="name" class="form-label">الاسم</label>
            <input type="text" name="name" id="name"
                   class="form-control"
                   value="{{ old('name', $admin->name) }}">
            @error('name')<div class="text-danger">{{ $message }}</div>@enderror
        </div>

        <div class="mb-3">
            <label for="email" class="form-label">البريد الإلكتروني</label>
            <input type="email" name="email" id="email"
                   class="form-control" style="text-align: right; direction: rtl;"
                   value="{{ $admin->email }}" readonly>
        </div>


        <div class="mb-3">
            <label for="password" class="form-label">كلمة المرور الجديدة (اختياري)</label>
            <input type="password" name="password" id="password" class="form-control">
            @error('password')<div class="text-danger">{{ $message }}</div>@enderror
        </div>


        <div class="mb-3">
            <label for="password_confirmation" class="form-label">تأكيد كلمة المرور</label>
            <input type="password" name="password_confirmation" id="password_confirmation" class="form-control">
        </div>

    <button type="submit" class="btn btn-primary">تحديث الملف الشخصي</button>
    </form>
</div>
@endsection
