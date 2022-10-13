<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;

class MevitsuServiceProvider extends ServiceProvider
{
    /**
     * Register services.
     *
     * @return void
     */
    public function register()
    {
		$this->app->bind('mevitsu',function($app){
			return new \App\Support\Mevitsu;
		});
    }

    /**
     * Bootstrap services.
     *
     * @return void
     */
    public function boot()
    {
		//
    }
}
