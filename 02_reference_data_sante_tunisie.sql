-- ============================================================================
-- Reference Data - GRH Ministère de la Santé de Tunisie
-- Generated: 2026-03-04
-- Insert order respects FK dependencies
-- ============================================================================

-- ============================================================================
-- 1. GOUVERNORAT: Les 24 gouvernorats de la Tunisie (ISO 3166-2:TN)
-- CHANGED: Replaced 12 Congolese departments with 24 Tunisian governorates
-- ============================================================================
INSERT INTO GOUVERNORAT (COD_GOUV, LIB_GOUV, LIB_GOUV_A) VALUES ('11', 'Tunis', 'تونس');
INSERT INTO GOUVERNORAT (COD_GOUV, LIB_GOUV, LIB_GOUV_A) VALUES ('12', 'Ariana', 'أريانة');
INSERT INTO GOUVERNORAT (COD_GOUV, LIB_GOUV, LIB_GOUV_A) VALUES ('13', 'Ben Arous', 'بن عروس');
INSERT INTO GOUVERNORAT (COD_GOUV, LIB_GOUV, LIB_GOUV_A) VALUES ('14', 'La Manouba', 'منوبة');
INSERT INTO GOUVERNORAT (COD_GOUV, LIB_GOUV, LIB_GOUV_A) VALUES ('21', 'Nabeul', 'نابل');
INSERT INTO GOUVERNORAT (COD_GOUV, LIB_GOUV, LIB_GOUV_A) VALUES ('22', 'Zaghouan', 'زغوان');
INSERT INTO GOUVERNORAT (COD_GOUV, LIB_GOUV, LIB_GOUV_A) VALUES ('23', 'Bizerte', 'بنزرت');
INSERT INTO GOUVERNORAT (COD_GOUV, LIB_GOUV, LIB_GOUV_A) VALUES ('31', 'Béja', 'باجة');
INSERT INTO GOUVERNORAT (COD_GOUV, LIB_GOUV, LIB_GOUV_A) VALUES ('32', 'Jendouba', 'جندوبة');
INSERT INTO GOUVERNORAT (COD_GOUV, LIB_GOUV, LIB_GOUV_A) VALUES ('33', 'Le Kef', 'الكاف');
INSERT INTO GOUVERNORAT (COD_GOUV, LIB_GOUV, LIB_GOUV_A) VALUES ('34', 'Siliana', 'سليانة');
INSERT INTO GOUVERNORAT (COD_GOUV, LIB_GOUV, LIB_GOUV_A) VALUES ('41', 'Kairouan', 'القيروان');
INSERT INTO GOUVERNORAT (COD_GOUV, LIB_GOUV, LIB_GOUV_A) VALUES ('42', 'Kasserine', 'القصرين');
INSERT INTO GOUVERNORAT (COD_GOUV, LIB_GOUV, LIB_GOUV_A) VALUES ('43', 'Sidi Bouzid', 'سيدي بوزيد');
INSERT INTO GOUVERNORAT (COD_GOUV, LIB_GOUV, LIB_GOUV_A) VALUES ('51', 'Sousse', 'سوسة');
INSERT INTO GOUVERNORAT (COD_GOUV, LIB_GOUV, LIB_GOUV_A) VALUES ('52', 'Monastir', 'المنستير');
INSERT INTO GOUVERNORAT (COD_GOUV, LIB_GOUV, LIB_GOUV_A) VALUES ('53', 'Mahdia', 'المهدية');
INSERT INTO GOUVERNORAT (COD_GOUV, LIB_GOUV, LIB_GOUV_A) VALUES ('61', 'Sfax', 'صفاقس');
INSERT INTO GOUVERNORAT (COD_GOUV, LIB_GOUV, LIB_GOUV_A) VALUES ('71', 'Gafsa', 'قفصة');
INSERT INTO GOUVERNORAT (COD_GOUV, LIB_GOUV, LIB_GOUV_A) VALUES ('72', 'Tozeur', 'توزر');
INSERT INTO GOUVERNORAT (COD_GOUV, LIB_GOUV, LIB_GOUV_A) VALUES ('73', 'Kébili', 'قبلي');
INSERT INTO GOUVERNORAT (COD_GOUV, LIB_GOUV, LIB_GOUV_A) VALUES ('81', 'Gabès', 'قابس');
INSERT INTO GOUVERNORAT (COD_GOUV, LIB_GOUV, LIB_GOUV_A) VALUES ('82', 'Médenine', 'مدنين');
INSERT INTO GOUVERNORAT (COD_GOUV, LIB_GOUV, LIB_GOUV_A) VALUES ('83', 'Tataouine', 'تطاوين');

-- ============================================================================
-- 2. DELEGATION: Délégations (exemples pour quelques gouvernorats)
-- CHANGED: Replaced Congolese districts with Tunisian delegations
-- Note: Tunisia has 264 délégations. Voici un échantillon représentatif.
-- ============================================================================
-- Gouvernorat de Tunis (11)
INSERT INTO DELEGATION (COD_GOUV, COD_DELEG, LIB_DELEG, LIB_DELEG_A) VALUES ('11', '1101', 'Tunis Médina', 'تونس المدينة');
INSERT INTO DELEGATION (COD_GOUV, COD_DELEG, LIB_DELEG, LIB_DELEG_A) VALUES ('11', '1102', 'Bab El Bhar', 'باب البحر');
INSERT INTO DELEGATION (COD_GOUV, COD_DELEG, LIB_DELEG, LIB_DELEG_A) VALUES ('11', '1103', 'Bab Souika', 'باب سويقة');
INSERT INTO DELEGATION (COD_GOUV, COD_DELEG, LIB_DELEG, LIB_DELEG_A) VALUES ('11', '1104', 'El Omrane', 'العمران');
INSERT INTO DELEGATION (COD_GOUV, COD_DELEG, LIB_DELEG, LIB_DELEG_A) VALUES ('11', '1105', 'El Omrane Supérieur', 'العمران الأعلى');
INSERT INTO DELEGATION (COD_GOUV, COD_DELEG, LIB_DELEG, LIB_DELEG_A) VALUES ('11', '1106', 'Ettahrir', 'التحرير');
INSERT INTO DELEGATION (COD_GOUV, COD_DELEG, LIB_DELEG, LIB_DELEG_A) VALUES ('11', '1107', 'El Menzah', 'المنزه');
INSERT INTO DELEGATION (COD_GOUV, COD_DELEG, LIB_DELEG, LIB_DELEG_A) VALUES ('11', '1108', 'Cité El Khadra', 'حي الخضراء');
INSERT INTO DELEGATION (COD_GOUV, COD_DELEG, LIB_DELEG, LIB_DELEG_A) VALUES ('11', '1109', 'Le Bardo', 'باردو');
INSERT INTO DELEGATION (COD_GOUV, COD_DELEG, LIB_DELEG, LIB_DELEG_A) VALUES ('11', '1110', 'Séjoumi', 'السيجومي');
INSERT INTO DELEGATION (COD_GOUV, COD_DELEG, LIB_DELEG, LIB_DELEG_A) VALUES ('11', '1111', 'Ezzouhour', 'الزهور');
INSERT INTO DELEGATION (COD_GOUV, COD_DELEG, LIB_DELEG, LIB_DELEG_A) VALUES ('11', '1112', 'El Hrairia', 'الحرايرية');
INSERT INTO DELEGATION (COD_GOUV, COD_DELEG, LIB_DELEG, LIB_DELEG_A) VALUES ('11', '1113', 'Sidi Hassine', 'سيدي حسين');
INSERT INTO DELEGATION (COD_GOUV, COD_DELEG, LIB_DELEG, LIB_DELEG_A) VALUES ('11', '1114', 'El Ouardia', 'الوردية');
INSERT INTO DELEGATION (COD_GOUV, COD_DELEG, LIB_DELEG, LIB_DELEG_A) VALUES ('11', '1115', 'El Kabaria', 'الكبارية');

-- Gouvernorat de l'Ariana (12)
INSERT INTO DELEGATION (COD_GOUV, COD_DELEG, LIB_DELEG, LIB_DELEG_A) VALUES ('12', '1201', 'Ariana Ville', 'أريانة المدينة');
INSERT INTO DELEGATION (COD_GOUV, COD_DELEG, LIB_DELEG, LIB_DELEG_A) VALUES ('12', '1202', 'Soukra', 'السكرة');
INSERT INTO DELEGATION (COD_GOUV, COD_DELEG, LIB_DELEG, LIB_DELEG_A) VALUES ('12', '1203', 'Raoued', 'رواد');
INSERT INTO DELEGATION (COD_GOUV, COD_DELEG, LIB_DELEG, LIB_DELEG_A) VALUES ('12', '1204', 'Kalâat El Andalous', 'قلعة الأندلس');
INSERT INTO DELEGATION (COD_GOUV, COD_DELEG, LIB_DELEG, LIB_DELEG_A) VALUES ('12', '1205', 'Sidi Thabet', 'سيدي ثابت');
INSERT INTO DELEGATION (COD_GOUV, COD_DELEG, LIB_DELEG, LIB_DELEG_A) VALUES ('12', '1206', 'Ettadhamen', 'التضامن');
INSERT INTO DELEGATION (COD_GOUV, COD_DELEG, LIB_DELEG, LIB_DELEG_A) VALUES ('12', '1207', 'Mnihla', 'المنيهلة');

-- Gouvernorat de Ben Arous (13)
INSERT INTO DELEGATION (COD_GOUV, COD_DELEG, LIB_DELEG, LIB_DELEG_A) VALUES ('13', '1301', 'Ben Arous', 'بن عروس');
INSERT INTO DELEGATION (COD_GOUV, COD_DELEG, LIB_DELEG, LIB_DELEG_A) VALUES ('13', '1302', 'La Nouvelle Médina', 'المدينة الجديدة');
INSERT INTO DELEGATION (COD_GOUV, COD_DELEG, LIB_DELEG, LIB_DELEG_A) VALUES ('13', '1303', 'El Mourouj', 'المروج');
INSERT INTO DELEGATION (COD_GOUV, COD_DELEG, LIB_DELEG, LIB_DELEG_A) VALUES ('13', '1304', 'Hammam Lif', 'حمام الأنف');
INSERT INTO DELEGATION (COD_GOUV, COD_DELEG, LIB_DELEG, LIB_DELEG_A) VALUES ('13', '1305', 'Hammam Chott', 'حمام الشط');
INSERT INTO DELEGATION (COD_GOUV, COD_DELEG, LIB_DELEG, LIB_DELEG_A) VALUES ('13', '1306', 'Bou Mhel El Bassatine', 'بومهل الباسطين');
INSERT INTO DELEGATION (COD_GOUV, COD_DELEG, LIB_DELEG, LIB_DELEG_A) VALUES ('13', '1307', 'Ezzahra', 'الزهراء');
INSERT INTO DELEGATION (COD_GOUV, COD_DELEG, LIB_DELEG, LIB_DELEG_A) VALUES ('13', '1308', 'Radès', 'رادس');
INSERT INTO DELEGATION (COD_GOUV, COD_DELEG, LIB_DELEG, LIB_DELEG_A) VALUES ('13', '1309', 'Mégrine', 'مقرين');
INSERT INTO DELEGATION (COD_GOUV, COD_DELEG, LIB_DELEG, LIB_DELEG_A) VALUES ('13', '1310', 'Mohamedia', 'المحمدية');
INSERT INTO DELEGATION (COD_GOUV, COD_DELEG, LIB_DELEG, LIB_DELEG_A) VALUES ('13', '1311', 'Fouchana', 'فوشانة');
INSERT INTO DELEGATION (COD_GOUV, COD_DELEG, LIB_DELEG, LIB_DELEG_A) VALUES ('13', '1312', 'Mornag', 'مرناق');

-- Gouvernorat de la Manouba (14)
INSERT INTO DELEGATION (COD_GOUV, COD_DELEG, LIB_DELEG, LIB_DELEG_A) VALUES ('14', '1401', 'La Manouba', 'منوبة');
INSERT INTO DELEGATION (COD_GOUV, COD_DELEG, LIB_DELEG, LIB_DELEG_A) VALUES ('14', '1402', 'Den Den', 'الدندان');
INSERT INTO DELEGATION (COD_GOUV, COD_DELEG, LIB_DELEG, LIB_DELEG_A) VALUES ('14', '1403', 'Douar Hicher', 'دوار هيشر');
INSERT INTO DELEGATION (COD_GOUV, COD_DELEG, LIB_DELEG, LIB_DELEG_A) VALUES ('14', '1404', 'Oued Ellil', 'وادي الليل');
INSERT INTO DELEGATION (COD_GOUV, COD_DELEG, LIB_DELEG, LIB_DELEG_A) VALUES ('14', '1405', 'Tebourba', 'طبربة');
INSERT INTO DELEGATION (COD_GOUV, COD_DELEG, LIB_DELEG, LIB_DELEG_A) VALUES ('14', '1406', 'El Battan', 'البطان');
INSERT INTO DELEGATION (COD_GOUV, COD_DELEG, LIB_DELEG, LIB_DELEG_A) VALUES ('14', '1407', 'Jedaida', 'الجديدة');
INSERT INTO DELEGATION (COD_GOUV, COD_DELEG, LIB_DELEG, LIB_DELEG_A) VALUES ('14', '1408', 'Borj El Amri', 'برج العامري');

-- Gouvernorat de Nabeul (21)
INSERT INTO DELEGATION (COD_GOUV, COD_DELEG, LIB_DELEG, LIB_DELEG_A) VALUES ('21', '2101', 'Nabeul', 'نابل');
INSERT INTO DELEGATION (COD_GOUV, COD_DELEG, LIB_DELEG, LIB_DELEG_A) VALUES ('21', '2102', 'Dar Chaâbane El Fehri', 'دار شعبان الفهري');
INSERT INTO DELEGATION (COD_GOUV, COD_DELEG, LIB_DELEG, LIB_DELEG_A) VALUES ('21', '2103', 'Béni Khiar', 'بني خيار');
INSERT INTO DELEGATION (COD_GOUV, COD_DELEG, LIB_DELEG, LIB_DELEG_A) VALUES ('21', '2104', 'Korba', 'قربة');
INSERT INTO DELEGATION (COD_GOUV, COD_DELEG, LIB_DELEG, LIB_DELEG_A) VALUES ('21', '2105', 'Menzel Temime', 'منزل تميم');
INSERT INTO DELEGATION (COD_GOUV, COD_DELEG, LIB_DELEG, LIB_DELEG_A) VALUES ('21', '2106', 'El Mida', 'الميدة');
INSERT INTO DELEGATION (COD_GOUV, COD_DELEG, LIB_DELEG, LIB_DELEG_A) VALUES ('21', '2107', 'Kelibia', 'قليبية');
INSERT INTO DELEGATION (COD_GOUV, COD_DELEG, LIB_DELEG, LIB_DELEG_A) VALUES ('21', '2108', 'Hammam Ghezaz', 'حمام الغزاز');
INSERT INTO DELEGATION (COD_GOUV, COD_DELEG, LIB_DELEG, LIB_DELEG_A) VALUES ('21', '2109', 'Haouaria', 'الهوارية');
INSERT INTO DELEGATION (COD_GOUV, COD_DELEG, LIB_DELEG, LIB_DELEG_A) VALUES ('21', '2110', 'Takelsa', 'تاكلسة');
INSERT INTO DELEGATION (COD_GOUV, COD_DELEG, LIB_DELEG, LIB_DELEG_A) VALUES ('21', '2111', 'Soliman', 'سليمان');
INSERT INTO DELEGATION (COD_GOUV, COD_DELEG, LIB_DELEG, LIB_DELEG_A) VALUES ('21', '2112', 'Menzel Bouzelfa', 'منزل بوزلفة');
INSERT INTO DELEGATION (COD_GOUV, COD_DELEG, LIB_DELEG, LIB_DELEG_A) VALUES ('21', '2113', 'Béni Khalled', 'بني خلاد');
INSERT INTO DELEGATION (COD_GOUV, COD_DELEG, LIB_DELEG, LIB_DELEG_A) VALUES ('21', '2114', 'Grombalia', 'قرمبالية');
INSERT INTO DELEGATION (COD_GOUV, COD_DELEG, LIB_DELEG, LIB_DELEG_A) VALUES ('21', '2115', 'Bouargoub', 'بوعرقوب');
INSERT INTO DELEGATION (COD_GOUV, COD_DELEG, LIB_DELEG, LIB_DELEG_A) VALUES ('21', '2116', 'Hammamet', 'الحمامات');

-- Gouvernorat de Sfax (61)
INSERT INTO DELEGATION (COD_GOUV, COD_DELEG, LIB_DELEG, LIB_DELEG_A) VALUES ('61', '6101', 'Sfax Ville', 'صفاقس المدينة');
INSERT INTO DELEGATION (COD_GOUV, COD_DELEG, LIB_DELEG, LIB_DELEG_A) VALUES ('61', '6102', 'Sfax Ouest', 'صفاقس الغربية');
INSERT INTO DELEGATION (COD_GOUV, COD_DELEG, LIB_DELEG, LIB_DELEG_A) VALUES ('61', '6103', 'Sfax Sud', 'صفاقس الجنوبية');
INSERT INTO DELEGATION (COD_GOUV, COD_DELEG, LIB_DELEG, LIB_DELEG_A) VALUES ('61', '6104', 'Sakiet Ezzit', 'ساقية الزيت');
INSERT INTO DELEGATION (COD_GOUV, COD_DELEG, LIB_DELEG, LIB_DELEG_A) VALUES ('61', '6105', 'Sakiet Eddaier', 'ساقية الدائر');
INSERT INTO DELEGATION (COD_GOUV, COD_DELEG, LIB_DELEG, LIB_DELEG_A) VALUES ('61', '6106', 'Thyna', 'طينة');
INSERT INTO DELEGATION (COD_GOUV, COD_DELEG, LIB_DELEG, LIB_DELEG_A) VALUES ('61', '6107', 'Agareb', 'عقارب');
INSERT INTO DELEGATION (COD_GOUV, COD_DELEG, LIB_DELEG, LIB_DELEG_A) VALUES ('61', '6108', 'Jebiniana', 'جبنيانة');
INSERT INTO DELEGATION (COD_GOUV, COD_DELEG, LIB_DELEG, LIB_DELEG_A) VALUES ('61', '6109', 'El Amra', 'العامرة');
INSERT INTO DELEGATION (COD_GOUV, COD_DELEG, LIB_DELEG, LIB_DELEG_A) VALUES ('61', '6110', 'El Hencha', 'الحنشة');
INSERT INTO DELEGATION (COD_GOUV, COD_DELEG, LIB_DELEG, LIB_DELEG_A) VALUES ('61', '6111', 'Menzel Chaker', 'منزل شاكر');
INSERT INTO DELEGATION (COD_GOUV, COD_DELEG, LIB_DELEG, LIB_DELEG_A) VALUES ('61', '6112', 'Ghraiba', 'الغريبة');
INSERT INTO DELEGATION (COD_GOUV, COD_DELEG, LIB_DELEG, LIB_DELEG_A) VALUES ('61', '6113', 'Bir Ali Ben Khalifa', 'بئر علي بن خليفة');
INSERT INTO DELEGATION (COD_GOUV, COD_DELEG, LIB_DELEG, LIB_DELEG_A) VALUES ('61', '6114', 'Skhira', 'الصخيرة');
INSERT INTO DELEGATION (COD_GOUV, COD_DELEG, LIB_DELEG, LIB_DELEG_A) VALUES ('61', '6115', 'Mahares', 'المحرس');
INSERT INTO DELEGATION (COD_GOUV, COD_DELEG, LIB_DELEG, LIB_DELEG_A) VALUES ('61', '6116', 'Kerkennah', 'قرقنة');

-- Gouvernorat de Sousse (51)
INSERT INTO DELEGATION (COD_GOUV, COD_DELEG, LIB_DELEG, LIB_DELEG_A) VALUES ('51', '5101', 'Sousse Ville', 'سوسة المدينة');
INSERT INTO DELEGATION (COD_GOUV, COD_DELEG, LIB_DELEG, LIB_DELEG_A) VALUES ('51', '5102', 'Sousse Riadh', 'سوسة الرياض');
INSERT INTO DELEGATION (COD_GOUV, COD_DELEG, LIB_DELEG, LIB_DELEG_A) VALUES ('51', '5103', 'Sousse Jawhara', 'سوسة جوهرة');
INSERT INTO DELEGATION (COD_GOUV, COD_DELEG, LIB_DELEG, LIB_DELEG_A) VALUES ('51', '5104', 'Sousse Sidi Abdelhamid', 'سوسة سيدي عبد الحميد');
INSERT INTO DELEGATION (COD_GOUV, COD_DELEG, LIB_DELEG, LIB_DELEG_A) VALUES ('51', '5105', 'Hammam Sousse', 'حمام سوسة');
INSERT INTO DELEGATION (COD_GOUV, COD_DELEG, LIB_DELEG, LIB_DELEG_A) VALUES ('51', '5106', 'Akouda', 'أكودة');
INSERT INTO DELEGATION (COD_GOUV, COD_DELEG, LIB_DELEG, LIB_DELEG_A) VALUES ('51', '5107', 'Kalâa Kebira', 'القلعة الكبرى');
INSERT INTO DELEGATION (COD_GOUV, COD_DELEG, LIB_DELEG, LIB_DELEG_A) VALUES ('51', '5108', 'Sidi Bou Ali', 'سيدي بوعلي');
INSERT INTO DELEGATION (COD_GOUV, COD_DELEG, LIB_DELEG, LIB_DELEG_A) VALUES ('51', '5109', 'Hergla', 'هرقلة');
INSERT INTO DELEGATION (COD_GOUV, COD_DELEG, LIB_DELEG, LIB_DELEG_A) VALUES ('51', '5110', 'Enfidha', 'النفيضة');
INSERT INTO DELEGATION (COD_GOUV, COD_DELEG, LIB_DELEG, LIB_DELEG_A) VALUES ('51', '5111', 'Bouficha', 'بوفيشة');
INSERT INTO DELEGATION (COD_GOUV, COD_DELEG, LIB_DELEG, LIB_DELEG_A) VALUES ('51', '5112', 'Kondar', 'كندار');
INSERT INTO DELEGATION (COD_GOUV, COD_DELEG, LIB_DELEG, LIB_DELEG_A) VALUES ('51', '5113', 'M''saken', 'المسعدين');
INSERT INTO DELEGATION (COD_GOUV, COD_DELEG, LIB_DELEG, LIB_DELEG_A) VALUES ('51', '5114', 'Kalâa Sghira', 'القلعة الصغرى');
INSERT INTO DELEGATION (COD_GOUV, COD_DELEG, LIB_DELEG, LIB_DELEG_A) VALUES ('51', '5115', 'Zaouia Ksiba Thrayet', 'الزاوية - القصيبة - الثريات');
INSERT INTO DELEGATION (COD_GOUV, COD_DELEG, LIB_DELEG, LIB_DELEG_A) VALUES ('51', '5116', 'Sidi El Heni', 'سيدي الهاني');

