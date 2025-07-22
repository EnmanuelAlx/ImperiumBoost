<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use GuzzleHttp\Exception\GuzzleException;
use GuzzleHttp\Client;
use function GuzzleHttp\json_decode;

class RiotController extends Controller
{
    CONST API_KEY = "";

    public function getSummoner(Request $request){
        $server = $request->input('servidor');
        $name = $request->input('nombre');
        // dd($server, $name);
        $api_key = self::API_KEY;
        $url = "https://$server.api.riotgames.com/lol/summoner/v4/summoners/by-name/$name?api_key=$api_key";
        $client = new Client();
        $response = $client->get($url);
        $data = $response->getBody();
        $data = json_decode($data, true);
        return response()->json($data, 200);
    }


    public function getVersion(){
        $url = "https://ddragon.leagueoflegends.com/api/versions.json";
        $client = new Client();
        $response = $client->get($url);
        $data = $response->getBody();
        $data = json_decode($data, true);
        return response()->json($data[0], 200);
    }

    public function getChamps(){
        $version = $this->getVersion()->getData();
        $url = "http://ddragon.leagueoflegends.com/cdn/$version/data/en_US/champion.json";
        $client = new Client();
        $response = $client->get($url);
        $data = $response->getBody();
        $data = json_decode($data, true);
        return response()->json($data['data'], 200);
    }

    public function getLeague(Request $request){
        $summoner = $this->getSummoner($request)->getData();
        $server = $request->input('servidor');
        $api_key = self::API_KEY;
        $url = "https://$server.api.riotgames.com/lol/league/v4/entries/by-summoner/$summoner->id?api_key=$api_key";
        $client = new Client();
        $response = $client->get($url);
        $data = $response->getBody();
        $data = json_decode($data, true);

        foreach ($data as $key => $value) {
            $number = 0; 
            //Buscar el id del producto por division y usarlo como id_league
            switch ($value['rank']) {
                case 'I':
                    $number = 3;
                    break;
                case 'II':
                    $number = 2;
                    break;
                case 'III':
                    $number = 1;
                    break;
                case 'IV':
                    $number = 0;
                    break;
            }
            switch ($value['tier']) {
                case 'IRON':
                    $img = strtolower('hierro'.$value['rank'].'.png');
                    $imagen_league = asset("imagenes/leagues/$img");
                    $data[$key]['image'] = $imagen_league;
                    $data[$key]['tier_rank_translate'] = "Hierro ".$value['rank'];
                    $data[$key]['id_league'] = '1.'.$number;
                    break;
                
                case 'BRONZE':
                    $img = strtolower('bronce'.$value['rank'].'.png');
                    $imagen_league = asset("imagenes/leagues/$img");
                    $data[$key]['image'] = $imagen_league;
                    $data[$key]['tier_rank_translate'] = "Bronce ".$value['rank'];
                    $data[$key]['id_league'] = '2.'.$number;
                    break;

                case 'SILVER':
                    $img = strtolower('plata'.$value['rank'].'.png');
                    $imagen_league = asset("imagenes/leagues/$img");
                    $data[$key]['image'] = $imagen_league;
                    $data[$key]['tier_rank_translate'] = "Plata ".$value['rank'];
                    $data[$key]['id_league'] = '3.'.$number;
                    break;

                case 'GOLD':
                    $img = strtolower('oro'.$value['rank'].'.png');
                    $imagen_league = asset("imagenes/leagues/$img");
                    $data[$key]['image'] = $imagen_league;
                    $data[$key]['tier_rank_translate'] = "Oro ".$value['rank'];
                    $data[$key]['id_league'] = '4.'.$number;
                    break;
                
                case 'PLATINUM':
                    $img = strtolower('platino'.$value['rank'].'.png');
                    $imagen_league = asset("imagenes/leagues/$img");
                    $data[$key]['image'] = $imagen_league;
                    $data[$key]['tier_rank_translate'] = "Platino ".$value['rank'];
                    $data[$key]['id_league'] = '5.'.$number;
                    break;

                case 'DIAMOND':
                    $img = strtolower('diamante'.$value['rank'].'.png');
                    $imagen_league = asset("imagenes/leagues/$img");
                    $data[$key]['image'] = $imagen_league;
                    $data[$key]['tier_rank_translate'] = "Diamante ".$value['rank']; 
                    $data[$key]['id_league'] = '6.'.$number;
                    break;

                case 'MASTER':
                    $img = strtolower('maestro'.$value['rank'].'.png');
                    $imagen_league = asset("imagenes/leagues/$img");
                    $data[$key]['image'] = $imagen_league;
                    $data[$key]['tier_rank_translate'] = "Maestro "; 
                    $data[$key]['id_league'] = '7.'.$number;

                    break;

                case 'GRANDMASTER':
                    $img = strtolower('granmaestro'.$value['rank'].'.png');
                    $imagen_league = asset("imagenes/leagues/$img");
                    $data[$key]['image'] = $imagen_league;
                    $data[$key]['tier_rank_translate'] = "Gran Maestro ";
                    $data[$key]['id_league'] = '8.'.$number;
                    break;
            }       
        }
        
        return response()->json($data, 200);
    }
}
