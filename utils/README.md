# Utility and convenience script for the grant

Install with

    zef install --deps-only .
	
	
## Download issues

Download them with 

    perl6 -I ../../../forks/perl6/perl6-WebService-GitHub/lib download-issues.p6 > ../data/issues.json

Some will probably fail; obtain the ones that have not been downloaded
and put them in not-downloaded.dat. Then

    ./download_some_issues.p6
    
    