-- Note: Pour les autres gouvernorats, les délégations doivent être ajoutées
-- selon le même modèle. Voir la documentation jointe pour la liste complète.

-- ============================================================================
-- 3. PAYS: Pays essentiels (Tunisie en premier)
-- UNCHANGED: Structure universelle. Insertion de la Tunisie obligatoire.
-- ============================================================================
INSERT INTO PAYS (COD_PAYS, LIB_PAYS, ABRV_PAYS, CONTINENT, NATIONALITE) VALUES ('TN', 'Tunisie', 'TN', 'A', 'Tunisienne');
INSERT INTO PAYS (COD_PAYS, LIB_PAYS, ABRV_PAYS, CONTINENT, NATIONALITE) VALUES ('DZ', 'Algérie', 'DZ', 'A', 'Algérienne');
INSERT INTO PAYS (COD_PAYS, LIB_PAYS, ABRV_PAYS, CONTINENT, NATIONALITE) VALUES ('LY', 'Libye', 'LY', 'A', 'Libyenne');
INSERT INTO PAYS (COD_PAYS, LIB_PAYS, ABRV_PAYS, CONTINENT, NATIONALITE) VALUES ('MA', 'Maroc', 'MA', 'A', 'Marocaine');
INSERT INTO PAYS (COD_PAYS, LIB_PAYS, ABRV_PAYS, CONTINENT, NATIONALITE) VALUES ('MR', 'Mauritanie', 'MR', 'A', 'Mauritanienne');
INSERT INTO PAYS (COD_PAYS, LIB_PAYS, ABRV_PAYS, CONTINENT, NATIONALITE) VALUES ('EG', 'Égypte', 'EG', 'A', 'Égyptienne');
INSERT INTO PAYS (COD_PAYS, LIB_PAYS, ABRV_PAYS, CONTINENT, NATIONALITE) VALUES ('FR', 'France', 'FR', 'E', 'Française');
INSERT INTO PAYS (COD_PAYS, LIB_PAYS, ABRV_PAYS, CONTINENT, NATIONALITE) VALUES ('IT', 'Italie', 'IT', 'E', 'Italienne');
INSERT INTO PAYS (COD_PAYS, LIB_PAYS, ABRV_PAYS, CONTINENT, NATIONALITE) VALUES ('DE', 'Allemagne', 'DE', 'E', 'Allemande');
INSERT INTO PAYS (COD_PAYS, LIB_PAYS, ABRV_PAYS, CONTINENT, NATIONALITE) VALUES ('US', 'États-Unis', 'US', 'M', 'Américaine');

-- ============================================================================
-- 4. TYP_CATEGORIE: Classification socio-professionnelle
-- CHANGED: Adapted to Tunisian public health classification
-- Original: 01=Execution, 02=Grades, 03=Cadre et H.Classe
-- Now: 01=Ouvrier, 02=Agent d'exécution, 03=Agent de maîtrise, 04=Cadre, 05=Cadre supérieur
-- ============================================================================
INSERT INTO TYP_CATEGORIE (TYP_CAT, LIB_TYP_CAT, LIB_TYP_CAT_A) VALUES ('01', 'Ouvrier', 'عمال');
INSERT INTO TYP_CATEGORIE (TYP_CAT, LIB_TYP_CAT, LIB_TYP_CAT_A) VALUES ('02', 'Agent d''exécution', 'أعوان تنفيذ');
INSERT INTO TYP_CATEGORIE (TYP_CAT, LIB_TYP_CAT, LIB_TYP_CAT_A) VALUES ('03', 'Agent de maîtrise', 'أعوان تحكّم');
INSERT INTO TYP_CATEGORIE (TYP_CAT, LIB_TYP_CAT, LIB_TYP_CAT_A) VALUES ('04', 'Cadre', 'إطار');
INSERT INTO TYP_CATEGORIE (TYP_CAT, LIB_TYP_CAT, LIB_TYP_CAT_A) VALUES ('05', 'Cadre supérieur', 'إطار سامي');

-- ============================================================================
-- 5. ETAT_PAIE: États de la paie
-- UNCHANGED: Generic values, same for Tunisia
-- ============================================================================
INSERT INTO ETAT_PAIE (COD_ETAT, LIB_ETAT, LIB_ETAT_A) VALUES ('0', 'Actif', 'نشيط');
INSERT INTO ETAT_PAIE (COD_ETAT, LIB_ETAT, LIB_ETAT_A) VALUES ('1', 'Bloqué', 'موقوف');
INSERT INTO ETAT_PAIE (COD_ETAT, LIB_ETAT, LIB_ETAT_A) VALUES ('5', 'Arrêt définitif', 'توقف نهائي');
INSERT INTO ETAT_PAIE (COD_ETAT, LIB_ETAT, LIB_ETAT_A) VALUES ('8', 'Solde de tout compte', 'تصفية الحساب');

-- ============================================================================
-- 6. STATUT: Statuts d'imposition
-- CHANGED: Adapted for Tunisian public sector tax regimes
-- ============================================================================
INSERT INTO STATUT (COD_STAT, LIB_STAT, LIB_STAT_A) VALUES ('01', 'Régime normal', 'النظام العادي');
INSERT INTO STATUT (COD_STAT, LIB_STAT, LIB_STAT_A) VALUES ('02', 'Régime forfaitaire', 'النظام الجزافي');
INSERT INTO STATUT (COD_STAT, LIB_STAT, LIB_STAT_A) VALUES ('03', 'Exonéré', 'معفى');

-- ============================================================================
-- 7. ECHELON: Échelons (5 échelons, 24 mois chacun)
-- UNCHANGED: Generic public sector echelon system, applicable to Tunisia
-- ============================================================================
INSERT INTO ECHELON (COD_ECH, DUREE_ECH, LIB_ECH) VALUES (1, 24, 'Echelon 1');
INSERT INTO ECHELON (COD_ECH, DUREE_ECH, LIB_ECH) VALUES (2, 24, 'Echelon 2');
INSERT INTO ECHELON (COD_ECH, DUREE_ECH, LIB_ECH) VALUES (3, 24, 'Echelon 3');
INSERT INTO ECHELON (COD_ECH, DUREE_ECH, LIB_ECH) VALUES (4, 24, 'Echelon 4');
INSERT INTO ECHELON (COD_ECH, DUREE_ECH, LIB_ECH) VALUES (5, 24, 'Echelon 5');

-- ============================================================================
-- 8. LISTE_DOMAINE: Domaines de spécialité
-- CHANGED: Replaced bank domains with health sector specialties
-- Original: Banque et Finances, Courtier, Gestion, etc.
-- Now: Health sector medical and administrative specialties
-- ============================================================================
INSERT INTO LISTE_DOMAINE (CODE_DOMAINE, LIB_DOMAINE, LIB_DOMAINE_A) VALUES ('MED', 'Médecine Générale', 'الطب العام');
INSERT INTO LISTE_DOMAINE (CODE_DOMAINE, LIB_DOMAINE, LIB_DOMAINE_A) VALUES ('MED_SPE', 'Médecine Spécialisée', 'طب الاختصاص');
INSERT INTO LISTE_DOMAINE (CODE_DOMAINE, LIB_DOMAINE, LIB_DOMAINE_A) VALUES ('CHIR', 'Chirurgie', 'الجراحة');
INSERT INTO LISTE_DOMAINE (CODE_DOMAINE, LIB_DOMAINE, LIB_DOMAINE_A) VALUES ('PHARM', 'Pharmacie', 'الصيدلة');
INSERT INTO LISTE_DOMAINE (CODE_DOMAINE, LIB_DOMAINE, LIB_DOMAINE_A) VALUES ('DENT', 'Médecine Dentaire', 'طب الأسنان');
INSERT INTO LISTE_DOMAINE (CODE_DOMAINE, LIB_DOMAINE, LIB_DOMAINE_A) VALUES ('INF', 'Soins Infirmiers', 'التمريض');
INSERT INTO LISTE_DOMAINE (CODE_DOMAINE, LIB_DOMAINE, LIB_DOMAINE_A) VALUES ('BIOL', 'Biologie Médicale', 'البيولوجيا الطبية');
INSERT INTO LISTE_DOMAINE (CODE_DOMAINE, LIB_DOMAINE, LIB_DOMAINE_A) VALUES ('RADIO', 'Radiologie et Imagerie', 'الأشعة والتصوير');
INSERT INTO LISTE_DOMAINE (CODE_DOMAINE, LIB_DOMAINE, LIB_DOMAINE_A) VALUES ('ANESTH', 'Anesthésie et Réanimation', 'التخدير والإنعاش');
INSERT INTO LISTE_DOMAINE (CODE_DOMAINE, LIB_DOMAINE, LIB_DOMAINE_A) VALUES ('PEDIATR', 'Pédiatrie', 'طب الأطفال');
INSERT INTO LISTE_DOMAINE (CODE_DOMAINE, LIB_DOMAINE, LIB_DOMAINE_A) VALUES ('GYNECO', 'Gynécologie Obstétrique', 'طب النساء والتوليد');
INSERT INTO LISTE_DOMAINE (CODE_DOMAINE, LIB_DOMAINE, LIB_DOMAINE_A) VALUES ('EPIDEM', 'Épidémiologie', 'علم الأوبئة');
INSERT INTO LISTE_DOMAINE (CODE_DOMAINE, LIB_DOMAINE, LIB_DOMAINE_A) VALUES ('SANTE_PUB', 'Santé Publique', 'الصحة العمومية');
INSERT INTO LISTE_DOMAINE (CODE_DOMAINE, LIB_DOMAINE, LIB_DOMAINE_A) VALUES ('ADMIN', 'Administration et Gestion', 'الإدارة والتصرف');
INSERT INTO LISTE_DOMAINE (CODE_DOMAINE, LIB_DOMAINE, LIB_DOMAINE_A) VALUES ('INFO', 'Informatique', 'الإعلامية');
INSERT INTO LISTE_DOMAINE (CODE_DOMAINE, LIB_DOMAINE, LIB_DOMAINE_A) VALUES ('TECH', 'Technique et Maintenance', 'التقنية والصيانة');
INSERT INTO LISTE_DOMAINE (CODE_DOMAINE, LIB_DOMAINE, LIB_DOMAINE_A) VALUES ('FINAN', 'Finances et Comptabilité', 'المالية والمحاسبة');
INSERT INTO LISTE_DOMAINE (CODE_DOMAINE, LIB_DOMAINE, LIB_DOMAINE_A) VALUES ('JURID', 'Juridique', 'القانونية');
INSERT INTO LISTE_DOMAINE (CODE_DOMAINE, LIB_DOMAINE, LIB_DOMAINE_A) VALUES ('KINE', 'Kinésithérapie', 'العلاج الطبيعي');
INSERT INTO LISTE_DOMAINE (CODE_DOMAINE, LIB_DOMAINE, LIB_DOMAINE_A) VALUES ('LABO', 'Laboratoire', 'المخبر');
INSERT INTO LISTE_DOMAINE (CODE_DOMAINE, LIB_DOMAINE, LIB_DOMAINE_A) VALUES ('NUTRIT', 'Nutrition', 'التغذية');
INSERT INTO LISTE_DOMAINE (CODE_DOMAINE, LIB_DOMAINE, LIB_DOMAINE_A) VALUES ('PROT_CIV', 'Protection Civile', 'الحماية المدنية');
INSERT INTO LISTE_DOMAINE (CODE_DOMAINE, LIB_DOMAINE, LIB_DOMAINE_A) VALUES ('SAGE_F', 'Sage-femme', 'القبالة');
INSERT INTO LISTE_DOMAINE (CODE_DOMAINE, LIB_DOMAINE, LIB_DOMAINE_A) VALUES ('PSYCHO', 'Psychologie', 'علم النفس');

-- ============================================================================
-- 9. PRM_MILITAIRE: Situations vis-à-vis du service national
-- UNCHANGED: Universal military service statuses
-- ============================================================================
INSERT INTO PRM_MILITAIRE (COD_MIL, LIB_MIL, LIB_MIL_A) VALUES ('01', 'Effectué', 'أدّى الخدمة');
INSERT INTO PRM_MILITAIRE (COD_MIL, LIB_MIL, LIB_MIL_A) VALUES ('02', 'Non effectué', 'لم يؤدّ الخدمة');
INSERT INTO PRM_MILITAIRE (COD_MIL, LIB_MIL, LIB_MIL_A) VALUES ('03', 'Dispensé', 'معفى');
INSERT INTO PRM_MILITAIRE (COD_MIL, LIB_MIL, LIB_MIL_A) VALUES ('04', 'Ajourné', 'مؤجّل');
INSERT INTO PRM_MILITAIRE (COD_MIL, LIB_MIL, LIB_MIL_A) VALUES ('05', 'Exempté', 'معفى نهائيا');
INSERT INTO PRM_MILITAIRE (COD_MIL, LIB_MIL, LIB_MIL_A) VALUES ('06', 'Réformé', 'مصلح');
INSERT INTO PRM_MILITAIRE (COD_MIL, LIB_MIL, LIB_MIL_A) VALUES ('07', 'Non concernée', 'غير معني');
INSERT INTO PRM_MILITAIRE (COD_MIL, LIB_MIL, LIB_MIL_A) VALUES ('08', 'En cours', 'في طور الأداء');

-- ============================================================================
-- 10. GROUPE_SANGUIN: Groupes sanguins
-- UNCHANGED: Universal
-- ============================================================================
INSERT INTO GROUPE_SANGUIN (GRP_SANG, LIB_GRP_SANG) VALUES ('A+', 'A Positif');
INSERT INTO GROUPE_SANGUIN (GRP_SANG, LIB_GRP_SANG) VALUES ('A-', 'A Négatif');
INSERT INTO GROUPE_SANGUIN (GRP_SANG, LIB_GRP_SANG) VALUES ('B+', 'B Positif');
INSERT INTO GROUPE_SANGUIN (GRP_SANG, LIB_GRP_SANG) VALUES ('B-', 'B Négatif');
INSERT INTO GROUPE_SANGUIN (GRP_SANG, LIB_GRP_SANG) VALUES ('AB+', 'AB Positif');
INSERT INTO GROUPE_SANGUIN (GRP_SANG, LIB_GRP_SANG) VALUES ('AB-', 'AB Négatif');
INSERT INTO GROUPE_SANGUIN (GRP_SANG, LIB_GRP_SANG) VALUES ('O+', 'O Positif');
INSERT INTO GROUPE_SANGUIN (GRP_SANG, LIB_GRP_SANG) VALUES ('O-', 'O Négatif');

-- ============================================================================
-- 11. FILLIERE: Filières professionnelles
-- CHANGED: Replaced bank career paths with health sector filières
-- Original: Secrétariat, Administrative, Commerciale, Inspection, Manipulation Espèce
-- Now: Health ministry career paths aligned with Tunisian public health
-- ============================================================================
INSERT INTO FILLIERE (COD_FIL, LIB_FIL, LIB_FIL_A) VALUES ('01', 'Filière Médicale', 'المسار الطبي');
INSERT INTO FILLIERE (COD_FIL, LIB_FIL, LIB_FIL_A) VALUES ('02', 'Filière Paramédicale', 'المسار شبه الطبي');
INSERT INTO FILLIERE (COD_FIL, LIB_FIL, LIB_FIL_A) VALUES ('03', 'Filière Administrative', 'المسار الإداري');
INSERT INTO FILLIERE (COD_FIL, LIB_FIL, LIB_FIL_A) VALUES ('04', 'Filière Technique', 'المسار التقني');
INSERT INTO FILLIERE (COD_FIL, LIB_FIL, LIB_FIL_A) VALUES ('05', 'Filière Ouvrière', 'المسار العمالي');
INSERT INTO FILLIERE (COD_FIL, LIB_FIL, LIB_FIL_A) VALUES ('06', 'Filière Pharmaceutique', 'المسار الصيدلي');
INSERT INTO FILLIERE (COD_FIL, LIB_FIL, LIB_FIL_A) VALUES ('07', 'Filière Dentaire', 'مسار طب الأسنان');

-- ============================================================================
-- 12. AFFECTATION: Statuts administratifs
-- CHANGED: Replaced CDI/CDD with Tunisian public sector statuses
-- Original: CDI, CDD
-- Now: Titulaire, Stagiaire, Contractuel, Vacataire (Tunisian public sector)
-- ============================================================================
INSERT INTO AFFECTATION (COD_AFFECT, LIB_AFFECT, NAT_AFFECT, LIB_AFFECT_A) VALUES ('01', 'Titulaire', 'T', 'رسمي');
INSERT INTO AFFECTATION (COD_AFFECT, LIB_AFFECT, NAT_AFFECT, LIB_AFFECT_A) VALUES ('02', 'Stagiaire', 'S', 'متربّص');
INSERT INTO AFFECTATION (COD_AFFECT, LIB_AFFECT, NAT_AFFECT, LIB_AFFECT_A) VALUES ('03', 'Contractuel', 'C', 'متعاقد');
INSERT INTO AFFECTATION (COD_AFFECT, LIB_AFFECT, NAT_AFFECT, LIB_AFFECT_A) VALUES ('04', 'Vacataire', 'I', 'عرضي');
INSERT INTO AFFECTATION (COD_AFFECT, LIB_AFFECT, NAT_AFFECT, LIB_AFFECT_A) VALUES ('05', 'Ouvrier permanent', 'T', 'عامل قار');
INSERT INTO AFFECTATION (COD_AFFECT, LIB_AFFECT, NAT_AFFECT, LIB_AFFECT_A) VALUES ('06', 'Ouvrier occasionnel', 'C', 'عامل وقتي');
INSERT INTO AFFECTATION (COD_AFFECT, LIB_AFFECT, NAT_AFFECT, LIB_AFFECT_A) VALUES ('07', 'Intérimaire', 'I', 'مؤقّت');

-- ============================================================================
-- 13. NATURE_RECRUT: Modes de recrutement
-- CHANGED: Adapted for Tunisian public sector recruitment
-- ============================================================================
INSERT INTO NATURE_RECRUT (COD_NAT_RECR, LIB_NAT_RECR, TYP_CAND, LIB_NAT_RECR_A) VALUES ('01', 'Par voie de concours externe', 'E', 'عن طريق مناظرة خارجية');
INSERT INTO NATURE_RECRUT (COD_NAT_RECR, LIB_NAT_RECR, TYP_CAND, LIB_NAT_RECR_A) VALUES ('02', 'Par voie de concours interne', 'E', 'عن طريق مناظرة داخلية');
INSERT INTO NATURE_RECRUT (COD_NAT_RECR, LIB_NAT_RECR, TYP_CAND, LIB_NAT_RECR_A) VALUES ('03', 'Recrutement direct', 'D', 'انتداب مباشر');
INSERT INTO NATURE_RECRUT (COD_NAT_RECR, LIB_NAT_RECR, TYP_CAND, LIB_NAT_RECR_A) VALUES ('04', 'Réintégration', 'R', 'إعادة إدماج');
INSERT INTO NATURE_RECRUT (COD_NAT_RECR, LIB_NAT_RECR, TYP_CAND, LIB_NAT_RECR_A) VALUES ('05', 'Par contrat', 'D', 'بعقد');
INSERT INTO NATURE_RECRUT (COD_NAT_RECR, LIB_NAT_RECR, TYP_CAND, LIB_NAT_RECR_A) VALUES ('06', 'Examen professionnel', 'E', 'امتحان مهني');
INSERT INTO NATURE_RECRUT (COD_NAT_RECR, LIB_NAT_RECR, TYP_CAND, LIB_NAT_RECR_A) VALUES ('07', 'Sur titre', 'D', 'على أساس الشهادة');

