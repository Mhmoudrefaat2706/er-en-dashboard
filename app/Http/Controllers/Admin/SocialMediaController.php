<?php
namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Socialmedia;
use App\Http\Requests\SocialMedia\StoreSocialMediaRequest;
use App\Http\Requests\SocialMedia\UpdateSocialMediaRequest;
use Illuminate\Http\JsonResponse;

class SocialMediaController extends Controller
{
    public function index()
    {
        $locale = app()->getLocale();
        $socials = SocialMedia::where('lang', app()->getLocale())
                    ->orderBy('created_at', 'desc')
                    ->paginate(6);

        return view('admin.pages.socialmedia.list', compact('socials'));
    }

    public function store(StoreSocialMediaRequest $request): JsonResponse
    {
        $validated = $request->validated();

        $validated['lang'] = $validated['lang'] ?? app()->getLocale();

        $social = SocialMedia::create($validated);

        return response()->json([
            'success' => true,
            'message' => __('Social media link created successfully'),
            'social'  => $social,
        ]);
    }

    public function update(UpdateSocialMediaRequest $request, SocialMedia $social_media): JsonResponse
    {
        $validated = $request->validated();

        $social_media->update($validated);

        return response()->json([
            'success' => true,
            'message' => __('Social media link update successfully'),
            'social'  => $social_media,
        ]);
    }

    public function destroy(SocialMedia $social_media): JsonResponse
    {
        $social_media->delete();

        return response()->json([
            'success' => true,
            'message' => __('Social media link deleted successfully'),
        ]);
    }
}
