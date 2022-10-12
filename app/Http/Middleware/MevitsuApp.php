<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class MevitsuApp
{
    /**
     * Mevitsu's app general Service
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse)  $next
     * @return \Illuminate\Http\Response
     */
    public function handle(Request $request, Closure $next)
    {
		//Check for upgrades due User-Agent header
		if(!$this->checkUserAgent($request->header('User-Agent')))
			return response()->mevitsu(null,426,'Application upgrade required');
		
		//User-Agent header is ok
        return $next($request);
    }
    
    /*
     * Check User-Agent header string only. It's provisory right now
     * 
     * @param string
     * @return bool
     */
    public function checkUserAgent(string $userAgent){
		//provisory for testing- for Firefox only
		if(!Str::contains($userAgent,'Firefox'))
			return false;
		else
			return true;
		
	 }
	 
}
