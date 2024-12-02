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
        Schema::create('historial_ofertas', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger("subasta_cliente_id");
            $table->unsignedBigInteger("subasta_id");
            $table->unsignedBigInteger("cliente_id");
            $table->decimal("puja");
            $table->date("fecha_oferta")->nullable();
            $table->timestamps();

            $table->foreign("subasta_cliente_id")->on("subasta_clientes")->references("id");
            $table->foreign("subasta_id")->on("subastas")->references("id");
            $table->foreign("cliente_id")->on("clientes")->references("id");
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('historial_ofertas');
    }
};
