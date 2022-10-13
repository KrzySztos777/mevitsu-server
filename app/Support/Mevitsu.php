<?php
  
namespace App\Support;
  
use Illuminate\Validation\Validator as Validator;

class Mevitsu {
	
	/*
	 * Validate form as static facade function
	 * 
	 * @param Validator $validator
	 * @param array $successMessages
	 * @param string $defaultSuccessMessage
	 * @return array 
	 */
    public static function validatorToArray(Validator $validator,$successMessages=[],$defaultSuccessMessage='OK!'){
		//fill successMessages with defaultSuccessMessages if they dont have one
		$successMessages=array_merge(array_fill_keys(array_keys($validator->getRules()),$defaultSuccessMessage),$successMessages);

		//replace success messages to a ["http"code=>200,message=>message]
		$successMessagesToArray= function (string $v): array { 
			return ['code'=>200,'message'=>$v]; 
		};
		$successMessages=array_map($successMessagesToArray,$successMessages);
		//$successMessages is well-preapred right now. 
		
		//prepare error messages
		$messages=$validator->getMessageBag()->getMessages();
		//replace error messages to a [code=>422,message=>message]
		$messages=array_map(function (array $v): array{ return ['code'=>422,'message'=>$v[0]]; },$messages);
		//error messages is well-prepared

		//if error message then leave it. if there is no one- put success message instead
		return array_merge($successMessages,$messages);
    }
}
