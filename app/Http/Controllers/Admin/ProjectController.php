<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Project;
use App\Http\Requests\Project\StoreProjectRequest;
use App\Http\Requests\Project\UpdateProjectRequest;
use Illuminate\Support\Str;

class ProjectController extends Controller
{
   public function index()
{

    $projects = Project::where('lang', app()->getLocale())
        ->orderBy('created_at', 'desc')
        ->paginate(6);

    $categories = Project::where('lang', app()->getLocale())->get();

    return view('admin.pages.projects.list', compact('projects', 'categories'));
}


   public function store(StoreProjectRequest $request)
{
    $data = $request->validated();
    $data['lang'] = app()->getLocale();
    $data['slug'] = Str::slug($data['title']);


if ($request->hasFile('image')) {
    $images = [];
    foreach ($request->file('image') as $file) {
        $path = $file->store('projects', 'public');
        $images[] = $path;
    }
    $data['image'] = $images;
}


    $project = Project::create($data);
    $project->load('category');

    return response()->json([
        'success' => true,
        'message' => __('Project created successfully.'),
        'project' => $project
    ]);
}

public function update(UpdateProjectRequest $request, Project $project)
{
    $data = $request->validated();
    if (isset($data['title'])) {
        $data['slug'] = Str::slug($data['title']);
    }


if ($request->hasFile('image')) {
    $images = [];
    foreach ($request->file('image') as $file) {
        $path = $file->store('projects', 'public');
        $images[] = $path;
    }
    $data['image'] = $images;
}


    $project->update($data);
    $project->load('category');

    return response()->json([
        'success' => true,
        'message' => __('Project updated successfully.'),
        'project' => $project
    ]);
}


    public function show(Project $project)
    {
        $project->load(['category', 'videos']);
        return view('admin.pages.projects.show', compact('project'));
    }

    public function destroy(Project $project)
    {
        $project->delete();

        return response()->json([
            'success' => true,
            'message' => __('Project deleted successfully.')
        ]);
    }
}
