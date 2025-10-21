<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Setting;
use Illuminate\Support\Facades\Storage;
use App\Http\Requests\Settings\UpdateSettingRequest;

class SettingController extends Controller
{
    public function index()
    {
        $locale = app()->getLocale();
        $settings = Setting::where('lang', $locale)->get();

        return view('admin.pages.settings.list', compact('settings', 'locale'));
    }

    public function show(Setting $setting)
    {
        return response()->json($setting);
    }

    public function update(UpdateSettingRequest $request, Setting $setting)
    {
        $data = $request->except('logo');
        $data['lang'] = app()->getLocale();

        if ($request->hasFile('logo')) {
            if ($setting->logo && Storage::disk('public')->exists($setting->logo)) {
                Storage::disk('public')->delete($setting->logo);
            }
            $data['logo'] = $request->file('logo')->store('admin/settings', 'public');
        }

        $setting->update($data);

        return redirect()->route('admin.settings.index')
                         ->with('message', __('Setting updated successfully!'));
    }
}
