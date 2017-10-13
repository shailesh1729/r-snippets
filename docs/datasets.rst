Datasets
================

R ships with a set of built-in datasets.

.. index:: data()

Viewing the list of datasets::

	> data()

Loading a dataset::

	> data(Orange)

Description of the dataset::

	> ?Orange


Lets assign a generic name to this dataset::

	> ds <- Orange

.. index:: head; data frame

Seeing the first few rows of the dataset::

	> head(ds)
	  Tree  age circumference
	1    1  118            30
	2    1  484            58
	3    1  664            87
	4    1 1004           115
	5    1 1231           120
	6    1 1372           142

.. index:: tail; data frame

Seeing the last few rows::

	> tail(ds)
	   Tree  age circumference
	30    5  484            49
	31    5  664            81
	32    5 1004           125
	33    5 1231           142
	34    5 1372           174
	35    5 1582           177


Number of records::

	> nrow(ds)
	[1] 35


Sampling some random rows from the dataset::

	> rows <- sample(nrow(ds), 10)
	> rows <- sort(rows)
	> ds[rows,]
	   Tree  age circumference
	2     1  484            58
	3     1  664            87
	10    2  664           111
	13    2 1372           203
	14    2 1582           203
	22    4  118            32
	23    4  484            62
	27    4 1372           209
	29    5  118            30
	31    5  664            81


.. index:: sample_n

``dplyr`` library provides similar functionality to sample records::

	> dplyr::sample_n(ds, 10)
	   Tree  age circumference
	24    4  664           112
	21    3 1582           140
	18    3 1004           108
	2     1  484            58
	5     1 1231           120
	30    5  484            49
	19    3 1231           115
	33    5 1231           142
	15    3  118            30
	25    4 1004           167


Finding the column names (variable names) in the dataset::

	> names(ds)
	[1] "Tree"          "age"           "circumference"


Computing averages::

	> mean(ds$age)
	[1] 922.1429
	> mean(ds$circumference)
	[1] 115.8571


Computing variances::

	> var(ds$age)
	[1] 241930.7
	> var(ds$circumference)
	[1] 3304.891

Summary of the dataset::

	> summary(ds)
	 Tree       age         circumference  
	 3:7   Min.   : 118.0   Min.   : 30.0  
	 1:7   1st Qu.: 484.0   1st Qu.: 65.5  
	 5:7   Median :1004.0   Median :115.0  
	 2:7   Mean   : 922.1   Mean   :115.9  
	 4:7   3rd Qu.:1372.0   3rd Qu.:161.5  
	       Max.   :1582.0   Max.   :214.0  


Finding class of each variable in the dataset::

	> sapply(Orange, class)
	$Tree
	[1] "ordered" "factor" 

	$age
	[1] "numeric"

	$circumference
	[1] "numeric"


This works better for other datasets like iris, mtcars::

	> sapply(iris, class)
	Sepal.Length  Sepal.Width Petal.Length  Petal.Width      Species 
	   "numeric"    "numeric"    "numeric"    "numeric"     "factor" 

	> sapply(mtcars, class)
	      mpg       cyl      disp        hp      drat        wt      qsec        vs        am 
	"numeric" "numeric" "numeric" "numeric" "numeric" "numeric" "numeric" "numeric" "numeric" 
	     gear      carb 
	"numeric" "numeric" 

mtcars Data Set
------------------------

.. index:: mtcars


Loading::

	> data("mtcars")

Basic info::


	> nrow(mtcars)
	[1] 32
	> ncol(mtcars)
	[1] 11
	> head(mtcars)
	                   mpg cyl disp  hp drat    wt  qsec vs am gear carb
	Mazda RX4         21.0   6  160 110 3.90 2.620 16.46  0  1    4    4
	Mazda RX4 Wag     21.0   6  160 110 3.90 2.875 17.02  0  1    4    4
	Datsun 710        22.8   4  108  93 3.85 2.320 18.61  1  1    4    1
	Hornet 4 Drive    21.4   6  258 110 3.08 3.215 19.44  1  0    3    1
	Hornet Sportabout 18.7   8  360 175 3.15 3.440 17.02  0  0    3    2
	Valiant           18.1   6  225 105 2.76 3.460 20.22  1  0    3    1


