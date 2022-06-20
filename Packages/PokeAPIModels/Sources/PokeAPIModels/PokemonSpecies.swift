//
//  PokemonSpecies.swift
//  
//
//  Created by Kamaal M Farah on 20/06/2022.
//

import Foundation

public struct PokemonSpecies: Codable, Hashable, Identifiable {
    public let id: Int
}

// let sample = """
// {
//    "base_happiness": 50,
//    "capture_rate": 45,
//    "color": {
//        "name": "blue",
//        "url": "https://pokeapi.co/api/v2/pokemon-color/2/"
//    },
//    "egg_groups": [
//        {
//            "name": "monster",
//            "url": "https://pokeapi.co/api/v2/egg-group/1/"
//        },
//        {
//            "name": "water1",
//            "url": "https://pokeapi.co/api/v2/egg-group/2/"
//        }
//    ],
//    "evolution_chain": {
//        "url": "https://pokeapi.co/api/v2/evolution-chain/3/"
//    },
//    "evolves_from_species": {
//        "name": "wartortle",
//        "url": "https://pokeapi.co/api/v2/pokemon-species/8/"
//    },
//    "flavor_text_entries": [
//        {
//            "flavor_text": "A brutal POKéMON\nwith pressurized\nwater jets on its shell. They are\nused for high\nspeed tackles.",
//            "language": {
//                "name": "en",
//                "url": "https://pokeapi.co/api/v2/language/9/"
//            },
//            "version": {
//                "name": "red",
//                "url": "https://pokeapi.co/api/v2/version/1/"
//            }
//        },
//        {
//            "flavor_text": "A brutal POKéMON\nwith pressurized\nwater jets on its shell. They are\nused for high\nspeed tackles.",
//            "language": {
//                "name": "en",
//                "url": "https://pokeapi.co/api/v2/language/9/"
//            },
//            "version": {
//                "name": "blue",
//                "url": "https://pokeapi.co/api/v2/version/2/"
//            }
//        },
//        {
//            "flavor_text": "Once it takes aim\nat its enemy, it\nblasts out water with even more\nforce than a fire\nhose.",
//            "language": {
//                "name": "en",
//                "url": "https://pokeapi.co/api/v2/language/9/"
//            },
//            "version": {
//                "name": "yellow",
//                "url": "https://pokeapi.co/api/v2/version/3/"
//            }
//        },
//        {
//            "flavor_text": "It deliberately\nmakes itself heavy\nso it can with­ stand the recoil\nof the water jets\nit fires.",
//            "language": {
//                "name": "en",
//                "url": "https://pokeapi.co/api/v2/language/9/"
//            },
//            "version": {
//                "name": "gold",
//                "url": "https://pokeapi.co/api/v2/version/4/"
//            }
//        },
//        {
//            "flavor_text": "The rocket cannons\non its shell fire\njets of water capable of punch­\ning holes through\nthick steel.",
//            "language": {
//                "name": "en",
//                "url": "https://pokeapi.co/api/v2/language/9/"
//            },
//            "version": {
//                "name": "silver",
//                "url": "https://pokeapi.co/api/v2/version/5/"
//            }
//        },
//        {
//            "flavor_text": "It firmly plants\nits feet on the\nground before shooting water\nfrom the jets on\nits back.",
//            "language": {
//                "name": "en",
//                "url": "https://pokeapi.co/api/v2/language/9/"
//            },
//            "version": {
//                "name": "crystal",
//                "url": "https://pokeapi.co/api/v2/version/6/"
//            }
//        },
//        {
//            "flavor_text": "BLASTOISE has water spouts that\nprotrude from its shell. The water\nspouts are very accurate. They can
// shoot bullets of water with\nenough accuracy to strike empty cans\nfrom a distance of over 160 feet.",
//            "language": {
//                "name": "en",
//                "url": "https://pokeapi.co/api/v2/language/9/"
//            },
//            "version": {
//                "name": "ruby",
//                "url": "https://pokeapi.co/api/v2/version/7/"
//            }
//        },
//        {
//            "flavor_text": "BLASTOISE has water spouts that\nprotrude from its shell. The water\nspouts are very accurate.They can shoot
// bullets of water with\nenough accuracy to strike empty cans\nfrom a distance of over 160 feet.",
//            "language": {
//                "name": "en",
//                "url": "https://pokeapi.co/api/v2/language/9/"
//            },
//            "version": {
//                "name": "sapphire",
//                "url": "https://pokeapi.co/api/v2/version/8/"
//            }
//        },
//        {
//            "flavor_text": "The waterspouts that protrude from its\nshell are highly accurate. Their bullets of\nwater can precisely nail tin cans from\na distance of over 160 feet.",
//            "language": {
//                "name": "en",
//                "url": "https://pokeapi.co/api/v2/language/9/"
//            },
//            "version": {
//                "name": "emerald",
//                "url": "https://pokeapi.co/api/v2/version/9/"
//            }
//        },
//        {
//            "flavor_text": "It crushes its foe under its heavy body\nto cause fainting. In a pinch, it will\nwithdraw inside its shell.",
//            "language": {
//                "name": "en",
//                "url": "https://pokeapi.co/api/v2/language/9/"
//            },
//            "version": {
//                "name": "firered",
//                "url": "https://pokeapi.co/api/v2/version/10/"
//            }
//        },
//        {
//            "flavor_text": "The pressurized water jets on this brutal\nPOKéMON’s shell are used for high-\nspeed tackles.",
//            "language": {
//                "name": "en",
//                "url": "https://pokeapi.co/api/v2/language/9/"
//            },
//            "version": {
//                "name": "leafgreen",
//                "url": "https://pokeapi.co/api/v2/version/11/"
//            }
//        },
//        {
//            "flavor_text": "The jets of water it spouts from\nthe rocket cannons on its shell\ncan punch through thick steel.",
//            "language": {
//                "name": "en",
//                "url": "https://pokeapi.co/api/v2/language/9/"
//            },
//            "version": {
//                "name": "diamond",
//                "url": "https://pokeapi.co/api/v2/version/12/"
//            }
//        },
//        {
//            "flavor_text": "The jets of water it spouts from\nthe rocket cannons on its shell\ncan punch through thick steel.",
//            "language": {
//                "name": "en",
//                "url": "https://pokeapi.co/api/v2/language/9/"
//            },
//            "version": {
//                "name": "pearl",
//                "url": "https://pokeapi.co/api/v2/version/13/"
//            }
//        },
//        {
//            "flavor_text": "The jets of water it spouts from\nthe rocket cannons on its shell\ncan punch through thick steel.",
//            "language": {
//                "name": "en",
//                "url": "https://pokeapi.co/api/v2/language/9/"
//            },
//            "version": {
//                "name": "platinum",
//                "url": "https://pokeapi.co/api/v2/version/14/"
//            }
//        },
//        {
//            "flavor_text": "It deliberately makes itself heavy\nso it can withstand the recoil\nof the water jets it fires.",
//            "language": {
//                "name": "en",
//                "url": "https://pokeapi.co/api/v2/language/9/"
//            },
//            "version": {
//                "name": "heartgold",
//                "url": "https://pokeapi.co/api/v2/version/15/"
//            }
//        },
//        {
//            "flavor_text": "The rocket cannons on its shell fire\njets of water capable of punching\nholes through thick steel.",
//            "language": {
//                "name": "en",
//                "url": "https://pokeapi.co/api/v2/language/9/"
//            },
//            "version": {
//                "name": "soulsilver",
//                "url": "https://pokeapi.co/api/v2/version/16/"
//            }
//        },
//        {
//            "flavor_text": "Les trombes d’eau projetées par\nles canons de sa carapace peuvent\npercer le métal le plus résistant.",
//            "language": {
//                "name": "fr",
//                "url": "https://pokeapi.co/api/v2/language/5/"
//            },
//            "version": {
//                "name": "black",
//                "url": "https://pokeapi.co/api/v2/version/17/"
//            }
//        },
//        {
//            "flavor_text": "The jets of water it spouts from\nthe rocket cannons on its shell\ncan punch through thick steel.",
//            "language": {
//                "name": "en",
//                "url": "https://pokeapi.co/api/v2/language/9/"
//            },
//            "version": {
//                "name": "black",
//                "url": "https://pokeapi.co/api/v2/version/17/"
//            }
//        },
//        {
//            "flavor_text": "Les trombes d’eau projetées par\nles canons de sa carapace peuvent\npercer le métal le plus résistant.",
//            "language": {
//                "name": "fr",
//                "url": "https://pokeapi.co/api/v2/language/5/"
//            },
//            "version": {
//                "name": "white",
//                "url": "https://pokeapi.co/api/v2/version/18/"
//            }
//        },
//        {
//            "flavor_text": "The jets of water it spouts from\nthe rocket cannons on its shell\ncan punch through thick steel.",
//            "language": {
//                "name": "en",
//                "url": "https://pokeapi.co/api/v2/language/9/"
//            },
//            "version": {
//                "name": "white",
//                "url": "https://pokeapi.co/api/v2/version/18/"
//            }
//        },
//        {
//            "flavor_text": "The jets of water it spouts from\nthe rocket cannons on its shell\ncan punch through thick steel.",
//            "language": {
//                "name": "en",
//                "url": "https://pokeapi.co/api/v2/language/9/"
//            },
//            "version": {
//                "name": "black-2",
//                "url": "https://pokeapi.co/api/v2/version/21/"
//            }
//        },
//        {
//            "flavor_text": "The jets of water it spouts from\nthe rocket cannons on its shell\ncan punch through thick steel.",
//            "language": {
//                "name": "en",
//                "url": "https://pokeapi.co/api/v2/language/9/"
//            },
//            "version": {
//                "name": "white-2",
//                "url": "https://pokeapi.co/api/v2/version/22/"
//            }
//        },
//        {
//            "flavor_text": "からだが　おもたく　のしかかって\nあいてを　きぜつさせる。\nピンチの　ときは　カラに　かくれる。",
//            "language": {
//                "name": "ja-Hrkt",
//                "url": "https://pokeapi.co/api/v2/language/1/"
//            },
//            "version": {
//                "name": "x",
//                "url": "https://pokeapi.co/api/v2/version/23/"
//            }
//        },
//        {
//            "flavor_text": "무거운 몸으로 상대를\n덮쳐서 기절시킨다.\n위기에 처하면 등껍질에 숨는다.",
//            "language": {
//                "name": "ko",
//                "url": "https://pokeapi.co/api/v2/language/3/"
//            },
//            "version": {
//                "name": "x",
//                "url": "https://pokeapi.co/api/v2/version/23/"
//            }
//        },
//        {
//            "flavor_text": "Il écrase ses adversaires de tout son poids pour leur\nfaire perdre connaissance. Il rentre dans sa carapace\ns’il se sent en danger.",
//            "language": {
//                "name": "fr",
//                "url": "https://pokeapi.co/api/v2/language/5/"
//            },
//            "version": {
//                "name": "x",
//                "url": "https://pokeapi.co/api/v2/version/23/"
//            }
//        },
//        {
//            "flavor_text": "Es begräbt seine Gegner mit seinem enormen\nKörpergewicht. Wenn es in einer aussichtslosen\nLage steckt, zieht es sich in seinen Panzer zurück.",
//            "language": {
//                "name": "de",
//                "url": "https://pokeapi.co/api/v2/language/6/"
//            },
//            "version": {
//                "name": "x",
//                "url": "https://pokeapi.co/api/v2/version/23/"
//            }
//        },
//        {
//            "flavor_text": "Para acabar con su enemigo, lo aplasta con el peso de\nsu cuerpo. En momentos de apuro, se esconde en el\ncaparazón.",
//            "language": {
//                "name": "es",
//                "url": "https://pokeapi.co/api/v2/language/7/"
//            },
//            "version": {
//                "name": "x",
//                "url": "https://pokeapi.co/api/v2/version/23/"
//            }
//        },
//        {
//            "flavor_text": "Mette KO gli avversari schiacciandoli sotto il corpo\npossente. Se è in difficoltà, può ritrarsi nella corazza.",
//            "language": {
//                "name": "it",
//                "url": "https://pokeapi.co/api/v2/language/8/"
//            },
//            "version": {
//                "name": "x",
//                "url": "https://pokeapi.co/api/v2/version/23/"
//            }
//        },
//        {
//            "flavor_text": "It crushes its foe under its heavy body to cause\nfainting. In a pinch, it will withdraw inside its shell.",
//            "language": {
//                "name": "en",
//                "url": "https://pokeapi.co/api/v2/language/9/"
//            },
//            "version": {
//                "name": "x",
//                "url": "https://pokeapi.co/api/v2/version/23/"
//            }
//        },
//        {
//            "flavor_text": "体が　重たく　のしかかって\n相手を　気絶させる。\nピンチのときは　殻に　隠れる。",
//            "language": {
//                "name": "ja",
//                "url": "https://pokeapi.co/api/v2/language/11/"
//            },
//            "version": {
//                "name": "x",
//                "url": "https://pokeapi.co/api/v2/version/23/"
//            }
//        },
//        {
//            "flavor_text": "こうらに　ふんしゃこうが　あって\nロケットのような　いきおいで\nつっこんでくる　すごい　やつだ。",
//            "language": {
//                "name": "ja-Hrkt",
//                "url": "https://pokeapi.co/api/v2/language/1/"
//            },
//            "version": {
//                "name": "y",
//                "url": "https://pokeapi.co/api/v2/version/24/"
//            }
//        },
//        {
//            "flavor_text": "등껍질에 분사구가 있어\n로켓 같은 기세로\n덤벼드는 굉장한 녀석이다.",
//            "language": {
//                "name": "ko",
//                "url": "https://pokeapi.co/api/v2/language/3/"
//            },
//            "version": {
//                "name": "y",
//                "url": "https://pokeapi.co/api/v2/version/24/"
//            }
//        },
//        {
//            "flavor_text": "Ce Pokémon brutal est armé de canons hydrauliques.\nSes puissants jets d’eau sont dévastateurs.",
//            "language": {
//                "name": "fr",
//                "url": "https://pokeapi.co/api/v2/language/5/"
//            },
//            "version": {
//                "name": "y",
//                "url": "https://pokeapi.co/api/v2/version/24/"
//            }
//        },
//        {
//            "flavor_text": "Ein mächtiges und schnelles Pokémon, das auf\ndem Rücken zwei Hochdruckwasserwerfer trägt.",
//            "language": {
//                "name": "de",
//                "url": "https://pokeapi.co/api/v2/language/6/"
//            },
//            "version": {
//                "name": "y",
//                "url": "https://pokeapi.co/api/v2/version/24/"
//            }
//        },
//        {
//            "flavor_text": "Es un Pokémon imponente. Tiene reactores de agua\nen el caparazón, que le sirven para atacar con fuerza.",
//            "language": {
//                "name": "es",
//                "url": "https://pokeapi.co/api/v2/language/7/"
//            },
//            "version": {
//                "name": "y",
//                "url": "https://pokeapi.co/api/v2/version/24/"
//            }
//        },
//        {
//            "flavor_text": "Pokémon brutale che lancia getti d’acqua ad alta\npressione dalla corazza, usati per attacchi rapidi.",
//            "language": {
//                "name": "it",
//                "url": "https://pokeapi.co/api/v2/language/8/"
//            },
//            "version": {
//                "name": "y",
//                "url": "https://pokeapi.co/api/v2/version/24/"
//            }
//        },
//        {
//            "flavor_text": "The pressurized water jets on this brutal Pokémon’s\nshell are used for high-speed tackles.",
//            "language": {
//                "name": "en",
//                "url": "https://pokeapi.co/api/v2/language/9/"
//            },
//            "version": {
//                "name": "y",
//                "url": "https://pokeapi.co/api/v2/version/24/"
//            }
//        },
//        {
//            "flavor_text": "甲羅に　噴射口が　あって\nロケットのような　勢いで\n突っこんでくる　すごい　やつだ。",
//            "language": {
//                "name": "ja",
//                "url": "https://pokeapi.co/api/v2/language/11/"
//            },
//            "version": {
//                "name": "y",
//                "url": "https://pokeapi.co/api/v2/version/24/"
//            }
//        },
//        {
//            "flavor_text": "こうらの　ふんしゃこうの　ねらいは　せいかく。\nみずの　だんがんを　５０メートル　はなれた\nあきかんに　めいちゅうさせる　ことが　できるぞ。",
//            "language": {
//                "name": "ja-Hrkt",
//                "url": "https://pokeapi.co/api/v2/language/1/"
//            },
//            "version": {
//                "name": "omega-ruby",
//                "url": "https://pokeapi.co/api/v2/version/25/"
//            }
//        },
//        {
//            "flavor_text": "등껍질의 분사구로 하는 조준은 정확하다.\n물 탄환으로 50m 떨어진\n빈 캔을 명중시킬 수 있다.",
//            "language": {
//                "name": "ko",
//                "url": "https://pokeapi.co/api/v2/language/3/"
//            },
//            "version": {
//                "name": "omega-ruby",
//                "url": "https://pokeapi.co/api/v2/version/25/"
//            }
//        },
//        {
//            "flavor_text": "Tortank dispose de canons à eau émergeant de sa carapace.\nIls sont très précis et peuvent envoyer des balles
// d’eau\ncapables de faire mouche sur une cible située à plus de 50 m.",
//            "language": {
//                "name": "fr",
//                "url": "https://pokeapi.co/api/v2/language/5/"
//            },
//            "version": {
//                "name": "omega-ruby",
//                "url": "https://pokeapi.co/api/v2/version/25/"
//            }
//        },
//        {
//            "flavor_text": "Turtok besitzt Wasserdüsen, die aus seinem\nPanzer herausragen. Diese sind sehr präzise.\nEs kann Wassergeschosse so genau
// verschießen,\ndass es damit aus fast 50 m leere Dosen trifft.",
//            "language": {
//                "name": "de",
//                "url": "https://pokeapi.co/api/v2/language/6/"
//            },
//            "version": {
//                "name": "omega-ruby",
//                "url": "https://pokeapi.co/api/v2/version/25/"
//            }
//        },
//        {
//            "flavor_text": "Blastoise lanza chorros de agua con gran precisión por los\ntubos que le salen del caparazón que tiene en la espalda.
// Puede disparar chorros de agua con tanta puntería que no\nfallaría al tirar contra una lata pequeña a 50 m.",
//            "language": {
//                "name": "es",
//                "url": "https://pokeapi.co/api/v2/language/7/"
//            },
//            "version": {
//                "name": "omega-ruby",
//                "url": "https://pokeapi.co/api/v2/version/25/"
//            }
//        },
//        {
//            "flavor_text": "Blastoise è dotato di cannoni ad acqua che fuoriescono dalla\ncorazza. I getti emessi sono così precisi da riuscire a colpire\nun bersaglio a una distanza di 50 m.",
//            "language": {
//                "name": "it",
//                "url": "https://pokeapi.co/api/v2/language/8/"
//            },
//            "version": {
//                "name": "omega-ruby",
//                "url": "https://pokeapi.co/api/v2/version/25/"
//            }
//        },
//        {
//            "flavor_text": "Blastoise has water spouts that protrude from its shell.\nThe water spouts are very accurate. They can shoot bullets
// of\nwater with enough accuracy to strike empty cans from a\ndistance of over 160 feet.",
//            "language": {
//                "name": "en",
//                "url": "https://pokeapi.co/api/v2/language/9/"
//            },
//            "version": {
//                "name": "omega-ruby",
//                "url": "https://pokeapi.co/api/v2/version/25/"
//            }
//        },
//        {
//            "flavor_text": "甲羅の　噴射口の　ねらいは　正確。\n水の　弾丸を　５０メートル　離れた\n空き缶に　命中させる　ことが　できるぞ。",
//            "language": {
//                "name": "ja",
//                "url": "https://pokeapi.co/api/v2/language/11/"
//            },
//            "version": {
//                "name": "omega-ruby",
//                "url": "https://pokeapi.co/api/v2/version/25/"
//            }
//        },
//        {
//            "flavor_text": "こうらの　ふんしゃこうの　ねらいは　せいかく。\nみずの　だんがんを　５０メートル　はなれた\nあきかんに　めいちゅうさせる　ことが　できるぞ。",
//            "language": {
//                "name": "ja-Hrkt",
//                "url": "https://pokeapi.co/api/v2/language/1/"
//            },
//            "version": {
//                "name": "alpha-sapphire",
//                "url": "https://pokeapi.co/api/v2/version/26/"
//            }
//        },
//        {
//            "flavor_text": "등껍질의 분사구로 하는 조준은 정확하다.\n물 탄환으로 50m 떨어진\n빈 캔을 명중시킬 수 있다.",
//            "language": {
//                "name": "ko",
//                "url": "https://pokeapi.co/api/v2/language/3/"
//            },
//            "version": {
//                "name": "alpha-sapphire",
//                "url": "https://pokeapi.co/api/v2/version/26/"
//            }
//        },
//        {
//            "flavor_text": "Tortank dispose de canons à eau émergeant de sa carapace.\nIls sont très précis et peuvent envoyer des balles
// d’eau\ncapables de faire mouche sur une cible située à plus de 50 m.",
//            "language": {
//                "name": "fr",
//                "url": "https://pokeapi.co/api/v2/language/5/"
//            },
//            "version": {
//                "name": "alpha-sapphire",
//                "url": "https://pokeapi.co/api/v2/version/26/"
//            }
//        },
//        {
//            "flavor_text": "Turtok besitzt Wasserdüsen, die aus seinem\nPanzer herausragen. Diese sind sehr präzise.\nEs kann Wassergeschosse so genau verschießen,\n
// dass es damit aus fast 50 m leere Dosen trifft.",
//            "language": {
//                "name": "de",
//                "url": "https://pokeapi.co/api/v2/language/6/"
//            },
//            "version": {
//                "name": "alpha-sapphire",
//                "url": "https://pokeapi.co/api/v2/version/26/"
//            }
//        },
//        {
//            "flavor_text": "Blastoise lanza chorros de agua con gran precisión por los\ntubos que le salen del caparazón que tiene en la espalda.
// \nPuede disparar chorros de agua con tanta puntería que no\nfallaría al tirar contra una lata pequeña a 50 m.",
//            "language": {
//                "name": "es",
//                "url": "https://pokeapi.co/api/v2/language/7/"
//            },
//            "version": {
//                "name": "alpha-sapphire",
//                "url": "https://pokeapi.co/api/v2/version/26/"
//            }
//        },
//        {
//            "flavor_text": "Blastoise è dotato di cannoni ad acqua che fuoriescono dalla\ncorazza. I getti emessi sono così precisi da riuscire a colpire\nun bersaglio a una distanza di 50 m.",
//            "language": {
//                "name": "it",
//                "url": "https://pokeapi.co/api/v2/language/8/"
//            },
//            "version": {
//                "name": "alpha-sapphire",
//                "url": "https://pokeapi.co/api/v2/version/26/"
//            }
//        },
//        {
//            "flavor_text": "Blastoise has water spouts that protrude from its shell.\nThe water spouts are very accurate.\nThey can shoot
// bullets of water with enough accuracy\nto strike empty cans from a distance of over 160 feet.",
//            "language": {
//                "name": "en",
//                "url": "https://pokeapi.co/api/v2/language/9/"
//            },
//            "version": {
//                "name": "alpha-sapphire",
//                "url": "https://pokeapi.co/api/v2/version/26/"
//            }
//        },
//        {
//            "flavor_text": "甲羅の　噴射口の　ねらいは　正確。\n水の　弾丸を　５０メートル　離れた\n空き缶に　命中させる　ことが　できるぞ。",
//            "language": {
//                "name": "ja",
//                "url": "https://pokeapi.co/api/v2/language/11/"
//            },
//            "version": {
//                "name": "alpha-sapphire",
//                "url": "https://pokeapi.co/api/v2/version/26/"
//            }
//        },
//        {
//            "flavor_text": "あいてに　ねらいを　さだめると\nしょうぼうしゃの　ホースより\nつよい　いきおいで　みずを　だす。",
//            "language": {
//                "name": "ja-Hrkt",
//                "url": "https://pokeapi.co/api/v2/language/1/"
//            },
//            "version": {
//                "name": "lets-go-pikachu",
//                "url": "https://pokeapi.co/api/v2/version/31/"
//            }
//        },
//        {
//            "flavor_text": "상대를 겨냥한 다음\n소방차의 호스보다\n강한 기세로 물을 뿜는다.",
//            "language": {
//                "name": "ko",
//                "url": "https://pokeapi.co/api/v2/language/3/"
//            },
//            "version": {
//                "name": "lets-go-pikachu",
//                "url": "https://pokeapi.co/api/v2/version/31/"
//            }
//        },
//        {
//            "flavor_text": "在鎖定了目標之後，\n會用比消防車的水龍\n更強的力道來射出水柱。",
//            "language": {
//                "name": "zh-Hant",
//                "url": "https://pokeapi.co/api/v2/language/4/"
//            },
//            "version": {
//                "name": "lets-go-pikachu",
//                "url": "https://pokeapi.co/api/v2/version/31/"
//            }
//        },
//        {
//            "flavor_text": "Une fois sa cible dans sa ligne de mire,\nil projette des jets d’eau plus puissants\nqu’une lance à incendie.",
//            "language": {
//                "name": "fr",
//                "url": "https://pokeapi.co/api/v2/language/5/"
//            },
//            "version": {
//                "name": "lets-go-pikachu",
//                "url": "https://pokeapi.co/api/v2/version/31/"
//            }
//        },
//        {
//            "flavor_text": "Nachdem es einen Gegner anvisiert hat, greift\nes mit einem Wasserstrahl an, dessen Druck\nhöher ist als der eines Feuerwehrschlauchs.",
//            "language": {
//                "name": "de",
//                "url": "https://pokeapi.co/api/v2/language/6/"
//            },
//            "version": {
//                "name": "lets-go-pikachu",
//                "url": "https://pokeapi.co/api/v2/version/31/"
//            }
//        },
//        {
//            "flavor_text": "Tras fijar el blanco, ataca disparando un chorro\nde agua a una presión mayor que la manguera\nde un bombero.",
//            "language": {
//                "name": "es",
//                "url": "https://pokeapi.co/api/v2/language/7/"
//            },
//            "version": {
//                "name": "lets-go-pikachu",
//                "url": "https://pokeapi.co/api/v2/version/31/"
//            }
//        },
//        {
//            "flavor_text": "Dopo aver preso la mira colpisce il nemico con\ngetti d’acqua più potenti di quelli di un idrante.",
//            "language": {
//                "name": "it",
//                "url": "https://pokeapi.co/api/v2/language/8/"
//            },
//            "version": {
//                "name": "lets-go-pikachu",
//                "url": "https://pokeapi.co/api/v2/version/31/"
//            }
//        },
//        {
//            "flavor_text": "Once it takes aim at its enemy, it blasts out\nwater with even more force than a fire hose.",
//            "language": {
//                "name": "en",
//                "url": "https://pokeapi.co/api/v2/language/9/"
//            },
//            "version": {
//                "name": "lets-go-pikachu",
//                "url": "https://pokeapi.co/api/v2/version/31/"
//            }
//        },
//        {
//            "flavor_text": "相手に　狙いを　定めると\n消防車の　ホースより\n強い　勢いで　水を　出す。",
//            "language": {
//                "name": "ja",
//                "url": "https://pokeapi.co/api/v2/language/11/"
//            },
//            "version": {
//                "name": "lets-go-pikachu",
//                "url": "https://pokeapi.co/api/v2/version/31/"
//            }
//        },
//        {
//            "flavor_text": "一旦锁定了目标，\n它会以超越了消防\n水枪的力道来喷水。",
//            "language": {
//                "name": "zh-Hans",
//                "url": "https://pokeapi.co/api/v2/language/12/"
//            },
//            "version": {
//                "name": "lets-go-pikachu",
//                "url": "https://pokeapi.co/api/v2/version/31/"
//            }
//        },
//        {
//            "flavor_text": "あいてに　ねらいを　さだめると\nしょうぼうしゃの　ホースより\nつよい　いきおいで　みずを　だす。",
//            "language": {
//                "name": "ja-Hrkt",
//                "url": "https://pokeapi.co/api/v2/language/1/"
//            },
//            "version": {
//                "name": "lets-go-eevee",
//                "url": "https://pokeapi.co/api/v2/version/32/"
//            }
//        },
//        {
//            "flavor_text": "상대를 겨냥한 다음\n소방차의 호스보다\n강한 기세로 물을 뿜는다.",
//            "language": {
//                "name": "ko",
//                "url": "https://pokeapi.co/api/v2/language/3/"
//            },
//            "version": {
//                "name": "lets-go-eevee",
//                "url": "https://pokeapi.co/api/v2/version/32/"
//            }
//        },
//        {
//            "flavor_text": "在鎖定了目標之後，\n會用比消防車的水龍\n更強的力道來射出水柱。",
//            "language": {
//                "name": "zh-Hant",
//                "url": "https://pokeapi.co/api/v2/language/4/"
//            },
//            "version": {
//                "name": "lets-go-eevee",
//                "url": "https://pokeapi.co/api/v2/version/32/"
//            }
//        },
//        {
//            "flavor_text": "Une fois sa cible dans sa ligne de mire,\nil projette des jets d’eau plus puissants\nqu’une lance à incendie.",
//            "language": {
//                "name": "fr",
//                "url": "https://pokeapi.co/api/v2/language/5/"
//            },
//            "version": {
//                "name": "lets-go-eevee",
//                "url": "https://pokeapi.co/api/v2/version/32/"
//            }
//        },
//        {
//            "flavor_text": "Nachdem es einen Gegner anvisiert hat, greift\nes mit einem Wasserstrahl an, dessen Druck\nhöher ist als der eines Feuerwehrschlauchs.",
//            "language": {
//                "name": "de",
//                "url": "https://pokeapi.co/api/v2/language/6/"
//            },
//            "version": {
//                "name": "lets-go-eevee",
//                "url": "https://pokeapi.co/api/v2/version/32/"
//            }
//        },
//        {
//            "flavor_text": "Tras fijar el blanco, ataca disparando un chorro\nde agua a una presión mayor que la manguera\nde un bombero.",
//            "language": {
//                "name": "es",
//                "url": "https://pokeapi.co/api/v2/language/7/"
//            },
//            "version": {
//                "name": "lets-go-eevee",
//                "url": "https://pokeapi.co/api/v2/version/32/"
//            }
//        },
//        {
//            "flavor_text": "Dopo aver preso la mira colpisce il nemico con\ngetti d’acqua più potenti di quelli di un idrante.",
//            "language": {
//                "name": "it",
//                "url": "https://pokeapi.co/api/v2/language/8/"
//            },
//            "version": {
//                "name": "lets-go-eevee",
//                "url": "https://pokeapi.co/api/v2/version/32/"
//            }
//        },
//        {
//            "flavor_text": "Once it takes aim at its enemy, it blasts out\nwater with even more force than a fire hose.",
//            "language": {
//                "name": "en",
//                "url": "https://pokeapi.co/api/v2/language/9/"
//            },
//            "version": {
//                "name": "lets-go-eevee",
//                "url": "https://pokeapi.co/api/v2/version/32/"
//            }
//        },
//        {
//            "flavor_text": "相手に　狙いを　定めると\n消防車の　ホースより\n強い　勢いで　水を　出す。",
//            "language": {
//                "name": "ja",
//                "url": "https://pokeapi.co/api/v2/language/11/"
//            },
//            "version": {
//                "name": "lets-go-eevee",
//                "url": "https://pokeapi.co/api/v2/version/32/"
//            }
//        },
//        {
//            "flavor_text": "一旦锁定了目标，\n它会以超越了消防\n水枪的力道来喷水。",
//            "language": {
//                "name": "zh-Hans",
//                "url": "https://pokeapi.co/api/v2/language/12/"
//            },
//            "version": {
//                "name": "lets-go-eevee",
//                "url": "https://pokeapi.co/api/v2/version/32/"
//            }
//        },
//        {
//            "flavor_text": "からだが　おもたく　のしかかって\nあいてを　きぜつさせる。\nピンチの　ときは　カラに　かくれる。",
//            "language": {
//                "name": "ja-Hrkt",
//                "url": "https://pokeapi.co/api/v2/language/1/"
//            },
//            "version": {
//                "name": "sword",
//                "url": "https://pokeapi.co/api/v2/version/33/"
//            }
//        },
//        {
//            "flavor_text": "무거운 몸으로 상대를\n덮쳐서 기절시킨다.\n위기에 처하면 등껍질에 숨는다.",
//            "language": {
//                "name": "ko",
//                "url": "https://pokeapi.co/api/v2/language/3/"
//            },
//            "version": {
//                "name": "sword",
//                "url": "https://pokeapi.co/api/v2/version/33/"
//            }
//        },
//        {
//            "flavor_text": "會用重量驚人的身體\n壓住對手使其昏厥。\n遇到危險時會躲進殼裡。",
//            "language": {
//                "name": "zh-Hant",
//                "url": "https://pokeapi.co/api/v2/language/4/"
//            },
//            "version": {
//                "name": "sword",
//                "url": "https://pokeapi.co/api/v2/version/33/"
//            }
//        },
//        {
//            "flavor_text": "Il écrase ses adversaires de tout son poids\npour leur faire perdre connaissance.\nIl rentre dans sa carapace s’il se sent en danger.",
//            "language": {
//                "name": "fr",
//                "url": "https://pokeapi.co/api/v2/language/5/"
//            },
//            "version": {
//                "name": "sword",
//                "url": "https://pokeapi.co/api/v2/version/33/"
//            }
//        },
//        {
//            "flavor_text": "Es begräbt seine Gegner mit seinem enormen\nKörpergewicht. Wenn es in einer aussichtslosen\nLage steckt, zieht es sich in seinen Panzer zurück.",
//            "language": {
//                "name": "de",
//                "url": "https://pokeapi.co/api/v2/language/6/"
//            },
//            "version": {
//                "name": "sword",
//                "url": "https://pokeapi.co/api/v2/version/33/"
//            }
//        },
//        {
//            "flavor_text": "Para acabar con su enemigo, lo aplasta con el\npeso de su cuerpo. En momentos de apuro, se\nesconde en el caparazón.",
//            "language": {
//                "name": "es",
//                "url": "https://pokeapi.co/api/v2/language/7/"
//            },
//            "version": {
//                "name": "sword",
//                "url": "https://pokeapi.co/api/v2/version/33/"
//            }
//        },
//        {
//            "flavor_text": "Mette KO gli avversari schiacciandoli sotto\nil corpo possente. Se è in difficoltà, può ritrarsi\nnella corazza.",
//            "language": {
//                "name": "it",
//                "url": "https://pokeapi.co/api/v2/language/8/"
//            },
//            "version": {
//                "name": "sword",
//                "url": "https://pokeapi.co/api/v2/version/33/"
//            }
//        },
//        {
//            "flavor_text": "It crushes its foe under its heavy body to cause\nfainting. In a pinch, it will withdraw inside its shell.",
//            "language": {
//                "name": "en",
//                "url": "https://pokeapi.co/api/v2/language/9/"
//            },
//            "version": {
//                "name": "sword",
//                "url": "https://pokeapi.co/api/v2/version/33/"
//            }
//        },
//        {
//            "flavor_text": "体が　重たく　のしかかって\n相手を　気絶させる。\nピンチの　ときは　殻に　隠れる。",
//            "language": {
//                "name": "ja",
//                "url": "https://pokeapi.co/api/v2/language/11/"
//            },
//            "version": {
//                "name": "sword",
//                "url": "https://pokeapi.co/api/v2/version/33/"
//            }
//        },
//        {
//            "flavor_text": "身体很重，压住对手后\n就能让对手昏厥。\n遇到危险时会躲进壳里。",
//            "language": {
//                "name": "zh-Hans",
//                "url": "https://pokeapi.co/api/v2/language/12/"
//            },
//            "version": {
//                "name": "sword",
//                "url": "https://pokeapi.co/api/v2/version/33/"
//            }
//        },
//        {
//            "flavor_text": "こうらの　ロケットほう　から\nふきだした　ジェットすいりゅうは\nぶあつい　てっぱんも　つらぬく。",
//            "language": {
//                "name": "ja-Hrkt",
//                "url": "https://pokeapi.co/api/v2/language/1/"
//            },
//            "version": {
//                "name": "shield",
//                "url": "https://pokeapi.co/api/v2/version/34/"
//            }
//        },
//        {
//            "flavor_text": "등껍질의 로켓포에서\n뿜어져 나오는 제트 수류는\n두꺼운 철판도 뚫는다.",
//            "language": {
//                "name": "ko",
//                "url": "https://pokeapi.co/api/v2/language/3/"
//            },
//            "version": {
//                "name": "shield",
//                "url": "https://pokeapi.co/api/v2/version/34/"
//            }
//        },
//        {
//            "flavor_text": "從甲殼上的大炮裡\n放出的噴射水流\n足以貫穿厚實的鐵板。",
//            "language": {
//                "name": "zh-Hant",
//                "url": "https://pokeapi.co/api/v2/language/4/"
//            },
//            "version": {
//                "name": "shield",
//                "url": "https://pokeapi.co/api/v2/version/34/"
//            }
//        },
//        {
//            "flavor_text": "Les canons sur sa carapace tirent des jets d’eau\ncapables de percer même de l’acier trempé.",
//            "language": {
//                "name": "fr",
//                "url": "https://pokeapi.co/api/v2/language/5/"
//            },
//            "version": {
//                "name": "shield",
//                "url": "https://pokeapi.co/api/v2/version/34/"
//            }
//        },
//        {
//            "flavor_text": "Die Wassersalven, die es mit den Wasserdüsen\nin seinem Panzer abfeuert, durchdringen sogar\ndicke Stahlwände.",
//            "language": {
//                "name": "de",
//                "url": "https://pokeapi.co/api/v2/language/6/"
//            },
//            "version": {
//                "name": "shield",
//                "url": "https://pokeapi.co/api/v2/version/34/"
//            }
//        },
//        {
//            "flavor_text": "Dispara chorros de agua a través de los cañones\nde su caparazón, capaces de agujerear incluso el\nacero.",
//            "language": {
//                "name": "es",
//                "url": "https://pokeapi.co/api/v2/language/7/"
//            },
//            "version": {
//                "name": "shield",
//                "url": "https://pokeapi.co/api/v2/version/34/"
//            }
//        },
//        {
//            "flavor_text": "I cannoni sul suo guscio sparano getti d’acqua\ncapaci di bucare l’acciaio.",
//            "language": {
//                "name": "it",
//                "url": "https://pokeapi.co/api/v2/language/8/"
//            },
//            "version": {
//                "name": "shield",
//                "url": "https://pokeapi.co/api/v2/version/34/"
//            }
//        },
//        {
//            "flavor_text": "The rocket cannons on its shell fire jets of water\ncapable of punching holes through thick steel.",
//            "language": {
//                "name": "en",
//                "url": "https://pokeapi.co/api/v2/language/9/"
//            },
//            "version": {
//                "name": "shield",
//                "url": "https://pokeapi.co/api/v2/version/34/"
//            }
//        },
//        {
//            "flavor_text": "甲羅の　ロケット砲　から\n噴き出した　ジェット水流は\nぶ厚い　鉄板も　つらぬく。",
//            "language": {
//                "name": "ja",
//                "url": "https://pokeapi.co/api/v2/language/11/"
//            },
//            "version": {
//                "name": "shield",
//                "url": "https://pokeapi.co/api/v2/version/34/"
//            }
//        },
//        {
//            "flavor_text": "从龟壳上的大炮里\n放出的喷射水流\n足以贯穿厚实的铁板。",
//            "language": {
//                "name": "zh-Hans",
//                "url": "https://pokeapi.co/api/v2/language/12/"
//            },
//            "version": {
//                "name": "shield",
//                "url": "https://pokeapi.co/api/v2/version/34/"
//            }
//        }
//    ],
//    "form_descriptions": [],
//    "forms_switchable": true,
//    "gender_rate": 1,
//    "genera": [
//        {
//            "genus": "こうらポケモン",
//            "language": {
//                "name": "ja-Hrkt",
//                "url": "https://pokeapi.co/api/v2/language/1/"
//            }
//        },
//        {
//            "genus": "껍질포켓몬",
//            "language": {
//                "name": "ko",
//                "url": "https://pokeapi.co/api/v2/language/3/"
//            }
//        },
//        {
//            "genus": "甲殼寶可夢",
//            "language": {
//                "name": "zh-Hant",
//                "url": "https://pokeapi.co/api/v2/language/4/"
//            }
//        },
//        {
//            "genus": "Pokémon Carapace",
//            "language": {
//                "name": "fr",
//                "url": "https://pokeapi.co/api/v2/language/5/"
//            }
//        },
//        {
//            "genus": "Panzertier-Pokémon",
//            "language": {
//                "name": "de",
//                "url": "https://pokeapi.co/api/v2/language/6/"
//            }
//        },
//        {
//            "genus": "Pokémon Armazón",
//            "language": {
//                "name": "es",
//                "url": "https://pokeapi.co/api/v2/language/7/"
//            }
//        },
//        {
//            "genus": "Pokémon Crostaceo",
//            "language": {
//                "name": "it",
//                "url": "https://pokeapi.co/api/v2/language/8/"
//            }
//        },
//        {
//            "genus": "Shellfish Pokémon",
//            "language": {
//                "name": "en",
//                "url": "https://pokeapi.co/api/v2/language/9/"
//            }
//        },
//        {
//            "genus": "こうらポケモン",
//            "language": {
//                "name": "ja",
//                "url": "https://pokeapi.co/api/v2/language/11/"
//            }
//        },
//        {
//            "genus": "甲壳宝可梦",
//            "language": {
//                "name": "zh-Hans",
//                "url": "https://pokeapi.co/api/v2/language/12/"
//            }
//        }
//    ],
//    "generation": {
//        "name": "generation-i",
//        "url": "https://pokeapi.co/api/v2/generation/1/"
//    },
//    "growth_rate": {
//        "name": "medium-slow",
//        "url": "https://pokeapi.co/api/v2/growth-rate/4/"
//    },
//    "habitat": {
//        "name": "waters-edge",
//        "url": "https://pokeapi.co/api/v2/pokemon-habitat/9/"
//    },
//    "has_gender_differences": false,
//    "hatch_counter": 20,
//    "id": 9,
//    "is_baby": false,
//    "is_legendary": false,
//    "is_mythical": false,
//    "name": "blastoise",
//    "names": [
//        {
//            "language": {
//                "name": "ja-Hrkt",
//                "url": "https://pokeapi.co/api/v2/language/1/"
//            },
//            "name": "カメックス"
//        },
//        {
//            "language": {
//                "name": "roomaji",
//                "url": "https://pokeapi.co/api/v2/language/2/"
//            },
//            "name": "Kamex"
//        },
//        {
//            "language": {
//                "name": "ko",
//                "url": "https://pokeapi.co/api/v2/language/3/"
//            },
//            "name": "거북왕"
//        },
//        {
//            "language": {
//                "name": "zh-Hant",
//                "url": "https://pokeapi.co/api/v2/language/4/"
//            },
//            "name": "水箭龜"
//        },
//        {
//            "language": {
//                "name": "fr",
//                "url": "https://pokeapi.co/api/v2/language/5/"
//            },
//            "name": "Tortank"
//        },
//        {
//            "language": {
//                "name": "de",
//                "url": "https://pokeapi.co/api/v2/language/6/"
//            },
//            "name": "Turtok"
//        },
//        {
//            "language": {
//                "name": "es",
//                "url": "https://pokeapi.co/api/v2/language/7/"
//            },
//            "name": "Blastoise"
//        },
//        {
//            "language": {
//                "name": "it",
//                "url": "https://pokeapi.co/api/v2/language/8/"
//            },
//            "name": "Blastoise"
//        },
//        {
//            "language": {
//                "name": "en",
//                "url": "https://pokeapi.co/api/v2/language/9/"
//            },
//            "name": "Blastoise"
//        },
//        {
//            "language": {
//                "name": "ja",
//                "url": "https://pokeapi.co/api/v2/language/11/"
//            },
//            "name": "カメックス"
//        },
//        {
//            "language": {
//                "name": "zh-Hans",
//                "url": "https://pokeapi.co/api/v2/language/12/"
//            },
//            "name": "水箭龟"
//        }
//    ],
//    "order": 9,
//    "pal_park_encounters": [
//        {
//            "area": {
//                "name": "pond",
//                "url": "https://pokeapi.co/api/v2/pal-park-area/4/"
//            },
//            "base_score": 90,
//            "rate": 3
//        }
//    ],
//    "pokedex_numbers": [
//        {
//            "entry_number": 9,
//            "pokedex": {
//                "name": "national",
//                "url": "https://pokeapi.co/api/v2/pokedex/1/"
//            }
//        },
//        {
//            "entry_number": 9,
//            "pokedex": {
//                "name": "kanto",
//                "url": "https://pokeapi.co/api/v2/pokedex/2/"
//            }
//        },
//        {
//            "entry_number": 234,
//            "pokedex": {
//                "name": "original-johto",
//                "url": "https://pokeapi.co/api/v2/pokedex/3/"
//            }
//        },
//        {
//            "entry_number": 239,
//            "pokedex": {
//                "name": "updated-johto",
//                "url": "https://pokeapi.co/api/v2/pokedex/7/"
//            }
//        },
//        {
//            "entry_number": 88,
//            "pokedex": {
//                "name": "kalos-central",
//                "url": "https://pokeapi.co/api/v2/pokedex/12/"
//            }
//        },
//        {
//            "entry_number": 9,
//            "pokedex": {
//                "name": "letsgo-kanto",
//                "url": "https://pokeapi.co/api/v2/pokedex/26/"
//            }
//        },
//        {
//            "entry_number": 73,
//            "pokedex": {
//                "name": "isle-of-armor",
//                "url": "https://pokeapi.co/api/v2/pokedex/28/"
//            }
//        }
//    ],
//    "shape": {
//        "name": "upright",
//        "url": "https://pokeapi.co/api/v2/pokemon-shape/6/"
//    },
//    "varieties": [
//        {
//            "is_default": true,
//            "pokemon": {
//                "name": "blastoise",
//                "url": "https://pokeapi.co/api/v2/pokemon/9/"
//            }
//        },
//        {
//            "is_default": false,
//            "pokemon": {
//                "name": "blastoise-mega",
//                "url": "https://pokeapi.co/api/v2/pokemon/10036/"
//            }
//        },
//        {
//            "is_default": false,
//            "pokemon": {
//                "name": "blastoise-gmax",
//                "url": "https://pokeapi.co/api/v2/pokemon/10197/"
//            }
//        }
//    ]
// }
//
// """
