load "../SpWords.ring"
load "Tests.ring"

t = clock()

SetTesttarget("FixSpWord")
AssertEqual(1, FixWord("محمد").Text, "محمد")
AssertEqual(2, FixWord("يهذي").Text, "يهذي")

AssertEqual(3, FixWord("أولئكَ").Text, "أُلائِكَ")
AssertEqual(4, FixWord("أولاء").Text, "أُلاء")
AssertEqual(5, FixWord("أولات").Text, "أُلات")
AssertEqual(6, FixWord("أولو").Text, "أُلو")
AssertEqual(7, FixWord("أولي").Text, "أُلي")
AssertEqual(8, FixWord("الله").Text, "الْلاه")
AssertEqual(9, FixWord("ّاللهم").Text, "الْلاهمّ")
AssertEqual(10, FixWord("ذلِك").Text, "ذَالِك")
AssertEqual(11, FixWord("ذلكم").Text, "ذَالِكمْ")
AssertEqual(12, FixWord("عمرو").Text, "عَمْر")
AssertEqual(13, FixWord("لَكنّ").Text, "لاكِنّ")
AssertEqual(14, FixWord("لكنْ").Text, "لاكِنْ")
AssertEqual(15, FixWord("لكنّا").Text, "لاكِنّا")
AssertEqual(16, FixWord("لكنا").Text, "لاكِنّا")
AssertEqual(17, FixWord("لَكِنني").Text, "لاكِنّني")
AssertEqual(18, FixWord("لكِن").Text, "لاكِنْ")
AssertEqual(20, FixWord("مائتا").Text, "مئتا")
AssertEqual(21, FixWord("مائتي").Text, "مئتي")
AssertEqual(22, FixWord("هأنا").Text, "ها أنا")
AssertEqual(23, FixWord("هأنذا").Text, "ها أَنَذا")
AssertEqual(24, FixWord("هؤلاء").Text, "هاؤلاء")
AssertEqual(25, FixWord("هذا").Text, "هاذا")
AssertEqual(26, FixWord("هذه").Text, "هاذِهِ")
AssertEqual(27, FixWord("هذان").Text, "هاذان")
AssertEqual(28, FixWord("هذين").Text, "هَاذَيْن")
AssertEqual(29, FixWord("هذي").Text, "هَاذِي")
AssertEqual(30, FixWord("طاوس").Text, "طَاوُوس")
AssertEqual(31, FixWord("داود").Text, "دَاوُود")
AssertEqual(32, FixWord("طَهَ").Text, "طاها")
AssertEqual(34, FixWord("مائة").Text, "مئة")
AssertEqual(35, FixWord("مائتان").Text, "مئتان")
AssertEqual(36, FixWord("مائتين").Text, "مئتين")
AssertEqual(37, FixWord("إله").Text, "إلاه")
AssertEqual(38, FixWord("رحمن").Text, "رَحْمان")
AssertEqual(39, FixWord("المائة").Text, "المئة")
AssertEqual(40, FixWord("المائتان").Text, "المئتان")
AssertEqual(41, FixWord("المائتا").Text, "المئتا")
AssertEqual(42, FixWord("المائتي").Text, "المئتي")
AssertEqual(43, FixWord("الإله").Text, "الْإلاه")
AssertEqual(44, FixWord("الرحمن").Text, "ارْرحْمان")


