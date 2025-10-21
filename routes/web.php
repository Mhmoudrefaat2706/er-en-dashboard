<?php

use Illuminate\Support\Facades\Route;

use App\Http\Middleware\Locale;

Route::middleware([Locale::class])->group(function () {
    Route::get('lang/{locale}', function ($locale) {
        if (in_array($locale, ['ar', 'en'])) {
            session(['locale' => $locale]);
            app()->setLocale($locale);
        }
        return redirect()->back();
    });



include __DIR__.'/admin.php';


Route::fallback(function () {
    return redirect()->route('admin.admins.index');
});

});