Summary::

	> summary(mtcars)
	      mpg             cyl             disp             hp             drat             wt       
	 Min.   :10.40   Min.   :4.000   Min.   : 71.1   Min.   : 52.0   Min.   :2.760   Min.   :1.513  
	 1st Qu.:15.43   1st Qu.:4.000   1st Qu.:120.8   1st Qu.: 96.5   1st Qu.:3.080   1st Qu.:2.581  
	 Median :19.20   Median :6.000   Median :196.3   Median :123.0   Median :3.695   Median :3.325  
	 Mean   :20.09   Mean   :6.188   Mean   :230.7   Mean   :146.7   Mean   :3.597   Mean   :3.217  
	 3rd Qu.:22.80   3rd Qu.:8.000   3rd Qu.:326.0   3rd Qu.:180.0   3rd Qu.:3.920   3rd Qu.:3.610  
	 Max.   :33.90   Max.   :8.000   Max.   :472.0   Max.   :335.0   Max.   :4.930   Max.   :5.424  
	      qsec             vs               am              gear            carb      
	 Min.   :14.50   Min.   :0.0000   Min.   :0.0000   Min.   :3.000   Min.   :1.000  
	 1st Qu.:16.89   1st Qu.:0.0000   1st Qu.:0.0000   1st Qu.:3.000   1st Qu.:2.000  
	 Median :17.71   Median :0.0000   Median :0.0000   Median :4.000   Median :2.000  
	 Mean   :17.85   Mean   :0.4375   Mean   :0.4062   Mean   :3.688   Mean   :2.812  
	 3rd Qu.:18.90   3rd Qu.:1.0000   3rd Qu.:1.0000   3rd Qu.:4.000   3rd Qu.:4.000  
	 Max.   :22.90   Max.   :1.0000   Max.   :1.0000   Max.   :5.000   Max.   :8.000 



iris Data Set
-------------------

.. index:: iris


Loading::

	> data("iris")

Basic info::

	> nrow(iris)
	[1] 150
	> ncol(iris)
	[1] 5
	> head(iris)
	  Sepal.Length Sepal.Width Petal.Length Petal.Width Species
	1          5.1         3.5          1.4         0.2  setosa
	2          4.9         3.0          1.4         0.2  setosa
	3          4.7         3.2          1.3         0.2  setosa
	4          4.6         3.1          1.5         0.2  setosa
	5          5.0         3.6          1.4         0.2  setosa
	6          5.4         3.9          1.7         0.4  setosa


Summary::

	> summary(iris)
	  Sepal.Length    Sepal.Width     Petal.Length    Petal.Width          Species  
	 Min.   :4.300   Min.   :2.000   Min.   :1.000   Min.   :0.100   setosa    :50  
	 1st Qu.:5.100   1st Qu.:2.800   1st Qu.:1.600   1st Qu.:0.300   versicolor:50  
	 Median :5.800   Median :3.000   Median :4.350   Median :1.300   virginica :50  
	 Mean   :5.843   Mean   :3.057   Mean   :3.758   Mean   :1.199                  
	 3rd Qu.:6.400   3rd Qu.:3.300   3rd Qu.:5.100   3rd Qu.:1.800                  
	 Max.   :7.900   Max.   :4.400   Max.   :6.900   Max.   :2.500     


Unique species::

	> table(iris$Species)

	    setosa versicolor  virginica 
	        50         50         50 


ToothGrowth Data Set
----------------------------

.. index:: ToothGrowth

Loading::

	> data("ToothGrowth")

Basic info::

	> nrow(ToothGrowth)
	[1] 60
	> ncol(ToothGrowth)
	[1] 3
	> head(ToothGrowth)
	   len supp dose
	1  4.2   VC  0.5
	2 11.5   VC  0.5
	3  7.3   VC  0.5
	4  5.8   VC  0.5
	5  6.4   VC  0.5
	6 10.0   VC  0.5

