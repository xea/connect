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
