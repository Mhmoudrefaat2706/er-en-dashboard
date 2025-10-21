<?php
namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Category;
use Illuminate\Support\Facades\Storage;
use App\Http\Requests\Category\StoreCategoryRequest;
use App\Http\Requests\Category\UpdateCategoryRequest;
use Illuminate\Support\Str;
use Illuminate\Http\JsonResponse;

class CategoryController extends Controller
{

  public function index()
{
    $currentLang = app()->getLocale();

    $categories = Category::where('lang', $currentLang)
        ->orderBy('created_at', 'desc')
        ->paginate(8);

    return view('admin.pages.categories.list', compact('categories'));
}

   public function store(StoreCategoryRequest $request): JsonResponse
{
    $validated = $request->validated();

    $validated['slug'] = $validated['slug'] ?? Str::slug($validated['name']);

    $validated['lang'] = app()->getLocale();

    if ($request->hasFile('image')) {
        $validated['image'] = $request->file('image')->store('categories', 'public');
    }

    $category = Category::create($validated);

    return response()->json([
        'success'  => true,
        'message'  => __('Category created successfully'),
        'category' => $category,
    ]);
}


    public function update(UpdateCategoryRequest $request, Category $category): JsonResponse
    {
        $validated = $request->validated();

        $validated['slug'] = $validated['slug'] ?? \Str::slug($validated['name']);

        if ($request->hasFile('image')) {
            if ($category->image && Storage::disk('public')->exists($category->image)) {
                Storage::disk('public')->delete($category->image);
            }
            $validated['image'] = $request->file('image')->store('categories', 'public');
        }

        $category->update($validated);

        return response()->json([
            'success'  => true,
            'message'  => __('Category updated successfully'),
            'category' => $category,
        ]);
    }


    public function destroy(Category $category): JsonResponse
    {
        if ($category->image && Storage::disk('public')->exists($category->image)) {
            Storage::disk('public')->delete($category->image);
        }

        $category->delete();

        return response()->json([
            'success' => true,
            'message' => __('Category deleted successfully'),
        ]);
    }
}
