<?php

namespace App\Providers;

use Response;
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
        //
    }

    /**
     * Bootstrap services.
     *
     * @return void
     */
    public function boot()
    {
		// Create custom reponse macro for mevitsu application.
		Response::macro('mevitsu', function ($http_code,$message,$json=null) {
            return Response::make($json===null?null:json_encode($json), $http_code)
				->header('Message', $message);
        });
        
        //
    }
}
