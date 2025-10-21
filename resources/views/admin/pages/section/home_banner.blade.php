@extends('admin.pages.app')

@section('content')
<div class="container">
    <h2>{{ isset($section) ? __('Edit Section Home Banner') : __('Add New Section Home Banner') }}</h2>

    @if(session('success'))
        <div class="alert alert-success">{{ __(session('success')) }}</div>
    @endif

    <form action="{{ isset($section) ? route('admin.home_banner.update', $section->id) : route('admin.home_banner.store') }}" method="POST" enctype="multipart/form-data">
        @csrf
        @if(isset($section))
            @method('PUT')
        @endif

        <div class="mb-3">
            <label>{{ __('Title') }}</label>
            <input type="text" name="title" class="form-control" value="{{ $section->content['title'] ?? '' }}" required>
        </div>

        <div class="mb-3">
            <label>{{ __('Subtitle') }}</label>
            <input type="text" name="subtitle" class="form-control" value="{{ $section->content['subtitle'] ?? '' }}">
        </div>

        <div class="mb-3">
            <label>{{ __('Description') }}</label>
            <input type="text" name="description" class="form-control" value="{{ $section->content['description'] ?? '' }}">
        </div>

        <div class="mb-3">
            <label>{{ __('Images') }}</label>
            <input type="file" name="images[]" class="form-control" multiple>
        </div>

        @if(isset($section) && !empty($section->content['images']))
            <div class="mb-3">
                <label>{{ __('Current Images') }}:</label>
                <div class="d-flex flex-wrap gap-2 mt-2">
                    @foreach($section->content['images'] as $img)
                        <div style="position: relative;">
                            <img src="{{ asset('sections/'.$img) }}" width="100" class="border rounded">
                        </div>
                    @endforeach
                </div>
            </div>
        @endif

        <button type="submit" data-disable-on-submit class="btn btn-primary mb-3">
            {{ isset($section) ? __('Update') : __('Add') }}
        </button>
    </form>
</div>
@endsection

<script>
document.addEventListener("DOMContentLoaded", function() {
    document.querySelectorAll('form').forEach(form => {
        form.addEventListener('submit', function(e) {
            const btn = form.querySelector('[data-disable-on-submit]');
            if (btn) {
                if (btn.disabled) {
                    e.preventDefault();
                    return;
                }

                btn.disabled = true;
                const originalText = btn.innerHTML;
                btn.setAttribute('data-original-text', originalText);
                btn.innerHTML = '{{ __("Sending...") }}';
                setTimeout(() => {
                    btn.disabled = false;
                    btn.innerHTML = btn.getAttribute('data-original-text');
                }, 4000);
            }
        });
    });
});
</script>
