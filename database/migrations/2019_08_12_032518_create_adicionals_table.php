<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateAdicionalsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('adicionales', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('nombre', 100)->default('nombre');
            $table->string('descripcion', 100)->nullable()->default('descripcion');
            $table->float('precio')->default(0);
            $table->float('porcentaje')->nullable();
            $table->bigInteger('servicio_id')->nullable()->unsigned();

            $table->foreign('servicio_id')->references('id')->on('servicios')->onDelete('cascade');
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
        Schema::dropIfExists('adicionals');
    }
}
