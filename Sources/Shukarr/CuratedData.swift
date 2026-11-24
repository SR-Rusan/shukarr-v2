import Foundation

struct QuranVerse: Identifiable, Codable {
    var id = UUID()
    let surah: String
    let ayah: Int
    let textArabic: String
    let textEnglish: String
    let transliteration: String
    let category: String
}

struct HadithQuote: Identifiable, Codable {
    var id = UUID()
    let source: String
    let textArabic: String
    let textEnglish: String
}

struct CuratedData {
    static let verses: [QuranVerse] = [
        QuranVerse(
            surah: "Al-Baqarah",
            ayah: 286,
            textArabic: "لَا يُكَلِّفُ اللَّهُ نَفْسًا إِلَّا وُسْعَهَا",
            textEnglish: "Allah does not burden a soul beyond that it can bear.",
            transliteration: "Lā yukallifullāhu nafsan illā wus'ahā",
            category: "patience"
        ),
        QuranVerse(
            surah: "Ash-Sharh",
            ayah: 6,
            textArabic: "إِنَّ مَعَ الْعُسْرِ يُسْرًا",
            textEnglish: "Indeed, with hardship [will be] ease.",
            transliteration: "Inna ma'al 'usri yusrā",
            category: "hope"
        ),
        QuranVerse(
            surah: "Al-Baqarah",
            ayah: 152,
            textArabic: "فَاذْكُرُونِي أَذْكُرْكُمْ وَاشْكُرُوا لِي وَلَا تَكْفُرُونِ",
            textEnglish: "So remember Me; I will remember you. And be grateful to Me and do not deny Me.",
            transliteration: "Fadhkurūnī adhkurkum washkurū lī wa lā takfurūn",
            category: "gratitude"
        ),
        QuranVerse(
            surah: "Al-Baqarah",
            ayah: 186,
            textArabic: "وَإِذَا سَأَلَكَ عِبَادِي عَنِّي فَإِنِّي قَرِيبٌ ۖ أُجِيبُ دَعْوَةَ الدَّاعِ إِذَا دَعَانِ",
            textEnglish: "And when My servants ask you concerning Me, indeed I am near. I respond to the invocation of the supplicant when he calls upon Me.",
            transliteration: "Wa idhā sa'alaka 'ibādī 'annī fa innī qarīb, ujību da'watad-dā'i idhā da'ān",
            category: "hope"
        ),
        QuranVerse(
            surah: "Az-Zumar",
            ayah: 53,
            textArabic: "قُلْ يَا عِبَادِيَ الَّذِينَ أَسْرَفُوا عَلَىٰ أَنفُسِهِمْ لَا تَقْنَطُوا مِن رَّحْمَةِ اللَّهِ",
            textEnglish: "Say, 'O My servants who have transgressed against themselves [by sinning], do not despair of the mercy of Allah.'",
            transliteration: "Qul yā 'ibādiyal-ladhīna asrafū 'alā anfusihim lā taqnatū mir-rahmatillāh",
            category: "hope"
        ),
        QuranVerse(
            surah: "Ibrahim",
            ayah: 7,
            textArabic: "لَئِن شَكَرْتُمْ لَأَزِيدَنَّكُمْ",
            textEnglish: "If you are grateful, I will surely increase you [in favor].",
            transliteration: "La'in shakartum la'azīdannakum",
            category: "gratitude"
        ),
        QuranVerse(
            surah: "Al-Imran",
            ayah: 139,
            textArabic: "وَلَا تَهِنُوا وَلَا تَحْزَنُوا وَأَنتُمُ الْأَعْلَوْنَ إِن كُنتُم مُّؤْمِنِينَ",
            textEnglish: "So do not weaken and do not grieve, and you will be superior if you are [true] believers.",
            transliteration: "Wa lā tahinū wa lā tahzanū wa antumul a'lawna in kuntum mu'minīn",
            category: "patience"
        ),
        QuranVerse(
            surah: "Al-Anfal",
            ayah: 40,
            textArabic: "نِعْمَ الْمَوْلَىٰ وَنِعْمَ النَّصِيرُ",
            textEnglish: "Excellent is the protector, and excellent is the helper.",
            transliteration: "Ni'mal mawlā wa ni'man-nasīr",
            category: "strength"
        ),
        QuranVerse(
            surah: "Ad-Duha",
            ayah: 3,
            textArabic: "مَا وَدَّعَكَ رَبُّكَ وَمَا قَلَىٰ",
            textEnglish: "Your Lord has not taken leave of you, [O Muhammad], nor has He detested [you].",
            transliteration: "Mā wadda'aka rabbuka wa mā qalā",
            category: "comfort"
        ),
        QuranVerse(
            surah: "Ad-Duha",
            ayah: 5,
            textArabic: "وَلَسَوْفَ يُعْطِيكَ رَبُّكَ فَتَرْضَىٰ",
            textEnglish: "And your Lord is going to give you, and you will be satisfied.",
            transliteration: "Wa lasawfa yu'ṭīka rabbuka fatarḍā",
            category: "hope"
        ),
        QuranVerse(
            surah: "Al-Inshirah",
            ayah: 5,
            textArabic: "فَإِنَّ مَعَ الْعُسْرِ يُسْرًا",
            textEnglish: "For indeed, with hardship [will be] ease.",
            transliteration: "Fa'inna ma'al 'usri yusrā",
            category: "hope"
        ),
        QuranVerse(
            surah: "Al-Baqarah",
            ayah: 153,
            textArabic: "يَا أَيُّهَا الَّذِينَ آمَنُوا اسْتَعِينُوا بِالصَّبْرِ وَالصَّلَاةِ ۚ إِنَّ اللَّهَ مَعَ الصَّابِرِينَ",
            textEnglish: "O you who have believed, seek help through patience and prayer. Indeed, Allah is with the patient.",
            transliteration: "Yā ayyuhal-ladhīna āmanus-ta'īnū biṣ-ṣabri waṣ-ṣalāh. Innallāha ma'aṣ-ṣābirīn",
            category: "patience"
        ),
        QuranVerse(
            surah: "Al-Baqarah",
            ayah: 216,
            textArabic: "وَعَسَىٰ أَن تَكْرَهُوا شَيْئًا وَهُوَ خَيْرٌ لَّكُمْ ۖ وَعَسَىٰ أَن تُحِبُّوا شَيْئًا وَهُوَ شَرٌّ لَّكُمْ",
            textEnglish: "But perhaps you hate a thing and it is good for you; and perhaps you love a thing and it is bad for you.",
            transliteration: "Wa 'asā an takrahū shay'an wa huwa khayrun lakum wa 'asā an tuḥibbū shay'an wa huwa sharrun lakum",
            category: "trust"
        ),
        QuranVerse(
            surah: "Al-Baqarah",
            ayah: 250,
            textArabic: "رَبَّنَا أَفْرِغْ عَلَيْنَا صَبْرًا وَثَبِّتْ أَقْدَامَنَا",
            textEnglish: "Our Lord, pour upon us patience and plant firmly our feet.",
            transliteration: "Rabbanā afrigh 'alaynā ṣabran wa thabbit aqdāmanā",
            category: "patience"
        ),
        QuranVerse(
            surah: "Al-Imran",
            ayah: 159,
            textArabic: "فَإِذَا عَزَمْتَ فَتَوَكَّلْ عَلَى اللَّهِ ۚ إِنَّ اللَّهَ يُحِبُّ الْمُتَوَكِّلِينَ",
            textEnglish: "And when you have decided, then rely upon Allah. Indeed, Allah loves those who rely [upon Him].",
            transliteration: "Fa idhā 'azamta fatawakkal 'alallāh. Innallāha yuḥibbul-mutawakkilīn",
            category: "trust"
        ),
        QuranVerse(
            surah: "Al-Imran",
            ayah: 160,
            textArabic: "إِن يَنصُرْكُمُ اللَّهُ فَلَا غَالِبَ لَكُمْ ۖ وَإِن يَخْذُلْكُمْ فَمَن ذَا الَّذِي يَنصُرُكُم مِّن بَعْدِهِ",
            textEnglish: "If Allah should aid you, no one can overcome you; and if He should forsake you, who is there that can aid you after Him?",
            transliteration: "In yanṣurkumullāhu falā ghāliba lakum wa in yakhdhulkum faman dhalladhī yanṣurukum min ba'dih",
            category: "strength"
        ),
        QuranVerse(
            surah: "Al-Imran",
            ayah: 173,
            textArabic: "حَسْبُنَا اللَّهُ وَنِعْمَ الْوَكِيلُ",
            textEnglish: "Sufficient for us is Allah, and [He is] the best Disposer of affairs.",
            transliteration: "Ḥasbunallāhu wa ni'mal-wakīl",
            category: "trust"
        ),
        QuranVerse(
            surah: "Al-Imran",
            ayah: 191,
            textArabic: "رَبَّنَا مَا خَلَقْتَ هَٰذَا بَاطِلًا سُبْحَانَكَ",
            textEnglish: "Our Lord, You did not create this aimlessly; exalted are You.",
            transliteration: "Rabbanā mā khalaqta hādhā bāṭilan subḥānaka",
            category: "reflection"
        ),
        QuranVerse(
            surah: "An-Nisa",
            ayah: 28,
            textArabic: "يُرِيدُ اللَّهُ أَن يُخَفِّفَ عَنكُمْ ۚ وَخُلِقَ الْإِنسَانُ ضَعِيفًا",
            textEnglish: "Allah wants to lighten for you [your difficulties]; and mankind was created weak.",
            transliteration: "Yurīdullāhu an yukhaffifa 'ankum wa khuliqal-insānu ḍa'īfā",
            category: "comfort"
        ),
        QuranVerse(
            surah: "An-Nisa",
            ayah: 110,
            textArabic: "وَمَن يَعْمَلْ سُوءًا أَوْ يَظْلِمْ نَفْسَهُ ثُمَّ يَسْتَغْفِرِ اللَّهَ يَجِدِ اللَّهَ غَفُورًا رَّحِيمًا",
            textEnglish: "And whoever does a wrong or wrongs himself but then seeks forgiveness of Allah will find Allah Forgiving and Merciful.",
            transliteration: "Wa man ya'mal sū'an aw yaẓlim nafsahu thumma yastaghfirillāha yajidillāha ghafūran raḥīmā",
            category: "hope"
        ),
        QuranVerse(
            surah: "Al-An'am",
            ayah: 17,
            textArabic: "وَإِن يَمْسَسْكَ اللَّهُ بِضُرٍّ فَلَا كَاشِفَ لَهُ إِلَّا هُوَ",
            textEnglish: "And if Allah should touch you with adversity, there is no remover of it except Him.",
            transliteration: "Wa in yamsaskallāhu biḍurrin falā kāshifa lahu illā huw",
            category: "trust"
        ),
        QuranVerse(
            surah: "Al-An'am",
            ayah: 32,
            textArabic: "وَلَلدَّارُ الْآخِرَةُ خَيْرٌ لِّلَّذِينَ يَتَّقُونَ",
            textEnglish: "And the home of the Hereafter is better for those who fear Allah.",
            transliteration: "Wa laddārul-ākhiratu khayrun lilladhīna yattaqūn",
            category: "reflection"
        ),
        QuranVerse(
            surah: "Al-A'raf",
            ayah: 156,
            textArabic: "وَرَحْمَتِي وَسِعَتْ كُلَّ شَيْءٍ",
            textEnglish: "My mercy encompasses all things.",
            transliteration: "Wa raḥmatī wasi'at kulla shay'",
            category: "hope"
        ),
        QuranVerse(
            surah: "Al-A'raf",
            ayah: 204,
            textArabic: "وَإِذَا قُرِئَ الْقُرْآنُ فَاسْتَمِعُوا لَهُ وَأَنصِتُوا لَعَلَّكُمْ تُرْحَمُونَ",
            textEnglish: "So when the Quran is recited, then listen to it and pay attention that you may receive mercy.",
            transliteration: "Wa idhā quri'al-qur'ānu fastami'ū lahu wa anṣitū la'allakum turḥamūn",
            category: "reflection"
        ),
        QuranVerse(
            surah: "Al-Anfal",
            ayah: 2,
            textArabic: "إِنَّمَا الْمُؤْمِنُونَ الَّذِينَ إِذَا ذُكِرَ اللَّهُ وَجِلَتْ قُلُوبُهُمْ",
            textEnglish: "The believers are only those who, when Allah is mentioned, their hearts feel fear.",
            transliteration: "Innamal-mu'minūnal-ladhīna idhā dhukirallāhu wajilat qulūbuhum",
            category: "remembrance"
        ),
        QuranVerse(
            surah: "Al-Anfal",
            ayah: 33,
            textArabic: "وَمَا كَانَ اللَّهُ مُعَذِّبَهُمْ وَهُمْ يَسْتَغْفِرُونَ",
            textEnglish: "And Allah would not punish them while they seek forgiveness.",
            transliteration: "Wa mā kānallāhu mu'adhdhibahum wa hum yastaghfirūn",
            category: "hope"
        ),
        QuranVerse(
            surah: "Yunus",
            ayah: 57,
            textArabic: "قَدْ جَاءَتْكُم مَّوْعِظَةٌ مِّن رَّبِّكُمْ وَشِفَاءٌ لِّمَا فِي الصُّدُورِ",
            textEnglish: "There has to you come instruction from your Lord and healing for what is in the breasts.",
            transliteration: "Qad jā'atkum maw'iẓatun min rabbikum wa shifā'ul-limā fiṣ-ṣudūr",
            category: "comfort"
        ),
        QuranVerse(
            surah: "Yunus",
            ayah: 62,
            textArabic: "أَلَا إِنَّ أَوْلِيَاءَ اللَّهِ لَا خَوْفٌ عَلَيْهِمْ وَلَا هُمْ يَحْزَنُونَ",
            textEnglish: "Unquestionably, [for] the allies of Allah there will be no fear concerning them, nor will they grieve.",
            transliteration: "Alā inna awliyā'allāhi lā khawfun 'alayhim wa lā hum yaḥzanūn",
            category: "comfort"
        ),
        QuranVerse(
            surah: "Yunus",
            ayah: 107,
            textArabic: "وَإِن يُرِدْكَ بِخَيْرٍ فَلَا رَادَّ لِفَضْلِهِ",
            textEnglish: "And if He intends for you good, then there is no repeller of His bounty.",
            transliteration: "Wa in yuridka bikhayrin falā rādda lifaḍlih",
            category: "trust"
        ),
        QuranVerse(
            surah: "Hud",
            ayah: 115,
            textArabic: "وَاصْبِرْ فَإِنَّ اللَّهَ لَا يُضِيعُ أَجْرَ الْمُحْسِنِينَ",
            textEnglish: "And be patient, for indeed, Allah does not allow to be lost the reward of those who do good.",
            transliteration: "Waṣbir fa'innallāha lā yuḍī'u ajral-muḥsinīn",
            category: "patience"
        ),
        QuranVerse(
            surah: "Yusuf",
            ayah: 86,
            textArabic: "قَالَ إِنَّمَا أَشْكُو بَثِّي وَحُزْنِي إِلَى اللَّهِ",
            textEnglish: "He said, 'I only complain of my suffering and my grief to Allah.'",
            transliteration: "Qāla innamā ashkū baththī wa ḥuznī ilallāh",
            category: "patience"
        ),
        QuranVerse(
            surah: "Yusuf",
            ayah: 87,
            textArabic: "وَلَا تَيْأَسُوا مِن رَّوْحِ اللَّهِ ۖ إِنَّهُ لَا يَيْأَسُ مِن رَّوْحِ اللَّهِ إِلَّا الْقَوْمُ الْكَافِرُونَ",
            textEnglish: "And despair not of relief from Allah. Indeed, no one despairs of relief from Allah except the disbelieving people.",
            transliteration: "Wa lā tay'asū mir-rawḥillāh, innahu lā yay'asu mir-rawḥillāhi illal-qawmul-kāfirūn",
            category: "hope"
        ),
        QuranVerse(
            surah: "Ar-Ra'd",
            ayah: 28,
            textArabic: "الَّذِينَ آمَنُوا وَتَطْمَئِنُّ قُلُوبُهُم بِذِكْرِ اللَّهِ ۗ أَلَا بِذِكْرِ اللَّهِ تَطْمَئِنُّ الْقُلُوبُ",
            textEnglish: "Those who have believed and whose hearts are assured by the remembrance of Allah. Unquestionably, by the remembrance of Allah hearts are assured.",
            transliteration: "Alladhīna āmanū wa taṭma'innu qulūbuhum bidhikrillāh. Alā bidhikrillāhi taṭma'innul-qulūb",
            category: "remembrance"
        ),
        QuranVerse(
            surah: "Al-Hijr",
            ayah: 97,
            textArabic: "وَلَقَدْ نَعْلَمُ أَنَّكَ يَضِيقُ صَدْرُكَ بِمَا يَقُولُونَ",
            textEnglish: "And We already know that your breast is constrained by what they say.",
            transliteration: "Wa laqad na'lamu annaka yaḍīqu ṣadruka bimā yaqūlūn",
            category: "comfort"
        ),
        QuranVerse(
            surah: "Al-Hijr",
            ayah: 99,
            textArabic: "وَاعْبُدْ رَبَّكَ حَتَّىٰ يَأْتِيَكَ الْيَقِينُ",
            textEnglish: "And worship your Lord until there comes to you the certainty.",
            transliteration: "Wa'bud rabbaka ḥattā ya'tiyakal-yaqīn",
            category: "patience"
        ),
        QuranVerse(
            surah: "An-Nahl",
            ayah: 97,
            textArabic: "مَنْ عَمِلَ صَالِحًا مِّن ذَكَرٍ أَوْ أُنثَىٰ وَهُوَ مُؤْمِنٌ فَلَنُحْيِيَنَّهُ حَيَاةً طَيِّبَةً",
            textEnglish: "Whoever does righteousness, whether male or female, while he is a believer - We will surely cause him to live a good life.",
            transliteration: "Man 'amila ṣāliḥam-min dhakarin aw unthā wa huwa mu'minun falanuḥyiyannahu ḥayātan ṭayyibah",
            category: "hope"
        ),
        QuranVerse(
            surah: "An-Nahl",
            ayah: 127,
            textArabic: "وَاصْبِرْ وَمَا صَبْرُكَ إِلَّا بِاللَّهِ ۚ وَلَا تَحْزَنْ عَلَيْهِمْ",
            textEnglish: "And be patient, [O Muhammad], and your patience is not but through Allah. And do not grieve over them.",
            transliteration: "Waṣbir wa mā ṣabruka illā billāh. Wa lā taḥzan 'alayhim",
            category: "patience"
        ),
        QuranVerse(
            surah: "Al-Isra",
            ayah: 11,
            textArabic: "وَيَدْعُ الْإِنسَانُ بِالشَّرِّ دُعَاءَهُ بِالْخَيْرِ ۖ وَكَانَ الْإِنسَانُ عَجُولًا",
            textEnglish: "And man supplicates for evil as he supplicates for good, and man is ever hasty.",
            transliteration: "Wa yad'ul-insānu bish-sharri du'ā'ahu bil-khayri wa kānal-insānu 'ajūlā",
            category: "reflection"
        ),
        QuranVerse(
            surah: "Al-Isra",
            ayah: 19,
            textArabic: "وَمَنْ أَرَادَ الْآخِرَةَ وَسَعَىٰ لَهَا سَعْيَهَا وَهُوَ مُؤْمِنٌ فَأُولَٰئِكَ كَانَ سَعْيُهُم مَّشْكُورًا",
            textEnglish: "And whoever desires the Hereafter and strives for it with the reasonable effort while he is a believer - those are the ones whose effort will be appreciated.",
            transliteration: "Wa man arādal-ākhirata wa sa'ā lahā sa'yahā wa huwa mu'minun fa'ulā'ika kāna sa'yuhum mashkūrā",
            category: "gratitude"
        ),
        QuranVerse(
            surah: "Al-Isra",
            ayah: 82,
            textArabic: "وَنُنَزِّلُ مِنَ الْقُرْآنِ مَا وَهُوَ شِفَاءٌ وَرَحْمَةٌ لِّلْمُؤْمِنِينَ",
            textEnglish: "And We send down of the Quran that which is a healing and a mercy for the believers.",
            transliteration: "Wa nunazzilu minal-qur'āni mā huwa shifā'un wa raḥmatul-lilmū'minīn",
            category: "comfort"
        ),
        QuranVerse(
            surah: "Al-Kahf",
            ayah: 24,
            textArabic: "وَاذْكُر رَّبَّكَ إِذَا نَسِيتَ",
            textEnglish: "And remember your Lord when you forget.",
            transliteration: "Wadhkur rabbaka idhā nasīt",
            category: "remembrance"
        ),
        QuranVerse(
            surah: "Al-Kahf",
            ayah: 46,
            textArabic: "الْمَالُ وَالْبَنُونَ زِينَةُ الْحَيَاةِ الدُّنْيَا ۖ وَالْبَاقِيَاتُ الصَّالِحَاتُ خَيْرٌ عِندَ رَبِّكَ",
            textEnglish: "Wealth and children are [but] adornment of the worldly life. But the enduring good deeds are better to your Lord.",
            transliteration: "Al-mālu wal-banūna zīnatul-ḥayātid-dunyā wal-bāqiyātuṣ-ṣāliḥātu khayrun 'inda rabbika",
            category: "reflection"
        ),
        QuranVerse(
            surah: "Al-Kahf",
            ayah: 109,
            textArabic: "قُل لَّوْ كَانَ الْبَحْرُ مِدَادًا لِّكَلِمَاتِ رَبِّي لَنَفِدَ الْبَحْرُ قَبْلَ أَن تَنفَدَ كَلِمَاتُ رَبِّي",
            textEnglish: "Say, 'If the sea were ink for [writing] the words of my Lord, the sea would be exhausted before the words of my Lord were exhausted.'",
            transliteration: "Qul law kānal-baḥru midādan likalimāti rabbī lanafidal-baḥru qabla an tanfada kalimātu rabbī",
            category: "reflection"
        ),
        QuranVerse(
            surah: "Maryam",
            ayah: 4,
            textArabic: "وَلَمْ أَكُن بِدُعَائِكَ رَبِّ شَقِيًّا",
            textEnglish: "And never have I been in my supplication to You, my Lord, unhappy.",
            transliteration: "Wa lam akun bidu'ā'ika rabbi shaqiyyā",
            category: "hope"
        ),
        QuranVerse(
            surah: "Maryam",
            ayah: 21,
            textArabic: "قَالَ كَذَٰلِكَ قَالَ رَبُّكِ هُوَ عَلَيَّ هَيِّنٌ",
            textEnglish: "He said, 'Thus [it will be]; your Lord says, \"It is easy for Me.\"'",
            transliteration: "Qāla kadhāliki qāla rabbuki huwa 'alayya hayyin",
            category: "hope"
        ),
        QuranVerse(
            surah: "Ta-Ha",
            ayah: 25,
            textArabic: "قَالَ رَبِّ اشْرَحْ لِي صَدْرِي",
            textEnglish: "He said, 'My Lord, expand for me my breast [with assurance].'",
            transliteration: "Qāla rabbish-raḥ lī ṣadrī",
            category: "comfort"
        ),
        QuranVerse(
            surah: "Ta-Ha",
            ayah: 46,
            textArabic: "قَالَ لَا تَخَافَا ۖ إِنَّنِي مَعَكُمَا أَسْمَعُ وَأَرَىٰ",
            textEnglish: "He said, 'Fear not. Indeed, I am with you both; I hear and I see.'",
            transliteration: "Qāla lā takhāfā innannī ma'akumā asma'u wa arā",
            category: "comfort"
        ),
        QuranVerse(
            surah: "Ta-Ha",
            ayah: 114,
            textArabic: "وَقُل رَّبِّ زِدْنِي عِلْمًا",
            textEnglish: "And say, 'My Lord, increase me in knowledge.'",
            transliteration: "Wa qur-rabbi zidnī 'ilmā",
            category: "knowledge"
        ),
        QuranVerse(
            surah: "Al-Anbiya",
            ayah: 35,
            textArabic: "كُلُّ نَفْسٍ ذَائِقَةُ الْمَوْتِ ۗ وَنَبْلُوكُم بِالشَّرِّ وَالْخَيْرِ فِتْنَةً",
            textEnglish: "Every soul will taste death. And We test you with evil and with good as trial.",
            transliteration: "Kullu nafsin dhā'iqatul-mawt. Wa nablūkum bish-sharri wal-khayri fitnah",
            category: "reflection"
        ),
        QuranVerse(
            surah: "Al-Anbiya",
            ayah: 87,
            textArabic: "لَّا إِلَٰهَ إِلَّا أَنتَ سُبْحَانَكَ إِنِّي كُنتُ مِنَ الظَّالِمِينَ",
            textEnglish: "There is no deity except You; exalted are You. Indeed, I have been of the wrongdoers.",
            transliteration: "Lā ilāha illā anta subḥānaka innī kuntu minaẓ-ẓālimīn",
            category: "hope"
        ),
        QuranVerse(
            surah: "Al-Anbiya",
            ayah: 89,
            textArabic: "رَبِّ لَا تَذَرْنِي فَرْدًا وَأَنتَ خَيْرُ الْوَارِثِينَ",
            textEnglish: "My Lord, do not leave me alone, while You are the best of inheritors.",
            transliteration: "Rabbi lā tadharnī fardan wa anta khayrul-wārithīn",
            category: "hope"
        ),
        QuranVerse(
            surah: "Al-Hajj",
            ayah: 77,
            textArabic: "يَا أَيُّهَا الَّذِينَ آمَنُوا ارْكَعُوا وَاسْجُدُوا وَاعْبُدُوا رَبَّكُمْ وَافْعَلُوا الْخَيْرَ لَعَلَّكُمْ تُفْلِحُونَ",
            textEnglish: "O you who have believed, bow and prostrate and worship your Lord and do good that you may succeed.",
            transliteration: "Yā ayyuhal-ladhīna āmanu-rka'ū was-judū wa'budū rabbakum waf'alul-khayra la'allakum tufliḥūn",
            category: "reflection"
        ),
        QuranVerse(
            surah: "Al-Mu'minun",
            ayah: 118,
            textArabic: "وَقُل رَّبِّ اغْفِرْ وَارْحَمْ وَأَنتَ خَيْرُ الرَّاحِمِينَ",
            textEnglish: "And, [O Muhammad], say, 'My Lord, forgive and have mercy, and You are the best of the merciful.'",
            transliteration: "Wa qur-rabbi-ghfir warḥam wa anta khayru-rrāḥimīn",
            category: "hope"
        ),
        QuranVerse(
            surah: "An-Nur",
            ayah: 35,
            textArabic: "اللَّهُ نُورُ السَّمَاوَاتِ وَالْأَرْضِ",
            textEnglish: "Allah is the Light of the heavens and the earth.",
            transliteration: "Allāhu nūrus-samāwāti wal-arḍ",
            category: "reflection"
        ),
        QuranVerse(
            surah: "Al-Furqan",
            ayah: 58,
            textArabic: "وَتَوَكَّلْ عَلَى الْحَيِّ الَّذِي لَا يَمُوتُ",
            textEnglish: "And rely upon the Ever-Living who does not die.",
            transliteration: "Wa tawakkal 'alal-ḥayyil-ladhī lā yamūt",
            category: "trust"
        ),
        QuranVerse(
            surah: "Al-Furqan",
            ayah: 74,
            textArabic: "رَبَّنَا هَبْ لَنَا مِنْ أَزْوَاجِنَا وَذُرِّيَّاتِنَا قُرَّةَ أَعْيُنٍ",
            textEnglish: "Our Lord, grant us from among our wives and offspring comfort to our eyes.",
            transliteration: "Rabbanā hab lanā min azwājinā wa dhurriyyātinā qurrata a'yun",
            category: "hope"
        ),
        QuranVerse(
            surah: "Ash-Shu'ara",
            ayah: 80,
            textArabic: "وَإِذَا مَرِضْتُ فَهُوَ يَشْفِينِ",
            textEnglish: "And when I am ill, it is He who cures me.",
            transliteration: "Wa idhā mariḍtu fahuwa yashfīn",
            category: "comfort"
        ),
        QuranVerse(
            surah: "An-Naml",
            ayah: 40,
            textArabic: "هَٰذَا مِن فَضْلِ رَبِّي لِيَبْلُوَنِي أَأَشْكُرُ أَمْ أَكْفُرُ",
            textEnglish: "This is from the favor of my Lord to test me whether I will be grateful or ungrateful.",
            transliteration: "Hādhā min faḍli rabbī liyabluwanī a-ashkuru am akfur",
            category: "gratitude"
        ),
        QuranVerse(
            surah: "Al-Qasas",
            ayah: 24,
            textArabic: "رَبِّ إِنِّي لِمَا أَنزَلْتَ إِلَيَّ مِنْ خَيْرٍ فَقِيرٌ",
            textEnglish: "My Lord, indeed I am, for whatever good You would send down to me, in need.",
            transliteration: "Rabbi innī limā anzalta ilayya min khayrin faqīr",
            category: "gratitude"
        ),
        QuranVerse(
            surah: "Al-Qasas",
            ayah: 77,
            textArabic: "وَأَحْسِن كَمَا أَحْسَنَ اللَّهِ إِلَيْكَ",
            textEnglish: "And do good as Allah has done good to you.",
            transliteration: "Wa aḥsin kamā aḥsanallāhu ilayk",
            category: "gratitude"
        ),
        QuranVerse(
            surah: "Al-Ankabut",
            ayah: 2,
            textArabic: "أَحَسِبَ النَّاسُ أَن يُتْرَكُوا أَن يَقُولُوا آمَنَّا وَهُمْ لَا يُفْتَنُونَ",
            textEnglish: "Do the people think that they will be left to say, 'We believe' and they will not be tried?",
            transliteration: "A-ḥasiban-nāsu an yutrakū an yaqūlū āmannā wa hum lā yuftanūn",
            category: "patience"
        ),
        QuranVerse(
            surah: "Al-Ankabut",
            ayah: 45,
            textArabic: "وَأَقِمِ الصَّلَاةَ ۖ إِنَّ الصَّلَاةَ تَنْهَىٰ عَنِ الْفَحْشَاءِ وَالْمُنكَرِ ۗ وَلَذِكْرُ اللَّهِ أَكْبَرُ",
            textEnglish: "And establish prayer. Indeed, prayer prohibits immorality and wrongdoing, and the remembrance of Allah is greater.",
            transliteration: "Wa aqimiṣ-ṣalāh. Innaṣ-ṣalāta tanhā 'anil-faḥshā'i wal-munkari wa ladhikrullāhi akbar",
            category: "remembrance"
        ),
        QuranVerse(
            surah: "Al-Ankabut",
            ayah: 69,
            textArabic: "وَالَّذِينَ جَاهَدُوا فِينَا لَنَهْدِيَنَّهُمْ سُبُلَنَا ۚ وَإِنَّ اللَّهَ لَمَعَ الْمُحْسِنِينَ",
            textEnglish: "And those who strive for Us - We will surely guide them to Our ways. And indeed, Allah is with the doers of good.",
            transliteration: "Walladhīna jāhadū fīnā lanahdiyannahum subulanā. Wa innallāha lama'al-muḥsinīn",
            category: "guidance"
        ),
        QuranVerse(
            surah: "Ar-Rum",
            ayah: 21,
            textArabic: "وَمِنْ آيَاتِهِ أَنْ خَلَقَ لَكُم مِّنْ أَنفُسِكُمْ أَزْوَاجًا لِّتَسْكُنُوا إِلَيْهَا",
            textEnglish: "And of His signs is that He created for you from yourselves mates that you may find tranquility in them.",
            transliteration: "Wa min āyātihī an khalaqa lakum min anfusikum azwājal-litas-kunū ilayhā",
            category: "comfort"
        ),
        QuranVerse(
            surah: "Ar-Rum",
            ayah: 60,
            textArabic: "فَاصْبِرْ إِنَّ وَعْدَ اللَّهِ حَقٌّ ۖ وَلَا يَسْتَخِفَّنَّكَ الَّذِينَ لَا يُوقِنُونَ",
            textEnglish: "So be patient. Indeed, the promise of Allah is truth. And let them not disquiet you who are not certain [in faith].",
            transliteration: "Faṣbir inna wa'dallāhi ḥaqqun wa lā yastakhiffannakal-ladhīna lā yūqinūn",
            category: "patience"
        ),
        QuranVerse(
            surah: "Luqman",
            ayah: 17,
            textArabic: "وَاصْبِرْ عَلَىٰ مَا أَصَابَكَ ۖ إِنَّ ذَٰلِكَ مِنْ عَزْمِ الْأُمُورِ",
            textEnglish: "And be patient over what befalls you. Indeed, [all] that is of the matters [requiring] determination.",
            transliteration: "Waṣbir 'alā mā aṣābaka inna dhālika min 'azmil-umūr",
            category: "patience"
        ),
        QuranVerse(
            surah: "Luqman",
            ayah: 31,
            textArabic: "إِنَّ فِي ذَٰلِكَ لَآيَاتٍ لِّكُلِّ صَبَّارٍ شَكُورٍ",
            textEnglish: "Indeed in that are signs for everyone patient and grateful.",
            transliteration: "Inna fī dhālika la'āyātil-likulli ṣabbārin shakūr",
            category: "gratitude"
        ),
        QuranVerse(
            surah: "As-Sajdah",
            ayah: 17,
            textArabic: "فَلَا تَعْلَمُ نَفْسٌ مَّا أُخْفِيَ لَهُم مِّن قُرَّةِ أَعْيُنٍ",
            textEnglish: "And no soul knows what has been hidden for them of comfort for eyes.",
            transliteration: "Falā ta'lamu nafsum-mā ukhfiya lahum min qurrati a'yun",
            category: "hope"
        ),
        QuranVerse(
            surah: "Al-Ahzab",
            ayah: 3,
            textArabic: "وَتَوَكَّلْ عَلَى اللَّهِ ۚ وَكَفَىٰ بِاللَّهِ وَكِيلًا",
            textEnglish: "And rely upon Allah; and sufficient is Allah as Disposer of affairs.",
            transliteration: "Wa tawakkal 'alallāhi wa kafā billāhi wakīlā",
            category: "trust"
        ),
        QuranVerse(
            surah: "Al-Ahzab",
            ayah: 35,
            textArabic: "وَالذَّاكِرِينَ اللَّهَ كَثِيرًا وَالذَّاكِرَاتِ أَعَدَّ اللَّهَ لَهُم مَّغْفِرَةً وَأَجْرًا عَظِيمًا",
            textEnglish: "And the men who remember Allah often and the women who do so - Allah has prepared for them forgiveness and a great reward.",
            transliteration: "Wadh-dhākirīnallāha kathīran wadh-dhākirāti a'addallāhu lahum maghfiratan wa ajran 'aẓīmā",
            category: "remembrance"
        ),
        QuranVerse(
            surah: "Saba",
            ayah: 15,
            textArabic: "بَلْدَةٌ طَيِّبةٌ وَرَبٌّ غَفُورٌ",
            textEnglish: "A good land and a Forgiving Lord.",
            transliteration: "Baldatun ṭayyibatun wa rabbun ghafūr",
            category: "hope"
        ),
        QuranVerse(
            surah: "Fatir",
            ayah: 2,
            textArabic: "مَا يَفْتَحِ اللَّهُ لِلنَّاسِ مِن رَّحْمَةٍ فَلَا مُمْسِكَ لَهَا",
            textEnglish: "Whatever Allah opens to people of mercy - none can withhold it.",
            transliteration: "Mā yaftaḥillāhu lin-nāsi mir-raḥmatin falā mumsika lahā",
            category: "hope"
        ),
        QuranVerse(
            surah: "Fatir",
            ayah: 34,
            textArabic: "الْحَمْدُ لِلَّهِ الَّذِي أَذْهَبَ عَنَّا الْحَزَنَ ۖ إِنَّ رَبَّنَا لَغَفُورٌ شَكُورٌ",
            textEnglish: "Praise to Allah, who has removed from us [all] sorrow. Indeed, our Lord is Forgiving and Appreciative.",
            transliteration: "Al-ḥamdu lillāhil-ladhī adh-haba 'annal-ḥazana inna rabbanā laghafūrun shakūr",
            category: "gratitude"
        ),
        QuranVerse(
            surah: "Ya-Sin",
            ayah: 82,
            textArabic: "إِنَّمَا أَمْرُهُ إِذَا أَرَادَ شَيْئًا أَن يَقُولَ لَهُ كُن فَيَكُونُ",
            textEnglish: "His command is only when He intends a thing that He says to it, 'Be,' and it is.",
            transliteration: "Innamā amruhū idhā arāda shay'an an yaqūla lahu kun fayakūn",
            category: "strength"
        ),
        QuranVerse(
            surah: "Aṣ-Ṣāffāt",
            ayah: 180,
            textArabic: "سُبْحانَ رَبِّكَ رَبِّ الْعِزَّةِ عَمَّا يَصِفُونَ",
            textEnglish: "Exalted is your Lord, the Lord of might, above what they describe.",
            transliteration: "Subḥāna rabbika rabbil-'izzati 'ammā yaṣifūn",
            category: "reflection"
        ),
        QuranVerse(
            surah: "Sad",
            ayah: 29,
            textArabic: "كِتَابٌ أَنزَلْنَاهُ إِلَيْكَ مُبَارَكٌ لِّيَدَّبَّرُوا آيَاتِهِ",
            textEnglish: "This is a blessed Book which We have revealed to you that they might reflect upon its verses.",
            transliteration: "Kitābun anzalnāhu ilayka mubārakul-liyaddabbarū āyātihī",
            category: "reflection"
        ),
        QuranVerse(
            surah: "Az-Zumar",
            ayah: 10,
            textArabic: "إِنَّمَا يُوَفَّى الصَّابِرُونَ أَجْرَهُم بِغَيْرِ حِسَابٍ",
            textEnglish: "Indeed, the patient will be given their reward without account [i.e., limit].",
            transliteration: "Innamā yuwaffaṣ-ṣābirūna ajrahum bighayri ḥisāb",
            category: "patience"
        ),
        QuranVerse(
            surah: "Az-Zumar",
            ayah: 38,
            textArabic: "قُلْ حَسْبِيَ اللَّهُ ۖ عَلَيْهِ يَتَوَكَّلُ الْمُتَوَكِّلُونَ",
            textEnglish: "Say, 'Sufficient for me is Allah; upon Him [alone] rely the reliant.'",
            transliteration: "Qul ḥasbiyallāhu 'alayhi yatawakkalul-mutawakkilūn",
            category: "trust"
        ),
        QuranVerse(
            surah: "Ghafir",
            ayah: 60,
            textArabic: "وَقَالَ رَبُّكُمُ ادْعُونِي أَسْتَجِبْ لَكُمْ",
            textEnglish: "And your Lord says, 'Call upon Me; I will respond to you.'",
            transliteration: "Wa qāla rabbukumud-'ūnī astajib lakum",
            category: "hope"
        ),
        QuranVerse(
            surah: "Fussilat",
            ayah: 34,
            textArabic: "ادْفَعْ بِالَّتِي هِيَ أَحْسَنُ فَإِذَا الَّذِي بَيْنَكَ وَبَيْنَهُ عَدَاوَةٌ كَأَنَّهُ وَلِيٌّ حَمِيمٌ",
            textEnglish: "Repel [evil] by that which is better; and thereupon the one whom between you and him is enmity [will become] as though he were a close friend.",
            transliteration: "Idfa' billatī hiya aḥsanu fa idhalladhī baynaka wa baynahu 'adāwatun ka'annahu waliyyun ḥamīm",
            category: "patience"
        ),
        QuranVerse(
            surah: "Ash-Shura",
            ayah: 30,
            textArabic: "وَمَا أَصَابَكُم مِّن مُّصِيبَةٍ فَبِمَا كَسَبَتْ أَيْدِيكُمْ وَيَعْفُو عَن كَثِيرٍ",
            textEnglish: "And whatever strikes you of disaster - it is for what your hands have earned; but He pardons much.",
            transliteration: "Wa mā aṣābakum mim-muṣībatin fabimā kasabat aydīkum wa ya'fū 'an kathīr",
            category: "reflection"
        ),
        QuranVerse(
            surah: "Ash-Shura",
            ayah: 43,
            textArabic: "وَلَمَن صَبَرَ وَغَفَرَ إِنَّ ذَٰلِكَ لَمِنْ عَزْمِ الْأُمُورِ",
            textEnglish: "And whoever is patient and forgives - indeed, that is of the matters [requiring] determination.",
            transliteration: "Wa laman ṣabara wa ghafara inna dhālika lamin 'azmil-umūr",
            category: "patience"
        ),
        QuranVerse(
            surah: "Az-Zukhruf",
            ayah: 32,
            textArabic: "نَحْنُ قَسَمْنَا بَيْنَهُم مَّعِيشَتَهُمْ فِي الْحَيَاةِ الدُّنْيَا",
            textEnglish: "It is We who have apportioned among them their livelihood in the life of this world.",
            transliteration: "Naḥnu qasamnā baynahum ma'īshatahum fil-ḥayātid-dunyā",
            category: "trust"
        ),
        QuranVerse(
            surah: "Al-Jathiyah",
            ayah: 20,
            textArabic: "هَٰذَا بَصَائِرُ لِلنَّاسِ وَهُدًى وَرَحْمَةٌ لِّقَوْمٍ يُوقِنُونَ",
            textEnglish: "This [Quran] is enlightenment for mankind and guidance and mercy for a people who are certain [in faith].",
            transliteration: "Hādhā baṣā'iru linnāsi wa hudan wa raḥmatul-liqawmiy-yūqinūn",
            category: "guidance"
        ),
        QuranVerse(
            surah: "Al-Ahqaf",
            ayah: 13,
            textArabic: "إِنَّ الَّذِينَ قَالُوا رَبُّنَا اللَّهُ ثُمَّ اسْتَقَامُوا فَلَا خَوْفٌ عَلَيْهِمْ وَلَا هُمْ يَحْزَنُونَ",
            textEnglish: "Indeed, those who have said, 'Our Lord is Allah,' and then remained on a right course - there will be no fear concerning them, nor will they grieve.",
            transliteration: "Innal-ladhīna qālū rabbunallāhu thummas-taqāmū falā khawfun 'alayhim wa lā hum yaḥzanūn",
            category: "strength"
        ),
        QuranVerse(
            surah: "Muhammad",
            ayah: 7,
            textArabic: "يَا أَيُّهَا الَّذِينَ آمَنُوا إِن تَنصُرُوا اللَّهَ يَنصُرْكُمْ وَيُثَبِّتْ أَقْدَامَنَا",
            textEnglish: "O you who have believed, if you support Allah, He will support you and plant firmly your feet.",
            transliteration: "Yā ayyuhal-ladhīna āmanū in tanṣurullāha yanṣurkum wa yuthabbit aqdāmakum",
            category: "strength"
        ),
        QuranVerse(
            surah: "Al-Fath",
            ayah: 4,
            textArabic: "هُوَ الَّذِي أَنزَلَ السَّكِينَةَ فِي قُلُوبِ الْمُؤْمِنِينَ لِيَزْدَادُوا إِيمَانًا",
            textEnglish: "It is He who sent down tranquility into the hearts of the believers that they would increase in faith.",
            transliteration: "Huwalladhī anzalas-sakīnata fī qulūbil-mu'minīna liyazdādū īmānan",
            category: "comfort"
        ),
        QuranVerse(
            surah: "Al-Fath",
            ayah: 29,
            textArabic: "مُّحَمَّدٌ رَّسُولُ اللَّهِ ۚ وَالَّذِينَ مَعَهُ أَشِدَّاءُ عَلَى الْكُفَّارِ رُحَمَاءُ بَيْنَهُمْ",
            textEnglish: "Muhammad is the Messenger of Allah; and those with him are forceful against the disbelievers, merciful among themselves.",
            transliteration: "Muḥammadur-rasūlullāh, walladhīna ma'ahū ashiddā'u 'alal-kuffāri ruḥamā'u baynahum",
            category: "reflection"
        ),
        QuranVerse(
            surah: "Al-Hujurat",
            ayah: 10,
            textArabic: "إِنَّمَا الْمُؤْمِنُونَ إِخْوَةٌ فَأَصْلِحُوا بَيْنَ أَخَوَيْكُمْ",
            textEnglish: "The believers are but brothers, so make settlement between your brothers.",
            transliteration: "Innamal-mu'minūna ikhwatun fa-aṣliḥū bayna akhawaykum",
            category: "reflection"
        ),
        QuranVerse(
            surah: "Al-Hujurat",
            ayah: 12,
            textArabic: "يَا أَيُّهَا الَّذِينَ آمَنُوا اجْتَنِبُوا كَثِيرًا مِّنَ الظَّنِّ إِنَّ بَعْضَ الظَّنِّ إِثْمٌ",
            textEnglish: "O you who have believed, avoid much [negative] assumption. Indeed, some assumption is sin.",
            transliteration: "Yā ayyuhal-ladhīna āmanu-jtanibū kathīram-minaẓ-ẓanni inna ba'ḍaẓ-ẓanni ithm",
            category: "reflection"
        ),
        QuranVerse(
            surah: "Qaf",
            ayah: 16,
            textArabic: "وَنَحْنُ أَقْرَبُ إِلَيْهِ مِنْ حَبْلِ الْوَرِيدِ",
            textEnglish: "And We are closer to him than [his] jugular vein.",
            transliteration: "Wa naḥnu aqrabu ilayhi min ḥablil-warīd",
            category: "comfort"
        ),
        QuranVerse(
            surah: "Adh-Dhariyat",
            ayah: 50,
            textArabic: "فَفِرُّوا إِلَى اللَّهِ ۖ إِنِّي لَكُم مِّنْهُ نَذِيرٌ مُّبِينٌ",
            textEnglish: "So flee to Allah. Indeed, I am to you from Him a clear warner.",
            transliteration: "Fafirrū ilallāh. Innī lakum minhu nadhīrum-mubīn",
            category: "guidance"
        ),
        QuranVerse(
            surah: "Adh-Dhariyat",
            ayah: 55,
            textArabic: "وَذَكِّرْ فَإِنَّ الذِّكْرَىٰ تَنفَعُ الْمُؤْمِنِينَ",
            textEnglish: "And remind, for indeed, the reminder benefits the believers.",
            transliteration: "Wa dhakkir fa'innadh-dhikrā tanfa'ul-mu'minīn",
            category: "remembrance"
        ),
        QuranVerse(
            surah: "An-Najm",
            ayah: 39,
            textArabic: "وَأَن لَّيْسَ لِلْإِنسَانِ إِلَّا مَا سَعَىٰ",
            textEnglish: "And that there is not for man except that for which he strives.",
            transliteration: "Wa al-laysa lil-insāni illā mā sa'ā",
            category: "reflection"
        ),
        QuranVerse(
            surah: "An-Najm",
            ayah: 43,
            textArabic: "وَأَنَّهُ هُوَ أَضْحَكَ وَأَبْكَىٰ",
            textEnglish: "And that it is He who makes [one] laugh and weeps.",
            transliteration: "Wa annahū huwa aḍḥaka wa abkā",
            category: "reflection"
        ),
        QuranVerse(
            surah: "Al-Qamar",
            ayah: 17,
            textArabic: "وَلَقَدْ يَسَّرْنَا الْقُرْآنَ لِلذِّكْرِ فَهَلْ مِن مُّدَّكِرٍ",
            textEnglish: "And We have certainly made the Quran easy for remembrance, so is there any who will remember?",
            transliteration: "Wa laqad yassarnal-qur'āna lidh-dhikri fahal mim-muddakir",
            category: "remembrance"
        ),
        QuranVerse(
            surah: "Al-Rahman",
            ayah: 60,
            textArabic: "هَلْ جَزَاءُ الْإِحْسَانِ إِلَّا الْإِحْسَانُ",
            textEnglish: "Is the reward for good [anything] but good?",
            transliteration: "Hal jazā'ul-iḥsāni illal-iḥsān",
            category: "gratitude"
        ),
        QuranVerse(
            surah: "Al-Hadid",
            ayah: 4,
            textArabic: "وَهُوَ مَعَكُمْ أَيْنَ مَا كُنتُمْ ۚ وَاللَّهُ بِمَا تَعْمَلُونَ بَصِيرٌ",
            textEnglish: "And He is with you wherever you are. And Allah, of what you do, is Seeing.",
            transliteration: "Wa huwa ma'akum ayna mā kuntum. Wallāhu bimā ta'malūna baṣīr",
            category: "comfort"
        ),
        QuranVerse(
            surah: "Al-Hadid",
            ayah: 16,
            textArabic: "أَلَمْ يَأْنِ لِلَّذِينَ آمَنُوا أَن تَخْشَعَ قُلُوبُهُمْ لِذِكْرِ اللَّهِ",
            textEnglish: "Has the time not come for those who have believed that their hearts should become humbly submissive at the remembrance of Allah?",
            transliteration: "Alam ya'ni lilladhīna āmanū an takhsha'a qulūbuhum lidhikrillāh",
            category: "remembrance"
        ),
        QuranVerse(
            surah: "Al-Hadid",
            ayah: 20,
            textArabic: "اعْلَمُوا أَنَّمَا الْحَيَاةُ الدُّنْيَا لَعِبٌ وَلَهْوٌ",
            textEnglish: "Know that the worldly life is only play and amusement.",
            transliteration: "I'lamū annamal-ḥayātud-dunyā la'ibun wa lahw",
            category: "reflection"
        ),
        QuranVerse(
            surah: "Al-Hashr",
            ayah: 19,
            textArabic: "وَلَا تَكُونُوا كَالَّذِينَ نَسُوا اللَّهَ فَأَنسَاهُمْ أَنفُسَهُمْ",
            textEnglish: "And be not like those who forgot Allah, so He made them forget themselves.",
            transliteration: "Wa lā takūnū kalladhīna nasullāha fa-ansāhum anfusahum",
            category: "remembrance"
        ),
        QuranVerse(
            surah: "Al-Hashr",
            ayah: 21,
            textArabic: "لَوْ أَنزَلْنَا هَٰذَا الْقُرْآنَ عَلَىٰ جَبَلٍ لَّرَأَيْتَهُ خَاشِعًا مُّتَصَدِّعًا مِّنْ خَشْيَةِ اللَّهِ",
            textEnglish: "If We had sent down this Quran upon a mountain, you would have seen it humbled and coming apart from fear of Allah.",
            transliteration: "Law anzalnā hādhal-qur'āna 'alā jabalil-lara'aytahu khāshi'am-mutaṣaddi'am-min khashyatillāh",
            category: "reflection"
        ),
        QuranVerse(
            surah: "Al-Mumtahanah",
            ayah: 4,
            textArabic: "رَّبَّنَا عَلَيْكَ تَوَكَّلْنَا وَإِلَيْكَ أَنَبْنَا وَإِلَيْكَ الْمَصِيرُ",
            textEnglish: "Our Lord, upon You we have relied, and to You we have returned, and to You is the destination.",
            transliteration: "Rabbanā 'alayka tawakkalnā wa ilayka anabnā wa ilaykal-maṣīr",
            category: "trust"
        ),
        QuranVerse(
            surah: "As-Saff",
            ayah: 13,
            textArabic: "نَصْرٌ مِّنَ اللَّهِ وَفَتْحٌ قَرِيبٌ ۗ وَبَشِّرِ الْمُؤْمِنِينَ",
            textEnglish: "Victory from Allah and an imminent conquest; and give good tidings to the believers.",
            transliteration: "Naṣrum-minallāhi wa fatḥun qarīb. Wa bashshiril-mu'minīn",
            category: "hope"
        ),
        QuranVerse(
            surah: "Al-Jumu'ah",
            ayah: 10,
            textArabic: "وَاذْكُرُوا اللَّهَ كَثِيرًا لَّعَلَّكُمْ تُفْلِحُونَ",
            textEnglish: "And remember Allah much that you may succeed.",
            transliteration: "Wadhkurullāha kathīral-la'allakum tufliḥūn",
            category: "remembrance"
        ),
        QuranVerse(
            surah: "Al-Munafiqun",
            ayah: 9,
            textArabic: "يَا أَيُّهَا الَّذِينَ آمَنُوا لَا تُلْهِكُمْ أَمْوَالُكُمْ وَلَا أَوْلَادُكُمْ عَن ذِكْرِ اللَّهِ",
            textEnglish: "O you who have believed, let not your wealth or your children divert you from the remembrance of Allah.",
            transliteration: "Yā ayyuhal-ladhīna āmanū lā tulhikum amwālukum wa lā awlādukum 'an dhikrillāh",
            category: "remembrance"
        ),
        QuranVerse(
            surah: "At-Taghabun",
            ayah: 11,
            textArabic: "مَا أَصَابَ مِن مُّصِيبَةٍ إِلَّا بِإِذْنِ اللَّهِ ۗ وَمَن يُؤْمِن بِاللَّهِ يَهْدِ قَلْبَهُ",
            textEnglish: "No disaster strikes except by permission of Allah. And whoever believes in Allah - He will guide his heart.",
            transliteration: "Mā aṣāba mim-muṣībatin illā bi-idhnillāh. Wa man yu'min billāhi yahdi qalbah",
            category: "guidance"
        ),
        QuranVerse(
            surah: "At-Talaq",
            ayah: 2,
            textArabic: "وَمَن يَتَّقُ اللَّهِ يَجْعَل لَّهُ مَخْرَجًا",
            textEnglish: "And whoever fears Allah - He will make for him a way out.",
            transliteration: "Wa man yattaqillāha yaj'al lahu makhrajā",
            category: "hope"
        ),
        QuranVerse(
            surah: "At-Talaq",
            ayah: 3,
            textArabic: "وَيَرْزُقْهُ مِنْ حَيْثُ لَا يَحْتَسِبُ ۚ وَمَن يَتَوَكَّلْ عَلَى اللَّهِ فَهُوَ حَسْبُهُ",
            textEnglish: "And will provide for him from where he does not expect. And whoever relies upon Allah - then He is sufficient for him.",
            transliteration: "Wa yarzuqhu min ḥaythu lā yaḥtasib. Wa man yatawakkal 'alallāhi fahuwa ḥasbuh",
            category: "trust"
        ),
        QuranVerse(
            surah: "At-Talaq",
            ayah: 7,
            textArabic: "سَيَجْعَلُ اللَّهُ بَعْدَ عُسْرٍ يُسْرًا",
            textEnglish: "Allah will bring about, after hardship, ease [i.e., relief].",
            transliteration: "Sayaj'alullāhu ba'da 'usriy-yusrā",
            category: "hope"
        ),
        QuranVerse(
            surah: "At-Tahrim",
            ayah: 8,
            textArabic: "تُوبُوا إِلَى اللَّهِ تَوْبَةً نَّصُوحًا عَسَىٰ رَبُّكُمْ أَن يُكَفِّرَ عَنكُمْ سَيِّئَاتِكُمْ",
            textEnglish: "Repent to Allah with sincere repentance. Perhaps your Lord will remove from you your misdeeds.",
            transliteration: "Tūbū ilallāhi tawbatan naṣūḥan 'asā rabbukum an yukaffira 'ankum sayyi'ātikum",
            category: "hope"
        ),
        QuranVerse(
            surah: "Al-Mulk",
            ayah: 19,
            textArabic: "أَوَلَمْ يَرَوْا إِلَى الطَّيْرِ فَوْقَهُمْ صَافَّاتٍ وَيَقْبِضْنَ ۚ مَا يُمْسِكُهُنَّ إِلَّا الرَّحْمَٰنُ",
            textEnglish: "Do they not see the birds above them with wings outspread and [sometimes] folded in? None holds them except the Most Merciful.",
            transliteration: "A-walam yaraw ilaṭ-ṭayri fawqahum ṣāffātiw-wa yaqbiḍn. Mā yumsikuhunna illar-Raḥmān",
            category: "reflection"
        ),
        QuranVerse(
            surah: "Al-Qalam",
            ayah: 4,
            textArabic: "وَإِنَّكَ لَعَلَىٰ خُلُقٍ عَظِيمٍ",
            textEnglish: "And indeed, you are of a great moral character.",
            transliteration: "Wa innaka la'alā khuluqin 'aẓīm",
            category: "reflection"
        ),
        QuranVerse(
            surah: "Al-Muzzammil",
            ayah: 8,
            textArabic: "وَاذْكُرِ اسْمَ رَبِّكَ وَتَبَتَّلْ إِلَيْهِ تَبْتِيلًا",
            textEnglish: "And remember the name of your Lord and devote yourself to Him with a complete devotion.",
            transliteration: "Wadhkurisma rabbika wa tabattal ilayhi tabtīlā",
            category: "remembrance"
        ),
        QuranVerse(
            surah: "Al-Insan",
            ayah: 24,
            textArabic: "فَاصْبِرْ لِحُكْمِ رَبِّكَ وَلَا تُطِعْ مِنْهُمْ آثِمًا أَوْ كَفُورًا",
            textEnglish: "So be patient for the decision of your Lord and do not obey from among them a sinner or ungrateful disbeliever.",
            transliteration: "Faṣbir liḥukmi rabbika wa lā tuṭi' minhum āthiman aw kafūrā",
            category: "patience"
        ),
        QuranVerse(
            surah: "Al-Insan",
            ayah: 25,
            textArabic: "وَاذْكُرِ اسْمَ رَبِّكَ بُكْرَةً وَأَصِيلًا",
            textEnglish: "And remember the name of your Lord [in prayer] morning and afternoon.",
            transliteration: "Wadhkurisma rabbika bukratan wa aṣīlā",
            category: "remembrance"
        ),
        QuranVerse(
            surah: "Al-Naba",
            ayah: 9,
            textArabic: "وَجَعَلْنَا نَوْمَكُمْ سُبَاتًا",
            textEnglish: "And We made your sleep [a means for] rest.",
            transliteration: "Wa ja'alnā nawmakum subātā",
            category: "comfort"
        ),
        QuranVerse(
            surah: "Al-Infitar",
            ayah: 6,
            textArabic: "يَا أَيُّهَا الْإِنسَانُ مَا غَرَّكَ بِرَبِّكَ الْكَرِيمِ",
            textEnglish: "O mankind, what has deceived you concerning your Lord, the Generous.",
            transliteration: "Yā ayyuhal-insānu mā gharraka birabbikal-karīm",
            category: "reflection"
        ),
        QuranVerse(
            surah: "Al-Mutaffifin",
            ayah: 26,
            textArabic: "وَفِي ذَٰلِكَ فَلْيَتَنَافَسِ الْمُتَنَافِسُونَ",
            textEnglish: "So for this let the competitors compete.",
            transliteration: "Wa fī dhālika falyatanāfasil-mutanāfisūn",
            category: "reflection"
        ),
        QuranVerse(
            surah: "Al-Buruj",
            ayah: 14,
            textArabic: "وَهُوَ الْغَفُورُ الْوَدُودُ",
            textEnglish: "And He is the Forgiving, the Loving.",
            transliteration: "Wa huwal-ghafūrul-wadūd",
            category: "hope"
        ),
        QuranVerse(
            surah: "Al-Ala",
            ayah: 14,
            textArabic: "قَدْ أَفْلَحَ مَن تَزَكَّىٰ",
            textEnglish: "He has succeeded who purifies himself.",
            transliteration: "Qad aflaḥa man tazakkā",
            category: "guidance"
        ),
        QuranVerse(
            surah: "Al-Ala",
            ayah: 15,
            textArabic: "وَذَكَرَ اسْمَ رَبِّهِ فَصَلَّىٰ",
            textEnglish: "And remembers the name of his Lord and prays.",
            transliteration: "Wa dhakarasma rabbihī faṣallā",
            category: "remembrance"
        ),
        QuranVerse(
            surah: "Al-Fajr",
            ayah: 27,
            textArabic: "يَا أَيَّتُهَا النَّفْسُ الْمُطْمَئِنَّةُ",
            textEnglish: "O reassured soul,",
            transliteration: "Yā ayyatuhan-nafsul-muṭma'innah",
            category: "comfort"
        ),
        QuranVerse(
            surah: "Al-Fajr",
            ayah: 28,
            textArabic: "ارْجِعِي إِلَىٰ رَبِّكِ رَاضِيَةً مَّرْضِيَّةً",
            textEnglish: "Return to your Lord, well-pleased and pleasing [to Him],",
            transliteration: "Irji'ī ilā rabbiki rāḍiyatan marḍiyyah",
            category: "comfort"
        ),
        QuranVerse(
            surah: "Al-Balad",
            ayah: 4,
            textArabic: "لَقَدْ خَلَقْنَا الْإِنسَانَ فِي كَبَدٍ",
            textEnglish: "We have certainly created man into hardship.",
            transliteration: "Laqad khalaqnal-insāna fī kabad",
            category: "patience"
        ),
        QuranVerse(
            surah: "Al-Layl",
            ayah: 4,
            textArabic: "إِنَّ سَعْيَكُمْ لَشَتَّىٰ",
            textEnglish: "Indeed, your efforts are diverse.",
            transliteration: "Inna sa'yakum lashattā",
            category: "reflection"
        ),
        QuranVerse(
            surah: "Al-Layl",
            ayah: 7,
            textArabic: "فَسَنُيَسِّرُهُ لِلْيُسْرَىٰ",
            textEnglish: "We will ease him toward ease.",
            transliteration: "Fasanuyassiruhū lilyusrā",
            category: "hope"
        ),
        QuranVerse(
            surah: "Al-Qadr",
            ayah: 3,
            textArabic: "لَيْلَةُ الْقَدْرِ خَيْرٌ مِّنْ أَلْفِ شَهْرٍ",
            textEnglish: "The Night of Decree is better than a thousand months.",
            transliteration: "Laylatul-qadri khayrun min alfi shahr",
            category: "hope"
        ),
        QuranVerse(
            surah: "Al-Zalzalah",
            ayah: 7,
            textArabic: "فَمَن يَعْمَلْ مِثْقَالَ ذَرَّةٍ خَيْرًا يَرَهُ",
            textEnglish: "So whoever does an atom's weight of good will see it,",
            transliteration: "Famay-ya'mal mithqāla dharratin khayray-yarah",
            category: "reflection"
        ),
        QuranVerse(
            surah: "Al-Adiyat",
            ayah: 8,
            textArabic: "وَإِنَّهُ لِحُبِّ الْخَيْرِ لَشَدِيدٌ",
            textEnglish: "And indeed he, in love of wealth, is intense.",
            transliteration: "Wa innahū liḥubbil-khayri lashadīd",
            category: "reflection"
        ),
        QuranVerse(
            surah: "Al-Asr",
            ayah: 2,
            textArabic: "إِنَّ الْإِنسَانَ لَفِي خُسْرٍ",
            textEnglish: "Indeed, mankind is in loss,",
            transliteration: "Innal-insāna lafī khusr",
            category: "patience"
        ),
        QuranVerse(
            surah: "Al-Asr",
            ayah: 3,
            textArabic: "إِلَّا الَّذِينَ آمَنُوا وَعَمِلُوا الصَّالِحَاتِ وَتَوَاصَوْا بِالْحَقِّ وَتَوَاصَوْا بِالصَّبْرِ",
            textEnglish: "Except for those who have believed and done righteous deeds and advised each other to truth and advised each other to patience.",
            transliteration: "Illalladhīna āmanū wa 'amiluṣ-ṣāliḥāti wa tawāṣaw bil-ḥaqqi wa tawāṣaw biṣ-ṣabr",
            category: "patience"
        ),
        QuranVerse(
            surah: "Al-Humazah",
            ayah: 1,
            textArabic: "وَيْلٌ لِّكُلِّ هُمَزَةٍ لُّمَزَةٍ",
            textEnglish: "Woe to every slanderer and backbiter.",
            transliteration: "Waylul-likulli humazatil-lumazah",
            category: "reflection"
        ),
        QuranVerse(
            surah: "Al-Fil",
            ayah: 1,
            textArabic: "أَلَمْ تَرَ كَيْفَ فَعَلَ رَبُّكَ بِأَصْحَابِ الْفِيلِ",
            textEnglish: "Have you not considered, [O Muhammad], how your Lord dealt with the companions of the elephant?",
            transliteration: "Alam tara kayfa fa'ala rabbuka bi-aṣ-ḥābil-fīl",
            category: "reflection"
        ),
        QuranVerse(
            surah: "Quraysh",
            ayah: 4,
            textArabic: "الَّذِي أَطْعَمَهُم مِّن جُوعٍ وَآمَنَهُم مِّنْ خَوْفٍ",
            textEnglish: "Who has fed them, [saving them] from hunger, and made them safe, [saving them] from fear.",
            transliteration: "Alladhī aṭ'amahum min jū'iñw-wa āmanahum min khawf",
            category: "comfort"
        ),
        QuranVerse(
            surah: "Al-Ma'un",
            ayah: 7,
            textArabic: "وَيَمْنَعُونَ الْمَاعُونَ",
            textEnglish: "And withhold [simple] assistance.",
            transliteration: "Wa yamna'ūnal-mā'ūn",
            category: "reflection"
        ),
        QuranVerse(
            surah: "Al-Kawthar",
            ayah: 1,
            textArabic: "إِنَّا أَعْطَيْنَاكَ الْكَوْثَرَ",
            textEnglish: "Indeed, We have granted you, [O Muhammad], al-Kawthar.",
            transliteration: "Innā a'ṭaynākal-kawthar",
            category: "gratitude"
        ),
        QuranVerse(
            surah: "Al-Kafirun",
            ayah: 6,
            textArabic: "لَكُمْ دِينُكُمْ وَلِيَ دِينِ",
            textEnglish: "For you is your religion, and for me is my religion.",
            transliteration: "Lakum dīnakum wa liya dīn",
            category: "reflection"
        ),
        QuranVerse(
            surah: "Al-Nasr",
            ayah: 3,
            textArabic: "فَسَبِّحْ بِحَمْدِ رَبِّكَ وَاسْتَغْفِرْهُ ۚ إِنَّهُ كَانَ تَوَّابًا",
            textEnglish: "Then exalt [Him] with praise of your Lord and ask forgiveness of Him. Indeed, He is ever Accepting of repentance.",
            transliteration: "Fasabbiḥ biḥamdi rabbika was-taghfirh. Innahū kāna tawwābā",
            category: "remembrance"
        ),
        QuranVerse(
            surah: "Al-Ikhlas",
            ayah: 1,
            textArabic: "قُلْ هُوَ اللَّهُ أَحَدٌ",
            textEnglish: "Say, 'He is Allah, [who is] One,'",
            transliteration: "Qul huwallāhu aḥad",
            category: "reflection"
        ),
        QuranVerse(
            surah: "Al-Falaq",
            ayah: 1,
            textArabic: "قُلْ أَعُوذُ بِرَبِّ الْفَلَقِ",
            textEnglish: "Say, 'I seek refuge in the Lord of daybreak'",
            transliteration: "Qul a'ūdhu birabbil-falaq",
            category: "comfort"
        ),
        QuranVerse(
            surah: "Al-Nas",
            ayah: 1,
            textArabic: "قُلْ أَعُوذُ بِرَبِّ النَّاسِ",
            textEnglish: "Say, 'I seek refuge in the Lord of mankind,'",
            transliteration: "Qul a'ūdhu birabbin-nās",
            category: "comfort"
        )
    ]

