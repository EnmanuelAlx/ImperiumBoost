<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateCuentasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('cuentas', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('rank', 100)->nullable()->default('text');
            $table->string('cola', 100)->nullable()->default('text');
            $table->string('servidor', 100)->nullable()->default('text');
            $table->string('rank_season_anterior', 100)->nullable()->default('text');
            $table->integer('campeones')->unsigned()->nullable()->default(12);
            $table->integer('skins')->unsigned()->nullable()->default(0);
            $table->integer('rp')->unsigned()->nullable()->default(0);
            $table->integer('lp')->unsigned()->nullable()->default(0);
            $table->float('precio')->nullable()->default(0);
            $table->boolean('vendido')->nullable()->default(false);
            $table->softDeletes();
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
        Schema::dropIfExists('cuentas');
    }
}