-- ============================================================================
-- 14. TYPE_ORG: Niveaux hiérarchiques organisationnels
-- CHANGED: Adapted for health ministry organizational structure
-- Original: DG, DGA, SG, CG, Cons, DC, DR, Dept, Serv, Ag
-- Now: Ministry, DG, Direction, Sous-Direction, Service, Bureau, 
--      DRS, CHU, HR, HC, CSB, etc.
-- ============================================================================
INSERT INTO TYPE_ORG (TYP_ORG, LIB_TYP_ORG, LIB_TYP_ORG_A, RANG) VALUES ('MIN', 'Ministère', 'الوزارة', 1);
INSERT INTO TYPE_ORG (TYP_ORG, LIB_TYP_ORG, LIB_TYP_ORG_A, RANG) VALUES ('CAB', 'Cabinet', 'الديوان', 2);
INSERT INTO TYPE_ORG (TYP_ORG, LIB_TYP_ORG, LIB_TYP_ORG_A, RANG) VALUES ('IGS', 'Inspection Générale', 'التفقّد العام', 3);
INSERT INTO TYPE_ORG (TYP_ORG, LIB_TYP_ORG, LIB_TYP_ORG_A, RANG) VALUES ('DG', 'Direction Générale', 'الإدارة العامة', 4);
INSERT INTO TYPE_ORG (TYP_ORG, LIB_TYP_ORG, LIB_TYP_ORG_A, RANG) VALUES ('DIR', 'Direction', 'الإدارة', 5);
INSERT INTO TYPE_ORG (TYP_ORG, LIB_TYP_ORG, LIB_TYP_ORG_A, RANG) VALUES ('SDIR', 'Sous-Direction', 'الإدارة الفرعية', 6);
INSERT INTO TYPE_ORG (TYP_ORG, LIB_TYP_ORG, LIB_TYP_ORG_A, RANG) VALUES ('SERV', 'Service', 'المصلحة', 7);
INSERT INTO TYPE_ORG (TYP_ORG, LIB_TYP_ORG, LIB_TYP_ORG_A, RANG) VALUES ('BUR', 'Bureau', 'المكتب', 8);
INSERT INTO TYPE_ORG (TYP_ORG, LIB_TYP_ORG, LIB_TYP_ORG_A, RANG) VALUES ('UNIT', 'Unité', 'الوحدة', 9);
INSERT INTO TYPE_ORG (TYP_ORG, LIB_TYP_ORG, LIB_TYP_ORG_A, RANG) VALUES ('DRS', 'Direction Régionale de la Santé', 'الإدارة الجهوية للصحة', 10);
INSERT INTO TYPE_ORG (TYP_ORG, LIB_TYP_ORG, LIB_TYP_ORG_A, RANG) VALUES ('CHU', 'Centre Hospitalo-Universitaire', 'المستشفى الجامعي', 11);
INSERT INTO TYPE_ORG (TYP_ORG, LIB_TYP_ORG, LIB_TYP_ORG_A, RANG) VALUES ('HR', 'Hôpital Régional', 'المستشفى الجهوي', 12);
INSERT INTO TYPE_ORG (TYP_ORG, LIB_TYP_ORG, LIB_TYP_ORG_A, RANG) VALUES ('HC', 'Hôpital de Circonscription', 'المستشفى المحلي', 13);
INSERT INTO TYPE_ORG (TYP_ORG, LIB_TYP_ORG, LIB_TYP_ORG_A, RANG) VALUES ('CSB', 'Centre de Santé de Base', 'مركز الصحة الأساسية', 14);
INSERT INTO TYPE_ORG (TYP_ORG, LIB_TYP_ORG, LIB_TYP_ORG_A, RANG) VALUES ('INST', 'Institut', 'المعهد', 15);
INSERT INTO TYPE_ORG (TYP_ORG, LIB_TYP_ORG, LIB_TYP_ORG_A, RANG) VALUES ('LAB', 'Laboratoire', 'المخبر', 16);

-- ============================================================================
-- 15. CATEG: Classification niveau 1 (nature des grilles)
-- CHANGED: Adapted for Tunisian public health classification
-- Original: "Personnel de service", "personnel de la banque"
-- Now: Tunisian public sector categories (A, B, C, D, Hors catégorie)
-- ============================================================================
INSERT INTO CATEG (COD_CATEG, LIB_CATEG, LIB_CATEG_A) VALUES ('A', 'Catégorie A - Cadres supérieurs', 'صنف أ - إطارات عليا');
INSERT INTO CATEG (COD_CATEG, LIB_CATEG, LIB_CATEG_A) VALUES ('B', 'Catégorie B - Cadres', 'صنف ب - إطارات');
INSERT INTO CATEG (COD_CATEG, LIB_CATEG, LIB_CATEG_A) VALUES ('C', 'Catégorie C - Agents de maîtrise', 'صنف ج - أعوان تحكّم');
INSERT INTO CATEG (COD_CATEG, LIB_CATEG, LIB_CATEG_A) VALUES ('D', 'Catégorie D - Agents d''exécution', 'صنف د - أعوان تنفيذ');
INSERT INTO CATEG (COD_CATEG, LIB_CATEG, LIB_CATEG_A) VALUES ('HC', 'Hors Catégorie', 'خارج الصنف');

-- ============================================================================
-- 16. CATEGORIE: Classification niveau 2
-- CHANGED: Health-specific subcategories under each main category
-- ============================================================================
-- Catégorie A - Cadres supérieurs
INSERT INTO CATEGORIE (COD_CATEG, COD_CAT, LIB_CAT, TYP_CAT, LIB_CAT_A) VALUES ('A', 'A1', 'Médecins Spécialistes', '05', 'أطباء اختصاص');
INSERT INTO CATEGORIE (COD_CATEG, COD_CAT, LIB_CAT, TYP_CAT, LIB_CAT_A) VALUES ('A', 'A2', 'Médecins Généralistes', '04', 'أطباء عامّون');
INSERT INTO CATEGORIE (COD_CATEG, COD_CAT, LIB_CAT, TYP_CAT, LIB_CAT_A) VALUES ('A', 'A3', 'Pharmaciens', '05', 'صيادلة');
INSERT INTO CATEGORIE (COD_CATEG, COD_CAT, LIB_CAT, TYP_CAT, LIB_CAT_A) VALUES ('A', 'A4', 'Médecins Dentistes', '04', 'أطباء أسنان');
INSERT INTO CATEGORIE (COD_CATEG, COD_CAT, LIB_CAT, TYP_CAT, LIB_CAT_A) VALUES ('A', 'A5', 'Cadres Supérieurs Administratifs', '05', 'إطارات إدارية عليا');

-- Catégorie B - Cadres
INSERT INTO CATEGORIE (COD_CATEG, COD_CAT, LIB_CAT, TYP_CAT, LIB_CAT_A) VALUES ('B', 'B1', 'Infirmiers Principaux', '04', 'ممرّضون رئيسيّون');
INSERT INTO CATEGORIE (COD_CATEG, COD_CAT, LIB_CAT, TYP_CAT, LIB_CAT_A) VALUES ('B', 'B2', 'Techniciens Supérieurs de Santé', '04', 'تقنيون ساميون في الصحة');
INSERT INTO CATEGORIE (COD_CATEG, COD_CAT, LIB_CAT, TYP_CAT, LIB_CAT_A) VALUES ('B', 'B3', 'Sages-Femmes', '04', 'قابلات');
INSERT INTO CATEGORIE (COD_CATEG, COD_CAT, LIB_CAT, TYP_CAT, LIB_CAT_A) VALUES ('B', 'B4', 'Cadres Administratifs', '04', 'إطارات إدارية');
INSERT INTO CATEGORIE (COD_CATEG, COD_CAT, LIB_CAT, TYP_CAT, LIB_CAT_A) VALUES ('B', 'B5', 'Cadres Techniques', '04', 'إطارات تقنية');

-- Catégorie C - Agents de maîtrise
INSERT INTO CATEGORIE (COD_CATEG, COD_CAT, LIB_CAT, TYP_CAT, LIB_CAT_A) VALUES ('C', 'C1', 'Infirmiers', '03', 'ممرّضون');
INSERT INTO CATEGORIE (COD_CATEG, COD_CAT, LIB_CAT, TYP_CAT, LIB_CAT_A) VALUES ('C', 'C2', 'Techniciens de Santé', '03', 'تقنيّون في الصحة');
INSERT INTO CATEGORIE (COD_CATEG, COD_CAT, LIB_CAT, TYP_CAT, LIB_CAT_A) VALUES ('C', 'C3', 'Aides-Soignants Principaux', '03', 'مساعدو التمريض الرئيسيّون');
INSERT INTO CATEGORIE (COD_CATEG, COD_CAT, LIB_CAT, TYP_CAT, LIB_CAT_A) VALUES ('C', 'C4', 'Agents de Maîtrise Administratifs', '03', 'أعوان تحكّم إداريّون');

-- Catégorie D - Agents d'exécution
INSERT INTO CATEGORIE (COD_CATEG, COD_CAT, LIB_CAT, TYP_CAT, LIB_CAT_A) VALUES ('D', 'D1', 'Aides-Soignants', '02', 'مساعدو التمريض');
INSERT INTO CATEGORIE (COD_CATEG, COD_CAT, LIB_CAT, TYP_CAT, LIB_CAT_A) VALUES ('D', 'D2', 'Agents Administratifs', '02', 'أعوان إداريّون');
INSERT INTO CATEGORIE (COD_CATEG, COD_CAT, LIB_CAT, TYP_CAT, LIB_CAT_A) VALUES ('D', 'D3', 'Agents de Service', '01', 'أعوان خدمات');

-- Hors Catégorie
INSERT INTO CATEGORIE (COD_CATEG, COD_CAT, LIB_CAT, TYP_CAT, LIB_CAT_A) VALUES ('HC', 'HC1', 'Professeurs Hospitalo-Universitaires', '05', 'أساتذة استشفائيّون جامعيّون');
INSERT INTO CATEGORIE (COD_CATEG, COD_CAT, LIB_CAT, TYP_CAT, LIB_CAT_A) VALUES ('HC', 'HC2', 'Maîtres de Conférences Agrégés', '05', 'أساتذة محاضرون مبرّزون');
INSERT INTO CATEGORIE (COD_CATEG, COD_CAT, LIB_CAT, TYP_CAT, LIB_CAT_A) VALUES ('HC', 'HC3', 'Professeurs Agrégés', '05', 'أساتذة مبرّزون');

-- ============================================================================
-- 17. GRADE: Classification niveau 3 (grades dans chaque catégorie)
-- CHANGED: Health-specific grades per category
-- ============================================================================
-- Exemples de grades pour les médecins spécialistes (A/A1)
INSERT INTO GRADE (COD_CATEG, COD_CAT, COD_GRAD, LIB_GRAD, LIB_GRAD_A, NBR_ECH) VALUES ('A', 'A1', 'G1', 'Médecin Spécialiste', 'طبيب اختصاص', 5);
INSERT INTO GRADE (COD_CATEG, COD_CAT, COD_GRAD, LIB_GRAD, LIB_GRAD_A, NBR_ECH) VALUES ('A', 'A1', 'G2', 'Médecin Spécialiste Principal', 'طبيب اختصاص رئيسي', 5);
INSERT INTO GRADE (COD_CATEG, COD_CAT, COD_GRAD, LIB_GRAD, LIB_GRAD_A, NBR_ECH) VALUES ('A', 'A1', 'G3', 'Médecin Spécialiste Major', 'طبيب اختصاص أوّل', 5);

-- Médecins Généralistes (A/A2)
INSERT INTO GRADE (COD_CATEG, COD_CAT, COD_GRAD, LIB_GRAD, LIB_GRAD_A, NBR_ECH) VALUES ('A', 'A2', 'G1', 'Médecin de Santé Publique', 'طبيب صحة عمومية', 5);
INSERT INTO GRADE (COD_CATEG, COD_CAT, COD_GRAD, LIB_GRAD, LIB_GRAD_A, NBR_ECH) VALUES ('A', 'A2', 'G2', 'Médecin Principal de Santé Publique', 'طبيب رئيسي للصحة العمومية', 5);
INSERT INTO GRADE (COD_CATEG, COD_CAT, COD_GRAD, LIB_GRAD, LIB_GRAD_A, NBR_ECH) VALUES ('A', 'A2', 'G3', 'Médecin Major de Santé Publique', 'طبيب أوّل للصحة العمومية', 5);

-- Pharmaciens (A/A3)
INSERT INTO GRADE (COD_CATEG, COD_CAT, COD_GRAD, LIB_GRAD, LIB_GRAD_A, NBR_ECH) VALUES ('A', 'A3', 'G1', 'Pharmacien', 'صيدلي', 5);
INSERT INTO GRADE (COD_CATEG, COD_CAT, COD_GRAD, LIB_GRAD, LIB_GRAD_A, NBR_ECH) VALUES ('A', 'A3', 'G2', 'Pharmacien Principal', 'صيدلي رئيسي', 5);
INSERT INTO GRADE (COD_CATEG, COD_CAT, COD_GRAD, LIB_GRAD, LIB_GRAD_A, NBR_ECH) VALUES ('A', 'A3', 'G3', 'Pharmacien Inspecteur', 'صيدلي متفقّد', 5);

-- Médecins Dentistes (A/A4)
INSERT INTO GRADE (COD_CATEG, COD_CAT, COD_GRAD, LIB_GRAD, LIB_GRAD_A, NBR_ECH) VALUES ('A', 'A4', 'G1', 'Médecin Dentiste', 'طبيب أسنان', 5);
INSERT INTO GRADE (COD_CATEG, COD_CAT, COD_GRAD, LIB_GRAD, LIB_GRAD_A, NBR_ECH) VALUES ('A', 'A4', 'G2', 'Médecin Dentiste Principal', 'طبيب أسنان رئيسي', 5);

-- Cadres Sup. Administratifs (A/A5)
INSERT INTO GRADE (COD_CATEG, COD_CAT, COD_GRAD, LIB_GRAD, LIB_GRAD_A, NBR_ECH) VALUES ('A', 'A5', 'G1', 'Administrateur', 'متصرّف', 5);
INSERT INTO GRADE (COD_CATEG, COD_CAT, COD_GRAD, LIB_GRAD, LIB_GRAD_A, NBR_ECH) VALUES ('A', 'A5', 'G2', 'Administrateur Conseiller', 'متصرّف مستشار', 5);
INSERT INTO GRADE (COD_CATEG, COD_CAT, COD_GRAD, LIB_GRAD, LIB_GRAD_A, NBR_ECH) VALUES ('A', 'A5', 'G3', 'Administrateur Général', 'متصرّف عام', 5);

-- Infirmiers Principaux (B/B1)
INSERT INTO GRADE (COD_CATEG, COD_CAT, COD_GRAD, LIB_GRAD, LIB_GRAD_A, NBR_ECH) VALUES ('B', 'B1', 'G1', 'Infirmier Principal', 'ممرّض رئيسي', 5);
INSERT INTO GRADE (COD_CATEG, COD_CAT, COD_GRAD, LIB_GRAD, LIB_GRAD_A, NBR_ECH) VALUES ('B', 'B1', 'G2', 'Infirmier Major', 'ممرّض أوّل', 5);

-- Techniciens Supérieurs (B/B2)
INSERT INTO GRADE (COD_CATEG, COD_CAT, COD_GRAD, LIB_GRAD, LIB_GRAD_A, NBR_ECH) VALUES ('B', 'B2', 'G1', 'Technicien Supérieur de Santé', 'تقني سام في الصحة', 5);
INSERT INTO GRADE (COD_CATEG, COD_CAT, COD_GRAD, LIB_GRAD, LIB_GRAD_A, NBR_ECH) VALUES ('B', 'B2', 'G2', 'Technicien Supérieur Major', 'تقني سام أوّل', 5);

-- Sages-Femmes (B/B3)
INSERT INTO GRADE (COD_CATEG, COD_CAT, COD_GRAD, LIB_GRAD, LIB_GRAD_A, NBR_ECH) VALUES ('B', 'B3', 'G1', 'Sage-Femme', 'قابلة', 5);
INSERT INTO GRADE (COD_CATEG, COD_CAT, COD_GRAD, LIB_GRAD, LIB_GRAD_A, NBR_ECH) VALUES ('B', 'B3', 'G2', 'Sage-Femme Principale', 'قابلة رئيسية', 5);
INSERT INTO GRADE (COD_CATEG, COD_CAT, COD_GRAD, LIB_GRAD, LIB_GRAD_A, NBR_ECH) VALUES ('B', 'B3', 'G3', 'Sage-Femme Major', 'قابلة أولى', 5);

-- Cadres Administratifs (B/B4)
INSERT INTO GRADE (COD_CATEG, COD_CAT, COD_GRAD, LIB_GRAD, LIB_GRAD_A, NBR_ECH) VALUES ('B', 'B4', 'G1', 'Attaché d''Administration', 'ملحق إدارة', 5);
INSERT INTO GRADE (COD_CATEG, COD_CAT, COD_GRAD, LIB_GRAD, LIB_GRAD_A, NBR_ECH) VALUES ('B', 'B4', 'G2', 'Attaché Principal d''Administration', 'ملحق رئيسي للإدارة', 5);

-- Cadres Techniques (B/B5)
INSERT INTO GRADE (COD_CATEG, COD_CAT, COD_GRAD, LIB_GRAD, LIB_GRAD_A, NBR_ECH) VALUES ('B', 'B5', 'G1', 'Technicien', 'تقني', 5);
INSERT INTO GRADE (COD_CATEG, COD_CAT, COD_GRAD, LIB_GRAD, LIB_GRAD_A, NBR_ECH) VALUES ('B', 'B5', 'G2', 'Technicien Principal', 'تقني رئيسي', 5);

-- Infirmiers (C/C1)
INSERT INTO GRADE (COD_CATEG, COD_CAT, COD_GRAD, LIB_GRAD, LIB_GRAD_A, NBR_ECH) VALUES ('C', 'C1', 'G1', 'Infirmier', 'ممرّض', 5);
INSERT INTO GRADE (COD_CATEG, COD_CAT, COD_GRAD, LIB_GRAD, LIB_GRAD_A, NBR_ECH) VALUES ('C', 'C1', 'G2', 'Infirmier de Première Classe', 'ممرّض من الصنف الأوّل', 5);

-- Techniciens de Santé (C/C2)
INSERT INTO GRADE (COD_CATEG, COD_CAT, COD_GRAD, LIB_GRAD, LIB_GRAD_A, NBR_ECH) VALUES ('C', 'C2', 'G1', 'Technicien de Santé', 'تقني صحة', 5);

-- Aides-Soignants Principaux (C/C3)
INSERT INTO GRADE (COD_CATEG, COD_CAT, COD_GRAD, LIB_GRAD, LIB_GRAD_A, NBR_ECH) VALUES ('C', 'C3', 'G1', 'Aide-Soignant Principal', 'مساعد تمريض رئيسي', 5);

-- Agents Maîtrise Administratifs (C/C4)
INSERT INTO GRADE (COD_CATEG, COD_CAT, COD_GRAD, LIB_GRAD, LIB_GRAD_A, NBR_ECH) VALUES ('C', 'C4', 'G1', 'Secrétaire d''Administration', 'كاتب إدارة', 5);

-- Aides-Soignants (D/D1)
INSERT INTO GRADE (COD_CATEG, COD_CAT, COD_GRAD, LIB_GRAD, LIB_GRAD_A, NBR_ECH) VALUES ('D', 'D1', 'G1', 'Aide-Soignant', 'مساعد تمريض', 5);

-- Agents Administratifs (D/D2)
INSERT INTO GRADE (COD_CATEG, COD_CAT, COD_GRAD, LIB_GRAD, LIB_GRAD_A, NBR_ECH) VALUES ('D', 'D2', 'G1', 'Agent Administratif', 'عون إداري', 5);

-- Agents de Service (D/D3)
INSERT INTO GRADE (COD_CATEG, COD_CAT, COD_GRAD, LIB_GRAD, LIB_GRAD_A, NBR_ECH) VALUES ('D', 'D3', 'G1', 'Agent de Service', 'عون خدمات', 5);

-- Hors Catégorie
INSERT INTO GRADE (COD_CATEG, COD_CAT, COD_GRAD, LIB_GRAD, LIB_GRAD_A, NBR_ECH) VALUES ('HC', 'HC1', 'G1', 'Professeur Hospitalo-Universitaire', 'أستاذ استشفائي جامعي', 5);
INSERT INTO GRADE (COD_CATEG, COD_CAT, COD_GRAD, LIB_GRAD, LIB_GRAD_A, NBR_ECH) VALUES ('HC', 'HC2', 'G1', 'Maître de Conférences Agrégé', 'أستاذ محاضر مبرّز', 5);
INSERT INTO GRADE (COD_CATEG, COD_CAT, COD_GRAD, LIB_GRAD, LIB_GRAD_A, NBR_ECH) VALUES ('HC', 'HC3', 'G1', 'Professeur Agrégé', 'أستاذ مبرّز', 5);