Summary::


	> summary(ToothGrowth)
	      len        supp         dose      
	 Min.   : 4.20   OJ:30   Min.   :0.500  
	 1st Qu.:13.07   VC:30   1st Qu.:0.500  
	 Median :19.25           Median :1.000  
	 Mean   :18.81           Mean   :1.167  
	 3rd Qu.:25.27           3rd Qu.:2.000  
	 Max.   :33.90           Max.   :2.000 



PlantGrowth Data Set
-----------------------------

.. index:: PlantGrowth


Loading::

	> data("PlantGrowth")

Basic info::

	> nrow(PlantGrowth)
	[1] 30
	> ncol(PlantGrowth)
	[1] 2
	> head(PlantGrowth)
	  weight group
	1   4.17  ctrl
	2   5.58  ctrl
	3   5.18  ctrl
	4   6.11  ctrl
	5   4.50  ctrl
	6   4.61  ctrl

Summary::

	> summary(PlantGrowth)
	     weight       group   
	 Min.   :3.590   ctrl:10  
	 1st Qu.:4.550   trt1:10  
	 Median :5.155   trt2:10  
	 Mean   :5.073            
	 3rd Qu.:5.530            
	 Max.   :6.310            


USArrests Data Set
---------------------------------------

.. index:: USArrests

Loading::

	> data('USArrests')

Basic info::

	> nrow(USArrests)
	[1] 50
	> ncol(USArrests)
	[1] 4
	> head(USArrests)
	           Murder Assault UrbanPop Rape
	Alabama      13.2     236       58 21.2
	Alaska       10.0     263       48 44.5
	Arizona       8.1     294       80 31.0
	Arkansas      8.8     190       50 19.5
	California    9.0     276       91 40.6
	Colorado      7.9     204       78 38.7


Summary::

	> summary(USArrests)
	     Murder          Assault         UrbanPop          Rape      
	 Min.   : 0.800   Min.   : 45.0   Min.   :32.00   Min.   : 7.30  
	 1st Qu.: 4.075   1st Qu.:109.0   1st Qu.:54.50   1st Qu.:15.07  
	 Median : 7.250   Median :159.0   Median :66.00   Median :20.10  
	 Mean   : 7.788   Mean   :170.8   Mean   :65.54   Mean   :21.23  
	 3rd Qu.:11.250   3rd Qu.:249.0   3rd Qu.:77.75   3rd Qu.:26.18  
	 Max.   :17.400   Max.   :337.0   Max.   :91.00   Max.   :46.00  



Datasets in the datasets Package
---------------------------------------

.. index:: datasets

