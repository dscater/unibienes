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
        Schema::create('publicacion_imagens', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger("publicacion_id");
            $table->string("imagen", 255);
            $table->timestamps();

            $table->foreign("publicacion_id")->on("publicacions")->references("id");
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('publicacion_imagens');
    }
};