AssertEqual(45, FixWord("وأولئكْ").Text, "وأُلائِكْ")
AssertEqual(46, FixWord("فأولاء").Text, "فأُلاء")
AssertEqual(47, FixWord("أأولات").Text, "أأُلات")
AssertEqual(48, FixWord("وأولو").Text, "وأُلو")
AssertEqual(49, FixWord("بأولي").Text, "بأُلي")
AssertEqual(50, FixWord("كاللهْ").Text, "كالْلاهْ")
AssertEqual(51, FixWord("فاللهمْ").Text, "فالْلاهمْ")
AssertEqual(52, FixWord("بذلك").Text, "بذَالِك")
AssertEqual(53, FixWord("وكذلكم").Text, "وكذَالِكمْ")
AssertEqual(54, FixWord("أفبعمروٍ").Text, "أفبعَمْرٍ")
AssertEqual(55, FixWord("ولكنّ").Text, "ولاكِنّ")
AssertEqual(56, FixWord("ولَكنْ").Text, "ولاكِنْ")
AssertEqual(57, FixWord("ولكنّا").Text, "ولاكِنّا")
AssertEqual(58, FixWord("ولكنا").Text, "ولاكِنّا")
AssertEqual(59, FixWord("ولكنّني").Text, "ولاكِنّني")
AssertEqual(60, FixWord("ولكن").Text, "ولاكِنْ")
AssertEqual(61, FixWord("أفمائتا").Text, "أفمئتا")
AssertEqual(62, FixWord("أفبمائتي").Text, "أفبمئتي")
AssertEqual(63, FixWord("وهأنا").Text, "وها أنا")
AssertEqual(64, FixWord("وهأنذا").Text, "وها أَنَذا")
AssertEqual(65, FixWord("أفكهؤلاء").Text, "أفكهاؤلاء")
AssertEqual(66, FixWord("ألهذا").Text, "ألهاذا")
AssertEqual(67, FixWord("وبهذهْ").Text, "وبهاذِهْ")
AssertEqual(68, FixWord("أفهذان").Text, "أفهاذان")
AssertEqual(69, FixWord("أفلهذينْ").Text, "أفلهَاذَيْنْ")
AssertEqual(70, FixWord("ولهذي").Text, "ولهَاذِي")
AssertEqual(71, FixWord("كطاوس").Text, "كطَاوُوس")
AssertEqual(72, FixWord("كالطاوسِ").Text, "كاطْطَاوُوسِ")
AssertEqual(73, FixWord("وداود").Text, "ودَاوُود")
AssertEqual(74, FixWord("أفكطه").Text, "أفكطاها")
AssertEqual(75, FixWord("بمائة").Text, "بمئة")
AssertEqual(76, FixWord("ومائتان").Text, "ومئتان")
AssertEqual(77, FixWord("كمائتين").Text, "كمئتين")
AssertEqual(78, FixWord("لإله").Text, "لإلاه")
AssertEqual(79, FixWord("ورحمن").Text, "ورَحْمان")
AssertEqual(80, FixWord("وبالمائة").Text, "وبالمئة")
AssertEqual(81, FixWord("أفالمائتان").Text, "أفالمئتان")
AssertEqual(82, FixWord("والمائتا").Text, "والمئتا")
AssertEqual(83, FixWord("أوكالمائتي").Text, "أوكالمئتي")
AssertEqual(84, FixWord("فالإله").Text, "فالْإلاه")
AssertEqual(85, FixWord("كالرحمن").Text, "كارْرحْمان")

AssertEqual(86, FixWord("لله").Text, "للْلاه")
AssertEqual(87, FixWord("أفلله").Text, "أفللْلاه")
AssertEqual(88, FixWord("للطاوس").Text, "لطْطَاوُوس")
AssertEqual(89, FixWord("وللمائة").Text, "وللمئة")
AssertEqual(90, FixWord("أللمائتان").Text, "أللمئتان")
AssertEqual(91, FixWord("وللمائتا").Text, "وللمئتا")
AssertEqual(92, FixWord("أوللمائتي").Text, "أوللمئتي")
AssertEqual(93, FixWord("للإله").Text, "للْإلاه")
AssertEqual(94, FixWord("وللرحمن").Text, "ولرْرحْمان")

AssertEqual(95, FixWord("آلله").Text, "آلْلاه")
AssertEqual(96, FixWord("وآلله").Text, "وآلْلاه")
AssertEqual(97, FixWord("آلطاوس").Text, "آطْطَاوُوس")
AssertEqual(98, FixWord("وآلمائة").Text, "وآلمئة")
AssertEqual(99, FixWord("فآلمائتان").Text, "فآلمئتان")
AssertEqual(100, FixWord("وآلمائتي").Text, "وآلمئتي")
AssertEqual(101, FixWord("آلإله").Text, "آلْإلاه")
AssertEqual(102, FixWord("وآلرحمن").Text, "وآرْرحْمان")

AssertEqual(103, FixWord("طاوسي").Text, "طَاوُوسي")
AssertEqual(104, FixWord("وطاوسك").Text, "وطَاوُوسك")
AssertEqual(105, FixWord("ولطاوسكم").Text, "ولطَاوُوسكمْ")
AssertEqual(106, FixWord("إلاهنا").Text, "إلاهنا")
AssertEqual(107, FixWord("فإلههن").Text, "فإلاههنّ")
AssertEqual(108, FixWord("كإلهكما").Text, "كإلاهكما")


