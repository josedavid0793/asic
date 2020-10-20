<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateHostClientesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('host_clientes', function (Blueprint $table) {
            $table->increments('id');
            $table->string('host_name');
            $table->string('ip');
            $table->string('cliente');
            $table->string('ambiente');
            $table->string('sistema_operativo');
            $table->string('escalamiento');
            $table->string('notas');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('host_clientes');
    }
}
