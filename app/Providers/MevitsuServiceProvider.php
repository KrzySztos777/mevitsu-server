<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\Response;

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
		Response::macro('mevitsu', function (array $json,int $http_code,string $message) {
			return Response::make($json===null?null:json_encode($json), $http_code)
					->header('Message', $message);
		});
    }
}
