<?php

namespace App\Http\Requests\Project;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Contracts\Validation\Validator;
use Illuminate\Http\Exceptions\HttpResponseException;
class UpdateProjectRequest extends FormRequest
{
    public function authorize(): bool
    {
        return true;
    }

    public function rules(): array
    {
        return [
            'title' => 'required|string|max:255',
            'short_description' => 'required|string|max:255',
            'description' => 'required|string',
            'category_id' => 'required|exists:categories,id',
            'status' => 'required|in:active,inactive',
            'price' => 'required|numeric|min:0',
            'image' => 'nullable|array',
            'image.*' => 'image|mimes:jpg,jpeg,png,gif|max:2048',
            'parking' => 'required|integer',
            'floor' => 'required|integer',
            'area' => 'required|integer',
            'bathrooms' => 'required|integer',
            'bedrooms' => 'required|integer',

        ];
    }

    protected function failedValidation(Validator $validator)
    {
        throw new HttpResponseException(response()->json([
            'success' => false,
            'errors' => $validator->errors()
        ], 422));
    }
}