-- ============================================================================
-- 18. PARAM_NIVEAU: Niveaux d'instruction
-- CHANGED: Adapted for Tunisian education system (LMD since 2006)
-- Kept most levels, adapted for Tunisia's specific diplomas
-- ============================================================================
INSERT INTO PARAM_NIVEAU (COD_NIVEAU, LIB_NIVEAU, TYP_NIVEAU, ETUDE, RANG, LIB_NIVEAU_A) VALUES ('00', 'Sans niveau', 'N', NULL, 1, 'بدون مستوى');
INSERT INTO PARAM_NIVEAU (COD_NIVEAU, LIB_NIVEAU, TYP_NIVEAU, ETUDE, RANG, LIB_NIVEAU_A) VALUES ('01', 'Primaire', 'N', 'P', 2, 'ابتدائي');
INSERT INTO PARAM_NIVEAU (COD_NIVEAU, LIB_NIVEAU, TYP_NIVEAU, ETUDE, RANG, LIB_NIVEAU_A) VALUES ('02', 'Certificat d''études primaires', 'D', 'P', 3, 'شهادة الدراسات الابتدائية');
INSERT INTO PARAM_NIVEAU (COD_NIVEAU, LIB_NIVEAU, TYP_NIVEAU, ETUDE, RANG, LIB_NIVEAU_A) VALUES ('03', 'Enseignement de base', 'N', 'B', 4, 'التعليم الأساسي');
INSERT INTO PARAM_NIVEAU (COD_NIVEAU, LIB_NIVEAU, TYP_NIVEAU, ETUDE, RANG, LIB_NIVEAU_A) VALUES ('04', 'Secondaire', 'N', 'S', 5, 'ثانوي');
INSERT INTO PARAM_NIVEAU (COD_NIVEAU, LIB_NIVEAU, TYP_NIVEAU, ETUDE, RANG, LIB_NIVEAU_A) VALUES ('05', 'CAP', 'D', 'S', 6, 'شهادة الكفاءة المهنية');
INSERT INTO PARAM_NIVEAU (COD_NIVEAU, LIB_NIVEAU, TYP_NIVEAU, ETUDE, RANG, LIB_NIVEAU_A) VALUES ('06', 'BTP', 'D', 'S', 7, 'شهادة التقني المهني');
INSERT INTO PARAM_NIVEAU (COD_NIVEAU, LIB_NIVEAU, TYP_NIVEAU, ETUDE, RANG, LIB_NIVEAU_A) VALUES ('07', 'Baccalauréat', 'D', 'S', 8, 'البكالوريا');
INSERT INTO PARAM_NIVEAU (COD_NIVEAU, LIB_NIVEAU, TYP_NIVEAU, ETUDE, RANG, LIB_NIVEAU_A) VALUES ('08', 'BTS', 'D', 'U', 9, 'شهادة التقني العالي');
INSERT INTO PARAM_NIVEAU (COD_NIVEAU, LIB_NIVEAU, TYP_NIVEAU, ETUDE, RANG, LIB_NIVEAU_A) VALUES ('09', 'Bac+2 / DEUG', 'D', 'U', 10, 'باك+2');
INSERT INTO PARAM_NIVEAU (COD_NIVEAU, LIB_NIVEAU, TYP_NIVEAU, ETUDE, RANG, LIB_NIVEAU_A) VALUES ('10', 'Licence (Bac+3)', 'D', 'U', 11, 'الإجازة');
INSERT INTO PARAM_NIVEAU (COD_NIVEAU, LIB_NIVEAU, TYP_NIVEAU, ETUDE, RANG, LIB_NIVEAU_A) VALUES ('11', 'Maîtrise (Bac+4)', 'D', 'U', 12, 'الأستاذية');
INSERT INTO PARAM_NIVEAU (COD_NIVEAU, LIB_NIVEAU, TYP_NIVEAU, ETUDE, RANG, LIB_NIVEAU_A) VALUES ('12', 'Mastère (Bac+5)', 'D', 'U', 13, 'الماجستير');
INSERT INTO PARAM_NIVEAU (COD_NIVEAU, LIB_NIVEAU, TYP_NIVEAU, ETUDE, RANG, LIB_NIVEAU_A) VALUES ('13', 'Ingénieur (Bac+5)', 'D', 'U', 14, 'مهندس');
INSERT INTO PARAM_NIVEAU (COD_NIVEAU, LIB_NIVEAU, TYP_NIVEAU, ETUDE, RANG, LIB_NIVEAU_A) VALUES ('14', 'Doctorat en Médecine', 'D', 'U', 15, 'دكتوراه في الطب');
INSERT INTO PARAM_NIVEAU (COD_NIVEAU, LIB_NIVEAU, TYP_NIVEAU, ETUDE, RANG, LIB_NIVEAU_A) VALUES ('15', 'Doctorat en Pharmacie', 'D', 'U', 16, 'دكتوراه في الصيدلة');
INSERT INTO PARAM_NIVEAU (COD_NIVEAU, LIB_NIVEAU, TYP_NIVEAU, ETUDE, RANG, LIB_NIVEAU_A) VALUES ('16', 'Doctorat en Médecine Dentaire', 'D', 'U', 17, 'دكتوراه في طب الأسنان');
INSERT INTO PARAM_NIVEAU (COD_NIVEAU, LIB_NIVEAU, TYP_NIVEAU, ETUDE, RANG, LIB_NIVEAU_A) VALUES ('17', 'Spécialité Médicale', 'D', 'U', 18, 'اختصاص طبي');
INSERT INTO PARAM_NIVEAU (COD_NIVEAU, LIB_NIVEAU, TYP_NIVEAU, ETUDE, RANG, LIB_NIVEAU_A) VALUES ('18', 'Doctorat (Bac+8)', 'D', 'U', 19, 'دكتوراه');
INSERT INTO PARAM_NIVEAU (COD_NIVEAU, LIB_NIVEAU, TYP_NIVEAU, ETUDE, RANG, LIB_NIVEAU_A) VALUES ('19', 'Habilitation Universitaire', 'D', 'U', 20, 'التأهيل الجامعي');
INSERT INTO PARAM_NIVEAU (COD_NIVEAU, LIB_NIVEAU, TYP_NIVEAU, ETUDE, RANG, LIB_NIVEAU_A) VALUES ('20', 'Diplôme Infirmier', 'D', 'U', 9, 'شهادة التمريض');
INSERT INTO PARAM_NIVEAU (COD_NIVEAU, LIB_NIVEAU, TYP_NIVEAU, ETUDE, RANG, LIB_NIVEAU_A) VALUES ('21', 'Diplôme Sage-Femme', 'D', 'U', 10, 'شهادة القبالة');
INSERT INTO PARAM_NIVEAU (COD_NIVEAU, LIB_NIVEAU, TYP_NIVEAU, ETUDE, RANG, LIB_NIVEAU_A) VALUES ('22', 'Diplôme Technicien de Santé', 'D', 'U', 9, 'شهادة التقني في الصحة');
INSERT INTO PARAM_NIVEAU (COD_NIVEAU, LIB_NIVEAU, TYP_NIVEAU, ETUDE, RANG, LIB_NIVEAU_A) VALUES ('23', 'Agrégation', 'D', 'U', 20, 'التبريز');

-- ============================================================================
-- 19. FONCTIONS: Fonctions dans le ministère
-- CHANGED: Replaced bank functions with health ministry functions
-- Original: DG, DGA, Chef d'Agence, DCCB, etc.
-- ============================================================================
INSERT INTO FONCTIONS (COD_FONCT, TYP_FONCT, LIB_FONCT, RESERVE, LIB_FONCT_A) VALUES ('01', 'F', 'Ministre', 'P', 'وزير');
INSERT INTO FONCTIONS (COD_FONCT, TYP_FONCT, LIB_FONCT, RESERVE, LIB_FONCT_A) VALUES ('02', 'F', 'Secrétaire d''État', 'P', 'كاتب دولة');
INSERT INTO FONCTIONS (COD_FONCT, TYP_FONCT, LIB_FONCT, RESERVE, LIB_FONCT_A) VALUES ('03', 'F', 'Directeur Général', 'P', 'مدير عام');
INSERT INTO FONCTIONS (COD_FONCT, TYP_FONCT, LIB_FONCT, RESERVE, LIB_FONCT_A) VALUES ('04', 'F', 'Inspecteur Général', 'P', 'متفقّد عام');
INSERT INTO FONCTIONS (COD_FONCT, TYP_FONCT, LIB_FONCT, RESERVE, LIB_FONCT_A) VALUES ('05', 'F', 'Directeur', 'P', 'مدير');
INSERT INTO FONCTIONS (COD_FONCT, TYP_FONCT, LIB_FONCT, RESERVE, LIB_FONCT_A) VALUES ('06', 'F', 'Sous-Directeur', 'A', 'مدير فرعي');
INSERT INTO FONCTIONS (COD_FONCT, TYP_FONCT, LIB_FONCT, RESERVE, LIB_FONCT_A) VALUES ('07', 'F', 'Chef de Service', 'A', 'رئيس مصلحة');
INSERT INTO FONCTIONS (COD_FONCT, TYP_FONCT, LIB_FONCT, RESERVE, LIB_FONCT_A) VALUES ('08', 'F', 'Chef de Bureau', 'A', 'رئيس مكتب');
INSERT INTO FONCTIONS (COD_FONCT, TYP_FONCT, LIB_FONCT, RESERVE, LIB_FONCT_A) VALUES ('09', 'F', 'Directeur Régional de la Santé', 'P', 'مدير جهوي للصحة');
INSERT INTO FONCTIONS (COD_FONCT, TYP_FONCT, LIB_FONCT, RESERVE, LIB_FONCT_A) VALUES ('10', 'F', 'Directeur d''Hôpital', 'P', 'مدير مستشفى');
INSERT INTO FONCTIONS (COD_FONCT, TYP_FONCT, LIB_FONCT, RESERVE, LIB_FONCT_A) VALUES ('11', 'F', 'Médecin Chef de Circonscription', 'A', 'طبيب رئيس دائرة صحية');
INSERT INTO FONCTIONS (COD_FONCT, TYP_FONCT, LIB_FONCT, RESERVE, LIB_FONCT_A) VALUES ('12', 'F', 'Chef de Service Hospitalier', 'A', 'رئيس قسم استشفائي');
INSERT INTO FONCTIONS (COD_FONCT, TYP_FONCT, LIB_FONCT, RESERVE, LIB_FONCT_A) VALUES ('13', 'F', 'Surveillant Général', 'A', 'مراقب عام');
INSERT INTO FONCTIONS (COD_FONCT, TYP_FONCT, LIB_FONCT, RESERVE, LIB_FONCT_A) VALUES ('14', 'F', 'Surveillant de Service', 'A', 'مراقب مصلحة');
INSERT INTO FONCTIONS (COD_FONCT, TYP_FONCT, LIB_FONCT, RESERVE, LIB_FONCT_A) VALUES ('15', 'F', 'Chef d''Unité', 'A', 'رئيس وحدة');
INSERT INTO FONCTIONS (COD_FONCT, TYP_FONCT, LIB_FONCT, RESERVE, LIB_FONCT_A) VALUES ('16', 'F', 'Coordinateur', 'A', 'منسّق');
INSERT INTO FONCTIONS (COD_FONCT, TYP_FONCT, LIB_FONCT, RESERVE, LIB_FONCT_A) VALUES ('17', 'F', 'Chef de Projet', 'A', 'رئيس مشروع');
INSERT INTO FONCTIONS (COD_FONCT, TYP_FONCT, LIB_FONCT, RESERVE, LIB_FONCT_A) VALUES ('18', 'F', 'Conseiller', 'P', 'مستشار');
INSERT INTO FONCTIONS (COD_FONCT, TYP_FONCT, LIB_FONCT, RESERVE, LIB_FONCT_A) VALUES ('19', 'F', 'Chargé de Mission', 'A', 'مكلّف بمأمورية');

-- Qualifications (TYP_FONCT = 'Q')
INSERT INTO FONCTIONS (COD_FONCT, TYP_FONCT, LIB_FONCT, LIB_FONCT_A) VALUES ('Q1', 'Q', 'Médecin', 'طبيب');
INSERT INTO FONCTIONS (COD_FONCT, TYP_FONCT, LIB_FONCT, LIB_FONCT_A) VALUES ('Q2', 'Q', 'Pharmacien', 'صيدلي');
INSERT INTO FONCTIONS (COD_FONCT, TYP_FONCT, LIB_FONCT, LIB_FONCT_A) VALUES ('Q3', 'Q', 'Infirmier', 'ممرّض');
INSERT INTO FONCTIONS (COD_FONCT, TYP_FONCT, LIB_FONCT, LIB_FONCT_A) VALUES ('Q4', 'Q', 'Sage-Femme', 'قابلة');
INSERT INTO FONCTIONS (COD_FONCT, TYP_FONCT, LIB_FONCT, LIB_FONCT_A) VALUES ('Q5', 'Q', 'Technicien', 'تقني');
INSERT INTO FONCTIONS (COD_FONCT, TYP_FONCT, LIB_FONCT, LIB_FONCT_A) VALUES ('Q6', 'Q', 'Administrateur', 'متصرّف');

-- ============================================================================
-- 20. CODE_AFFILIATION: Affiliations sociales
-- CHANGED: Replaced Congolese CNAS/CNR with Tunisian CNRPS/CNAM/CNSS
-- ============================================================================
-- Types de retraite
INSERT INTO CODE_AFFILIATION (TYP_AFFIL, COD_AFFIL, LIB_AFFIL, LIB_AFFIL_A) VALUES ('AFF_RETR', '01', 'CNRPS', 'الصندوق الوطني للتقاعد والحيطة الاجتماعية');
INSERT INTO CODE_AFFILIATION (TYP_AFFIL, COD_AFFIL, LIB_AFFIL, LIB_AFFIL_A) VALUES ('AFF_RETR', '02', 'CNSS', 'الصندوق الوطني للضمان الاجتماعي');

-- Types d'assurance maladie
INSERT INTO CODE_AFFILIATION (TYP_AFFIL, COD_AFFIL, LIB_AFFIL, LIB_AFFIL_A) VALUES ('AFF_CSS', '01', 'CNAM', 'الصندوق الوطني للتأمين على المرض');
INSERT INTO CODE_AFFILIATION (TYP_AFFIL, COD_AFFIL, LIB_AFFIL, LIB_AFFIL_A) VALUES ('AFF_CSS', '02', 'CNAM - Filière publique', 'التأمين على المرض - المسلك العمومي');
INSERT INTO CODE_AFFILIATION (TYP_AFFIL, COD_AFFIL, LIB_AFFIL, LIB_AFFIL_A) VALUES ('AFF_CSS', '03', 'CNAM - Filière privée', 'التأمين على المرض - المسلك الخاص');
INSERT INTO CODE_AFFILIATION (TYP_AFFIL, COD_AFFIL, LIB_AFFIL, LIB_AFFIL_A) VALUES ('AFF_CSS', '04', 'CNAM - Système de remboursement', 'التأمين على المرض - نظام الاسترجاع');

-- Types syndicaux
INSERT INTO CODE_AFFILIATION (TYP_AFFIL, COD_AFFIL, LIB_AFFIL, LIB_AFFIL_A) VALUES ('AFF_SYND', '01', 'UGTT', 'الاتحاد العام التونسي للشغل');
INSERT INTO CODE_AFFILIATION (TYP_AFFIL, COD_AFFIL, LIB_AFFIL, LIB_AFFIL_A) VALUES ('AFF_SYND', '02', 'Syndicat des Médecins', 'نقابة الأطباء');
INSERT INTO CODE_AFFILIATION (TYP_AFFIL, COD_AFFIL, LIB_AFFIL, LIB_AFFIL_A) VALUES ('AFF_SYND', '03', 'Syndicat des Pharmaciens', 'نقابة الصيادلة');

-- Mutuelles
INSERT INTO CODE_AFFILIATION (TYP_AFFIL, COD_AFFIL, LIB_AFFIL, LIB_AFFIL_A) VALUES ('AFF_MUT', '01', 'MFPE - Mutuelle Fonctionnaires', 'التعاضدية الوظيفة العمومية');

-- ============================================================================
-- 21. AFFELIATION: Organismes d'affiliation
-- CHANGED: Replaced Congolese organisms with Tunisian ones
-- ============================================================================
INSERT INTO AFFELIATION (COD_AFF, LIB_AFF, ABRV_AFF, TYP_AFF, LIB_AFF_A) VALUES ('01', 'Caisse Nationale de Retraite et de Prévoyance Sociale', 'CNRPS', 'R', 'ص.و.ت.ح.إ');
INSERT INTO AFFELIATION (COD_AFF, LIB_AFF, ABRV_AFF, TYP_AFF, LIB_AFF_A) VALUES ('02', 'Caisse Nationale de Sécurité Sociale', 'CNSS', 'R', 'ص.و.ض.إ');
INSERT INTO AFFELIATION (COD_AFF, LIB_AFF, ABRV_AFF, TYP_AFF, LIB_AFF_A) VALUES ('03', 'Caisse Nationale d''Assurance Maladie', 'CNAM', 'A', 'ص.و.ت.م');
INSERT INTO AFFELIATION (COD_AFF, LIB_AFF, ABRV_AFF, TYP_AFF, LIB_AFF_A) VALUES ('04', 'Union Générale Tunisienne du Travail', 'UGTT', 'S', 'إ.ع.ت.ش');

-- ============================================================================
-- 22. MOTIF_SORT: Positions administratives
-- UNCHANGED: Generic public sector positions, mostly applicable as-is
-- ============================================================================
INSERT INTO MOTIF_SORT (COD_MOTIF, LIB_MOTIF, NATURE_MOTIF, SALAIRE, AVANCEMENT, CONGE, LIB_MOTIF_A) VALUES ('01', 'Activité', '1', 'O', 'O', 'O', 'مباشرة');
INSERT INTO MOTIF_SORT (COD_MOTIF, LIB_MOTIF, NATURE_MOTIF, SALAIRE, AVANCEMENT, CONGE, LIB_MOTIF_A) VALUES ('02', 'Détachement', '2', 'N', 'O', 'N', 'إلحاق');
INSERT INTO MOTIF_SORT (COD_MOTIF, LIB_MOTIF, NATURE_MOTIF, SALAIRE, AVANCEMENT, CONGE, LIB_MOTIF_A) VALUES ('03', 'Disponibilité', '6', 'N', 'N', 'N', 'عدم مباشرة');
INSERT INTO MOTIF_SORT (COD_MOTIF, LIB_MOTIF, NATURE_MOTIF, SALAIRE, AVANCEMENT, CONGE, LIB_MOTIF_A) VALUES ('04', 'Sous les drapeaux', '4', 'N', 'O', 'N', 'تحت السلاح');
INSERT INTO MOTIF_SORT (COD_MOTIF, LIB_MOTIF, NATURE_MOTIF, SALAIRE, AVANCEMENT, CONGE, LIB_MOTIF_A) VALUES ('05', 'Mise à disposition', '7', 'O', 'O', 'O', 'وضع على الذمة');
INSERT INTO MOTIF_SORT (COD_MOTIF, LIB_MOTIF, NATURE_MOTIF, SALAIRE, AVANCEMENT, CONGE, LIB_MOTIF_A) VALUES ('06', 'Congé sans solde', '3', 'N', 'N', 'N', 'عطلة بدون أجر');
INSERT INTO MOTIF_SORT (COD_MOTIF, LIB_MOTIF, NATURE_MOTIF, SALAIRE, AVANCEMENT, CONGE, LIB_MOTIF_A) VALUES ('07', 'Détachement interne', '5', 'O', 'O', 'O', 'إلحاق داخلي');
INSERT INTO MOTIF_SORT (COD_MOTIF, LIB_MOTIF, NATURE_MOTIF, SALAIRE, AVANCEMENT, CONGE, LIB_MOTIF_A) VALUES ('08', 'Congé de maladie longue durée', '3', 'O', 'O', 'N', 'عطلة مرض طويلة');
INSERT INTO MOTIF_SORT (COD_MOTIF, LIB_MOTIF, NATURE_MOTIF, SALAIRE, AVANCEMENT, CONGE, LIB_MOTIF_A) VALUES ('09', 'Congé de maternité', '1', 'O', 'O', 'N', 'عطلة أمومة');
INSERT INTO MOTIF_SORT (COD_MOTIF, LIB_MOTIF, NATURE_MOTIF, SALAIRE, AVANCEMENT, CONGE, LIB_MOTIF_A) VALUES ('10', 'Stage / Formation à l''étranger', '2', 'O', 'O', 'N', 'تربّص / تكوين بالخارج');
INSERT INTO MOTIF_SORT (COD_MOTIF, LIB_MOTIF, NATURE_MOTIF, SALAIRE, AVANCEMENT, CONGE, LIB_MOTIF_A) VALUES ('11', 'Suspension provisoire', '3', 'N', 'N', 'N', 'إيقاف مؤقّت');

