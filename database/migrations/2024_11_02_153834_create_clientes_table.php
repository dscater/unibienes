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
        Schema::create('clientes', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger("user_id");
            $table->string('nombre');
            $table->string('paterno');
            $table->string('materno')->nullable();
            $table->string('ci');
            $table->string("complemento")->nullable();
            $table->string('ci_exp');
            $table->string('fono', 255);
            $table->string('dpto_residencia');
            $table->string('email');
            $table->string("foto_ci_anverso", 255)->nullable();
            $table->string("foto_ci_reverso", 255)->nullable();
            $table->string("banco", 255);
            $table->string("nro_cuenta", 255);
            $table->string("moneda", 255);
            $table->date("fecha_registro");
            $table->timestamps();

            $table->foreign("user_id")->on("users")->references("id");
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('clientes');
    }
};
