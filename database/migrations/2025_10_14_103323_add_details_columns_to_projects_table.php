<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
   public function up(): void
{
    Schema::table('projects', function (Blueprint $table) {
        $table->integer('parking')->nullable()->after('price');
        $table->integer('floor')->nullable()->after('parking');
        $table->integer('area')->nullable()->after('floor');
        $table->integer('bathrooms')->nullable()->after('area');
        $table->integer('bedrooms')->nullable()->after('bathrooms');
    });
}

public function down(): void
{
    Schema::table('projects', function (Blueprint $table) {
        $table->dropColumn(['parking', 'floor', 'area', 'bathrooms', 'bedrooms']);
    });
}

};