===========================     =========================================================================
Dataset                         Description
===========================     =========================================================================
AirPassengers                   Monthly Airline Passenger Numbers 1949-1960
BJsales                         Sales Data with Leading Indicator
BJsales.lead (BJsales)          Sales Data with Leading Indicator
BOD                             Biochemical Oxygen Demand
CO2                             Carbon Dioxide Uptake in Grass Plants
ChickWeight                     Weight versus age of chicks on different diets
DNase                           Elisa assay of DNase
EuStockMarkets                  Daily Closing Prices of Major European Stock Indices, 1991-1998
Formaldehyde                    Determination of Formaldehyde
HairEyeColor                    Hair and Eye Color of Statistics Students
Harman23.cor                    Harman Example 2.3
Harman74.cor                    Harman Example 7.4
Indometh                        Pharmacokinetics of Indomethacin
InsectSprays                    Effectiveness of Insect Sprays
JohnsonJohnson                  Quarterly Earnings per Johnson & Johnson Share
LakeHuron                       Level of Lake Huron 1875-1972
LifeCycleSavings                Intercountry Life-Cycle Savings Data
Loblolly                        Growth of Loblolly pine trees
Nile                            Flow of the River Nile
Orange                          Growth of Orange Trees
OrchardSprays                   Potency of Orchard Sprays
PlantGrowth                     Results from an Experiment on Plant Growth
Puromycin                       Reaction Velocity of an Enzymatic Reaction
Seatbelts                       Road Casualties in Great Britain 1969-84
Theoph                          Pharmacokinetics of Theophylline
Titanic                         Survival of passengers on the Titanic
ToothGrowth                     The Effect of Vitamin C on Tooth Growth in Guinea Pigs
UCBAdmissions                   Student Admissions at UC Berkeley
UKDriverDeaths                  Road Casualties in Great Britain 1969-84
UKgas                           UK Quarterly Gas Consumption
USAccDeaths                     Accidental Deaths in the US 1973-1978
USArrests                       Violent Crime Rates by US State
USJudgeRatings                  Lawyers' Ratings of State Judges in the US Superior Court
USPersonalExpenditure           Personal Expenditure Data
UScitiesD                       Distances Between European Cities and Between US Cities
VADeaths                        Death Rates in Virginia (1940)
WWWusage                        Internet Usage per Minute
WorldPhones                     The World's Telephones
ability.cov                     Ability and Intelligence Tests
airmiles                        Passenger Miles on Commercial US Airlines, 1937-1960
airquality                      New York Air Quality Measurements
anscombe                        Anscombe's Quartet of 'Identical' Simple Linear Regressions
attenu                          The Joyner-Boore Attenuation Data
attitude                        The Chatterjee-Price Attitude Data
austres                         Quarterly Time Series of the Number of Australian Residents
beaver1 (beavers)               Body Temperature Series of Two Beavers
beaver2 (beavers)               Body Temperature Series of Two Beavers
cars                            Speed and Stopping Distances of Cars
chickwts                        Chicken Weights by Feed Type
co2                             Mauna Loa Atmospheric CO2 Concentration
crimtab                         Student's 3000 Criminals Data
discoveries                     Yearly Numbers of Important Discoveries
esoph                           Smoking, Alcohol and (O)esophageal Cancer
euro                            Conversion Rates of Euro Currencies
euro.cross (euro)               Conversion Rates of Euro Currencies
eurodist                        Distances Between European Cities and Between US Cities
faithful                        Old Faithful Geyser Data
fdeaths (UKLungDeaths)          Monthly Deaths from Lung Diseases in the UK
freeny                          Freeny's Revenue Data
freeny.x (freeny)               Freeny's Revenue Data
freeny.y (freeny)               Freeny's Revenue Data
infert                          Infertility after Spontaneous and Induced Abortion
iris                            Edgar Anderson's Iris Data
iris3                           Edgar Anderson's Iris Data
islands                         Areas of the World's Major Landmasses
ldeaths (UKLungDeaths)          Monthly Deaths from Lung Diseases in the UK
lh                              Luteinizing Hormone in Blood Samples
longley                         Longley's Economic Regression Data
lynx                            Annual Canadian Lynx trappings 1821-1934
mdeaths (UKLungDeaths)          Monthly Deaths from Lung Diseases in the UK
morley                          Michelson Speed of Light Data
mtcars                          Motor Trend Car Road Tests
nhtemp                          Average Yearly Temperatures in New Haven
nottem                          Average Monthly Temperatures at Nottingham, 1920-1939
npk                             Classical N, P, K Factorial Experiment
occupationalStatus              Occupational Status of Fathers and their Sons
precip                          Annual Precipitation in US Cities
presidents                      Quarterly Approval Ratings of US Presidents
pressure                        Vapor Pressure of Mercury as a Function of Temperature
quakes                          Locations of Earthquakes off Fiji
randu                           Random Numbers from Congruential Generator RANDU
rivers                          Lengths of Major North American Rivers
rock                            Measurements on Petroleum Rock Samples
sleep                           Student's Sleep Data
stack.loss (stackloss)          Brownlee's Stack Loss Plant Data
stack.x (stackloss)             Brownlee's Stack Loss Plant Data
stackloss                       Brownlee's Stack Loss Plant Data
state.abb (state)               US State Facts and Figures
state.area (state)              US State Facts and Figures
state.center (state)            US State Facts and Figures
state.division (state)          US State Facts and Figures
state.name (state)              US State Facts and Figures
state.region (state)            US State Facts and Figures
state.x77 (state)               US State Facts and Figures
sunspot.month                   Monthly Sunspot Data, from 1749 to "Present"
sunspot.year                    Yearly Sunspot Data, 1700-1988
sunspots                        Monthly Sunspot Numbers, 1749-1983
swiss                           Swiss Fertility and Socioeconomic Indicators (1888) Data
treering                        Yearly Treering Data, -6000-1979
trees                           Girth, Height and Volume for Black Cherry Trees
uspop                           Populations Recorded by the US Census
volcano                         Topographic Information on Auckland's Maunga Whau Volcano
warpbreaks                      The Number of Breaks in Yarn during Weaving
women                           Average Heights and Weights for American Women
===========================     =========================================================================


