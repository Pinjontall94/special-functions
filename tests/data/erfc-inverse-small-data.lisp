;;; -*- Mode: LISP; Base: 10; Syntax: ANSI-Common-Lisp; Package: SPECIAL-FUNCTIONS-TESTS -*-
;;; Copyright (c) 2020 by Symbolics Pte. Ltd. All rights reserved.
(in-package #:special-functions-tests)

;;; Original (C) Copyright John Maddock 2006.
;;; Use, modification and distribution are subject to the Boost
;;; Software License, Version 1.0. (See
;;; http://www.boost.org/LICENSE_1_0.txt)
;;; Source: https://github.com/boostorg/math/blob/c4972b02143b787387560f87238e50f55502834e/test/test_gamma_data.ipp

;;; Also see how the data is called by tests at:
;;; https://scm.cs.kuleuven.be/scm/svn/numerics_software/boost_1_59_0/libs/math/performance/test_gamma.cpp

#| From the Boost testing:
https://github.com/boostorg/math/blob/c4972b02143b787387560f87238e50f55502834e/test/test_gamma.hpp

The actual test data is rather verbose, so it's in a separate file.

Each row is organised as follows:

Col  Description
 0   Parameter x
 1   erfc(x)
|#

(defparameter erfc-inverse-small-data
  #2A((0.5460825444184401149953083908674803067585e-4312 99.62016927389407649911084501709563799849)
      (0.2645475979732877501542006305722535728925e-4291 99.38083815930157675670279543643240126733)
      (0.4647218972549971591905525747707221131215e-4281 99.26209205835381203650501813598769577392)
      (0.1525121257807440558802279626797226161005e-4243 98.82602533559047574603223381461761500878)
      (0.1981708500756372844759510276075956268897e-4234 98.71980149740490464004477100962342642155)
      (0.3841754068409692466399340503654464602243e-4180 98.08467819532462847486581213069198608289)
      (0.5335004017651487579647125338582580235046e-4091 97.03275964437690000965320992419441429924)
      (0.1806383895924070461510470704435189756123e-4076 96.86022098874718527180735862424264805433)
      (0.1321513657594592521699131916159148731226e-4066 96.7429083707271579347385166737183074303)
      (0.1054920495502343332517378247415093412624e-4043 96.46999015250599733880053488460821308812)
      (0.47363892632169499253148937212672347289e-4043 96.46220643869959630846141605535921442023)
      (0.4750819439081903839348296656606873483722e-4000 95.94763372873564880985964950938277645413)
      (0.5934696803923580795229088781443547003391e-3998 95.92247396394370347463100485254034797278)
      (0.2809661603171360146097006130839773212914e-3996 95.90236599111862577117586443056337455754)
      (0.201344506190345013258215914381814651279e-3981 95.72387427307012892119049758800169512382)
      (0.1349680361063247504563298949422573179728e-3978 95.68987765258188263846875190956134957764)
      (0.9554154264888789862328696045397641686626e-3961 95.47488611856686267812468521780070611561)
      (0.4565370419999699854685454921616341777152e-3921 94.99523139627283958425843803677334678489)
      (0.9326136640408284179797117117017987832624e-3838 93.98018858040542889098559401088499617323)
      (0.2085705673165100591822581196874037577838e-3788 93.37371566951938600144821032880068555931)
      (0.28906230618616666278153940715368369251e-3788 93.37196812654735398207358428222836165935)
      (0.540152632181355759951616925660164590124e-3750 92.89890240230691810677222482470759338646)
      (0.1373243759745268803582425259844487470076e-3682 92.05981131540500971264194940023399842876)
      (0.3331647658738942966983713783383120828716e-3653 91.69161143487247689253830777510103757803)
      (0.134842155208242065478707324403653741427e-3641 91.54576292987357613504022634708802175022)
      (0.7492191291954483620899871520373510239375e-3623 91.30973569873630381671516956816451328373)
      (0.2551662007977519576358324440130450442778e-3575 90.70847518912252606205543434018735665529)
      (0.6190686739111601149790106116510494551314e-3563 90.55115617451523669098548678613430984841)
      (0.9276632609820886396580236856359763026966e-3447 89.06191184952516547664083098302741022803)
      (0.6433072193358217453796447947689324967478e-3351 87.8143275613841604460220844122740180476)
      (0.3653541017426498234750653436978737170327e-3338 87.64696333406539636312319479272468979115)
      (0.2789596742720445243557533363147985407484e-3305 87.21398755358298377575097222058344254911)
      (0.443825473802222651705813573190067261172e-3131 84.88340554604607048910870088690204110131)
      (0.3345784652046112831225855034049282590715e-3126 84.81723263217786918755009758623351862559)
      (0.2414445336524691790354556146640969706061e-3069 84.0419598414264046587129844579410948894)
      (0.8478603490304246265311990779170856959861e-3028 83.47092766845828325139370216002957076776)
      (0.14740427247445948990191590432902058536e-2997 83.05281564078241081289202980345540186102)
      (0.1329036517699801662619770631013011165738e-2944 82.31552494008283774947792893056404158871)
      (0.1706141285384843345987169410441595650031e-2933 82.16002264325748303060260330185689090281)
      (0.8373844481146949976640588846233709740831e-2929 82.09426838736262780476565867158939922013)
      (0.6495088549453856516509184167801252067894e-2926 82.05373670564597872871969963977451713693)
      (0.1833720938105362893360888392913141441369e-2882 81.44184518033949369735162216055497263014)
      (0.2333520177487467820415573739119469955902e-2879 81.39794775935971788819430665383756478382)
      (0.2894427653993793412567889456980821259226e-2847 80.94277839157518781341184937011412770395)
      (0.2604952067990663450155633194749904382233e-2836 80.78683208931494064074748747620852519014)
      (0.8678138849264725191436450361584810016324e-2832 80.72235938139247087444254555436435678849)
      (0.3682667903200544588455731527142145038363e-2781 79.99708530932539906643334265914340895581)
      (0.4588121885193651068401508885826145226945e-2766 79.77955734877589476980263452200168409691)
      (0.7764413237799866858364453900343995777469e-2765 79.76182876388495108788138224124277407448)
      (0.2423421525461451159440550098196593570056e-2760 79.69693586691073000502029265856910229446)
      (0.5878986254507577903335876253702952707265e-2746 79.48887849840574283826340114327272440985)
      (0.1673845625470905295897015228985949168928e-2737 79.36634262823360407978363436458177566234)
      (0.6698391998725201197546429856824581586977e-2735 79.32858818851906731315743566169843426962)
      (0.2515130355594925802647014162660517938496e-2725 79.18952171986121353050089556124781639244)
      (0.2461647325252598254899739145066165462755e-2636 77.88509727460664014637457387303638162253)
      (0.1641105794585019759166735829835878355641e-2634 77.85813389734403078489439365068353770847)
      (0.6351595345143555864526860293158388570963e-2601 77.35991719682138597284770268761692627695)
      (0.9223028410198721360701049566280075593579e-2545 76.51960497818744876859269133142591483997)
      (0.5002814464212067387766735395165041257035e-2533 76.34286436673947487064698531398136817799)
      (0.1185824625931586847282481488476410873355e-2519 76.14091514413348192509930444973601480465)
      (0.257414900548022702014576953401369926289e-2493 75.74167889782762540410788473501883567486)
      (0.9183566141599824732209230606531307948203e-2490 75.68766731518135433104337024242062602941)
      (0.2932809029313999449803475825227510422988e-2473 75.43622352043665347320282000269125370548)
      (0.5498724163832736366794865810754062391466e-2467 75.34043418668345319181733147217173430757)
      (0.6795395146348654066574869189625572073492e-2451 75.09414895042043847993638837712888889371)
      (0.4232772623968377298803745728444220344828e-2398 74.2804044020029126990405093970664224902)
      (0.437705010214781194544970904918846009988e-2382 74.0317968899859238324605680410762845653)
      (0.7328784181257135130009299062120147357384e-2332 73.24665809155865681149475856856425835323)
      (0.8195784402152374810490855567845040936044e-2295 72.6620497559170838922485865519610574788)
      (0.8987013844942659551846558843047951168834e-2288 72.55042905061235174343554742739711560742)
      (0.2390567310984670056453397739020313330694e-2193 71.03636046035780611691848769848245798184)
      (0.4332167143233490736155663100970351222456e-2185 70.90240600026913612396368503494705740935)
      (0.108890416531056942890760795215821213854e-2164 70.57040795030909610470208299858512551923)
      (0.5060627104045047637085866910481125331788e-2163 70.54320633525883330072442815574897293795)
      (0.3691223561779676390769470042383461854014e-2122 69.87319260661719659265781125754219708719)
      (0.6969547608629390600217634449465487521466e-2099 69.48865744111861740557954052160177140024)
      (0.1920331015960815466646483904103550820861e-2096 69.44822094478638613766926468731012767531)
      (0.6083975528963974425124099594841117907605e-2016 68.1007710158724367714118546612371304706)
      (0.7700980458334894771243720474212758259757e-2007 67.94673150215833308050516745181191739631)
      (0.3784507382437993534366757035181644553005e-2006 67.93501557417646729265187361704446762791)
      (0.1933058527290172128745148456282632896472e-2000 67.8382198195958948309248955546035843938)
      (0.3073129169339213242656468129490128120275e-1912 66.32462247762686573271005635222158246919)
      (0.3563704808140633534254743351059329459844e-1867 65.53779859486217889665515029788703171428)
      (0.1117328435404434848431164536157383381954e-1865 65.5115114749327337441199600755950731015)
      (0.162291367493531393505178202172746460504e-1863 65.47350810130320090152901346075787089108)
      (0.7291877778593992272357923862974438803504e-1814 64.59461716634387479104306278695990989692)
      (0.1103697274312455454535522513124420450513e-1800 64.35930484119184106703256655579503018943)
      (0.2787184985694988691274106077027481674296e-1777 63.93935283526837024038868862230807595467)
      (0.2242899394948684173448369886336215330859e-1736 63.19860571879709151914226858360392775225)
      (0.6373703493315477830264234158158397230918e-1648 61.5663708938977044791256528616543682363)
      (0.1130761791970139872085460502062402383311e-1534 59.4111793960172436477860564668325556624)
      (0.5186477168932786698797072956323906176672e-1526 59.24311964529112251267296011750890265511)
      (0.2371756563156473396673371175154689282089e-1487 58.48710687097943040207443293838886041518)
      (0.2474530000251364788339443399087025927602e-1487 58.48674428195209156566913277116595315737)
      (0.1620952363661926127361288574589236587446e-1465 58.05577331395656272747602508275617390989)
      (0.2122625807107458215797391334648973459688e-1429 57.33517766371867417445655972866006304427)
      (0.6243197332907990298222556346398382173979e-1405 56.8418011386019473870793880887159457241)
      (0.5516957459853521159388169416018722269647e-1400 56.74154440911648902947449827969373477014)
      (0.2926235914834555267234269989321844626118e-1369 56.11477468249401615221533062929223131088)
      (0.3794627523015867743608205312364027747225e-1312 54.93070214218908343008136754660768021631)
      (0.318880483330771111942926508195676807607e-1300 54.68024803482526161939511993227336637443)
      (0.3369469880227599686172744089074258905398e-1300 54.67974419399797522074814528351877319048)
      (0.1302713766629726626489873195118034634277e-1298 54.64631892482891526341853652123547792494)
      (0.2469170628653646881926626888059718255132e-1223 53.03693750856997083336291247307325166587)
      (0.1371607091728437802604087975394383012252e-1207 52.69411504628090115129531887668248361258)
      (0.1731629169156886034424126010604259325511e-1111 50.55126123375417963154846480444273825353)
      (0.1988578488030194560097782052960341565225e-1101 50.32166883510982608447898399736737553384)
      (0.2274776484360344132543141099781042532126e-1078 49.79143524779148474319978052812994435046)
      (0.5627666511768513324968956052244126556016e-1045 49.01338231598138050658354300270473769631)
      (0.1825674918577823738426304992234296317652e-1041 48.93085667837639283695386917651720233174)
      (0.3802925527627705362359485795331572740116e-1032 48.71115012911996883239788333878826905934)
      (0.704333512302902280929638896129066471028e-1023 48.49165994415978768781022851843247093366)
      (0.1313561715183354223096034930474262234265e-978 47.429170762115701641491822625509511735)
      (0.1479971733547495818402245675295016370485e-972 47.28207432819548183826826245137119654147)
      (0.1347434440250964238000754812764303681229e-956 46.89195339639151403964904162145015071721)
      (0.1121116975652110010815188524143927325837e-910 45.75090030899601472255890798805286514432)
      (0.6537208325713531384544436742840979538836e-903 45.55510822465697895367331173242574718725)
      (0.5260776239804675672628897143432967891746e-862 44.50957576907949796448736564849939576426)
      (0.9950661094879265377710346605980409852453e-836 43.8248018686713805421278904903492358615)
      (0.2062512012152859485600938747081581263563e-777 42.26547837659956767422521162018458102221)
      (0.1860519246978454733361447959343549701547e-773 42.15763210320445259646388169147606822404)
      (0.292259268934242545722820123169012540872e-772 42.12496313029953419941505368125427033208)
      (0.2655070971534510004697091453590968778995e-739 41.21462174108933535284728637920523260807)
      (0.2901429667218951401071997769907995675312e-725 40.82070209799865627866597450674844815644)
      (0.2691466393457144658729027931985645462202e-709 40.36799005611971249179085189213378251021)
      (0.3197098867400748771350059689777583564847e-690 39.82043439287531202279866114834532850691)
      (0.509206568051986013963235738541488132177e-677 39.43700823628539555409237521877515418161)
      (0.3582760294415859512291360611861492812312e-668 39.17795922357671427001830102855480201337)
      (0.7456401788156278694200104791854742334257e-668 39.16860717559069454303739314459059279729)
      (0.1879442582827104576451480885999452191966e-655 38.80249559566898835529327655718231853047)
      (0.3684861623635251188317018685920580219909e-651 38.67497066678513891028432141977632830295)
      (0.5300532049641075447010094275260357817648e-632 38.10059865129674828052108905587617617209)
      (0.254919090870011244639387672109478129648e-628 37.98921207590422610976320034158408446716)
      (0.1261526994355170599813296346837863228294e-566 36.07180567207263624533709617168647173026)
      (0.3348102113183452824057762060804616114175e-551 35.57631428343251267029769551692709310927)
      (0.3615878633639651283997811017708582782249e-540 35.21759342981655987654847385348063502236)
      (0.8556456214239050595803534051499578042028e-537 35.10716335050071391896400132832542452084)
      (0.109310372545754088817907678327638735624e-531 34.93937406241154814427167189866546786437)
      (0.6542713735351179620273602253478996592612e-503 33.97831683163889299935986132301256667123)
      (0.2612280308120653787093215442892321688194e-493 33.65156678099809689208816819469703821624)
      (0.1022554993887925308488446602367781896336e-479 33.18348488984914247206612191269120081123)
      (0.2031774862883333653515762991534010669034e-436 31.64637875978842562095759897711662201891)
      (0.6588827942394778508739583209849917530674e-435 31.59139083855039387728200786192864837174)
      (0.3663469071718277378831360961951773982499e-412 30.75175430540050080137890276895073229866)
      (0.1361305298482799765369196276048348425522e-395 30.12535428053783863012447180563559906292)
      (0.3744171560141971093473580527502555697533e-390 29.91687192152261750809710487517869880922)
      (0.6874405809297488106605573621300258853644e-383 29.63617622599272249872842949718868018609)
      (0.1459704391344155418984387882925473942446e-354 28.51518995595697899285114107951299228827)
      (0.143123157725799928952051937462499680388e-336 27.77976460222037023739857761278401004959)
      (0.9025996658203895649285047801834901806925e-333 27.62194204731470015756869063464069373815)
      (0.1293287994487535182921055345118992149121e-330 27.53198333089873848069767951797741434292)
      (0.1040364789689237257780791904879173249974e-287 25.67656975866313564221220720210665888424)
      (0.2450719147172718682892603854216257656211e-282 25.43473899116627259523415573506406682191)
      (0.1540635014300999959290867576988859893076e-280 25.35326739382267978364899192426764093558)
      (0.1611739209855438499046222515484436760851e-273 25.03273169525729329624232590800413859205)
      (0.2781078901633922872827030068281452871724e-257 24.27512000889987237167959986465966890736)
      (0.8837820681846044382839818307987545000847e-230 22.93495456229819340317355998004446065241)
      (0.2845511846316072211634522373099423142668e-217 22.29887672117465208331735160799934601323)
      (0.662011186385949636511655220013184768187e-212 22.02033498263166080103335807537366542004)
      (0.1113036584088835972703336205837326051999e-204 21.63966022176108818726656867477709317659)
      (0.891278753475701910699424577762349195273e-195 21.10677883438545215904960900943812596651)
      (0.1243375606125932867518669565282002251187e-191 20.93474611896499049089384377937974962862)
      (0.963481566993839758726177317091390488753e-188 20.72000418866581389344212197908962674052)
      (0.1401265332225531798315780528328964001988e-167 19.56909048260682534539216053987194710384)
      (0.7560947579095629715718115752684784187336e-154 18.74494560773490096872968649468667611647)
      (0.2179858592534951368829782528927445425064e-151 18.59346814776643084908600446605555382182)
      (0.5208405693419352209961246987938629746382e-131 17.28776816936911830963159975455855394785)
      (0.5376896865772724579278898126622880802843e-127 17.01882418428649428645068852272615582504)
      (0.1449951754876351411423239477096839160613e-114 16.15763261758311680195806763260744183267)
      (0.3189212836315126918184908007667112228414e-108 15.70012576642621709878560027430710336585)
      (0.1297369886602648502231884634897739722895e-107 15.65546665388935777226018284593032382368)
      (0.2602821327589283546034644516083144727197e-103 15.33647743152077165227354683273671003413)
      (0.1590035594081776210615338926776093483999e-96 14.81946110818452708436758045284808001241)
      (0.2720908074515874075065365442027770927174e-96 14.80136596875698966601900922593357151598)
      (0.3706750818860597777102228512408751197629e-87 14.07473190298865115531360325271322276549)
      (0.3489539664837006993042769801460156282803e-83 13.74669364199157990777768669458685265472)
      (0.1947620269151566018960312643171165602404e-79 13.43009987431500967622734624289673694188)
      (0.5129832297533069185312436951335270626736e-73 12.86957639029561313119037589037764922829)
      (0.9272206234111032518003166213125699095688e-70 12.57574048509944911276422466059543556873)
      (0.1460449453933976163637836336160553873706e-68 12.46599637375040876166599138465603014844)
      (0.8768204308820258161647995326423963318019e-68 12.39412855962299302779918858089973570208)
      (0.3176564512338672251415481009303329209995e-61 11.77127316747622053532997731227084711173)
      (0.1172937774279091349820752991146331290881e-54 11.11297358832626209702547835299261897395)
      (0.3822700066028246575792241970441049035743e-52 10.85058828114725350216779162566256390403)
      (0.4793602326185941396320885530096873382082e-41 9.607343723542133339487829511083057069273)
      (0.106201511009181306109371950926034372112e-40 9.566077632118694585964030456246300276422)
      (0.1026229395621872573137267432392849554594e-24 7.413111396559360630306454710337113823294)
      (0.1433834013674021626308791056277965507134e-19 6.574536501026477531602186421374903506051)
      (0.2287484604245551701383736767135709586086e-12 5.183672646329402197657171322814515766894)
      (0.4054382118091501052221361988694253843776e-11 4.903978376537783549083010816442468785255)
      (0.5517250582467272934968166422809728429772e-9 4.386634719241854622420456791837035899963)
      (0.1708920553446964553659243704866375034024e-5 3.383585107532389209677350898502297644278)
      (0.2892930668406028955896934416060055101499e-5 3.308042643013470022433136596357284983766)
      (0.7029998339557698614154475319387477445787e-5 3.17687395056466498458108882620439294841)
      (0.3973417837559780922949941034264323413971e-4 2.90551585834893682957467771364140403613)
      (0.04246334897368917726269942070072005435577 1.434684541881674882915735690265484394337)
      (0.159920364968560744996532371753339418774 0.9937250495458864822841753804433979428041)
      (0.2425390104583346613758947085681683120129 0.826370276571483139432927467391341431105)
      (0.7954739362140872788414606986417965117653 0.1832884885283639734589195991287031281603)
      (0.9236374866673857278562449757419727802699 0.06777816075457032123722158048171767182127)))

