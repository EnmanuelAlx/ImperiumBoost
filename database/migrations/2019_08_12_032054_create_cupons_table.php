<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateCuponsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('cupones', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('nombre', 100)->nullable()->default('nombre');
            $table->float('porcentaje')->nullable()->default(0);
            $table->date('activacion')->nullable();
            $table->date('vencimiento')->nullable();
            $table->string('descripcion', 250)->nullable();
            $table->boolean('usado')->nullable()->default(false);
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
        Schema::dropIfExists('cupons');
    }
}