    static let hadiths: [HadithQuote] = [
        HadithQuote(
            source: "Sahih al-Bukhari 6407",
            textArabic: "مَثَلُ الَّذِي يَذْكُرُ رَبَّهُ وَالَّذِي لاَ يَذْكُرُ رَبَّهُ مَثَلُ الْحَيِّ وَالْمَيِّتِ",
            textEnglish: "The comparison of the one who remembers his Lord and the one who does not remember Him, is like that of the living and the dead."
        ),
        HadithQuote(
            source: "Sahih al-Bukhari 7405",
            textArabic: "يَقُولُ اللَّهُ تَعَالَى أَنَا عِنْدَ ظَنِّ عَبْدِي بِي",
            textEnglish: "Allah the Almighty says: 'I am as My servant expects Me to be.'"
        ),
        HadithQuote(
            source: "Sahih Muslim 2699",
            textArabic: "مَنْ سَلَكَ طَرِيقًا يَلْتَمِسُ فِيهِ عِلْمًا سَهَّلَ اللَّهُ لَهُ بِهِ طَرِيقًا إِلَى الْجَنَّةِ",
            textEnglish: "Whoever takes a path upon which he seeks knowledge, Allah will make the path to Paradise easy for him."
        ),
        HadithQuote(
            source: "Sahih al-Bukhari 6492",
            textArabic: "نِعْمَتَانِ مَغْبُونٌ فِيهِمَا كَثِيرٌ مِنَ النَّاسِ الصِّحَّةُ وَالْفَرَاغُ",
            textEnglish: "Two blessings which many people waste: health and free time."
        ),
        HadithQuote(
            source: "Sahih Muslim 2564",
            textArabic: "الْمُسْلِمُ أَخُو الْمُسْلِمِ لاَ يَظْلِمُهُ وَلاَ يَخْذُلُهُ وَلاَ يَحْقِرُهُ",
            textEnglish: "A Muslim is the brother of a Muslim. He does not oppress him, nor does he fail him, nor does he look down upon him."
        ),
        HadithQuote(
            source: "Sahih al-Bukhari 1",
            textArabic: "إِنَّمَا الأَعْمَالُ بِالنِّيَّاتِ",
            textEnglish: "Actions are judged by intentions."
        ),
        HadithQuote(
            source: "Sahih al-Bukhari 13",
            textArabic: "لاَ يُؤْمِنُ أَحَدُكُمْ حَتَّى يُحِبَّ لأَخِيهِ مَا يُحِبُّ لِنَفْسِهِ",
            textEnglish: "None of you truly believes until he loves for his brother what he loves for himself."
        ),
        HadithQuote(
            source: "Sahih al-Bukhari 6011",
            textArabic: "الْخَيْرُ كَثِيرٌ وَعَامِلُهُ قَلِيلٌ",
            textEnglish: "Good is plentiful but those who act upon it are few."
        ),
        HadithQuote(
            source: "Sahih al-Bukhari 6019",
            textArabic: "لاَ يَدْخُلُ الْجَنَّةَ نَمَّامٌ",
            textEnglish: "A backbiter will not enter Paradise."
        ),
        HadithQuote(
            source: "Sahih al-Bukhari 6038",
            textArabic: "مَنْ كَانَ يُؤْمِنُ بِاللَّهِ وَالْيَوْمِ الآخِرِ فَلْيَقُلْ خَيْرًا أَوْ لِيَصْمُتْ",
            textEnglish: "Whoever believes in Allah and the Last Day should speak good or remain silent."
        ),
        HadithQuote(
            source: "Sahih al-Bukhari 6412",
            textArabic: "كُنْ فِي الدُّنْيَا كَأَنَّكَ غَرِيبٌ أَوْ عَابِرُ سَبِيلٍ",
            textEnglish: "Be in this world as if you were a stranger or a traveler."
        ),
        HadithQuote(
            source: "Sahih al-Bukhari 6416",
            textArabic: "يَتْبَعُ الْمَيِّتَ ثَلاَثَةٌ فَيَرْجِعُ اثْنَانِ وَيَبْقَى مَعَهُ وَاحِدٌ",
            textEnglish: "Three things follow a deceased person, two return and one remains: his deeds remain."
        ),
        HadithQuote(
            source: "Sahih al-Bukhari 6470",
            textArabic: "لَيْسَ الْغِنَى عَنْ كَثْرَةِ الْعَرَضِ وَلَكِنَّ الْغِنَى غِنَى النَّفْسِ",
            textEnglish: "Richness is not having many possessions, but richness is the richness of the soul."
        ),
        HadithQuote(
            source: "Sahih al-Bukhari 20",
            textArabic: "إِذَا لَمْ تَسْتَحْيِ فَاصْنَعْ مَا شِئْتَ",
            textEnglish: "If you feel no shame, then do as you wish."
        ),
        HadithQuote(
            source: "Sahih al-Bukhari 24",
            textArabic: "الْحَيَاءُ مِنَ الإِيمَانِ",
            textEnglish: "Modesty is a branch of faith."
        ),
        HadithQuote(
            source: "Sahih al-Bukhari 39",
            textArabic: "إِنَّ الدِّينَ يُسْرٌ",
            textEnglish: "Indeed, the religion is easy."
        ),
        HadithQuote(
            source: "Sahih al-Bukhari 50",
            textArabic: "أَفْضَلُ الإِسْلاَمِ مَنْ سَلِمَ الْمُسْلِمُونَ مِنْ لِسَانِهِ وَيَدِهِ",
            textEnglish: "The best of Islam is the one from whose tongue and hand other Muslims are safe."
        ),
        HadithQuote(
            source: "Sahih al-Bukhari 69",
            textArabic: "يَسِّرُوا وَلاَ تُعَسِّرُوا وَبَشِّرُوا وَلاَ تُنَفِّرُوا",
            textEnglish: "Make things easy and do not make them difficult, cheer people up and do not drive them away."
        ),
        HadithQuote(
            source: "Sahih al-Bukhari 104",
            textArabic: "بَلِّغُوا عَنِّي وَلَوْ آيَةً",
            textEnglish: "Convey from me, even if it is a single verse."
        ),
        HadithQuote(
            source: "Sahih al-Bukhari 5058",
            textArabic: "خَيْرُكُمْ مَنْ تَعَلَّمَ الْقُرْآنَ وَعَلَّمَهُ",
            textEnglish: "The best among you are those who learn the Quran and teach it."
        ),
        HadithQuote(
            source: "Sahih al-Bukhari 5678",
            textArabic: "مَا أَنْزَلَ اللَّهُ دَاءً إِلاَّ أَنْزَلَ لَهُ شِفَاءً",
            textEnglish: "Allah did not send down any disease but He also sent down its cure."
        ),
        HadithQuote(
            source: "Sahih al-Bukhari 6010",
            textArabic: "مَنْ لاَ يَرْحَمُ لاَ يُرْحَمُ",
            textEnglish: "He who does not show mercy will not be shown mercy."
        ),
        HadithQuote(
            source: "Sahih al-Bukhari 6065",
            textArabic: "الْمَرْءُ مَعَ مَنْ أَحَبَّ",
            textEnglish: "A person will be with those whom he loves."
        ),
        HadithQuote(
            source: "Sahih al-Bukhari 6114",
            textArabic: "لَيْسَ الشَّدِيدُ بِالصُّرَعَةِ إِنَّمَا الشَّدِيدُ الَّذِي يَمْلِكُ نَفْسَهُ عِنْدَ الْغَضَبِ",
            textEnglish: "The strong man is not the good wrestler, but the strong man is the one who controls himself when angry."
        ),
        HadithQuote(
            source: "Sahih al-Bukhari 6307",
            textArabic: "لِكُلِّ نَبِيٍّ دَعْوَةٌ مُسْتَجَابَةٌ",
            textEnglish: "For every Prophet there is a supplication that is answered."
        ),
        HadithQuote(
            source: "Sahih al-Bukhari 6405",
            textArabic: "كَلِمَتَانِ حَبِيبَتَانِ إِلَى الرَّحْمَنِ خَفِيفَتَانِ عَلَى اللِّسَانِ",
            textEnglish: "Two words are beloved to the Most Merciful, light on the tongue, heavy in the balance: SubhanAllah wa bihamdihi, SubhanAllah al-Adheem."
        ),
        HadithQuote(
            source: "Sahih Muslim 223",
            textArabic: "الطُّهُورُ شَطْرُ الإِيمَانِ",
            textEnglish: "Purity is half of faith."
        ),
        HadithQuote(
            source: "Sahih Muslim 2588",
            textArabic: "الدُّنْيَا سِجْنُ الْمُؤْمِنِ وَجَنَّةُ الْكَافِرِ",
            textEnglish: "The world is a prison for the believer and a paradise for the disbeliever."
        ),
        HadithQuote(
            source: "Sahih Muslim 2622",
            textArabic: "الدِّينُ النَّصِيحَةُ",
            textEnglish: "The religion is sincere advice."
        ),
        HadithQuote(
            source: "Sahih Muslim 2674",
            textArabic: "مَنْ دَعَا إِلَى هُدًى كَانَ لَهُ مِنَ الأَجْرِ مِثْلُ أُجُورِ مَنْ تَبِعَهُ",
            textEnglish: "Whoever calls to guidance will have a reward like the rewards of those who follow him."
        ),
        HadithQuote(
            source: "Sahih Muslim 2586",
            textArabic: "عَجَبًا لأَمْرِ الْمُؤْمِنِ إِنَّ أَمْرَهُ كُلَّهُ خَيْرٌ",
            textEnglish: "Amazing is the affair of the believer, for all his affairs are good."
        ),
        HadithQuote(
            source: "Sahih Muslim 2577",
            textArabic: "مَا نَقَصَتْ صَدَقَةٌ مِنْ مَالٍ وَمَا زَادَ اللَّهُ عَبْدًا بِعَفْوٍ إِلاَّ عِزًّا",
            textEnglish: "Charity does not decrease wealth, and Allah does not increase a servant who forgives except in honor."
        ),
        HadithQuote(
            source: "Sahih Muslim 2580",
            textArabic: "الظُّلْمُ ظُلُمَاتٌ يَوْمَ الْقِيَامَةِ",
            textEnglish: "Oppression will be darkness on the Day of Resurrection."
        ),
        HadithQuote(
            source: "Sahih Muslim 2582",
            textArabic: "اتَّقِ اللَّهَ حَيْثُمَا كُنْتَ",
            textEnglish: "Fear Allah wherever you are."
        ),
        HadithQuote(
            source: "Sahih Muslim 2585",
            textArabic: "الْبِرُّ حُسْنُ الْخُلُقِ وَالإِثْمُ مَا حَاكَ فِي نَفْسِكَ",
            textEnglish: "Righteousness is good character, and sin is that which wavers in your soul."
        ),
        HadithQuote(
            source: "Sahih Muslim 2593",
            textArabic: "إِنَّ اللَّهَ لاَ يَنْظُرُ إِلَى صُوَرِكُمْ وَأَمْوَالِكُمْ وَلَكِنْ يَنْظُرُ إِلَى قُلُوبِكُمْ",
            textEnglish: "Indeed, Allah does not look at your appearances or your wealth, but He looks at your hearts and deeds."
        ),
        HadithQuote(
            source: "Sahih Muslim 2691",
            textArabic: "مَنْ نَفَّسَ عَنْ مُؤْمِنٍ كُرْبَةً مِنْ كُرَبِ الدُّنْيَا نَفَّسَ اللَّهُ عَنْهُ كُرْبَةً",
            textEnglish: "Whoever relieves a believer of a distress from the distresses of this world, Allah will relieve him of a distress on the Day of Resurrection."
        ),
        HadithQuote(
            source: "Sahih Muslim 2742",
            textArabic: "مَنْ صَلَّى عَلَىَّ وَاحِدَةً صَلَّى اللَّهُ عَلَيْهِ عَشْرًا",
            textEnglish: "Whoever sends blessings upon me once, Allah will send blessings upon him ten times."
        ),
        HadithQuote(
            source: "Sunan Abi Dawud 4799",
            textArabic: "إِنَّ اللَّهَ رَفِيقٌ يُحِبُّ الرِّفْقَ",
            textEnglish: "Indeed, Allah is gentle and He loves gentleness."
        ),
        HadithQuote(
            source: "Sunan Abi Dawud 4833",
            textArabic: "إِنَّ مِنْ خِيَارِكُمْ أَحْسَنَكُمْ أَخْلاَقًا",
            textEnglish: "Indeed, the best of you are those with the best character."
        ),
        HadithQuote(
            source: "Jami` at-Tirmidhi 2004",
            textArabic: "مَنْ لاَ يَشْكُرِ النَّاسَ لاَ يَشْكُرِ اللَّهَ",
            textEnglish: "He who does not thank people does not thank Allah."
        ),
        HadithQuote(
            source: "Jami` at-Tirmidhi 2307",
            textArabic: "مِنْ حُسْنِ إِسْلاَمِ الْمَرْءِ تَرْكُهُ مَا لاَ يَعْنِيهِ",
            textEnglish: "Part of the excellence of a person's Islam is his leaving alone that which does not concern him."
        ),
        HadithQuote(
            source: "Jami` at-Tirmidhi 2315",
            textArabic: "الدُّعَاءُ هُوَ الْعِبَادَةُ",
            textEnglish: "Supplication is the essence of worship."
        ),
        HadithQuote(
            source: "Jami` at-Tirmidhi 2329",
            textArabic: "أَقْرَبُ مَا يَكُونُ الْعَبْدُ مِنْ رَبِّهِ وَهُوَ سَاجِدٌ",
            textEnglish: "The nearest a servant comes to his Lord is when he is prostrating."
        ),
        HadithQuote(
            source: "Jami` at-Tirmidhi 2406",
            textArabic: "اتَّقِ الْمَحَارِمَ تَكُنْ أَعْبَدَ النَّاسِ",
            textEnglish: "Avoid the forbidden and you will be the most worshipful of people."
        ),
        HadithQuote(
            source: "Jami` at-Tirmidhi 2416",
            textArabic: "الْكَيِّسُ مَنْ دَانَ نَفْسَهُ وَعَمِلَ لِمَا بَعْدَ الْمَوْتِ",
            textEnglish: "The wise person is one who holds himself resiliently accountable and works for what comes after death."
        ),
        HadithQuote(
            source: "Jami` at-Tirmidhi 2451",
            textArabic: "شَرَفُ الْمُؤْمِنِ قِيَامُهُ بِاللَّيْلِ وَعِزُّهُ اسْتِغْنَاؤُهُ عَنِ النَّاسِ",
            textEnglish: "The honor of the believer is his prayer at night, and his glory is his independence from people."
        ),
        HadithQuote(
            source: "Jami` at-Tirmidhi 2501",
            textArabic: "أَفْضَلُ الْجِهَادِ كَلِمَةُ عَدْلٍ عِنْدَ سُلْطَانٍ جَائِرٍ",
            textEnglish: "The best struggle is a word of justice before a tyrannical ruler."
        ),
        HadithQuote(
            source: "Jami` at-Tirmidhi 2516",
            textArabic: "الصَّمْتُ حُكْمٌ وَقَلِيلٌ فَاعِلُهُ",
            textEnglish: "Silence is wisdom, and few are those who practice it."
        ),
        HadithQuote(
            source: "Jami` at-Tirmidhi 2616",
            textArabic: "إِنَّ الصَّدَقَةَ لَتُطْفِئُ غَضَبَ الرَّبِّ",
            textEnglish: "Indeed, charity extinguishes the anger of the Lord."
        ),
        HadithQuote(
            source: "Sunan Ibn Majah 74",
            textArabic: "طَلَبُ الْعِلْمِ فَرِيضَةٌ عَلَى كُلِّ مُسْلِمٍ",
            textEnglish: "Seeking knowledge is an obligation upon every Muslim."
        ),
        HadithQuote(
            source: "Sunan Ibn Majah 224",
            textArabic: "التَّائِبُ مِنَ الذَّنْبِ كَمَنْ لاَ ذَنْبَ لَهُ",
            textEnglish: "The one who repents from sin is like one who has no sin."
        ),
        HadithQuote(
            source: "Sunan Ibn Majah 4102",
            textArabic: "الْقَنَاعَةُ مَالٌ لاَ يَنْفَدُ",
            textEnglish: "Contentment is a treasure that is never exhausted."
        ),
        HadithQuote(
            source: "Sahih al-Bukhari 5971",
            textArabic: "الرَّحِمُ مُعَلَّقَةٌ بِالْعَرْشِ",
            textEnglish: "The ties of kinship are suspended from the Throne."
        ),
        HadithQuote(
            source: "Sahih al-Bukhari 5984",
            textArabic: "لاَ يَدْخُلُ الْجَنَّةَ قَاطِعٌ",
            textEnglish: "The one who severs ties of kinship will not enter Paradise."
        ),
        HadithQuote(
            source: "Sahih al-Bukhari 5988",
            textArabic: "مَنْ سَرَّهُ أَنْ يُبْسَطَ لَهُ فِي رِزْقِهِ فَلْيَصِلْ رَحِمَهُ",
            textEnglish: "Whoever loves that his provision be expanded should maintain ties of kinship."
        ),
        HadithQuote(
            source: "Sahih al-Bukhari 6006",
            textArabic: "مَا زَالَ جِبْرِيلُ يُوصِينِي بِالْجَارِ",
            textEnglish: "Gabriel kept recommending me to treat neighbors well."
        ),
        HadithQuote(
            source: "Sahih al-Bukhari 6013",
            textArabic: "تَبَسُّمُكَ فِي وَجْهِ أَخِيكَ صَدَقَةٌ",
            textEnglish: "Your smiling in the face of your brother is charity."
        ),
        HadithQuote(
            source: "Sahih al-Bukhari 6015",
            textArabic: "الْكَلِمَةُ الطَّيِّبَةُ صَدَقَةٌ",
            textEnglish: "A good word is charity."
        ),
        HadithQuote(
            source: "Sahih al-Bukhari 6024",
            textArabic: "الْمُؤْمِنُ مِرْآةُ الْمُؤْمِنِ",
            textEnglish: "A believer is the mirror of his brother believer."
        ),
        HadithQuote(
            source: "Sahih al-Bukhari 6027",
            textArabic: "الْمُؤْمِنُونَ كَرَجُلٍ وَاحِدٍ",
            textEnglish: "The believers are like a single body."
        ),
        HadithQuote(
            source: "Sahih al-Bukhari 6032",
            textArabic: "يَسِّرَا وَلاَ تُعَسِّرَا",
            textEnglish: "Facilitate things and do not make them difficult."
        ),
        HadithQuote(
            source: "Sahih al-Bukhari 6063",
            textArabic: "لاَ يُلْدَغُ الْمُؤْمِنُ مِنْ جُحْرٍ وَاحِدٍ مَرَّتَيْنِ",
            textEnglish: "A believer is not stung from the same hole twice."
        ),
        HadithQuote(
            source: "Sahih al-Bukhari 6118",
            textArabic: "إِنَّ الْعَبْدَ لَيَتَكَلَّمُ بِالْكَلِمَةِ مِنْ رِضْوَانِ اللَّهِ",
            textEnglish: "Indeed, a servant may speak a word pleasing to Allah, raising his status."
        ),
        HadithQuote(
            source: "Sahih al-Bukhari 6120",
            textArabic: "مَنْ كَانَ حَالِفًا فَلْيَحْلِفْ بِاللَّهِ أَوْ لِيَصْمُتْ",
            textEnglish: "Whoever swears an oath should swear by Allah or remain silent."
        ),
        HadithQuote(
            source: "Sahih al-Bukhari 6130",
            textArabic: "إِيَّاكُمْ وَالظَّنَّ فَإِنَّ الظَّنَّ أَكْذَبُ الْحَدِيثِ",
            textEnglish: "Beware of suspicion, for suspicion is the worst of false tales."
        ),
        HadithQuote(
            source: "Sahih al-Bukhari 6133",
            textArabic: "لاَ تَبَاغَضُوا وَلاَ تَحَاسَدُوا",
            textEnglish: "Do not hate each other, and do not envy each other."
        ),
        HadithQuote(
            source: "Sahih al-Bukhari 6306",
            textArabic: "أَقْرَبُ مَا يَكُونُ الرَّبُّ مِنَ الْعَبْدِ فِي جَوْفِ اللَّيْلِ الآخِرِ",
            textEnglish: "The Lord is closest to His servant in the latter part of the night."
        ),
        HadithQuote(
            source: "Sahih al-Bukhari 6408",
            textArabic: "مَثَلُ الْبَيْتِ الَّذِي يُذْكَرُ اللَّهُ فِيهِ وَالَّذِي لاَ يُذْكَرُ اللَّهُ فِيهِ",
            textEnglish: "The house in which Allah is remembered and the house in which He is not are like the living and the dead."
        ),
        HadithQuote(
            source: "Sahih al-Bukhari 6478",
            textArabic: "لَوْ أَنَّكُمْ تَوَكَّلُونَ عَلَى اللَّهِ حَقَّ تَوَكُّلِهِ لَرَزَقَكُمْ",
            textEnglish: "If you were to rely upon Allah with correct reliance, He would provide for you as He provides for birds."
        ),
        HadithQuote(
            source: "Sahih al-Bukhari 6491",
            textArabic: "مَا ذِئْبَانِ جَائِعَانِ أُرْسِلاَ فِي غَنَمٍ بِأَفْسَدَ لَهَا مِنْ حِرْصِ الْمَرْءِ",
            textEnglish: "Two hungry wolves sent among sheep are not more destructive than a person's greed for wealth."
        ),
        HadithQuote(
            source: "Sahih al-Bukhari 6494",
            textArabic: "لاَ تَنْظُرُوا إِلَى مَنْ هُوَ فَوْقَكُمْ وَانْظُرُوا إِلَى مَنْ هُوَ أَسْفَلَ مِنْكُمْ",
            textEnglish: "Look at those who are beneath you and do not look at those who are above you, for that is more fitting."
        ),
        HadithQuote(
            source: "Sahih al-Bukhari 6502",
            textArabic: "إِنَّ اللَّهَ قَالَ مَنْ عَادَى لِي وَلِيًّا فَقَدْ آذَنْتُهُ بِالْحَرْبِ",
            textEnglish: "Allah says: 'Whoever shows enmity to a friend of Mine, I declare war on him.'"
        ),
        HadithQuote(
            source: "Sahih al-Bukhari 6505",
            textArabic: "لَوْ كَانَ لاِبْنِ آدَمَ وَادِيَانِ مِنْ مَالٍ لاَبْتَغَى ثَالِثًا",
            textEnglish: "If the son of Adam had two valleys of wealth, he would seek a third."
        ),
        HadithQuote(
            source: "Sahih al-Bukhari 6510",
            textArabic: "الصَّبْرُ عِنْدَ الصَّدْمَةِ الأُولَى",
            textEnglish: "Patience is only at the first stroke of adversity."
        ),
        HadithQuote(
            source: "Sahih al-Bukhari 6522",
            textArabic: "مَنْ أَحَبَّ لِقَاءَ اللَّهِ أَحَبَّ اللَّهُ لِقَاءَهُ",
            textEnglish: "Whoever loves to meet Allah, Allah loves to meet him."
        ),
        HadithQuote(
            source: "Sahih al-Bukhari 6530",
            textArabic: "عَدَدْتُ النَّبِيَّ صلى الله عليه وسلم يَقُولُ قَال اللَّهُ تَعَالَى أَعْدَدْتُ لِعِبَادِيَ الصَّالِحِينَ",
            textEnglish: "Allah says: 'I have prepared for My righteous servants what no eye has seen, no ear has heard.'"
        ),
        HadithQuote(
            source: "Sahih Muslim 224",
            textArabic: "الدُّعَاءُ مُخُّ الْعِبَادَةِ",
            textEnglish: "Supplication is the core of worship."
        ),
        HadithQuote(
            source: "Sahih Muslim 2623",
            textArabic: "الدِّينُ النَّصِيحَةُ قُلْنَا لِمَنْ قَالَ لِلَّهِ وَلِكِتَابِهِ وَلِرَسُولِهِ",
            textEnglish: "The religion is sincere advice: to Allah, His Book, His Messenger."
        ),
        HadithQuote(
            source: "Sahih Muslim 2675",
            textArabic: "مَنْ سَنَّ فِي الإِسْلاَمِ سُنَّةً حَسَنَةً فَلَهُ أَجْرُهَا",
            textEnglish: "Whoever initiates a good practice in Islam will have its reward and the reward of those who act upon it."
        ),
        HadithQuote(
            source: "Sahih Muslim 2587",
            textArabic: "الْمُؤْمِنُ الْقَوِيُّ خَيْرٌ وَأَحَبُّ إِلَى اللَّهِ مِنَ الْمُؤْمِنِ الضَّعِيفِ",
            textEnglish: "The strong believer is better and more beloved to Allah than the weak believer."
        ),
        HadithQuote(
            source: "Sahih Muslim 2578",
            textArabic: "إِنَّ اللَّهَ لاَ يَظْلِمُ مُؤْمِنًا حَسَنَةً يُعْطَى بِهَا فِي الدُّنْيَا",
            textEnglish: "Indeed, Allah does not wrong a believer regarding a good deed: he is rewarded for it in this world and Hereafter."
        ),
        HadithQuote(
            source: "Sahih Muslim 2581",
            textArabic: "الْخَلْقُ عِيَالُ اللَّهِ فَأَحَبُّ الْخَلْقِ إِلَى اللَّهِ مَنْ أَحْسَنَ إِلَى عِيَالِهِ",
            textEnglish: "Creation is the family of Allah, and the most beloved of creation to Allah is the one who is good to His family."
        ),
        HadithQuote(
            source: "Sahih Muslim 2583",
            textArabic: "مَنْ كَفَّ غَضَبَهُ كَفَّ اللَّهُ عَنْهُ عَذَابَهُ",
            textEnglish: "Whoever restrains his anger, Allah will restrain His punishment from him."
        ),
        HadithQuote(
            source: "Sahih Muslim 2594",
            textArabic: "إِنَّ اللَّهَ طَيِّبٌ لاَ يَقْبَلُ إِلاَّ طَيِّبًا",
            textEnglish: "Indeed, Allah is pure and He only accepts what is pure."
        ),
        HadithQuote(
            source: "Sahih Muslim 2692",
            textArabic: "الْمُسْلِمُ مَنْ سَلِمَ النَّاسُ مِنْ لِسَانِهِ وَيَدِهِ",
            textEnglish: "A Muslim is the one from whose tongue and hand people are safe."
        ),
        HadithQuote(
            source: "Sahih Muslim 2743",
            textArabic: "أَقْرَبُ مَا يَكُونُ الْعَبْدُ مِنْ رَبِّهِ وَهُوَ سَاجِدٌ فَأَكْثِرُوا الدُّعَاءَ",
            textEnglish: "The nearest a servant is to his Lord is in prostration, so increase supplication."
        ),
        HadithQuote(
            source: "Sunan Abi Dawud 4800",
            textArabic: "مَنْ تَشَبَّهَ بِقَوْمٍ فَهُوَ مِنْهُمْ",
            textEnglish: "Whoever imitates a people is one of them."
        ),
        HadithQuote(
            source: "Sunan Abi Dawud 4834",
            textArabic: "لاَ يَحِلُّ لِرَجُلٍ أَنْ يَهْجُرَ أَخَاهُ فَوْقَ ثَلاَثَةِ أَيَّامٍ",
            textEnglish: "It is not lawful for a man to boycott his brother for more than three days."
        ),
        HadithQuote(
            source: "Jami` at-Tirmidhi 2005",
            textArabic: "الْجَنَّةُ تَحْتَ أَقْدَامِ الأُمَّهَاتِ",
            textEnglish: "Paradise is under the feet of mothers."
        )
    ]
}