-- ============================================================================
-- 23. TYPE_DEPART: Types de départ
-- UNCHANGED: Universal departure types, same in Tunisia
-- ============================================================================
INSERT INTO TYPE_DEPART (COD_TYP_DEPART, LIB_TYP_DEPART, NATURE_DEPART, LIB_TYP_DEPART_A) VALUES ('01', 'Retraite', 'R', 'تقاعد');
INSERT INTO TYPE_DEPART (COD_TYP_DEPART, LIB_TYP_DEPART, NATURE_DEPART, LIB_TYP_DEPART_A) VALUES ('02', 'Démission', 'D', 'استقالة');
INSERT INTO TYPE_DEPART (COD_TYP_DEPART, LIB_TYP_DEPART, NATURE_DEPART, LIB_TYP_DEPART_A) VALUES ('03', 'Décès', 'M', 'وفاة');
INSERT INTO TYPE_DEPART (COD_TYP_DEPART, LIB_TYP_DEPART, NATURE_DEPART, LIB_TYP_DEPART_A) VALUES ('04', 'Révocation', 'S', 'عزل');
INSERT INTO TYPE_DEPART (COD_TYP_DEPART, LIB_TYP_DEPART, NATURE_DEPART, LIB_TYP_DEPART_A) VALUES ('05', 'Licenciement', 'C', 'طرد');
INSERT INTO TYPE_DEPART (COD_TYP_DEPART, LIB_TYP_DEPART, NATURE_DEPART, LIB_TYP_DEPART_A) VALUES ('06', 'Invalidité', 'I', 'عجز');
INSERT INTO TYPE_DEPART (COD_TYP_DEPART, LIB_TYP_DEPART, NATURE_DEPART, LIB_TYP_DEPART_A) VALUES ('07', 'Fin de contrat', 'F', 'انتهاء العقد');
INSERT INTO TYPE_DEPART (COD_TYP_DEPART, LIB_TYP_DEPART, NATURE_DEPART, LIB_TYP_DEPART_A) VALUES ('08', 'Retraite anticipée', 'R', 'تقاعد مبكّر');
INSERT INTO TYPE_DEPART (COD_TYP_DEPART, LIB_TYP_DEPART, NATURE_DEPART, LIB_TYP_DEPART_A) VALUES ('09', 'Abandon de poste', 'A', 'هجر العمل');
INSERT INTO TYPE_DEPART (COD_TYP_DEPART, LIB_TYP_DEPART, NATURE_DEPART, LIB_TYP_DEPART_A) VALUES ('10', 'Mutation vers autre ministère', 'L', 'نقلة نحو وزارة أخرى');
INSERT INTO TYPE_DEPART (COD_TYP_DEPART, LIB_TYP_DEPART, NATURE_DEPART, LIB_TYP_DEPART_A) VALUES ('11', 'Fin période d''essai', 'P', 'نهاية فترة التجربة');

-- ============================================================================
-- 24. SOCIETE: Organisme principal (Ministère de la Santé)
-- CHANGED: Replaced "Banque Postale du Congo" with Tunisian Health Ministry
-- ============================================================================
INSERT INTO SOCIETE (
    COD_SOC, LIB_SOC, LIB_SOC_A, ABRV_SOC, ABRV_SOC_A,
    COD_POST, RUE_SOC, VILLE_SOC, PAYS_SOC,
    MINISTERE_SOC, NUM_RETR, TYP_SOC,
    RUE_SOC_A, VILLE_SOC_A, PAYS_SOC_A
) VALUES (
    '01',
    'Ministère de la Santé',
    'وزارة الصحة',
    'MS', 'و.ص',
    '1006',
    'Place Bab Saadoun',
    'Tunis',
    'Tunisie',
    'Ministère de la Santé',
    NULL,
    'P',
    'ساحة باب سعدون',
    'تونس',
    'تونس'
);

-- ============================================================================
-- 25. SERVICE: Structure organisationnelle du ministère
-- CHANGED: Replaced bank departments with health ministry departments
-- ============================================================================
-- Niveau Ministère
INSERT INTO SERVICE (COD_SOC, COD_SERV, SER_COD_SERV, LIB_SERV, TYPE_SERV, LIB_SERV_A 
) VALUES ('01', 'MIN', NULL, 'Ministère de la Santé', 'MIN', 'وزارة الصحة');

-- Cabinet du Ministre
INSERT INTO SERVICE (COD_SOC, COD_SERV, SER_COD_SERV, LIB_SERV, TYPE_SERV, LIB_SERV_A
) VALUES ('01', 'CAB', 'MIN', 'Cabinet du Ministre', 'CAB', 'ديوان الوزير');

-- Inspection Générale de la Santé
INSERT INTO SERVICE (COD_SOC, COD_SERV, SER_COD_SERV, LIB_SERV, TYPE_SERV, LIB_SERV_A
) VALUES ('01', 'IGS', 'MIN', 'Inspection Générale de la Santé', 'IGS', 'التفقّد العام للصحة');

-- Direction Générale de la Santé Publique
INSERT INTO SERVICE (COD_SOC, COD_SERV, SER_COD_SERV, LIB_SERV, TYPE_SERV, LIB_SERV_A
) VALUES ('01', 'DGSP', 'MIN', 'Direction Générale de la Santé Publique', 'DG', 'الإدارة العامة للصحة العمومية');

INSERT INTO SERVICE (COD_SOC, COD_SERV, SER_COD_SERV, LIB_SERV, TYPE_SERV, LIB_SERV_A
) VALUES ('01', 'DSSB', 'DGSP', 'Direction des Soins de Santé de Base', 'DIR', 'إدارة العلاج الصحي الأساسي');

INSERT INTO SERVICE (COD_SOC, COD_SERV, SER_COD_SERV, LIB_SERV, TYPE_SERV, LIB_SERV_A
) VALUES ('01', 'DHYG', 'DGSP', 'Direction de l''Hygiène du Milieu', 'DIR', 'إدارة حفظ صحة المحيط');

INSERT INTO SERVICE (COD_SOC, COD_SERV, SER_COD_SERV, LIB_SERV, TYPE_SERV, LIB_SERV_A
) VALUES ('01', 'DPREV', 'DGSP', 'Direction de la Médecine Préventive', 'DIR', 'إدارة الطب الوقائي');

-- Direction Générale des Services Communs
INSERT INTO SERVICE (COD_SOC, COD_SERV, SER_COD_SERV, LIB_SERV, TYPE_SERV, LIB_SERV_A
) VALUES ('01', 'DGSC', 'MIN', 'Direction Générale des Services Communs', 'DG', 'الإدارة العامة للمصالح المشتركة');

INSERT INTO SERVICE (COD_SOC, COD_SERV, SER_COD_SERV, LIB_SERV, TYPE_SERV, LIB_SERV_A
) VALUES ('01', 'DRH', 'DGSC', 'Direction des Ressources Humaines', 'DIR', 'إدارة الموارد البشرية');

INSERT INTO SERVICE (COD_SOC, COD_SERV, SER_COD_SERV, LIB_SERV, TYPE_SERV, LIB_SERV_A
) VALUES ('01', 'DFIN', 'DGSC', 'Direction des Affaires Financières', 'DIR', 'إدارة الشؤون المالية');

INSERT INTO SERVICE (COD_SOC, COD_SERV, SER_COD_SERV, LIB_SERV, TYPE_SERV, LIB_SERV_A
) VALUES ('01', 'DBAT', 'DGSC', 'Direction des Bâtiments et Equipements', 'DIR', 'إدارة البناءات والتجهيزات');

INSERT INTO SERVICE (COD_SOC, COD_SERV, SER_COD_SERV, LIB_SERV, TYPE_SERV, LIB_SERV_A
) VALUES ('01', 'DINFO', 'DGSC', 'Direction de l''Organisation et de l''Informatique', 'DIR', 'إدارة التنظيم والإعلامية');

-- Direction Générale des Structures Sanitaires Publiques
INSERT INTO SERVICE (COD_SOC, COD_SERV, SER_COD_SERV, LIB_SERV, TYPE_SERV, LIB_SERV_A
) VALUES ('01', 'DGSSP', 'MIN', 'Direction Générale des Structures Sanitaires Publiques', 'DG', 'الإدارة العامة للمنشآت الصحية العمومية');

INSERT INTO SERVICE (COD_SOC, COD_SERV, SER_COD_SERV, LIB_SERV, TYPE_SERV, LIB_SERV_A
) VALUES ('01', 'DHOSP', 'DGSSP', 'Direction des Hôpitaux', 'DIR', 'إدارة المستشفيات');

INSERT INTO SERVICE (COD_SOC, COD_SERV, SER_COD_SERV, LIB_SERV, TYPE_SERV, LIB_SERV_A
) VALUES ('01', 'DPHARM', 'DGSSP', 'Direction de la Pharmacie et du Médicament', 'DIR', 'إدارة الصيدلة والدواء');

-- Directions Régionales de la Santé (une par gouvernorat - exemples)
INSERT INTO SERVICE (COD_SOC, COD_SERV, SER_COD_SERV, LIB_SERV, TYPE_SERV, LIB_SERV_A
) VALUES ('01', 'DRS11', 'MIN', 'DRS Tunis', 'DRS', 'الإدارة الجهوية للصحة بتونس');
INSERT INTO SERVICE (COD_SOC, COD_SERV, SER_COD_SERV, LIB_SERV, TYPE_SERV, LIB_SERV_A
) VALUES ('01', 'DRS12', 'MIN', 'DRS Ariana', 'DRS', 'الإدارة الجهوية للصحة بأريانة');
INSERT INTO SERVICE (COD_SOC, COD_SERV, SER_COD_SERV, LIB_SERV, TYPE_SERV, LIB_SERV_A
) VALUES ('01', 'DRS13', 'MIN', 'DRS Ben Arous', 'DRS', 'الإدارة الجهوية للصحة ببن عروس');
INSERT INTO SERVICE (COD_SOC, COD_SERV, SER_COD_SERV, LIB_SERV, TYPE_SERV, LIB_SERV_A
) VALUES ('01', 'DRS21', 'MIN', 'DRS Nabeul', 'DRS', 'الإدارة الجهوية للصحة بنابل');
INSERT INTO SERVICE (COD_SOC, COD_SERV, SER_COD_SERV, LIB_SERV, TYPE_SERV, LIB_SERV_A
) VALUES ('01', 'DRS51', 'MIN', 'DRS Sousse', 'DRS', 'الإدارة الجهوية للصحة بسوسة');
INSERT INTO SERVICE (COD_SOC, COD_SERV, SER_COD_SERV, LIB_SERV, TYPE_SERV, LIB_SERV_A
) VALUES ('01', 'DRS61', 'MIN', 'DRS Sfax', 'DRS', 'الإدارة الجهوية للصحة بصفاقس');

-- ============================================================================
-- 26. PRM_LIEU_GEOGRAPHIQUE: Lieux géographiques (exemples)
-- CHANGED: Replaced Congolese locations with Tunisian locations
-- Note: Should be completed with all communes/villes du ministère
-- ============================================================================
INSERT INTO PRM_LIEU_GEOGRAPHIQUE (COD_LIEU_GEOG, LIB_LIEU, LIB_LIEU_A, DIST_LIEU_TUNIS) VALUES ('TUN', 'Tunis', 'تونس', 0);
INSERT INTO PRM_LIEU_GEOGRAPHIQUE (COD_LIEU_GEOG, LIB_LIEU, LIB_LIEU_A, DIST_LIEU_TUNIS) VALUES ('ARI', 'Ariana', 'أريانة', 8);
INSERT INTO PRM_LIEU_GEOGRAPHIQUE (COD_LIEU_GEOG, LIB_LIEU, LIB_LIEU_A, DIST_LIEU_TUNIS) VALUES ('BAR', 'Ben Arous', 'بن عروس', 10);
INSERT INTO PRM_LIEU_GEOGRAPHIQUE (COD_LIEU_GEOG, LIB_LIEU, LIB_LIEU_A, DIST_LIEU_TUNIS) VALUES ('MNB', 'La Manouba', 'منوبة', 12);
INSERT INTO PRM_LIEU_GEOGRAPHIQUE (COD_LIEU_GEOG, LIB_LIEU, LIB_LIEU_A, DIST_LIEU_TUNIS) VALUES ('NAB', 'Nabeul', 'نابل', 67);
INSERT INTO PRM_LIEU_GEOGRAPHIQUE (COD_LIEU_GEOG, LIB_LIEU, LIB_LIEU_A, DIST_LIEU_TUNIS) VALUES ('ZAG', 'Zaghouan', 'زغوان', 57);
INSERT INTO PRM_LIEU_GEOGRAPHIQUE (COD_LIEU_GEOG, LIB_LIEU, LIB_LIEU_A, DIST_LIEU_TUNIS) VALUES ('BIZ', 'Bizerte', 'بنزرت', 65);
INSERT INTO PRM_LIEU_GEOGRAPHIQUE (COD_LIEU_GEOG, LIB_LIEU, LIB_LIEU_A, DIST_LIEU_TUNIS) VALUES ('BEJ', 'Béja', 'باجة', 105);
INSERT INTO PRM_LIEU_GEOGRAPHIQUE (COD_LIEU_GEOG, LIB_LIEU, LIB_LIEU_A, DIST_LIEU_TUNIS) VALUES ('JEN', 'Jendouba', 'جندوبة', 155);
INSERT INTO PRM_LIEU_GEOGRAPHIQUE (COD_LIEU_GEOG, LIB_LIEU, LIB_LIEU_A, DIST_LIEU_TUNIS) VALUES ('KEF', 'Le Kef', 'الكاف', 175);
INSERT INTO PRM_LIEU_GEOGRAPHIQUE (COD_LIEU_GEOG, LIB_LIEU, LIB_LIEU_A, DIST_LIEU_TUNIS) VALUES ('SIL', 'Siliana', 'سليانة', 128);
INSERT INTO PRM_LIEU_GEOGRAPHIQUE (COD_LIEU_GEOG, LIB_LIEU, LIB_LIEU_A, DIST_LIEU_TUNIS) VALUES ('KAI', 'Kairouan', 'القيروان', 155);
INSERT INTO PRM_LIEU_GEOGRAPHIQUE (COD_LIEU_GEOG, LIB_LIEU, LIB_LIEU_A, DIST_LIEU_TUNIS) VALUES ('KAS', 'Kasserine', 'القصرين', 297);
INSERT INTO PRM_LIEU_GEOGRAPHIQUE (COD_LIEU_GEOG, LIB_LIEU, LIB_LIEU_A, DIST_LIEU_TUNIS) VALUES ('SBZ', 'Sidi Bouzid', 'سيدي بوزيد', 264);
INSERT INTO PRM_LIEU_GEOGRAPHIQUE (COD_LIEU_GEOG, LIB_LIEU, LIB_LIEU_A, DIST_LIEU_TUNIS) VALUES ('SOU', 'Sousse', 'سوسة', 143);
INSERT INTO PRM_LIEU_GEOGRAPHIQUE (COD_LIEU_GEOG, LIB_LIEU, LIB_LIEU_A, DIST_LIEU_TUNIS) VALUES ('MON', 'Monastir', 'المنستير', 162);
INSERT INTO PRM_LIEU_GEOGRAPHIQUE (COD_LIEU_GEOG, LIB_LIEU, LIB_LIEU_A, DIST_LIEU_TUNIS) VALUES ('MAH', 'Mahdia', 'المهدية', 205);
INSERT INTO PRM_LIEU_GEOGRAPHIQUE (COD_LIEU_GEOG, LIB_LIEU, LIB_LIEU_A, DIST_LIEU_TUNIS) VALUES ('SFA', 'Sfax', 'صفاقس', 270);
INSERT INTO PRM_LIEU_GEOGRAPHIQUE (COD_LIEU_GEOG, LIB_LIEU, LIB_LIEU_A, DIST_LIEU_TUNIS) VALUES ('GAF', 'Gafsa', 'قفصة', 369);
INSERT INTO PRM_LIEU_GEOGRAPHIQUE (COD_LIEU_GEOG, LIB_LIEU, LIB_LIEU_A, DIST_LIEU_TUNIS) VALUES ('TOZ', 'Tozeur', 'توزر', 450);
INSERT INTO PRM_LIEU_GEOGRAPHIQUE (COD_LIEU_GEOG, LIB_LIEU, LIB_LIEU_A, DIST_LIEU_TUNIS) VALUES ('KEB', 'Kébili', 'قبلي', 505);
INSERT INTO PRM_LIEU_GEOGRAPHIQUE (COD_LIEU_GEOG, LIB_LIEU, LIB_LIEU_A, DIST_LIEU_TUNIS) VALUES ('GAB', 'Gabès', 'قابس', 405);
INSERT INTO PRM_LIEU_GEOGRAPHIQUE (COD_LIEU_GEOG, LIB_LIEU, LIB_LIEU_A, DIST_LIEU_TUNIS) VALUES ('MED', 'Médenine', 'مدنين', 487);
INSERT INTO PRM_LIEU_GEOGRAPHIQUE (COD_LIEU_GEOG, LIB_LIEU, LIB_LIEU_A, DIST_LIEU_TUNIS) VALUES ('TAT', 'Tataouine', 'تطاوين', 531);

-- ============================================================================
-- 27. ACTIVITE_FAMILLE: Activités des membres de famille
-- UNCHANGED: Generic family member activities
-- ============================================================================
-- Conjoint
INSERT INTO ACTIVITE_FAMILLE (COD_ACTIVITE, PARENTE_ACT, LIB_ACTIVITE, ALLOCATION, LIB_ACTIVITE_A) VALUES ('01', 'C', 'Sans travail', 'O', 'بدون عمل');
INSERT INTO ACTIVITE_FAMILLE (COD_ACTIVITE, PARENTE_ACT, LIB_ACTIVITE, ALLOCATION, LIB_ACTIVITE_A) VALUES ('02', 'C', 'Fonctionnaire', 'N', 'موظّف/ة');
INSERT INTO ACTIVITE_FAMILLE (COD_ACTIVITE, PARENTE_ACT, LIB_ACTIVITE, ALLOCATION, LIB_ACTIVITE_A) VALUES ('03', 'C', 'Secteur privé', 'N', 'قطاع خاص');
INSERT INTO ACTIVITE_FAMILLE (COD_ACTIVITE, PARENTE_ACT, LIB_ACTIVITE, ALLOCATION, LIB_ACTIVITE_A) VALUES ('04', 'C', 'Profession libérale', 'N', 'مهنة حرّة');
-- Enfant
INSERT INTO ACTIVITE_FAMILLE (COD_ACTIVITE, PARENTE_ACT, LIB_ACTIVITE, ALLOCATION, LIB_ACTIVITE_A) VALUES ('01', 'E', 'A charge (scolarisé)', 'O', 'على العهدة (يدرس)');
INSERT INTO ACTIVITE_FAMILLE (COD_ACTIVITE, PARENTE_ACT, LIB_ACTIVITE, ALLOCATION, LIB_ACTIVITE_A) VALUES ('02', 'E', 'A charge (non scolarisé)', 'O', 'على العهدة (لا يدرس)');
INSERT INTO ACTIVITE_FAMILLE (COD_ACTIVITE, PARENTE_ACT, LIB_ACTIVITE, ALLOCATION, LIB_ACTIVITE_A) VALUES ('03', 'E', 'Travaille', 'N', 'يعمل');
INSERT INTO ACTIVITE_FAMILLE (COD_ACTIVITE, PARENTE_ACT, LIB_ACTIVITE, ALLOCATION, LIB_ACTIVITE_A) VALUES ('04', 'E', 'Marié(e)', 'N', 'متزوّج/ة');
INSERT INTO ACTIVITE_FAMILLE (COD_ACTIVITE, PARENTE_ACT, LIB_ACTIVITE, ALLOCATION, LIB_ACTIVITE_A) VALUES ('05', 'E', 'Handicapé', 'O', 'معوّق');
INSERT INTO ACTIVITE_FAMILLE (COD_ACTIVITE, PARENTE_ACT, LIB_ACTIVITE, ALLOCATION, LIB_ACTIVITE_A) VALUES ('06', 'E', 'Décédé', 'N', 'متوفّى');

-- ============================================================================
-- 28. PARAM_MVT: Mouvements de carrière (échantillon)
-- UNCHANGED: Generic public sector career movements
-- Note: The original had 131 movements, mostly already suitable for Tunisia
-- Here are the essential ones
-- ============================================================================
-- Recrutement
INSERT INTO PARAM_MVT (COD_MVT, LIB_MVT, TYP_MVT, LIB_MVT_A) VALUES ('100', 'Recrutement', '1', 'انتداب');
INSERT INTO PARAM_MVT (COD_MVT, LIB_MVT, TYP_MVT, LIB_MVT_A) VALUES ('110', 'Recrutement par concours', '1', 'انتداب عن طريق المناظرة');
INSERT INTO PARAM_MVT (COD_MVT, LIB_MVT, TYP_MVT, LIB_MVT_A) VALUES ('120', 'Recrutement direct', '1', 'انتداب مباشر');
INSERT INTO PARAM_MVT (COD_MVT, LIB_MVT, TYP_MVT, LIB_MVT_A) VALUES ('130', 'Réintégration', '1', 'إعادة إدماج');

-- Position
INSERT INTO PARAM_MVT (COD_MVT, LIB_MVT, TYP_MVT, LIB_MVT_A) VALUES ('200', 'Mise en activité', '2', 'مباشرة');
INSERT INTO PARAM_MVT (COD_MVT, LIB_MVT, TYP_MVT, LIB_MVT_A) VALUES ('210', 'Détachement', '2', 'إلحاق');
INSERT INTO PARAM_MVT (COD_MVT, LIB_MVT, TYP_MVT, LIB_MVT_A) VALUES ('220', 'Mise en disponibilité', '2', 'عدم مباشرة');
INSERT INTO PARAM_MVT (COD_MVT, LIB_MVT, TYP_MVT, LIB_MVT_A) VALUES ('230', 'Sous les drapeaux', '2', 'تحت السلاح');
INSERT INTO PARAM_MVT (COD_MVT, LIB_MVT, TYP_MVT, LIB_MVT_A) VALUES ('240', 'Mise à disposition', '2', 'وضع على الذمة');