US states facts and figures
---------------------------------------

.. index:: US states

Names of states::

	> datasets::state.name
	 [1] "Alabama"        "Alaska"         "Arizona"        "Arkansas"       "California"     "Colorado"      
	 [7] "Connecticut"    "Delaware"       "Florida"        "Georgia"        "Hawaii"         "Idaho"         
	[13] "Illinois"       "Indiana"        "Iowa"           "Kansas"         "Kentucky"       "Louisiana"     
	[19] "Maine"          "Maryland"       "Massachusetts"  "Michigan"       "Minnesota"      "Mississippi"   
	[25] "Missouri"       "Montana"        "Nebraska"       "Nevada"         "New Hampshire"  "New Jersey"    
	[31] "New Mexico"     "New York"       "North Carolina" "North Dakota"   "Ohio"           "Oklahoma"      
	[37] "Oregon"         "Pennsylvania"   "Rhode Island"   "South Carolina" "South Dakota"   "Tennessee"     
	[43] "Texas"          "Utah"           "Vermont"        "Virginia"       "Washington"     "West Virginia" 
	[49] "Wisconsin"      "Wyoming"       

Abbreviations of states::

	> datasets::state.abb
	 [1] "AL" "AK" "AZ" "AR" "CA" "CO" "CT" "DE" "FL" "GA" "HI" "ID" "IL" "IN" "IA" "KS" "KY" "LA" "ME" "MD" "MA"
	[22] "MI" "MN" "MS" "MO" "MT" "NE" "NV" "NH" "NJ" "NM" "NY" "NC" "ND" "OH" "OK" "OR" "PA" "RI" "SC" "SD" "TN"
	[43] "TX" "UT" "VT" "VA" "WA" "WV" "WI" "WY"


Longitudes and latitudes::

	> datasets::state.center
	$x
	 [1]  -86.7509 -127.2500 -111.6250  -92.2992 -119.7730 -105.5130  -72.3573  -74.9841  -81.6850  -83.3736
	[11] -126.2500 -113.9300  -89.3776  -86.0808  -93.3714  -98.1156  -84.7674  -92.2724  -68.9801  -76.6459
	[21]  -71.5800  -84.6870  -94.6043  -89.8065  -92.5137 -109.3200  -99.5898 -116.8510  -71.3924  -74.2336
	[31] -105.9420  -75.1449  -78.4686 -100.0990  -82.5963  -97.1239 -120.0680  -77.4500  -71.1244  -80.5056
	[41]  -99.7238  -86.4560  -98.7857 -111.3300  -72.5450  -78.2005 -119.7460  -80.6665  -89.9941 -107.2560

	$y
	 [1] 32.5901 49.2500 34.2192 34.7336 36.5341 38.6777 41.5928 38.6777 27.8744 32.3329 31.7500 43.5648 40.0495
	[14] 40.0495 41.9358 38.4204 37.3915 30.6181 45.6226 39.2778 42.3645 43.1361 46.3943 32.6758 38.3347 46.8230
	[27] 41.3356 39.1063 43.3934 39.9637 34.4764 43.1361 35.4195 47.2517 40.2210 35.5053 43.9078 40.9069 41.5928
	[40] 33.6190 44.3365 35.6767 31.3897 39.1063 44.2508 37.5630 47.4231 38.4204 44.5937 43.0504