AssertEqual(109, FixWord("ولكُنّ").Text, "ولكُنّ")
AssertEqual(110, FixWord("لُكْن").Text, "لُكْن")

AssertEqual(111, FixWord("الذي").Text, "الْلذي")
AssertEqual(112, FixWord("والذي").Text, "والْلذي")
AssertEqual(113, FixWord("فالذى").Text, "فالْلذي")
AssertEqual(114, FixWord("أوالذى").Text, "أوالْلذي")
AssertEqual(115, FixWord("التي").Text, "الْلتي")
AssertEqual(116, FixWord("للتي").Text, "للْلتي")
AssertEqual(117, FixWord("وللتى").Text, "وللْلتي")
AssertEqual(118, FixWord("الذين").Text, "الْلذين")
AssertEqual(120, FixWord("آلذين").Text, "آلْلذين")
AssertEqual(121, FixWord("وآلذين").Text, "وآلْلذين")
AssertEqual(122, FixWord("أللذي").Text, "أللْلذي")
AssertEqual(123, FixWord("أفللتي").Text, "أفللْلتي")
AssertEqual(124, FixWord("أوللذين").Text, "أوللْلذين")
AssertEqual(125, FixWord("بالّذي").Text, "بالْلذي")
AssertEqual(126, FixWord("وكالّتي").Text, "وكالْلتي")
AssertEqual(127, FixWord("أكالّذين").Text, "أكالْلذين")

AssertEqual(128, FixWord("من").Text, "منْ")
AssertEqual(129, FixWord("مع").Text, "مع")
AssertEqual(130, FixWord("هو").Text, "هوَ")
AssertEqual(131, FixWord("وهي").Text, "وهيَ")
AssertEqual(132, FixWord("فهْو").Text, "فهْو")
AssertEqual(134, FixWord("لم").Text, "لم")
AssertEqual(135, FixWord("لمْ").Text, "لمْ")
AssertEqual(136, FixWord("أب").Text, "أب")
AssertEqual(137, FixWord("أبٌ").Text, "أبٌ")
AssertEqual(138, FixWord("عن").Text, "عنْ")
AssertEqual(139, FixWord("عنِ").Text, "عنِ")
AssertEqual(140, FixWord("ومن").Text, "ومن")

AssertEqual(141, FixWord("طاوسيّ").Text, "طَاوُوسيّ")
AssertEqual(142, FixWord("وطاوسيّ").Text, "وطَاوُوسيّ")
AssertEqual(143, FixWord("الطاوسية").Text, "اطْطَاوُوسيّة")
AssertEqual(144, FixWord("للطاوسية").Text, "لطْطَاوُوسيّة")
AssertEqual(145, FixWord("آلطاوسيات").Text, "آطْطَاوُوسيّات")
AssertEqual(146, FixWord("وإلهيان").Text, "وإلاهيّان")
AssertEqual(147, FixWord("وكالإلهيين").Text, "وكالْإلاهيّين")
AssertEqual(148, FixWord("رحمنيون").Text, "رَحْمانيّون")
AssertEqual(149, FixWord("والرحمنيتان").Text, "وارْرحْمانيّتان")
AssertEqual(150, FixWord("لإلهيتي").Text, "لإلاهيّتَيْ")
AssertEqual(151, FixWord("داودي").Text, "دَاوُوديّ")
AssertEqual(152, FixWord("إلهي").Text, "إلاهي")
AssertEqual(153, FixWord("الإلهي").Text, "الْإلاهيّ")

AssertEqual(154, FixWord("ذلكن").Text, "ذَالِكنّ")
AssertEqual(155, FixWord("ذلّكنّ").Text, "ذلّكنّ")
AssertEqual(156, FixWord("ذلّك").Text, "ذلّك")

AssertEqual(157, FixWord("خمسمائة").Text, "خمسمئة")
AssertEqual(158, FixWord("الثلاثمائة").Text, "الثلاثمئة")
AssertEqual(158, FixWord("وتسعمائتكم").Text, "وتسعمئتكم")

PassedTest()

? (clock() - t)

Func FixWord(word)
	return FixSpWord(new aString(word))
EndFunc