-- Promotion / Avancement
INSERT INTO PARAM_MVT (COD_MVT, LIB_MVT, TYP_MVT, LIB_MVT_A) VALUES ('300', 'Avancement d''échelon', '3', 'ترقية في الرتبة');
INSERT INTO PARAM_MVT (COD_MVT, LIB_MVT, TYP_MVT, LIB_MVT_A) VALUES ('310', 'Avancement de grade', '3', 'ترقية في الدرجة');
INSERT INTO PARAM_MVT (COD_MVT, LIB_MVT, TYP_MVT, LIB_MVT_A) VALUES ('320', 'Promotion de catégorie', '3', 'ترقية في الصنف');
INSERT INTO PARAM_MVT (COD_MVT, LIB_MVT, TYP_MVT, LIB_MVT_A) VALUES ('330', 'Nomination à une fonction', '3', 'تسمية في خطة وظيفية');
INSERT INTO PARAM_MVT (COD_MVT, LIB_MVT, TYP_MVT, LIB_MVT_A) VALUES ('340', 'Titularisation', '3', 'ترسيم');

-- Mutation / Affectation
INSERT INTO PARAM_MVT (COD_MVT, LIB_MVT, TYP_MVT, LIB_MVT_A) VALUES ('400', 'Mutation', '4', 'نقلة');
INSERT INTO PARAM_MVT (COD_MVT, LIB_MVT, TYP_MVT, LIB_MVT_A) VALUES ('410', 'Changement de service', '4', 'تغيير المصلحة');
INSERT INTO PARAM_MVT (COD_MVT, LIB_MVT, TYP_MVT, LIB_MVT_A) VALUES ('420', 'Changement d''établissement', '4', 'تغيير المؤسسة');
INSERT INTO PARAM_MVT (COD_MVT, LIB_MVT, TYP_MVT, LIB_MVT_A) VALUES ('430', 'Changement de lieu géographique', '4', 'تغيير مكان العمل');

-- Formation
INSERT INTO PARAM_MVT (COD_MVT, LIB_MVT, TYP_MVT, LIB_MVT_A) VALUES ('500', 'Stage de formation', '5', 'تربّص تكويني');
INSERT INTO PARAM_MVT (COD_MVT, LIB_MVT, TYP_MVT, LIB_MVT_A) VALUES ('510', 'Formation à l''étranger', '5', 'تكوين بالخارج');

-- Reclassement
INSERT INTO PARAM_MVT (COD_MVT, LIB_MVT, TYP_MVT, LIB_MVT_A) VALUES ('600', 'Reclassement', '6', 'إعادة ترتيب');
INSERT INTO PARAM_MVT (COD_MVT, LIB_MVT, TYP_MVT, LIB_MVT_A) VALUES ('610', 'Intégration', '6', 'إدماج');

-- Départ
INSERT INTO PARAM_MVT (COD_MVT, LIB_MVT, TYP_MVT, LIB_MVT_A) VALUES ('800', 'Retraite', '8', 'تقاعد');
INSERT INTO PARAM_MVT (COD_MVT, LIB_MVT, TYP_MVT, LIB_MVT_A) VALUES ('810', 'Démission', '8', 'استقالة');
INSERT INTO PARAM_MVT (COD_MVT, LIB_MVT, TYP_MVT, LIB_MVT_A) VALUES ('820', 'Décès', '8', 'وفاة');
INSERT INTO PARAM_MVT (COD_MVT, LIB_MVT, TYP_MVT, LIB_MVT_A) VALUES ('830', 'Licenciement', '8', 'طرد');
INSERT INTO PARAM_MVT (COD_MVT, LIB_MVT, TYP_MVT, LIB_MVT_A) VALUES ('840', 'Révocation', '8', 'عزل');
INSERT INTO PARAM_MVT (COD_MVT, LIB_MVT, TYP_MVT, LIB_MVT_A) VALUES ('850', 'Fin de contrat', '8', 'انتهاء العقد');

-- Annulation
INSERT INTO PARAM_MVT (COD_MVT, LIB_MVT, TYP_MVT, LIB_MVT_A) VALUES ('900', 'Annulation recrutement', '9', 'إلغاء انتداب');
INSERT INTO PARAM_MVT (COD_MVT, LIB_MVT, TYP_MVT, LIB_MVT_A) VALUES ('910', 'Annulation promotion', '9', 'إلغاء ترقية');
INSERT INTO PARAM_MVT (COD_MVT, LIB_MVT, TYP_MVT, LIB_MVT_A) VALUES ('920', 'Annulation mutation', '9', 'إلغاء نقلة');

-- Discipline / Sanctions
INSERT INTO PARAM_MVT (COD_MVT, LIB_MVT, TYP_MVT, LIB_MVT_A) VALUES ('700', 'Avertissement', '7', 'إنذار');
INSERT INTO PARAM_MVT (COD_MVT, LIB_MVT, TYP_MVT, LIB_MVT_A) VALUES ('710', 'Blâme', '7', 'توبيخ');
INSERT INTO PARAM_MVT (COD_MVT, LIB_MVT, TYP_MVT, LIB_MVT_A) VALUES ('720', 'Mise à pied', '7', 'إيقاف عن العمل');
INSERT INTO PARAM_MVT (COD_MVT, LIB_MVT, TYP_MVT, LIB_MVT_A) VALUES ('730', 'Retard d''avancement', '7', 'تأخير في الترقية');
INSERT INTO PARAM_MVT (COD_MVT, LIB_MVT, TYP_MVT, LIB_MVT_A) VALUES ('740', 'Rétrogradation', '7', 'النزول في الرتبة');

COMMIT;

-- ============================================================================
-- PHASE 2: MODULE CONGÉ ET POINTAGE - DONNÉES DE RÉFÉRENCE
-- Added: 2026-03-05
-- Adapted for: Ministère de la Santé - Fonction publique tunisienne
-- ============================================================================

-- ============================================================================
-- 20. TYP_CONGE: Types/groupes de congé et codes de pointage
-- ADAPTED: Terminology adapted for Tunisian public health sector
-- ============================================================================
INSERT INTO TYP_CONGE (TYP_CNG, LIB_CNG, MOIS_DEBUT, MOIS_FIN, RESERVE, LIB_CNG_A, DROIT_CONGE, NAT_TYP_CNG, SOLD) VALUES ('01', 'Congé annuel', '01/01', '31/12', 'O', 'عطلة سنوية', 'M', 'C', 'O');
INSERT INTO TYP_CONGE (TYP_CNG, LIB_CNG, MOIS_DEBUT, MOIS_FIN, RESERVE, LIB_CNG_A, DROIT_CONGE, NAT_TYP_CNG, SOLD) VALUES ('02', 'Congé de maladie', '01/01', '31/12', 'O', 'عطلة مرض', NULL, 'C', 'N');
INSERT INTO TYP_CONGE (TYP_CNG, LIB_CNG, MOIS_DEBUT, MOIS_FIN, RESERVE, LIB_CNG_A, DROIT_CONGE, NAT_TYP_CNG, SOLD) VALUES ('03', 'Congé exceptionnel', '01/01', '31/12', 'O', 'عطلة استثنائية', NULL, 'C', 'N');
INSERT INTO TYP_CONGE (TYP_CNG, LIB_CNG, MOIS_DEBUT, MOIS_FIN, RESERVE, LIB_CNG_A, DROIT_CONGE, NAT_TYP_CNG, SOLD) VALUES ('04', 'Congé de récupération', NULL, NULL, 'O', 'عطلة تعويضية', NULL, 'P', 'N');
INSERT INTO TYP_CONGE (TYP_CNG, LIB_CNG, MOIS_DEBUT, MOIS_FIN, RESERVE, LIB_CNG_A, DROIT_CONGE, NAT_TYP_CNG, SOLD) VALUES ('05', 'Sanction disciplinaire', NULL, NULL, 'O', 'عقوبة تأديبية', NULL, 'P', 'N');
INSERT INTO TYP_CONGE (TYP_CNG, LIB_CNG, MOIS_DEBUT, MOIS_FIN, RESERVE, LIB_CNG_A, DROIT_CONGE, NAT_TYP_CNG, SOLD) VALUES ('06', 'Pointage présence', '01/01', '31/12', 'O', 'حضور', NULL, 'P', 'N');
INSERT INTO TYP_CONGE (TYP_CNG, LIB_CNG, MOIS_DEBUT, MOIS_FIN, RESERVE, LIB_CNG_A, DROIT_CONGE, NAT_TYP_CNG, SOLD) VALUES ('07', 'Accident de travail et maladie prof.', NULL, NULL, 'O', 'حادث شغل ومرض مهني', NULL, 'P', 'N');
INSERT INTO TYP_CONGE (TYP_CNG, LIB_CNG, MOIS_DEBUT, MOIS_FIN, RESERVE, LIB_CNG_A, DROIT_CONGE, NAT_TYP_CNG, SOLD) VALUES ('08', 'Autres absences', '01/01', '31/12', NULL, 'غيابات أخرى', NULL, 'P', 'N');
INSERT INTO TYP_CONGE (TYP_CNG, LIB_CNG, MOIS_DEBUT, MOIS_FIN, RESERVE, LIB_CNG_A, DROIT_CONGE, NAT_TYP_CNG, SOLD) VALUES ('09', 'Position administrative', NULL, NULL, 'N', 'وضعية إدارية', NULL, 'P', 'N');

-- ============================================================================
-- 21. REGIME_CONGE: Régimes de congé annuel
-- ADAPTED: Tunisian public service leave rights per decree 83-1122
-- Congé annuel: 1 jour/mois (1ère année), puis selon ancienneté:
--   <5 ans: 22j ouvrables | 5-9: 24j | 10-14: 26j | 15-19: 28j | 20+: 30j
-- ============================================================================
INSERT INTO REGIME_CONGE (REG_CNG, LIB_REG_CNG, LIB_REG_CNG_A, TAUX_REG_CNG) VALUES ('01', 'Droit 22 jours (ancienneté < 5 ans)', 'حق 22 يوم (أقدمية أقل من 5 سنوات)', 22);
INSERT INTO REGIME_CONGE (REG_CNG, LIB_REG_CNG, LIB_REG_CNG_A, TAUX_REG_CNG) VALUES ('02', 'Droit 24 jours (ancienneté 5-9 ans)', 'حق 24 يوم (أقدمية 5-9 سنوات)', 24);
INSERT INTO REGIME_CONGE (REG_CNG, LIB_REG_CNG, LIB_REG_CNG_A, TAUX_REG_CNG) VALUES ('03', 'Droit 26 jours (ancienneté 10-14 ans)', 'حق 26 يوم (أقدمية 10-14 سنة)', 26);
INSERT INTO REGIME_CONGE (REG_CNG, LIB_REG_CNG, LIB_REG_CNG_A, TAUX_REG_CNG) VALUES ('04', 'Droit 28 jours (ancienneté 15-19 ans)', 'حق 28 يوم (أقدمية 15-19 سنة)', 28);
INSERT INTO REGIME_CONGE (REG_CNG, LIB_REG_CNG, LIB_REG_CNG_A, TAUX_REG_CNG) VALUES ('05', 'Droit 30 jours (ancienneté 20+ ans)', 'حق 30 يوم (أقدمية 20 سنة فأكثر)', 30);

-- ============================================================================
-- 22. CONDITION_CONGE: Conditions d'éligibilité par régime
-- ADAPTED: Tunisian seniority brackets
-- ============================================================================
INSERT INTO CONDITION_CONGE (COD_COND, LIB_COND, ANC_COND, REG_CNG) VALUES ('1', 'Agents ayant moins de 5 ans d''ancienneté', 0, '01');
INSERT INTO CONDITION_CONGE (COD_COND, LIB_COND, ANC_COND, REG_CNG) VALUES ('1', 'Agents ayant entre 5 et 9 ans d''ancienneté', 5, '02');
INSERT INTO CONDITION_CONGE (COD_COND, LIB_COND, ANC_COND, REG_CNG) VALUES ('1', 'Agents ayant entre 10 et 14 ans d''ancienneté', 10, '03');
INSERT INTO CONDITION_CONGE (COD_COND, LIB_COND, ANC_COND, REG_CNG) VALUES ('1', 'Agents ayant entre 15 et 19 ans d''ancienneté', 15, '04');
INSERT INTO CONDITION_CONGE (COD_COND, LIB_COND, ANC_COND, REG_CNG) VALUES ('1', 'Agents ayant 20 ans et plus d''ancienneté', 20, '05');

-- ============================================================================
-- 23. CYCLE_CONGE: Cycles de congé
-- UNCHANGED: Calendar year cycle
-- ============================================================================
INSERT INTO CYCLE_CONGE (COD_CYCL, DAT_DEBUT_CYCL, DAT_FIN_CYCL) VALUES ('1', '01/01', '31/12');

-- ============================================================================
-- 24. JOUR_SEMAINE: Jours de la semaine
-- ADAPTED: Added Arabic labels
-- ============================================================================
INSERT INTO JOUR_SEMAINE (NUM_JOUR, LIB_JOUR) VALUES (1, 'Lundi');
INSERT INTO JOUR_SEMAINE (NUM_JOUR, LIB_JOUR) VALUES (2, 'Mardi');
INSERT INTO JOUR_SEMAINE (NUM_JOUR, LIB_JOUR) VALUES (3, 'Mercredi');
INSERT INTO JOUR_SEMAINE (NUM_JOUR, LIB_JOUR) VALUES (4, 'Jeudi');
INSERT INTO JOUR_SEMAINE (NUM_JOUR, LIB_JOUR) VALUES (5, 'Vendredi');
INSERT INTO JOUR_SEMAINE (NUM_JOUR, LIB_JOUR) VALUES (6, 'Samedi');
INSERT INTO JOUR_SEMAINE (NUM_JOUR, LIB_JOUR) VALUES (7, 'Dimanche');

-- ============================================================================
-- 25. JOURS_FERIERS: Jours fériés officiels de la Tunisie
-- CHANGED: Replaced Congolese holidays with Tunisian official holidays
-- Source: Décret n° 96-56 et mises à jour ultérieures
-- Includes: 7 fêtes civiles fixes + 5 fêtes religieuses islamiques (mobiles)
-- ============================================================================
-- Fêtes civiles fixes
INSERT INTO JOURS_FERIERS (COD_FERIE, REGIME_TRAV, LIB_FERIE, TYP_FERIE, COD_M, LIB_FERIE_A) VALUES (1, 'M', 'Jour de l''An', '1', 'R3', 'رأس السنة الميلادية');
INSERT INTO JOURS_FERIERS (COD_FERIE, REGIME_TRAV, LIB_FERIE, TYP_FERIE, COD_M, LIB_FERIE_A) VALUES (2, 'M', 'Fête de la Révolution et de la Jeunesse (14 janvier)', '1', 'R3', 'عيد الثورة والشباب');
INSERT INTO JOURS_FERIERS (COD_FERIE, REGIME_TRAV, LIB_FERIE, TYP_FERIE, COD_M, LIB_FERIE_A) VALUES (3, 'M', 'Fête de l''Indépendance (20 mars)', '1', 'R3', 'عيد الاستقلال');
INSERT INTO JOURS_FERIERS (COD_FERIE, REGIME_TRAV, LIB_FERIE, TYP_FERIE, COD_M, LIB_FERIE_A) VALUES (4, 'M', 'Journée des Martyrs (9 avril)', '1', 'R3', 'يوم الشهداء');
INSERT INTO JOURS_FERIERS (COD_FERIE, REGIME_TRAV, LIB_FERIE, TYP_FERIE, COD_M, LIB_FERIE_A) VALUES (5, 'M', 'Fête du Travail (1er mai)', '1', 'R3', 'عيد الشغل');
INSERT INTO JOURS_FERIERS (COD_FERIE, REGIME_TRAV, LIB_FERIE, TYP_FERIE, COD_M, LIB_FERIE_A) VALUES (6, 'M', 'Fête de la République (25 juillet)', '1', 'R3', 'عيد الجمهورية');
INSERT INTO JOURS_FERIERS (COD_FERIE, REGIME_TRAV, LIB_FERIE, TYP_FERIE, COD_M, LIB_FERIE_A) VALUES (7, 'M', 'Fête de la Femme (13 août)', '1', 'R3', 'عيد المرأة');
INSERT INTO JOURS_FERIERS (COD_FERIE, REGIME_TRAV, LIB_FERIE, TYP_FERIE, COD_M, LIB_FERIE_A) VALUES (8, 'M', 'Fête de l''Évacuation (15 octobre)', '1', 'R3', 'عيد الجلاء');
-- Fêtes religieuses islamiques (dates mobiles selon le calendrier hégirien)
INSERT INTO JOURS_FERIERS (COD_FERIE, REGIME_TRAV, LIB_FERIE, TYP_FERIE, COD_M, LIB_FERIE_A) VALUES (9, 'M', 'Aïd El Fitr (1er jour)', '2', 'R3', 'عيد الفطر - اليوم الأول');
INSERT INTO JOURS_FERIERS (COD_FERIE, REGIME_TRAV, LIB_FERIE, TYP_FERIE, COD_M, LIB_FERIE_A) VALUES (10, 'M', 'Aïd El Fitr (2ème jour)', '2', 'R3', 'عيد الفطر - اليوم الثاني');
INSERT INTO JOURS_FERIERS (COD_FERIE, REGIME_TRAV, LIB_FERIE, TYP_FERIE, COD_M, LIB_FERIE_A) VALUES (11, 'M', 'Aïd El Idha (1er jour)', '2', 'R3', 'عيد الأضحى - اليوم الأول');
INSERT INTO JOURS_FERIERS (COD_FERIE, REGIME_TRAV, LIB_FERIE, TYP_FERIE, COD_M, LIB_FERIE_A) VALUES (12, 'M', 'Aïd El Idha (2ème jour)', '2', 'R3', 'عيد الأضحى - اليوم الثاني');
INSERT INTO JOURS_FERIERS (COD_FERIE, REGIME_TRAV, LIB_FERIE, TYP_FERIE, COD_M, LIB_FERIE_A) VALUES (13, 'M', 'Mouled (Naissance du Prophète)', '2', 'R3', 'عيد المولد النبوي');
INSERT INTO JOURS_FERIERS (COD_FERIE, REGIME_TRAV, LIB_FERIE, TYP_FERIE, COD_M, LIB_FERIE_A) VALUES (14, 'M', 'Ras El Am El Hijri (Nouvel an hégirien)', '2', 'R3', 'رأس السنة الهجرية');

-- ============================================================================
-- 26. DATE_FERIERS: Dates effectives des jours fériés (2025-2026)
-- CHANGED: Tunisian holiday dates
-- Note: Islamic holidays are approximate (depend on lunar observation)
-- ============================================================================
-- 2025
INSERT INTO DATE_FERIERS (COD_FERIE, DAT_FERIE) VALUES (1, TO_DATE('01/01/2025','DD/MM/YYYY'));
INSERT INTO DATE_FERIERS (COD_FERIE, DAT_FERIE) VALUES (2, TO_DATE('14/01/2025','DD/MM/YYYY'));
INSERT INTO DATE_FERIERS (COD_FERIE, DAT_FERIE) VALUES (3, TO_DATE('20/03/2025','DD/MM/YYYY'));
INSERT INTO DATE_FERIERS (COD_FERIE, DAT_FERIE) VALUES (4, TO_DATE('09/04/2025','DD/MM/YYYY'));
INSERT INTO DATE_FERIERS (COD_FERIE, DAT_FERIE) VALUES (5, TO_DATE('01/05/2025','DD/MM/YYYY'));
INSERT INTO DATE_FERIERS (COD_FERIE, DAT_FERIE) VALUES (6, TO_DATE('25/07/2025','DD/MM/YYYY'));
INSERT INTO DATE_FERIERS (COD_FERIE, DAT_FERIE) VALUES (7, TO_DATE('13/08/2025','DD/MM/YYYY'));
INSERT INTO DATE_FERIERS (COD_FERIE, DAT_FERIE) VALUES (8, TO_DATE('15/10/2025','DD/MM/YYYY'));
INSERT INTO DATE_FERIERS (COD_FERIE, DAT_FERIE) VALUES (9, TO_DATE('30/03/2025','DD/MM/YYYY'));
INSERT INTO DATE_FERIERS (COD_FERIE, DAT_FERIE) VALUES (10, TO_DATE('31/03/2025','DD/MM/YYYY'));
INSERT INTO DATE_FERIERS (COD_FERIE, DAT_FERIE) VALUES (11, TO_DATE('06/06/2025','DD/MM/YYYY'));
INSERT INTO DATE_FERIERS (COD_FERIE, DAT_FERIE) VALUES (12, TO_DATE('07/06/2025','DD/MM/YYYY'));
INSERT INTO DATE_FERIERS (COD_FERIE, DAT_FERIE) VALUES (13, TO_DATE('05/09/2025','DD/MM/YYYY'));
INSERT INTO DATE_FERIERS (COD_FERIE, DAT_FERIE) VALUES (14, TO_DATE('26/06/2025','DD/MM/YYYY'));
-- 2026
INSERT INTO DATE_FERIERS (COD_FERIE, DAT_FERIE) VALUES (1, TO_DATE('01/01/2026','DD/MM/YYYY'));
INSERT INTO DATE_FERIERS (COD_FERIE, DAT_FERIE) VALUES (2, TO_DATE('14/01/2026','DD/MM/YYYY'));
INSERT INTO DATE_FERIERS (COD_FERIE, DAT_FERIE) VALUES (3, TO_DATE('20/03/2026','DD/MM/YYYY'));
INSERT INTO DATE_FERIERS (COD_FERIE, DAT_FERIE) VALUES (4, TO_DATE('09/04/2026','DD/MM/YYYY'));
INSERT INTO DATE_FERIERS (COD_FERIE, DAT_FERIE) VALUES (5, TO_DATE('01/05/2026','DD/MM/YYYY'));
INSERT INTO DATE_FERIERS (COD_FERIE, DAT_FERIE) VALUES (6, TO_DATE('25/07/2026','DD/MM/YYYY'));
INSERT INTO DATE_FERIERS (COD_FERIE, DAT_FERIE) VALUES (7, TO_DATE('13/08/2026','DD/MM/YYYY'));
INSERT INTO DATE_FERIERS (COD_FERIE, DAT_FERIE) VALUES (8, TO_DATE('15/10/2026','DD/MM/YYYY'));
INSERT INTO DATE_FERIERS (COD_FERIE, DAT_FERIE) VALUES (9, TO_DATE('20/03/2026','DD/MM/YYYY'));
INSERT INTO DATE_FERIERS (COD_FERIE, DAT_FERIE) VALUES (10, TO_DATE('21/03/2026','DD/MM/YYYY'));
INSERT INTO DATE_FERIERS (COD_FERIE, DAT_FERIE) VALUES (11, TO_DATE('27/05/2026','DD/MM/YYYY'));
INSERT INTO DATE_FERIERS (COD_FERIE, DAT_FERIE) VALUES (12, TO_DATE('28/05/2026','DD/MM/YYYY'));
INSERT INTO DATE_FERIERS (COD_FERIE, DAT_FERIE) VALUES (13, TO_DATE('25/08/2026','DD/MM/YYYY'));
INSERT INTO DATE_FERIERS (COD_FERIE, DAT_FERIE) VALUES (14, TO_DATE('16/06/2026','DD/MM/YYYY'));

