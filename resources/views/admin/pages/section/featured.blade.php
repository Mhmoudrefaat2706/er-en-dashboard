@extends('admin.pages.app')

@section('content')
<div class="container">
    <h2>
        {{ isset($section) ? __('Edit Featured Section') : __('Add New Featured Section') }}
    </h2>

    @if(session('success'))
        <div class="alert alert-success">{{ __(session('success')) }}</div>
    @endif

    <form action="{{ isset($section) ? route('admin.featured.update', $section->id) : route('admin.featured.store') }}" method="POST" enctype="multipart/form-data">
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
                <label>{{ __('Address') }}</label>
                <input type="text" name="address" class="form-control" value="{{ $section->content['address'] ?? '' }}">
            </div>

            <div class="col-6 mb-3">
                <label>{{ __('Space') }}</label>
                <input type="number" name="space" class="form-control" value="{{ $section->content['space'] ?? '' }}">
            </div>

            <div class="col-6 mb-3">
                <label>{{ __('Price') }}</label>
                <input type="number" name="price" class="form-control" value="{{ $section->content['price'] ?? '' }}">
            </div>

            <div class="mb-3">
                <label>{{ __('Question One') }}</label>
                <input type="text" name="question_one" class="form-control" value="{{ $section->content['question_one'] ?? '' }}">
            </div>

            <div class="mb-3">
                <label>{{ __('Answer One') }}</label>
                <input type="text" name="answer_one" class="form-control" value="{{ $section->content['answer_one'] ?? '' }}">
            </div>

            <div class="mb-3">
                <label>{{ __('Question Two') }}</label>
                <input type="text" name="question_two" class="form-control" value="{{ $section->content['question_two'] ?? '' }}">
            </div>

            <div class="mb-3">
                <label>{{ __('Answer Two') }}</label>
                <input type="text" name="answer_two" class="form-control" value="{{ $section->content['answer_two'] ?? '' }}">
            </div>

            <div class="mb-3">
                <label>{{ __('Question Three') }}</label>
                <input type="text" name="question_three" class="form-control" value="{{ $section->content['question_three'] ?? '' }}">
            </div>

            <div class="mb-3">
                <label>{{ __('Answer Three') }}</label>
                <input type="text" name="answer_three" class="form-control" value="{{ $section->content['answer_three'] ?? '' }}">
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
