module Sting(nextWisdom) where

import System.Random

wisdomSource = [ "Ebben nem értünk egyet. Én ennek a fordítottját gondolom. Pedig én a PHP 4 idejében is dolgoztam PHP-val (és más nyelvekkel is). A PHP pont, hogy a PHP 4 után vált alkalmassá komoly feladatokra is.",
                 "Egyrészt az \"általános célú nyelv\" nem azt jelenti, amit te a jelek szerint gondolsz róla.",
                 "Tehát az állítás, ami szerint \"szép csendben elkezdett lecserélődni a kódbázis\", - pusztán az idézettek alapján - alaptalan.",
                 "Hát, abból amit idéztél, konkrétan nem következik még az sem, hogy akár csak egyetlen sort is biztosan átírtak másik nyelvre. És ha mégis, akkor mit mire.",
                 "Ehhez képest az előbb még nem tudtad a rendes nevét sem, valamint a hack újdonságaként emlegetted. Nyilván azért, mert te annyira jól képben voltál.",
                 "Rajtad kívül senki nem mondtad, hogy az lenne. Amit én mondtam az volt, hogy ezek ellentétes irányúak az említett type hinting fejlesztésekkel.",
                 "De te nyilván ezt is tudtad. Csak jól titkolod.",
                 "Nem tudom mit gondolsz felőlük és nem is érdekel.",
                 "Én csak azt látom, hogy sem maguk a PHP és a Hack képességeit, terminológiáját nem ismereid, sem azt illetően abszolút nem vagy képben, hogy a Facebook milyen utakat járt be a PHP kapcsán, és milyen konzekvenciákat vont le ezekből.",
                 "Na, most képzeld el, hogy mennyire többet értenél a dinamikus nyelvekből és úgy általában a programozásból is, ha tudnád, hogy a Dart, a Hack és a TypeScript nem bevezeti a típusok koncepcióját - mert hogy azok dinamikus nyelvekben is alapból vannak -, hanem a paraméterek, mezők, stb. típusának ún. annotálását teszik lehetővé, illetve ennek lehetőségét bővítik ki (mert ugye pl. a PHP-ban ez eleve lehetséges, csak korlátozott körben).",
                 "Neked ez biztos teljesen új dolog, de a PHP-ban is van már \"optional typing\" (bár ezt úgy hívják szépen, hogy \"optional type hinting\") - azaz, meg lehet adni, rögzíteni lehet a paraméterek elvárt típusát a függvény- és metódusfejlécekben, amit aztán a futtatási környezet ki is kényszerít, illetve ellenőriz.",
                 "Ne csúsztassunk!",
                 "Vagy legalábbis sokkal jobb és megfelelőbb, mint akármelyik más szóba jöhető mainstream nyelv (pl. C++, C#, Java, stb.) lenne",
                 "Hanem, mert egyszerűen nekik a PHP volt a legjobb és ez ma is a legjobb nyelv.",
                 "Biztos nem esett le neked, mert nem néztél utána és mert én is csak háromszor írtam le, de Hack nem más, mint PHP kibővített változata.",
                 "Egyrészt ez a mondatot alapból értelmetlen.",
                 "Mondod te. A valóság ehhez képest az, hogy 2012-es keres(l)eti adatok a legkorábbiak. Legalább néztél volna már utána akkor, amikor mondják!",
                 "Ami ha így is lenne teljesen irreleváns lenne, mert nem erről beszélünk...",
                 "Nem mintha igazad lenne ebben - de még mindig ott vagyunk, hogy senki nem beszélt \"teljesítményről\"",
                 "Ezt különösen szép a te szádból hallani, amikor még arról sem tudtál, hogy a PHP-t FastCGI módban is lehet használni Apache alatt is.",
                 "Na, ezért rúgnálak ki páros lábbal az interjújról ha jelentkeznél hozzám, még akkor is, ha csak junior PHP fejlesztői pozícióra pályáznál...",
                 "Megrogytam érveid súlya alatt. Nem.",
                 "Ezzel tökéletesen cáfolja a hülyeséget, amit az Apache modulos dologról mondtál.",
                 "Ebben nem értünk egyet. Én ennek a fordítottját gondolom.",
                 "Meg. Ezért újra és újra elolvastam amit írtál, és megpróbáltam eltérő módokon értelmezni. De mindig hülyeségnek hangzott - így levontam a konzekvenciát, hogy ez azért van így, mert tényleg hülyeséget írtál.",
                 "Ezt akkor mondja valaki, amikor nem tudja és érti, hogy amiről beszélünk az, nem egy olyan rendszer, ami azt a hibát amiről beszélünk képes lenne \"tűrni\". Vagy amikor tudja és érti ezt, csak mellé akar beszélni.",
                 "Újabb hülyeség. Háromszorosan is. ",
                 "Na, ebből látszik, hogy igazán halvány lila gőzöd sincs miről beszélsz.",
                 "Ugyanis egyrészt nem minden kód ami a backend része, kell hogy egyben része legyen a számlakezelő logikának is.",
                 "Istenem. És egy ilyen ember képzeli magát programozónak. ",
                 "Én ilyent nem tettem. Már megint elbóbiskolhattál...",
                 "Meggyőzni te csak te tudod saját magad. Én csak a tényekkel tudlak szembesíteni. Aztán te eldöntheted, hogy elfogadod vagy továbbra is konokul tagadod őket.",
                 "Azt kérted, hogy mutassak példát arra a helyzetre, amikor az \"én világom az előnyösebb\". Ez megtörtént. Innentől kezdve rajtad áll, hogy elismered a dolgot, vagy tagadod, és ismét hülyét csinálsz magadból.",
                 "Öröm látni, hogy haladsz a megértésben. Ezek szerint van remény. Bár a többes számot nem értem.",
                 "Egyelőre jussunk el odáig, hogy egyáltalán megérted, hogy miről beszélek! Ha ez megvan, akkor állhatsz neki okoskodni arról, hogy hol és miben tévedek. De addig - mint láthatod - teljesen értelmetlen.",
                 "Azt észrevetted már, hogy megint egy hamis állítást fogalmaztál meg egy kérdésedben, és ezzel egy érvelési hibát követtél el?",
                 "Ha ez igaz is lenne, akkor is ennek pusztán említése is megint egy érvelési hiba.",
                 "Megleptél volna ha ez a mondatod is nem egy érvelési hiba lett volna.",
                 "A szép az egész hozzászólásodban, hogy bár nyilván valamiféle cáfolatnak szántad, de valójában csak az utolsó szóig megerősítetted azt, amit korábban írtam. És egyben cáfoltad azokat az állításokat, amiket a saját hozzászólásodban fogalmaztál meg.",
                 "Ha nem állandóan nettó hülyeségeket írnál tele érvelési hibákkal, nem lenne ez lenne az egyetlen dolog amit megállapíthatnék a kijelentéseidről. Én örülnék a legjobban annak, ha ez nem így lenne. Viszont amíg így van, addig sajnos ez az egyetlen amit érdemben értelmes ember válaszolni tud rájuk és neked.",
                 "Na, még egy ember, aki még mindig nem tudja, hogy mi a különbség a típusosság, és a statikus valamint a dinamikus típusosság/típusrendszer között... És ilyenekkel állok én le nap, mint nap vitatkozni...",
                 "Nem erről volt szó. Illetve pár amatőr leírt ilyen hülyeséget, de tőlem ilyent, hogy valamelyik nyelv általánosságban jobb, biztosan nem olvashattál itt.",
                 "Most, hogy megint leírtál pár valótlan ill. irreleváns dolgot...",
                 "Azt látom. Mármint, hogy nem érted. Pedig már többször is elmondtam.",
                 "Nem. Még egyszer mondom: ugyanannyi kód kell hozzá. Egy fél bájttal sem kell több.",
                 "Az igazi lényeg persze az, hogy míg a hozott JavaScript példa ugyanannyi sorból megvalósítható akkor is, ha nem valamilyen jól ismert módon felderíthető struktúrájú adatbázison, hanem valami teljesen egyedi, a programon belül deklarált adatelemekkel dolgozunk",
                 "Ha pl. a toString() helyett vagy mellé létrehozol egy toProduct() metódust is (amiben értelemszerűen select id helyett select * van), akkor máris megoldhatod, hogy közvetlenül a teljes cikket reprezentáló objektumot kaphasd vissza a tetszőleges közvetett referencia, egyedi azonosító alapján, ha éppen arra van szükséged vagy az a célszerű.",
                 "Nézd, ha nem érted, akkor azt mondd! Ne kényszeresed leszóld azt, amit nyilvalóan nem értesz, aminek következményeit nem látod át.",
                 "Egyrészt ismered az, aki tudja csinálja, aki nem, tanítja mondást?",
                 "Másrészt ugye azt is tudod, mi az én racionális logikai következtetésemmel megpróbálni szembeállítani valaki más véleményét, pusztán azon az alapon, hogy az illető valami főiskolai tanár? Bizony: A te érvelési hibád: Tekintélyre hivatkozás"
                 "Látom megint elbóbiskoltál két hozzászólás között az asztalon, és álmodtál valamit. ",
                 "Mással - mint egy álommal - legalábbis nem tudom megmagyarázni, hogy te honnan vetted ezt a kijelentést, amikor sem a \"káros\" szó, sem a redundancia bármiféle minősítése nem szerepelt a hozzászólásban, amire válaszoltál.",
                 "Fogalmazthatsz úgy is - csak ennek a kijelentésnek semmi értelme nincs. Mert a tervezésnek semmi köze nincs a redundanciához. Ezek ortogonális fogalmak.".
                 "A redundancia és a plusz deklarációk nem igényelnek nem hogy több, de egyáltalán semmiféle tervezést. Csak kétszer vagy többször kell beírni ugyanazt.",
                 "Ami megint egy teljesen téves következtetés részedről. Hiszen utóbbiból nem az következik, amit te állítasz, hogy feltétlenül kevésbé lesz validálva az adat a programban.",
                 "Ez a te szubjektív, de teljesen irracionális álláspontod. Racionálisan azonban fejlesztő és a végfelhasználó érdeke is az, hogy a program egészen addig ne jelezzen hibát (illetve egészen pontosan addig ne akadjon meg a futása - mert a háttérben azért notice szinten naplózhat ilyeneket, mint ahogy sok dinamikus nyelv lehetővé is teszi), amíg helyesen tud működni.",
                 "Ez csak amellett érv, hogy miért nem szabad pl. neked soha sem a statikus nyelvterületen kívülre merészkedned. Ha érted mire célzok...",
                 "Nem hiszem el, hogy ezt képes voltál leírni.... Ha komolyan gondoltad, akkor azért, ha meg tudtad, hogy hülyeség, akkor azért.",
                 "Lényeg a lényeg: egy pénzügyi rendszerben a frontend hibája éppen olyan (anyagi értelemben is) súlyos problémákat, illetve károkat okozhat, mint a backend hibája.",
                 "Hát ez az. Hogy leírtál valamit, hogy az úgy van, amit azonban nem hogy tényinformációkkal nem tudtál igazolni, de még logikusnak ható érvet, logikai láncot sem tudtál odarakni mögé, hogy ti. miért lenne logikus, hogy úgy legyen.. Éppen erről beszélek.",
                 "És igen. Megint nem értetted meg. Hogy ti. itt se mondta senki, hogy azért használj node.js-t, mert az eBay és a PayPal is azt használja. Hanem mindössze azt a logikai ugrást követte el, amit te is. Hogy ti. azt mondta, hogy ha az eBay és a PayPal is használják, akkor az biztosan azért van, mert a node.js még a legmagasabb elvárásoknak is megfelel - tehát bárki másnak is jó lesz.",
                 "Már megint semmi értelme nincs annak amit mondasz.",
                 "Annak amiről te beszélsz (ti. hogy többfajta frontendje is van a PayPal-nak), egyszerűen semmi köze nincs ahhoz, amit én írtam (ti. tök mindegy, hogy egy szolgáltatásveremből a backend vagy a frontend esik ki, mert ugyanúgy megbénul). Ennél fogva pedig előbbi nem is cáfolhatja utóbbit.",
                 "Ja, hogy te nem tudod, hogy a PayPal egyes REST API-jait is (ha ugyan nem az összeset) a node.js biztosítja? Na, ezért nem érted te ezt az egész dolgot, amiről beszélünk.",
                 "Hát ez speciel megint hülyeség. Egyrészt, mert egy ilyen alkalmazásban éppen annyira megengedhetetlen adatok téves megjelenítése is. ",
                 "Persze mindez amúgy tök irreleváns adott esetben, hiszen a node.js nem csak az UI kezelésében, és nem csak a frontendben kerül felhasználásra.",
                 "Nincs sok logika abban amit mondasz. ",
                 "Ha előbbi nem megy, utóbbi se tud csinálni semmit, hiszen minden műveletet a frontendről lehet indítani és a frontend felé adja vissza az eredményeket.",
                 "Ezzel összefüggésben az is nyilvánvaló, hogy a PayPal-nál minden adat, amit majd a backend feldolgoz, a frontenden is átmegy (ti. vagy onnan származik, vagy ott jelenik majd meg)",
                 "Ezzel összefüggésben a PHP igenis nem, hogy általános célú nyelv, de pontosan annyira általános célú, mint a C++." ]

randomId :: IO Int
randomId = randomRIO (0, (length wisdomSource) - 1)

getWisdom :: IO Int -> IO String
getWisdom i = fmap (\x -> wisdomSource !! x) i

nextWisdom :: IO String
nextWisdom = getWisdom randomId

-- vim: sw=2:ts=2:et
