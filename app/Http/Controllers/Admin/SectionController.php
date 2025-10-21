<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Section;
use App\Models\Socialmedia;
use Illuminate\Support\Str;
class SectionController extends Controller
{

// Home Banner Section Methods
    public function home_bannerindex()
    {
        $currentLang = app()->getLocale();
        $section = Section::where('slug', 'home_banner')
                  ->where('lang', $currentLang)
                  ->first();

        $socials = SocialMedia::where('status', 'active')->get()->keyBy('name');

        return view('admin.pages.section.home_banner', compact('section', 'socials'));
    }

 public function home_bannerstore(Request $request)
{
    $data = $request->only('title','subtitle','description');
    $images = [];

    if($request->hasFile('images')){
        foreach($request->file('images') as $image){
            $filename = time().'_'.Str::random(5).'.'.$image->getClientOriginalExtension();
            $image->move(public_path('sections'), $filename);
            $images[] = $filename;
        }
    }

    $data['images'] = $images;

    $lang = app()->getLocale();

    Section::updateOrCreate(
        ['slug' => 'home_banner', 'lang' => $lang],
        ['content' => $data, 'status' => 'active']
    );

    return redirect()->back()->with('success', __('create successfully'));
}



    public function home_bannerupdate(Request $request, Section $section)
{
    $data = $request->only('title','subtitle','description');

    $images = [];

    if($request->hasFile('images')){
        if(!empty($section->content['images'])){
            foreach($section->content['images'] as $oldImg){
                $oldPath = public_path('sections/'.$oldImg);
                if(file_exists($oldPath)){
                    unlink($oldPath);
                }
            }
        }

        foreach($request->file('images') as $image){
            $filename = time().'_'.Str::random(5).'.'.$image->getClientOriginalExtension();
            $image->move(public_path('sections'), $filename);
            $images[] = $filename;
        }
    } else {
        $images = $section->content['images'] ?? [];
    }

    $data['images'] = $images;

    $section->update([
        'content' => $data
    ]);

    return redirect()->back()->with('success', __('update successfully'));
}

// Featured Section Methods
public function featuredindex()
{
    $currentLang = app()->getLocale();
    $section = Section::where('slug', 'featured')
                      ->where('lang', $currentLang)
                      ->first();

    return view('admin.pages.section.featured', compact('section'));
}

public function featuredstore(Request $request)
{
    $data = $request->only(
        'title','subtitle',
        'question_one','answer_one',
        'question_two','answer_two',
        'question_three','answer_three',
        'address','space','price'
    );

    $images = [];
    if($request->hasFile('image')){
        $image = $request->file('image');
        $filename = time().'_'.Str::random(5).'.'.$image->getClientOriginalExtension();
        $image->move(public_path('sections'), $filename);
        $images[] = $filename;
    }

    $lang = app()->getLocale();

    $existing = Section::where('slug', 'featured')->where('lang', $lang)->first();
    if(empty($images) && $existing && !empty($existing->content['image'])){
        $images = $existing->content['image'];
    }

    $data['image'] = $images;

    Section::updateOrCreate(
        ['slug' => 'featured', 'lang' => $lang],
        ['content' => $data, 'status' => 'active']
    );

    return redirect()->back()->with('success', __('create successfully'));
}

public function featuredupdate(Request $request, Section $section)
{
    $data = $request->only(
        'title','subtitle',
        'question_one','answer_one',
        'question_two','answer_two',
        'question_three','answer_three',
        'address','space','price'
    );

    if ($request->hasFile('image')) {
        if (!empty($section->content['image'])) {
            $oldPath = public_path('sections/'.$section->content['image'][0]);
            if (file_exists($oldPath)) {
                @unlink($oldPath);
            }
        }
        $image = $request->file('image');
        $filename = time().'_'.Str::random(5).'.'.$image->getClientOriginalExtension();
        $image->move(public_path('sections'), $filename);
        $data['image'] = [$filename];
    } else {
        $data['image'] = $section->content['image'] ?? [];
    }

    $section->update(['content' => $data]);

    return redirect()->back()->with('success', __('update successfully'));
}


// Video Section Methods
public function videoIndex()
{
    $currentLang = app()->getLocale();
    $section = Section::where('slug', 'video')
                      ->where('lang', $currentLang)
                      ->first();

    return view('admin.pages.section.video_view', compact('section'));
}

public function videoStore(Request $request)
{
    $data = $request->only(
        'title','subtitle',
        'Awwards_Won','Years_Experience',
        'Buildings_Finished_Now','video_link'
    );

    $images = [];
    if($request->hasFile('image')){
        $image = $request->file('image');
        $filename = time().'_'.Str::random(5).'.'.$image->getClientOriginalExtension();
        $image->move(public_path('sections'), $filename);
        $images[] = $filename;
    }

    $lang = app()->getLocale();

    $existing = Section::where('slug', 'video')->where('lang', $lang)->first();
    if(empty($images) && $existing && !empty($existing->content['image'])){
        $images = $existing->content['image'];
    }

    $data['image'] = $images;

    Section::updateOrCreate(
        ['slug' => 'video', 'lang' => $lang],
        ['content' => $data, 'status' => 'active']
    );

    return redirect()->back()->with('success', __('create successfully'));
}

public function videoUpdate(Request $request, Section $section)
{
    $data = $request->only(
        'title','subtitle',
        'Awwards_Won','Years_Experience',
        'Buildings_Finished_Now','video_link'
    );

    if ($request->hasFile('image')) {
        if (!empty($section->content['image'])) {
            $oldPath = public_path('sections/'.$section->content['image'][0]);
            if (file_exists($oldPath)) {
                @unlink($oldPath);
            }
        }
        $image = $request->file('image');
        $filename = time().'_'.Str::random(5).'.'.$image->getClientOriginalExtension();
        $image->move(public_path('sections'), $filename);
        $data['image'] = [$filename];
    } else {
        $data['image'] = $section->content['image'] ?? [];
    }

    $section->update(['content' => $data]);

    return redirect()->back()->with('success', __('update successfully'));
}


}
