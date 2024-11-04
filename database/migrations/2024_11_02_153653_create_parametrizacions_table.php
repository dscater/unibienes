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
        Schema::create('parametrizacions', function (Blueprint $table) {
            $table->id();
            $table->integer("inactividad_cliente");
            $table->decimal("tipo_cambio", 24, 2);
            $table->json("servidor_correo");
            $table->integer("nro_imagenes_pub");
            $table->integer("tiempo_pub");
            $table->text("terminos_condiciones");
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('parametrizacions');
    }
};