-- ============================================================================
-- 27. TYP_AUTORISATION: Types d'autorisations de sortie
-- ADAPTED: For public health sector context
-- ============================================================================
INSERT INTO TYP_AUTORISATION (COD_TYP_AUT, LIB_TYP_AUT, LIB_TYP_AUT_A, NAT_TYP_AUT, PLAF_PAY) VALUES ('01', 'Autorisation syndicale', 'إذن نقابي', 'O', 2);
INSERT INTO TYP_AUTORISATION (COD_TYP_AUT, LIB_TYP_AUT, LIB_TYP_AUT_A, NAT_TYP_AUT, PLAF_PAY) VALUES ('02', 'Autorisation de sortie personnelle', 'إذن خروج شخصي', 'O', 2);
INSERT INTO TYP_AUTORISATION (COD_TYP_AUT, LIB_TYP_AUT, LIB_TYP_AUT_A, NAT_TYP_AUT, PLAF_PAY) VALUES ('03', 'Mission officielle', 'مأمورية رسمية', 'O', NULL);
INSERT INTO TYP_AUTORISATION (COD_TYP_AUT, LIB_TYP_AUT, LIB_TYP_AUT_A, NAT_TYP_AUT, PLAF_PAY) VALUES ('04', 'Formation continue', 'تكوين مستمر', 'O', NULL);
INSERT INTO TYP_AUTORISATION (COD_TYP_AUT, LIB_TYP_AUT, LIB_TYP_AUT_A, NAT_TYP_AUT, PLAF_PAY) VALUES ('05', 'Autorisation pour enseignement', 'إذن تدريس', 'O', NULL);
INSERT INTO TYP_AUTORISATION (COD_TYP_AUT, LIB_TYP_AUT, LIB_TYP_AUT_A, NAT_TYP_AUT, PLAF_PAY) VALUES ('06', 'Visite médicale', 'زيارة طبية', 'O', NULL);
INSERT INTO TYP_AUTORISATION (COD_TYP_AUT, LIB_TYP_AUT, LIB_TYP_AUT_A, NAT_TYP_AUT, PLAF_PAY) VALUES ('07', 'Garde / Astreinte hôpital', 'حراسة / مناوبة مستشفى', 'O', NULL);

-- ============================================================================
-- 28. MOTIF_J: Motifs d'absence et codes de pointage
-- ADAPTED: French public service leave system adapted for Tunisia
-- Key changes:
--   - Congé maternité: 2 mois (60 jours) per Tunisian law
--   - Congé spécial (décès, mariage): per Tunisian statut général FP
--   - Congé maladie: plein traitement puis demi puis sans solde
--   - Added: Congé allaitement (spécifique secteur santé)
-- ============================================================================

-- 01: Congé annuel
INSERT INTO MOTIF_J (COD_M, TYP_CNG, LIB_MOT, ABRV_MOT, DED_SAL, DED_CNG, PLAFOND_CNG, UNITE, JOUR, NAT_CNG, MOTIF_CHEV_POINT, NBR_JOUR_MIN, DED_ANCIENNETE, SEXE, DED_TICKET, RESERVE, ORD_REND, LIB_MOT_A, NUM_DEC)
VALUES ('01', '01', 'Congé annuel', 'C.ANN', 'N', 'N', NULL, 'N', 'O', 'C', NULL, 1, NULL, NULL, 'N', NULL, 10, 'عطلة سنوية', 210);

-- 02-04: Congés de maladie
INSERT INTO MOTIF_J (COD_M, TYP_CNG, LIB_MOT, ABRV_MOT, DED_SAL, DED_CNG, PLAFOND_CNG, UNITE, JOUR, NAT_CNG, MOTIF_CHEV_POINT, NBR_JOUR_MIN, DED_ANCIENNETE, SEXE, DED_TICKET, RESERVE, ORD_REND, LIB_MOT_A)
VALUES ('02', '02', 'Congé de maladie ordinaire', 'C.MAL', NULL, 'N', NULL, 'N', 'C', 'C', NULL, 1, NULL, NULL, 'N', NULL, 11, 'عطلة مرض عادية');
INSERT INTO MOTIF_J (COD_M, TYP_CNG, LIB_MOT, ABRV_MOT, DED_SAL, DED_CNG, PLAFOND_CNG, UNITE, JOUR, NAT_CNG, MOTIF_CHEV_POINT, NBR_JOUR_MIN, DED_ANCIENNETE, SEXE, DED_TICKET, RESERVE, ORD_REND, LIB_MOT_A)
VALUES ('03', '02', 'Congé de maladie longue durée', 'C.MLD', NULL, 'N', NULL, 'N', 'C', 'C', NULL, 1, NULL, NULL, 'N', NULL, 12, 'عطلة مرض طويلة المدة');
INSERT INTO MOTIF_J (COD_M, TYP_CNG, LIB_MOT, ABRV_MOT, DED_SAL, DED_CNG, PLAFOND_CNG, UNITE, JOUR, NAT_CNG, MOTIF_CHEV_POINT, NBR_JOUR_MIN, DED_ANCIENNETE, SEXE, DED_TICKET, RESERVE, ORD_REND, LIB_MOT_A, NUM_DEC, NUM_DEC_REP)
VALUES ('04', '02', 'Congé de maternité', 'C.MAT', NULL, 'N', 60, 'N', 'C', 'C', NULL, 1, NULL, 'F', 'N', NULL, 13, 'عطلة أمومة', 200, 201);

-- 10-19: Congés exceptionnels (spéciaux) - selon statut FP tunisienne
INSERT INTO MOTIF_J (COD_M, TYP_CNG, LIB_MOT, ABRV_MOT, DED_SAL, DED_CNG, PLAFOND_CNG, UNITE, JOUR, UNIT_PLAF, NAT_CNG, NBR_JOUR_MIN, DED_ANCIENNETE, DED_TICKET, RESERVE, ORD_REND, LIB_MOT_A, NUM_DEC)
VALUES ('10', '03', 'Décès d''un membre de la famille (frère, sœur, beau-parent)', 'C.DECE', NULL, 'O', 3, 'N', 'O', 'A', 'C', 1, NULL, 'N', NULL, 20, 'وفاة أحد أفراد العائلة', 211);
INSERT INTO MOTIF_J (COD_M, TYP_CNG, LIB_MOT, ABRV_MOT, DED_SAL, DED_CNG, PLAFOND_CNG, UNITE, JOUR, UNIT_PLAF, NAT_CNG, NBR_JOUR_MIN, DED_ANCIENNETE, DED_TICKET, RESERVE, ORD_REND, LIB_MOT_A, NUM_DEC)
VALUES ('11', '03', 'Mariage de l''agent', 'C.MAR', NULL, 'O', 3, NULL, 'O', 'A', 'C', 1, NULL, 'N', NULL, 21, 'زواج العون', 211);
INSERT INTO MOTIF_J (COD_M, TYP_CNG, LIB_MOT, ABRV_MOT, DED_SAL, DED_CNG, PLAFOND_CNG, UNITE, JOUR, UNIT_PLAF, NAT_CNG, NBR_JOUR_MIN, DED_ANCIENNETE, DED_TICKET, RESERVE, ORD_REND, LIB_MOT_A, NUM_DEC)
VALUES ('12', '03', 'Naissance d''un enfant', 'C.NAIS', NULL, 'O', 2, 'N', 'O', 'A', 'C', 1, NULL, 'N', NULL, 22, 'ولادة مولود', 211);
INSERT INTO MOTIF_J (COD_M, TYP_CNG, LIB_MOT, ABRV_MOT, DED_SAL, DED_CNG, PLAFOND_CNG, UNITE, JOUR, UNIT_PLAF, NAT_CNG, NBR_JOUR_MIN, DED_ANCIENNETE, DED_TICKET, RESERVE, ORD_REND, LIB_MOT_A, NUM_DEC)
VALUES ('13', '03', 'Décès du père ou de la mère', 'C.DECP', NULL, 'O', 3, NULL, 'O', 'A', 'C', 1, NULL, 'N', NULL, 23, 'وفاة الأب أو الأم', 211);
INSERT INTO MOTIF_J (COD_M, TYP_CNG, LIB_MOT, ABRV_MOT, DED_SAL, DED_CNG, PLAFOND_CNG, UNITE, JOUR, UNIT_PLAF, NAT_CNG, NBR_JOUR_MIN, DED_ANCIENNETE, DED_TICKET, RESERVE, ORD_REND, LIB_MOT_A, NUM_DEC)
VALUES ('14', '03', 'Circoncision d''un enfant', 'C.CIRC', NULL, 'O', 2, 'N', 'O', 'A', 'C', 1, NULL, 'N', NULL, 24, 'ختان طفل', 211);
INSERT INTO MOTIF_J (COD_M, TYP_CNG, LIB_MOT, ABRV_MOT, DED_SAL, DED_CNG, PLAFOND_CNG, UNITE, JOUR, UNIT_PLAF, NAT_CNG, NBR_JOUR_MIN, DED_ANCIENNETE, DED_TICKET, RESERVE, ORD_REND, LIB_MOT_A, NUM_DEC)
VALUES ('15', '03', 'Pèlerinage (Hajj)', 'C.HAJJ', NULL, 'O', 30, 'N', 'C', 'A', 'C', 1, NULL, 'N', NULL, 25, 'حج', 211);
INSERT INTO MOTIF_J (COD_M, TYP_CNG, LIB_MOT, ABRV_MOT, DED_SAL, DED_CNG, PLAFOND_CNG, UNITE, JOUR, UNIT_PLAF, NAT_CNG, NBR_JOUR_MIN, DED_ANCIENNETE, DED_TICKET, RESERVE, ORD_REND, LIB_MOT_A, NUM_DEC)
VALUES ('16', '03', 'Examen ou concours professionnel', 'C.EXAM', NULL, 'O', NULL, 'N', 'O', 'A', 'C', 1, NULL, 'N', NULL, 26, 'إمتحان أو مناظرة مهنية', 211);
INSERT INTO MOTIF_J (COD_M, TYP_CNG, LIB_MOT, ABRV_MOT, DED_SAL, DED_CNG, PLAFOND_CNG, UNITE, JOUR, UNIT_PLAF, NAT_CNG, NBR_JOUR_MIN, DED_ANCIENNETE, DED_TICKET, RESERVE, ORD_REND, LIB_MOT_A, NUM_DEC)
VALUES ('17', '03', 'Décès du conjoint ou d''un enfant', 'C.DECC', NULL, 'O', 5, 'N', 'C', 'A', 'C', 1, NULL, 'N', NULL, 27, 'وفاة الزوج أو طفل', 211);
INSERT INTO MOTIF_J (COD_M, TYP_CNG, LIB_MOT, ABRV_MOT, DED_SAL, DED_CNG, PLAFOND_CNG, UNITE, JOUR, UNIT_PLAF, NAT_CNG, NBR_JOUR_MIN, DED_ANCIENNETE, DED_TICKET, RESERVE, ORD_REND, LIB_MOT_A, NUM_DEC)
VALUES ('18', '03', 'Mariage d''un enfant', 'C.MARE', NULL, 'O', 2, 'N', 'O', 'A', 'C', 1, NULL, 'N', NULL, 29, 'زواج ابن', 211);

-- 20-21: Congé de récupération
INSERT INTO MOTIF_J (COD_M, TYP_CNG, LIB_MOT, ABRV_MOT, DED_SAL, DED_CNG, UNITE, JOUR, NAT_CNG, NBR_JOUR_MIN, DED_ANCIENNETE, DED_TICKET, RESERVE, ORD_REND, LIB_MOT_A)
VALUES ('20', '04', 'Congé de récupération', 'C.RECU', NULL, NULL, 'N', 'C', 'C', 1, NULL, 'N', NULL, 99, 'عطلة تعويضية');
INSERT INTO MOTIF_J (COD_M, TYP_CNG, LIB_MOT, ABRV_MOT, DED_SAL, DED_CNG, UNITE, JOUR, NAT_CNG, NBR_JOUR_MIN, DED_ANCIENNETE, DED_TICKET, RESERVE, ORD_REND, LIB_MOT_A)
VALUES ('21', '04', 'Congé pour élection', 'C.ELECT', NULL, NULL, 'N', 'C', 'C', 1, NULL, 'N', NULL, 99, 'عطلة انتخاب');

-- 25-26: Accident de travail et maladie professionnelle
INSERT INTO MOTIF_J (COD_M, TYP_CNG, LIB_MOT, ABRV_MOT, DED_SAL, DED_CNG, UNITE, JOUR, NAT_CNG, NBR_JOUR_MIN, DED_ANCIENNETE, DED_TICKET, TYPE_ABS, MOTIF_POINT, RESERVE, ORD_REND, LIB_MOT_A)
VALUES ('25', '07', 'Congé suite accident de travail', 'C.ACCT', NULL, NULL, 'N', 'C', 'C', 1, NULL, 'N', 'T', '05', NULL, 18, 'عطلة حادث شغل');
INSERT INTO MOTIF_J (COD_M, TYP_CNG, LIB_MOT, ABRV_MOT, DED_SAL, DED_CNG, UNITE, JOUR, NAT_CNG, NBR_JOUR_MIN, DED_ANCIENNETE, DED_TICKET, TYPE_ABS, RESERVE, ORD_REND, LIB_MOT_A)
VALUES ('26', '07', 'Maladie professionnelle', 'C.MALP', NULL, NULL, 'N', 'C', 'C', 1, NULL, 'N', 'P', NULL, 19, 'مرض مهني');

-- 30-32: Sanctions disciplinaires
INSERT INTO MOTIF_J (COD_M, TYP_CNG, LIB_MOT, ABRV_MOT, DED_SAL, DED_CNG, UNITE, JOUR, NAT_CNG, NBR_JOUR_MIN, DED_ANCIENNETE, DED_TICKET, RESERVE, ORD_REND, LIB_MOT_A)
VALUES ('30', '05', 'Mise à pied', 'C.MAP', NULL, NULL, 'N', 'C', 'C', 1, NULL, 'N', NULL, 4, 'إيقاف عن العمل');
INSERT INTO MOTIF_J (COD_M, TYP_CNG, LIB_MOT, ABRV_MOT, DED_SAL, DED_CNG, UNITE, JOUR, NAT_CNG, NBR_JOUR_MIN, DED_ANCIENNETE, DED_TICKET, RESERVE, ORD_REND, LIB_MOT_A)
VALUES ('31', '05', 'Suspension', 'C.SUSP', NULL, NULL, 'N', 'C', 'C', 1, NULL, 'N', NULL, 5, 'تعليق');
INSERT INTO MOTIF_J (COD_M, TYP_CNG, LIB_MOT, ABRV_MOT, DED_SAL, DED_CNG, UNITE, JOUR, NAT_CNG, NBR_JOUR_MIN, DED_ANCIENNETE, DED_TICKET, RESERVE, ORD_REND, LIB_MOT_A)
VALUES ('32', '05', 'Suspension avec retenue de salaire', 'C.SUSPS', NULL, NULL, 'N', 'C', 'C', 1, NULL, 'N', NULL, 6, 'تعليق مع خصم أجر');

-- 50-57: Autres absences et positions
INSERT INTO MOTIF_J (COD_M, TYP_CNG, LIB_MOT, ABRV_MOT, DED_SAL, DED_CNG, PLAFOND_CNG, UNITE, JOUR, NAT_CNG, NBR_JOUR_MIN, DED_ANCIENNETE, DED_TICKET, RESERVE, ORD_REND, LIB_MOT_A, NUM_DEC)
VALUES ('50', '08', 'Congé sans solde', 'C.CS', NULL, NULL, 3, 'N', 'O', 'C', 0.5, NULL, 'N', NULL, 2, 'عطلة بدون أجر', 212);
INSERT INTO MOTIF_J (COD_M, TYP_CNG, LIB_MOT, ABRV_MOT, DED_SAL, DED_CNG, UNITE, JOUR, NAT_CNG, NBR_JOUR_MIN, DED_ANCIENNETE, DED_TICKET, RESERVE, ORD_REND, LIB_MOT_A)
VALUES ('51', '09', 'En détachement', 'C.DET', NULL, NULL, 'N', 'C', 'C', 1, NULL, 'N', NULL, 7, 'إلحاق');
INSERT INTO MOTIF_J (COD_M, TYP_CNG, LIB_MOT, ABRV_MOT, DED_SAL, DED_CNG, UNITE, JOUR, NAT_CNG, NBR_JOUR_MIN, DED_ANCIENNETE, DED_TICKET, RESERVE, ORD_REND, LIB_MOT_A)
VALUES ('52', '09', 'Service national', 'C.SERV', NULL, NULL, 'N', 'C', 'C', 1, NULL, 'N', NULL, 8, 'خدمة وطنية');
INSERT INTO MOTIF_J (COD_M, TYP_CNG, LIB_MOT, ABRV_MOT, DED_SAL, DED_CNG, UNITE, JOUR, NAT_CNG, NBR_JOUR_MIN, DED_ANCIENNETE, DED_TICKET, RESERVE, ORD_REND, LIB_MOT_A)
VALUES ('53', '09', 'Mise en disponibilité', 'C.DISP', NULL, NULL, 'N', 'C', 'C', 1, NULL, 'N', NULL, 3, 'إلحاق بدون أجر');
INSERT INTO MOTIF_J (COD_M, TYP_CNG, LIB_MOT, ABRV_MOT, DED_SAL, DED_CNG, UNITE, JOUR, UNIT_PLAF, NAT_CNG, NBR_JOUR_MIN, DED_ANCIENNETE, DED_TICKET, RESERVE, ORD_REND, LIB_MOT_A)
VALUES ('54', '08', 'Absence autorisée (visite, RDV médical)', 'C.VISIT', NULL, NULL, 'N', 'C', 'A', 'C', 0.5, NULL, 'N', NULL, 28, 'غياب مرخص');
INSERT INTO MOTIF_J (COD_M, TYP_CNG, LIB_MOT, ABRV_MOT, DED_SAL, DED_CNG, UNITE, JOUR, NAT_CNG, NBR_JOUR_MIN, DED_ANCIENNETE, DED_TICKET, RESERVE, ORD_REND, LIB_MOT_A)
VALUES ('55', '08', 'Congé pour maladie d''un proche sans solde', 'A1', NULL, NULL, 'N', 'C', 'C', 1, NULL, 'N', NULL, 20, 'عطلة مرض قريب بدون أجر');
INSERT INTO MOTIF_J (COD_M, TYP_CNG, LIB_MOT, ABRV_MOT, DED_SAL, DED_CNG, UNITE, JOUR, NAT_CNG, NBR_JOUR_MIN, DED_ANCIENNETE, DED_TICKET, RESERVE, ORD_REND, LIB_MOT_A)
VALUES ('56', '09', 'Réquisition', 'C.REQUI', NULL, NULL, 'N', 'C', 'C', 1, NULL, 'N', NULL, 99, 'تسخير');
INSERT INTO MOTIF_J (COD_M, TYP_CNG, LIB_MOT, ABRV_MOT, DED_SAL, DED_CNG, UNITE, JOUR, NAT_CNG, NBR_JOUR_MIN, DED_ANCIENNETE, DED_TICKET, RESERVE, ORD_REND, LIB_MOT_A)
VALUES ('57', '09', 'Mission', 'C.MISS', NULL, NULL, 'N', 'C', 'C', 1, NULL, 'N', NULL, 40, 'مأمورية');

