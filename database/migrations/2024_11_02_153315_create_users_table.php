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
        Schema::create('users', function (Blueprint $table) {
            $table->id();
            $table->string("usuario", 255);
            $table->string("nombres", 255);
            $table->string("apellidos", 255);
            $table->string('password');
            $table->unsignedBigInteger("role_id")->nullable();
            $table->integer("acceso");
            $table->date("fecha_registro");
            $table->timestamps();

            $table->foreign("role_id")->on("roles")->references("id");

        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('users');
    }
};
