# tfwstring
**tenfourWest.com** string functions

```tfwstring``` is tenfourWest.com's `R` package for string manipulation. 

## Installation

```r
if (!require(remotes)) install.packages("remotes")
remotes::install_github("nbarsch/tfwstring")
```

## Usage
```tfwstring```'s most useful function to the public is the R wrapper to the ```usaddress``` python module to make address parsing easy and automatic. This function uses the R package ```reticulate``` to run usaddress python module directly and easily in R.


## To parse addresses:
```tfwstring::parseaddress(address, check_python=TRUE, force_stateabb=FALSE, return="char")```

**On Mac and Linux** python AND the python module ``usaddress`` should automatically install if missing (because unix is superior clearly).

**On Windows** it is recommended to 
1. Install python yourself from here: https://www.python.org/downloads/windows/ 
2. Install c++ and python tools for visual studio: https://visualstudio.microsoft.com/downloads/ 
2. Use powershell to ```pip3 install usaddress```
3. When running ```parseaddress()``` use ```check_python=FALSE``` to avoid issues running in the windows OS. 

## Simplest use
```parseaddress("Biden's White House 1700 Pennsylvania Ave NW, Washington DC 20500")```

```
                Recipient             AddressNumber                StreetName        StreetNamePostType StreetNamePostDirectional                 PlaceName 
    "Biden's White House"                    "1700"            "Pennsylvania"                     "Ave"                      "NW"              "Washington" 
                StateName                   ZipCode 
                     "DC"                   "20500" 
```
```parseaddress("Biden's White House 1700 Pennsylvania Ave NW, Washington DC 20500", return="vertical")```

```

                               parsed_address
Recipient                 Biden's White House
AddressNumber                            1700
StreetName                       Pennsylvania
StreetNamePostType                        Ave
StreetNamePostDirectional                  NW
PlaceName                          Washington
StateName                                  DC
ZipCode                                 20500

```
```parseaddress("Colgate University 13 Oak Drive Hamilton, NY 13346", return="horizontal")```

```
                        Recipient AddressNumber StreetName StreetNamePostType PlaceName StateName ZipCode
parsed_address Colgate University            13        Oak              Drive  Hamilton        NY   13346
```                   


## Optional Parameters:

```return``` FORMAT TYPE for RETURNED RESULTS (1. "vertical" or "v" for vertical data.frame, 2. "horizontal" or "h" for horizontal data.frame, "c" or "char" for named character vector )

```check_python``` TRUE or FALSE, DO NOT INSTALL MINICONDA IF PROMPTED! TRUE=check for python dependencies and install if missing, FALSE= skip check (faster if you have already have the python dependencies installed)

```force_stateabb``` TRUE or FALSE, if TRUE state names are forced to abbreviation format for unified format

