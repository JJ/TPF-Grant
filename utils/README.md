# Utility and convenience script for the grant

Install the Perl 6 dependencies with

    zef install --deps-only .
	
You'll need to install R, ggplot2 and ggthemes2 to run the R scripts.

	
## Download issues

Download them with 

    perl6 -I ../../../forks/perl6/perl6-WebService-GitHub/lib download-issues.p6 > ../data/issues.json

Some will probably fail; obtain the ones that have not been downloaded
and put them in not-downloaded.dat. Then

    ./download_some_issues.p6
    
    
