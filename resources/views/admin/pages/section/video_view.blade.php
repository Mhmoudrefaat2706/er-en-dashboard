@extends('admin.pages.app')

@section('content')
<div class="container">
    <h2>{{ isset($section) ? __('Edit Section Video View') : __('Add New Section Video View') }}</h2>

    @if(session('success'))
        <div class="alert alert-success">{{ __(session('success')) }}</div>
    @endif

    <form action="{{ isset($section) ? route('admin.video.update', $section->id) : route('admin.video.store') }}" method="POST" enctype="multipart/form-data">
        @csrf
        @if(isset($section))
            @method('PUT')
        @endif

        <div class="row">
            <div class="col-12 mb-3">
                <label>{{ __('Title') }}</label>
                <input type="text" name="title" class="form-control" value="{{ $section->content['title'] ?? '' }}" required>
            </div>

            <div class="col-6 mb-3">
                <label>{{ __('Subtitle') }}</label>
                <input type="text" name="subtitle" class="form-control" value="{{ $section->content['subtitle'] ?? '' }}">
            </div>

            <div class="col-6 mb-3">
                <label>{{ __('Buildings Finished Now') }}</label>
                <input type="number" name="Buildings_Finished_Now" class="form-control" value="{{ $section->content['Buildings_Finished_Now'] ?? '' }}">
            </div>

            <div class="col-6 mb-3">
                <label>{{ __('Years Experience') }}</label>
                <input type="number" name="Years_Experience" class="form-control" value="{{ $section->content['Years_Experience'] ?? '' }}">
            </div>

            <div class="col-6 mb-3">
                <label>{{ __('Awards Won 2023') }}</label>
                <input type="number" name="Awwards_Won" class="form-control" value="{{ $section->content['Awwards_Won'] ?? '' }}">
            </div>

            <div class="mb-3">
                <label>{{ __('Video Link') }}</label>
                <input type="url" name="video_link" class="form-control" value="{{ $section->content['video_link'] ?? '' }}">
            </div>

            <div class="mb-3">
                <label>{{ __('Image') }}</label>
                <input type="file" name="image" class="form-control">
            </div>

            @if(isset($section) && !empty($section->content['image']))
                <div class="mb-3">
                    <label>{{ __('Current Image') }}:</label>
                    <div style="position: relative;">
                        <img src="{{ asset('sections/'.$section->content['image'][0]) }}" width="100" class="border rounded">
                    </div>
                </div>
            @endif
        </div>

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
