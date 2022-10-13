<?php
  
namespace App\Support;
  
use Illuminate\Validation\Validator as Validator;
use Illuminate\Http\Response as Response;

class Mevitsu {
	public static function valid(...$params){
		return Validator::make(...$params);
	}
	/*
	 * Create Mevitsu's app dedicated reponse
	 * 
	 * @param array $json
	 * @param int $http_code
	 * @param string $message
	 * @return Illuminate\Http\Response
	 */
	public static function response(array $json,int $http_code, string $message) : Response {
		return Response::make($json===null?null:json_encode($json), $http_code)
			->header('Message', $message);
	}
	
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
/* NOT USED, BUT LEFT HERE [*]
		//preparing crendetials
		//add "bail" credential to $credentials
		$addBailToCredentials= function(string|array $v):string|array{
			if(gettype($v)=='string')
				return 'bail|'.$v;
			else{//type is array
					array_unshift($v,'bail');
					return $v;
			}
		};
		$credentials=array_map($addBailToCredentials,$credentials);
		//$credentials is well-prepared right now
		
		//validation...
		$validator=Validator::make($values,$credentials,$customMessages=array(),$customAttributes=['name'=>'NAZWA'],$fallbackMessages=['name'=>'supcio']);
		*/
		
		//prepare error messages
		$messages=$validator->getMessageBag()->getMessages();
		//replace error messages to a [code=>422,message=>message]
		$messages=array_map(function (array $v): array{ return ['code'=>422,'message'=>$v[0]]; },$messages);
		//error messages is well-prepared

		//if error message then leave it. if there is no one- put success message instead
		return array_merge($successMessages,$messages);
    }
}