-- 60: Congé pour maladie d'un enfant
INSERT INTO MOTIF_J (COD_M, TYP_CNG, LIB_MOT, ABRV_MOT, DED_SAL, DED_CNG, PLAFOND_CNG, UNITE, JOUR, UNIT_PLAF, NAT_CNG, NBR_JOUR_MIN, DED_ANCIENNETE, DED_TICKET, RESERVE, ORD_REND, LIB_MOT_A, ENFANT)
VALUES ('60', '03', 'Congé pour maladie d''un enfant', 'MLDE', NULL, 'O', 12, 'N', 'O', 'A', 'C', 1, NULL, 'N', NULL, 31, 'عطلة مرض طفل', 'O');

-- Codes de pointage quotidien
INSERT INTO MOTIF_J (COD_M, TYP_CNG, LIB_MOT, ABRV_MOT, DED_SAL, DED_CNG, UNITE, JOUR, NAT_CNG, NBR_JOUR_MIN, CUMUL_HSUP48, DED_ANCIENNETE, DED_TICKET, ORD_REND, LIB_MOT_A, CORRES_PERS, TYPE_ABS)
VALUES ('P', '06', 'Jour de présence', NULL, 'N', 'N', 'N', 'O', 'C', 1, 'N', 'N', 'N', 99, 'يوم حضور', NULL, 'A');
INSERT INTO MOTIF_J (COD_M, TYP_CNG, LIB_MOT, ABRV_MOT, DED_SAL, DED_CNG, UNITE, JOUR, NAT_CNG, NBR_JOUR_MIN, CUMUL_HSUP48, DED_ANCIENNETE, DED_TICKET, ORD_REND, LIB_MOT_A, CORRES_PERS, TYPE_ABS)
VALUES ('R1', '06', 'Repos hebdomadaire', NULL, 'N', 'N', 'N', 'O', 'C', 1, 'N', 'N', 'N', 99, 'راحة أسبوعية', NULL, 'A');
INSERT INTO MOTIF_J (COD_M, TYP_CNG, LIB_MOT, ABRV_MOT, DED_SAL, DED_CNG, UNITE, JOUR, NAT_CNG, NBR_JOUR_MIN, DED_ANCIENNETE, DED_TICKET, ORD_REND, LIB_MOT_A)
VALUES ('R3', '06', 'Jour chômé payé (férié)', NULL, NULL, 'N', 'N', 'O', 'C', 1, NULL, 'N', 99, 'يوم عطلة مدفوعة الأجر');
INSERT INTO MOTIF_J (COD_M, TYP_CNG, LIB_MOT, ABRV_MOT, DED_SAL, DED_CNG, UNITE, JOUR, NAT_CNG, NBR_JOUR_MIN, DED_ANCIENNETE, DED_TICKET, ORD_REND, LIB_MOT_A)
VALUES ('RS', '06', 'Repos hebdomadaire supplémentaire', NULL, NULL, 'N', 'N', 'O', 'C', 1, NULL, 'N', 6, 'راحة أسبوعية إضافية');
INSERT INTO MOTIF_J (COD_M, TYP_CNG, LIB_MOT, ABRV_MOT, DED_SAL, DED_CNG, UNITE, JOUR, NAT_CNG, NBR_JOUR_MIN, DED_ANCIENNETE, DED_TICKET, ORD_REND, LIB_MOT_A)
VALUES ('A1', '08', 'Absence irrégulière', 'A1', NULL, NULL, 'N', 'C', 'C', 0.5, NULL, 'N', 1, 'غياب غير شرعي');
INSERT INTO MOTIF_J (COD_M, TYP_CNG, LIB_MOT, ABRV_MOT, DED_SAL, DED_CNG, UNITE, JOUR, NAT_CNG, NBR_JOUR_MIN, DED_ANCIENNETE, DED_TICKET, ORD_REND, LIB_MOT_A)
VALUES ('F', '08', 'Jour de formation', NULL, NULL, 'N', 'N', 'C', 'C', 1, NULL, 'N', 99, 'يوم تكوين');

-- ============================================================================
-- 29. REGIME: Régimes de pointage/travail
-- ADAPTED: Health ministry specific work regimes
-- Tunisia public sector: 37.5h/week (admin) or shift-based (hospitals)
-- ============================================================================
INSERT INTO REGIME (COD_REG, LIB_REGIME, LIB_REGIME_A, TYPE, COD_SOC, NAT_REG, TYP_REG, TOL_ENTREE, TOL_SORTIE)
VALUES ('AD', 'Régime administratif (siège)', 'النظام الإداري (المقر)', 'S', '01', 'N', 'P', 10, 10);
INSERT INTO REGIME (COD_REG, LIB_REGIME, LIB_REGIME_A, TYPE, COD_SOC, NAT_REG, TYP_REG, TOL_ENTREE, TOL_SORTIE)
VALUES ('HO', 'Régime hospitalier (séance unique)', 'النظام الاستشفائي', 'S', '01', 'N', 'P', 10, 10);
INSERT INTO REGIME (COD_REG, LIB_REGIME, LIB_REGIME_A, TYPE, COD_SOC, NAT_REG, TYP_REG, TOL_ENTREE, TOL_SORTIE)
VALUES ('GR', 'Régime garde 24h', 'نظام الحراسة 24 ساعة', 'S', '01', 'P', 'O', 15, 15);
INSERT INTO REGIME (COD_REG, LIB_REGIME, LIB_REGIME_A, TYPE, COD_SOC, NAT_REG, TYP_REG, TOL_ENTREE, TOL_SORTIE)
VALUES ('3X8', 'Régime 3x8h (hôpital 24/7)', 'نظام 3×8 ساعات', 'S', '01', 'P', 'P', 10, 10);
INSERT INTO REGIME (COD_REG, LIB_REGIME, LIB_REGIME_A, TYPE, COD_SOC, NAT_REG, TYP_REG, TOL_ENTREE, TOL_SORTIE)
VALUES ('CSB', 'Régime CSB (centre santé de base)', 'نظام مركز الصحة الأساسية', 'S', '01', 'N', 'P', 10, 10);
INSERT INTO REGIME (COD_REG, LIB_REGIME, LIB_REGIME_A, TYPE, COD_SOC, NAT_REG, TYP_REG, TOL_ENTREE, TOL_SORTIE)
VALUES ('ALL', 'Régime allaitement', 'نظام الرضاعة', 'S', '01', 'N', 'O', 10, 10);

-- ============================================================================
-- 30. SHIF: Définition des shifts
-- ADAPTED: Health sector shifts for Tunisia
-- Admin: Séance unique 8h-16h ou double séance 8h-12h30 + 14h-17h30
-- Hospital: Matin 7h-13h, Soir 13h-19h, Nuit 19h-7h
-- ============================================================================
INSERT INTO SHIF (COD_SHIFT, LIB_SHIFT, LIB_SHIFT_A, PAUSE_SHIFT, H_ENTREE, M_ENTREE, H_SORTIE, M_SORTIE, PLAGE_A_E, PLAGE_A_S, COD_SOC, TYPE_SHIF)
VALUES ('01', 'Séance unique administrative', 'حصة واحدة إدارية', 60, 8, 30, 17, 30, 120, 30, '01', 'S');
INSERT INTO SHIF (COD_SHIFT, LIB_SHIFT, LIB_SHIFT_A, PAUSE_SHIFT, H_ENTREE, M_ENTREE, H_SORTIE, M_SORTIE, PLAGE_A_E, PLAGE_A_S, COD_SOC, TYPE_SHIF)
VALUES ('02', 'Séance matin administrative', 'حصة صباحية إدارية', NULL, 8, 0, 12, 30, 30, 120, '01', 'S');
INSERT INTO SHIF (COD_SHIFT, LIB_SHIFT, LIB_SHIFT_A, PAUSE_SHIFT, H_ENTREE, M_ENTREE, H_SORTIE, M_SORTIE, PLAGE_A_E, PLAGE_A_S, COD_SOC, TYPE_SHIF)
VALUES ('03', 'Séance après-midi administrative', 'حصة مسائية إدارية', NULL, 14, 0, 17, 30, 30, 120, '01', 'S');
INSERT INTO SHIF (COD_SHIFT, LIB_SHIFT, LIB_SHIFT_A, PAUSE_SHIFT, H_ENTREE, M_ENTREE, H_SORTIE, M_SORTIE, PLAGE_A_E, PLAGE_A_S, COD_SOC, TYPE_SHIF)
VALUES ('04', 'Séance samedi matin', 'حصة سبت صباحية', NULL, 8, 0, 13, 0, 120, 15, '01', 'S');
INSERT INTO SHIF (COD_SHIFT, LIB_SHIFT, LIB_SHIFT_A, PAUSE_SHIFT, H_ENTREE, M_ENTREE, H_SORTIE, M_SORTIE, PLAGE_A_E, PLAGE_A_S, COD_SOC, TYPE_SHIF)
VALUES ('05', 'Shift matin hôpital (7h-13h)', 'فترة صباح مستشفى', NULL, 7, 0, 13, 0, 30, 30, '01', 'S');
INSERT INTO SHIF (COD_SHIFT, LIB_SHIFT, LIB_SHIFT_A, PAUSE_SHIFT, H_ENTREE, M_ENTREE, H_SORTIE, M_SORTIE, PLAGE_A_E, PLAGE_A_S, COD_SOC, TYPE_SHIF)
VALUES ('06', 'Shift soir hôpital (13h-19h)', 'فترة مساء مستشفى', NULL, 13, 0, 19, 0, 30, 30, '01', 'S');
INSERT INTO SHIF (COD_SHIFT, LIB_SHIFT, LIB_SHIFT_A, PAUSE_SHIFT, H_ENTREE, M_ENTREE, H_SORTIE, M_SORTIE, PLAGE_A_E, PLAGE_A_S, COD_SOC, TYPE_SHIF)
VALUES ('07', 'Shift nuit hôpital (19h-7h)', 'فترة ليل مستشفى', NULL, 19, 0, 7, 0, 30, 30, '01', 'S');
INSERT INTO SHIF (COD_SHIFT, LIB_SHIFT, LIB_SHIFT_A, PAUSE_SHIFT, H_ENTREE, M_ENTREE, H_SORTIE, M_SORTIE, PLAGE_A_E, PLAGE_A_S, COD_SOC, TYPE_SHIF)
VALUES ('08', 'Garde 24h', 'حراسة 24 ساعة', NULL, 8, 0, 8, 0, 60, 60, '01', 'S');
INSERT INTO SHIF (COD_SHIFT, LIB_SHIFT, LIB_SHIFT_A, PAUSE_SHIFT, H_ENTREE, M_ENTREE, H_SORTIE, M_SORTIE, PLAGE_A_E, PLAGE_A_S, COD_SOC, TYPE_SHIF)
VALUES ('09', 'Séance unique CSB', 'حصة واحدة مركز صحة', 30, 8, 0, 15, 30, 15, 120, '01', 'S');

-- ============================================================================
-- 31. SHIFT_REG: Association shifts/régimes par jour de semaine
-- ADAPTED: Tunisian work week (Lun-Ven for admin, with samedi optionnel)
-- Note: En Tunisie, repos hebdo = Samedi après-midi + Dimanche (admin)
--       Pour les hôpitaux: rotation 3x8h, 7j/7
-- ============================================================================
-- Régime administratif (AD): Lun-Ven séance unique, Sam matin
INSERT INTO SHIFT_REG (COD_REG, COD_SHIFT, BASE_H, BASE_M, JOURS_SEM, TYPE, COD_SOC) VALUES ('AD', '01', 7, 30, 1, '3', '01');
INSERT INTO SHIFT_REG (COD_REG, COD_SHIFT, BASE_H, BASE_M, JOURS_SEM, TYPE, COD_SOC) VALUES ('AD', '01', 7, 30, 2, '3', '01');
INSERT INTO SHIFT_REG (COD_REG, COD_SHIFT, BASE_H, BASE_M, JOURS_SEM, TYPE, COD_SOC) VALUES ('AD', '01', 7, 30, 3, '3', '01');
INSERT INTO SHIFT_REG (COD_REG, COD_SHIFT, BASE_H, BASE_M, JOURS_SEM, TYPE, COD_SOC) VALUES ('AD', '01', 7, 30, 4, '3', '01');
INSERT INTO SHIFT_REG (COD_REG, COD_SHIFT, BASE_H, BASE_M, JOURS_SEM, TYPE, COD_SOC) VALUES ('AD', '01', 7, 30, 5, '3', '01');
-- Régime hospitalier (HO): Lun-Ven shift matin, Sam matin
INSERT INTO SHIFT_REG (COD_REG, COD_SHIFT, BASE_H, BASE_M, JOURS_SEM, TYPE, COD_SOC) VALUES ('HO', '05', 6, 0, 1, '3', '01');
INSERT INTO SHIFT_REG (COD_REG, COD_SHIFT, BASE_H, BASE_M, JOURS_SEM, TYPE, COD_SOC) VALUES ('HO', '05', 6, 0, 2, '3', '01');
INSERT INTO SHIFT_REG (COD_REG, COD_SHIFT, BASE_H, BASE_M, JOURS_SEM, TYPE, COD_SOC) VALUES ('HO', '05', 6, 0, 3, '3', '01');
INSERT INTO SHIFT_REG (COD_REG, COD_SHIFT, BASE_H, BASE_M, JOURS_SEM, TYPE, COD_SOC) VALUES ('HO', '05', 6, 0, 4, '3', '01');
INSERT INTO SHIFT_REG (COD_REG, COD_SHIFT, BASE_H, BASE_M, JOURS_SEM, TYPE, COD_SOC) VALUES ('HO', '05', 6, 0, 5, '3', '01');
INSERT INTO SHIFT_REG (COD_REG, COD_SHIFT, BASE_H, BASE_M, JOURS_SEM, TYPE, COD_SOC) VALUES ('HO', '04', 5, 0, 6, '3', '01');
-- Régime CSB: Lun-Ven séance unique, Sam matin
INSERT INTO SHIFT_REG (COD_REG, COD_SHIFT, BASE_H, BASE_M, JOURS_SEM, TYPE, COD_SOC) VALUES ('CSB', '09', 7, 0, 1, '3', '01');
INSERT INTO SHIFT_REG (COD_REG, COD_SHIFT, BASE_H, BASE_M, JOURS_SEM, TYPE, COD_SOC) VALUES ('CSB', '09', 7, 0, 2, '3', '01');
INSERT INTO SHIFT_REG (COD_REG, COD_SHIFT, BASE_H, BASE_M, JOURS_SEM, TYPE, COD_SOC) VALUES ('CSB', '09', 7, 0, 3, '3', '01');
INSERT INTO SHIFT_REG (COD_REG, COD_SHIFT, BASE_H, BASE_M, JOURS_SEM, TYPE, COD_SOC) VALUES ('CSB', '09', 7, 0, 4, '3', '01');
INSERT INTO SHIFT_REG (COD_REG, COD_SHIFT, BASE_H, BASE_M, JOURS_SEM, TYPE, COD_SOC) VALUES ('CSB', '09', 7, 0, 5, '3', '01');
INSERT INTO SHIFT_REG (COD_REG, COD_SHIFT, BASE_H, BASE_M, JOURS_SEM, TYPE, COD_SOC) VALUES ('CSB', '04', 5, 0, 6, '3', '01');

-- ============================================================================
-- 32. CYCLE_POINTAGE: Cycles de pointage spéciaux
-- ADAPTED: Nursing/breastfeeding cycle for health sector
-- ============================================================================
INSERT INTO CYCLE_POINTAGE (DAT_DEBUT, DAT_FIN, LIB_CYCLE) VALUES (TO_DATE('01/01/2026','DD/MM/YYYY'), TO_DATE('31/12/2026','DD/MM/YYYY'), 'Régime allaitement 2026');

-- ============================================================================
-- 33. JUSTIF_MOTIF: Justificatifs requis par motif
-- NEW: Tunisian public health specific justifications
-- ============================================================================
INSERT INTO JUSTIF_MOTIF (COD_JUSTIF, COD_M, OBSERV_JUSTIF, OBSERV_JUSTIF_A) VALUES ('01', '02', 'Certificat médical', 'شهادة طبية');
INSERT INTO JUSTIF_MOTIF (COD_JUSTIF, COD_M, OBSERV_JUSTIF, OBSERV_JUSTIF_A) VALUES ('01', '03', 'Certificat médical spécialisé', 'شهادة طبية مختصة');
INSERT INTO JUSTIF_MOTIF (COD_JUSTIF, COD_M, OBSERV_JUSTIF, OBSERV_JUSTIF_A) VALUES ('02', '03', 'PV du comité médical', 'محضر اللجنة الطبية');
INSERT INTO JUSTIF_MOTIF (COD_JUSTIF, COD_M, OBSERV_JUSTIF, OBSERV_JUSTIF_A) VALUES ('01', '04', 'Certificat de grossesse ou d''accouchement', 'شهادة حمل أو ولادة');
INSERT INTO JUSTIF_MOTIF (COD_JUSTIF, COD_M, OBSERV_JUSTIF, OBSERV_JUSTIF_A) VALUES ('01', '10', 'Extrait de décès', 'مضمون وفاة');
INSERT INTO JUSTIF_MOTIF (COD_JUSTIF, COD_M, OBSERV_JUSTIF, OBSERV_JUSTIF_A) VALUES ('01', '11', 'Extrait de mariage', 'مضمون زواج');
INSERT INTO JUSTIF_MOTIF (COD_JUSTIF, COD_M, OBSERV_JUSTIF, OBSERV_JUSTIF_A) VALUES ('01', '12', 'Extrait de naissance', 'مضمون ولادة');
INSERT INTO JUSTIF_MOTIF (COD_JUSTIF, COD_M, OBSERV_JUSTIF, OBSERV_JUSTIF_A) VALUES ('01', '13', 'Extrait de décès du parent', 'مضمون وفاة الوالد');
INSERT INTO JUSTIF_MOTIF (COD_JUSTIF, COD_M, OBSERV_JUSTIF, OBSERV_JUSTIF_A) VALUES ('01', '15', 'Attestation de hajj', 'شهادة أداء الحج');
INSERT INTO JUSTIF_MOTIF (COD_JUSTIF, COD_M, OBSERV_JUSTIF, OBSERV_JUSTIF_A) VALUES ('01', '17', 'Extrait de décès du conjoint/enfant', 'مضمون وفاة الزوج/الطفل');
INSERT INTO JUSTIF_MOTIF (COD_JUSTIF, COD_M, OBSERV_JUSTIF, OBSERV_JUSTIF_A) VALUES ('01', '25', 'Rapport d''accident de travail', 'تقرير حادث شغل');
INSERT INTO JUSTIF_MOTIF (COD_JUSTIF, COD_M, OBSERV_JUSTIF, OBSERV_JUSTIF_A) VALUES ('02', '25', 'PV de la CNAM', 'محضر الصندوق الوطني للتأمين على المرض');
INSERT INTO JUSTIF_MOTIF (COD_JUSTIF, COD_M, OBSERV_JUSTIF, OBSERV_JUSTIF_A) VALUES ('01', '60', 'Certificat médical de l''enfant', 'شهادة طبية للطفل');

-- ============================================================================
-- 34. PLAF_MOTIF_CNG: Plafonds maladie par statut et ancienneté
-- ADAPTED: Tunisian public sector sick leave ceilings
-- Titulaire: 0-5 ans: 3m PT + 3m DT | 5-10: 6m PT + 6m DT | 10+: 12m PT + 12m DT
-- Contractuel: limité à 1 mois PT par année de service
-- ============================================================================
-- Congé maladie ordinaire (02) - Titulaire (T)
INSERT INTO PLAF_MOTIF_CNG (COD_M, COD_AFFECT, ANCIEN_MIN, ANCIEN_MAX, PLAF_PT, PLAF_T50, PLAF_T100, UNIT_PLAF) VALUES ('02', 'T', 0, 60, 90, 90, NULL, 'C');
INSERT INTO PLAF_MOTIF_CNG (COD_M, COD_AFFECT, ANCIEN_MIN, ANCIEN_MAX, PLAF_PT, PLAF_T50, PLAF_T100, UNIT_PLAF) VALUES ('02', 'T', 61, 120, 180, 180, NULL, 'C');
INSERT INTO PLAF_MOTIF_CNG (COD_M, COD_AFFECT, ANCIEN_MIN, ANCIEN_MAX, PLAF_PT, PLAF_T50, PLAF_T100, UNIT_PLAF) VALUES ('02', 'T', 121, 9999, 365, 365, NULL, 'C');
-- Congé maladie ordinaire (02) - Contractuel (C)
INSERT INTO PLAF_MOTIF_CNG (COD_M, COD_AFFECT, ANCIEN_MIN, ANCIEN_MAX, PLAF_PT, PLAF_T50, PLAF_T100, UNIT_PLAF) VALUES ('02', 'C', 0, 9999, 30, NULL, NULL, 'A');
-- Congé maladie longue durée (03) - Titulaire
INSERT INTO PLAF_MOTIF_CNG (COD_M, COD_AFFECT, ANCIEN_MIN, ANCIEN_MAX, PLAF_PT, PLAF_T50, PLAF_T100, UNIT_PLAF) VALUES ('03', 'T', 0, 60, 365, 365, 365, 'C');
INSERT INTO PLAF_MOTIF_CNG (COD_M, COD_AFFECT, ANCIEN_MIN, ANCIEN_MAX, PLAF_PT, PLAF_T50, PLAF_T100, UNIT_PLAF) VALUES ('03', 'T', 61, 9999, 730, 730, 365, 'C');

COMMIT;

-- ============================================================================
-- END OF REFERENCE DATA
-- ============================================================================