Divisions::

	> datasets::state.division
	 [1] East South Central Pacific            Mountain           West South Central Pacific           
	 [6] Mountain           New England        South Atlantic     South Atlantic     South Atlantic    
	[11] Pacific            Mountain           East North Central East North Central West North Central
	[16] West North Central East South Central West South Central New England        South Atlantic    
	[21] New England        East North Central West North Central East South Central West North Central
	[26] Mountain           West North Central Mountain           New England        Middle Atlantic   
	[31] Mountain           Middle Atlantic    South Atlantic     West North Central East North Central
	[36] West South Central Pacific            Middle Atlantic    New England        South Atlantic    
	[41] West North Central East South Central West South Central Mountain           New England       
	[46] South Atlantic     Pacific            South Atlantic     East North Central Mountain          
	9 Levels: New England Middle Atlantic South Atlantic East South Central ... Pacific
	> table(datasets::state.division)

	       New England    Middle Atlantic     South Atlantic East South Central West South Central 
	                 6                  3                  8                  4                  4 
	East North Central West North Central           Mountain            Pacific 
	                 5                  7                  8                  5 


Area in square miles::

	> datasets::state.area
	 [1]  51609 589757 113909  53104 158693 104247   5009   2057  58560  58876   6450  83557  56400  36291  56290
	[16]  82264  40395  48523  33215  10577   8257  58216  84068  47716  69686 147138  77227 110540   9304   7836
	[31] 121666  49576  52586  70665  41222  69919  96981  45333   1214  31055  77047  42244 267339  84916   9609
	[46]  40815  68192  24181  56154  97914

Regions::

	> datasets::state.region
	 [1] South         West          West          South         West          West          Northeast    
	 [8] South         South         South         West          West          North Central North Central
	[15] North Central North Central South         South         Northeast     South         Northeast    
	[22] North Central North Central South         North Central West          North Central West         
	[29] Northeast     Northeast     West          Northeast     South         North Central North Central
	[36] South         West          Northeast     Northeast     South         North Central South        
	[43] South         West          Northeast     South         West          South         North Central
	[50] West         
	Levels: Northeast South North Central West
	> table(datasets::state.region)

	    Northeast         South North Central          West 
	            9            16            12            13 

Several statistics for the states::

	> head(datasets::state.x77)
	           Population Income Illiteracy Life Exp Murder HS Grad Frost   Area
	Alabama          3615   3624        2.1    69.05   15.1    41.3    20  50708
	Alaska            365   6315        1.5    69.31   11.3    66.7   152 566432
	Arizona          2212   4530        1.8    70.55    7.8    58.1    15 113417
	Arkansas         2110   3378        1.9    70.66   10.1    39.9    65  51945
	California      21198   5114        1.1    71.71   10.3    62.6    20 156361
	Colorado         2541   4884        0.7    72.06    6.8    63.9   166 103766

	> summary(datasets::state.x77)
	   Population        Income       Illiteracy       Life Exp         Murder          HS Grad     
	 Min.   :  365   Min.   :3098   Min.   :0.500   Min.   :67.96   Min.   : 1.400   Min.   :37.80  
	 1st Qu.: 1080   1st Qu.:3993   1st Qu.:0.625   1st Qu.:70.12   1st Qu.: 4.350   1st Qu.:48.05  
	 Median : 2838   Median :4519   Median :0.950   Median :70.67   Median : 6.850   Median :53.25  
	 Mean   : 4246   Mean   :4436   Mean   :1.170   Mean   :70.88   Mean   : 7.378   Mean   :53.11  
	 3rd Qu.: 4968   3rd Qu.:4814   3rd Qu.:1.575   3rd Qu.:71.89   3rd Qu.:10.675   3rd Qu.:59.15  
	 Max.   :21198   Max.   :6315   Max.   :2.800   Max.   :73.60   Max.   :15.100   Max.   :67.30  
	     Frost             Area       
	 Min.   :  0.00   Min.   :  1049  
	 1st Qu.: 66.25   1st Qu.: 36985  
	 Median :114.50   Median : 54277  
	 Mean   :104.46   Mean   : 70736  
	 3rd Qu.:139.75   3rd Qu.: 81163  
	 Max.   :188.00   Max.   :566432  

	 