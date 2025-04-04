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
        Schema::create('subasta_clientes', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger("subasta_id");
            $table->unsignedBigInteger("cliente_id");
            $table->integer("garantia");
            $table->decimal("puja");
            $table->string("comprobante", 255);
            $table->integer("estado_comprobante");
            $table->integer("estado_puja");
            $table->date("fecha_oferta")->nullable();
            $table->time("hora_oferta")->nullable();
            $table->integer("devolucion")->default(0);
            $table->text("descripcion_devolucion")->nullable()->default(NULL);
            $table->date("fecha_devolucion")->nullable()->default(NULL);
            $table->time("hora_devolucion")->nullable()->default(NULL);
            $table->timestamps();

            $table->foreign("subasta_id")->on("subastas")->references("id");
            $table->foreign("cliente_id")->on("clientes")->references("id");
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('subasta_clientes');
    }
};
