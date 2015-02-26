<?php


function isPrime($num) {
		
	$root = sqrt($num);
        if((int) $root == $root ) {
		return false;
	}
	for($i=2;$i<$root;$i++) {
		if($num%$i==0) {
    			return false;
		}
	}

	return true;
}

if(isset($argv[1])) {
	$num = $argv[1];
	$primes = array();
	$i = 0;
        while(count($primes) < $num) {
                if(isPrime($i)) {
			$primes[] = $i;
		}
		$i++;
        }
	echo join(",",$primes);
//	echo count($primes);
}

