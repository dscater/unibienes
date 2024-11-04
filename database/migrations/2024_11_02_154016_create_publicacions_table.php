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
        Schema::create('publicacions', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger("user_id");
            $table->string("categoria", 155);
            $table->string("moneda");
            $table->decimal("oferta_inicial", 24, 2);
            $table->string("ubicacion");
            $table->string("observaciones")->nullable();
            $table->date("fecha_limite");
            $table->date("hora_limite");
            $table->decimal("monto_garantia", 24, 2);
            $table->timestamps();

            $table->foreign("user_id")->on("users")->references("id");
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('publicacions');
    }
};
