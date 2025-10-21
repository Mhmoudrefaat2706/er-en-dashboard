<?php
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('sections', function (Blueprint $table) {
            $table->id();
            $table->string('slug');
            $table->json('content');
            $table->string('lang', 5)->default('en');
            $table->enum('status', ['active','inactive'])->default('active');
            $table->timestamps();

            $table->unique(['slug', 'lang']);
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('sections');
    }
};
