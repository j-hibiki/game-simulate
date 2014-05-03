=begin


ダメージ計算がまだちゃんとしてない。
相手が技を選ぶアルゴリズムができてない。

ダメージ計算式
（（攻撃側のレベル × 2 ÷ 5 ＋ 2）× 技の威力 × 攻撃側の能力値 ÷
 防御側の能力値 ÷ 50 ＋ 2）×（85～100）÷ 100 
 
■つばさでうつ
物理
飛行
60/100
 
■エアスラッシュ
特殊
飛行
75/95
3割ひるみ

--所持ポケモン--
カモネギLv100（6Vで努力値無振り）
1つばさでうつ,2エアスラッシュ,3リーフブレード,4ねっぷう

--シゲルのポケモン--
ピジョットLv61（6Vで努力値無振り）
つばさでうつ	ふきとばし　	オウムがえし	ゴッドバード

サイドンLv61（6Vで努力値無振り）
しっぽをふる	つのドリル	　にらみつける	みだれづき

ナッシーLv63（6Vで努力値無振り）
さいみんじゅつ	ふみつけ	たまなげ

ウインディLv61	（6Vで努力値無振り）
ほえる	ひのこ	にらみつける	とっしん

フーディンLv59（6Vで努力値無振り）
サイケこうせん	じこさいせい	サイコキネシス	リフレクター

カメックスLv65（6Vで努力値無振り）
かみつく	からにこもる	ハイドロポンプ	ふぶき

=end

#ポケモンのステータス配列
#0名前,1レベル,2HP,3攻撃,4防御,5特攻,6特防,7素早さ
Kamonegi = ["カモネギ",100,245,166,146,152,160,156]
Pijotto = ["ピジョット",61,191,121,115,109,109,147]
Saidon  = ["サイドン", 61,218,182,170,78,78,72]
Nassi   = ["ナッシー",63,212,144,131,182,106,93]
Uindi   = ["ウインディ",61,199,158,121,145,121,139]
Fudin   = ["フーディン",59,152,82,76,182,135,164]
Kamex   = ["カメックス",65,197,133,155,135,161,126]

#技の配列
#0名前,1威力,2命中,3タイプ
#カモネギの技
Tsubasa = ["つばさでうつ",60,100,"ひこう"]
Easura  = ["エアスラッシュ",75,95,"ひこう"]
LeafBlade = ["リーフブレード",90,100,"くさ"]
Neppuu = ["ねっぷう",95,90,"ほのお"]

#ピジョットの技
Tsubasa2 = ["つばさでうつ",60,100,"ひこう"]
Fuki = ["ふきとばし",0,0,"ひこう"]
Oumu = ["オウムがえし",0,0,"ひこう"]
Godbird = ["ゴッドバード",140,90,"ひこう"]

#サイドンの技
Shippo = ["しっぽをふる",0,0,"ノーマル"]
Tsuno = ["つのドリル",0,0,"ノーマル"]
Nirami = ["にらみつける",0,0,"ノーマル"]
Midare = ["みだれづき",15,85,"ノーマル"]

#ウインディの技
Hoeru = ["ほえる",0,0,"ノーマル"]
Hinoko = ["ひのこ",40,100,"ほのお"]
Nirami2 = ["にらみつける",0,0,"ノーマル"]
Toshin = ["とっしん",90,85,"ノーマル"]

#ナッシーの技
Toshin
Fumi = ["ふみつけ",65,100,"ノーマル"]
Tama = ["たまなげ",15,85,"ノーマル"]
Saimin = ["さいみんじゅつ",0,0,"エスパー"]

#フーディンの技
Saiko = ["サイコキネシス",90,100,"エスパー"]
Saike = ["サイケこうせん",65,100,"エスパー"]
Jiko = ["じこさいせい",0,0,"エスパー"]
Rifu = ["リフレクター",0,0,"エスパー"]

#カメックスの技
Haidoro = ["ハイドロポンプ",120,75,"みず"]
Kamitsuku = ["かみつく",60,100,"あく"]
Fubuki = ["ふぶき",120,70,"ふぶき"]
Karani = ["からにこもる",0,0,"みず"]

#HPを格納する
kamonegiH = Kamonegi[2]
pijottoH = Pijotto[2]
saidonH = Saidon[2]
nassiH = Nassi[2]
uindiH = Uindi[2]
fudinH = Fudin[2]
kamexH = Kamex[2]

#戦闘開始
print("チャンピオンのシゲルが勝負をしかけてきた。\n")
print("チャンピオンのシゲルは",Pijotto[0],"を繰り出した。\n")
print("行け！",Kamonegi[0],"\n")

########################################1戦目　ピジョット##########################################
while pijottoH > 0 do
	
	#お互いのHPを表示
	print(Pijotto[0],"のHP:" ,pijottoH," ")
	print(Kamonegi[0],"のHP:" ,kamonegiH," \n")
	
	#選択した技をmyAttackに格納
	print("▷たたかう\n")
	print("1つばさでうつ,2エアスラッシュ,3リーフブレード,4ねっぷう,5すごいきずぐすり,6なんでもなおし")
	myAttack = gets.to_i
	
	if(myAttack == 1)#つばさでうつ
		typeComp1 = 1	#ひこう→ノーマル
		typeComp2 = 1	#ひこう→ひこう
		typeMach1 = 1.5	#ひこう=ひこう
		typeMach2 = 1	#ひこう≠ノーマル
		damage = ((Kamonegi[1] * 2 / 5 + 2) * Tsubasa[1] * Kamonegi[4] / Pijotto[5] / 50 + 2) * (85+rand(16)) / 100 * typeComp1 * typeComp2 * typeMach1 * typeMach2
		damage = damage.floor
		waza = Tsubasa[0]
		
	elsif(myAttack == 2)#エアスラッシュ
		typeComp1 = 1	#ひこう→ノーマル
		typeComp2 = 1	#ひこう→ひこう
		typeMach1 = 1.5	#ひこう=ひこう
		typeMach2 = 1	#ひこう≠ノーマル
		damage = ((Kamonegi[1] * 2 / 5 + 2) * Easura[1] * Kamonegi[6] / Pijotto[7] / 50 + 2) * (85+rand(16)) / 100 * typeComp1 * typeComp2 * typeMach1 * typeMach2
		damage = damage.floor
		waza = Easura[0]
		
	elsif(myAttack == 3)#リーフブレード
		typeComp1 = 1	#くさ→ノーマル
		typeComp2 = 0.5	#くさ→ひこう
		typeMach1 = 1	#くさ≠ひこう
		typeMach2 = 1	#くさ≠ノーマル
		damage = ((Kamonegi[1] * 2 / 5 + 2) * LeafBlade[1] * Kamonegi[4] / Pijotto[5] / 50 + 2) * (85+rand(16)) / 100 * typeComp1 * typeComp2 * typeMach1 * typeMach2
		damage = damage.floor
		waza = LeafBlade[0]
		
	elsif(myAttack == 4)#ねっぷう
		typeComp1 = 1	#ほのお→ノーマル
		typeComp2 = 1	#ほのお→ひこう
		typeMach1 = 1	#ほのお≠ひこう
		typeMach2 = 1	#ほのお≠ノーマル
		damage = ((Kamonegi[1] * 2 / 5 + 2) * Neppuu[1] * Kamonegi[6] / Pijotto[7] / 50 + 2) * (85+rand(16)) / 100 * typeComp1 * typeComp2 * typeMach1 * typeMach2
		damage = damage.floor
		waza = Neppuu[0]
		
	end
		print(Kamonegi[0],"の",waza,"！",Pijotto[0],"に",damage,"のダメージ\n")
		pijottoH -= damage
		
	
	#ここからピジョットの攻撃
	
	opAttack = rand(4)+1
	
	if(opAttack == 1)#つばさでうつ
		typeComp1 = 1	#ひこう→ノーマル
		typeComp2 = 1	#ひこう→ひこう
		typeMach1 = 1.5	#ひこう=ひこう
		typeMach2 = 1	#ひこう≠ノーマル
		damage = ((Pijotto[1] * 2 / 5 + 2) * Tsubasa2[1] * Pijotto[4] / Kamonegi[5] / 50 + 2) * (85+rand(16)) / 100 * typeComp1 * typeComp2 * typeMach1 * typeMach2
		damage = damage.floor
		waza = Tsubasa2[0]
		
	elsif(opAttack == 2)#ふきとばし
		typeComp1 = 1	#ひこう→ノーマル
		typeComp2 = 1	#ひこう→ひこう
		typeMach1 = 1.5	#ひこう=ひこう
		typeMach2 = 1	#ひこう≠ノーマル
		damage = ((Pijotto[1] * 2 / 5 + 2) * Fuki[1] * Pijotto[6] / Kamonegi[7] / 50 + 2) * (85+rand(16)) / 100 * typeComp1 * typeComp2 * typeMach1 * typeMach2
		damage = damage.floor
		waza = Fuki[0]
		
	elsif(opAttack == 3)#オウムがえし
		typeComp1 = 1	#ひこう→ノーマル
		typeComp2 = 1	#ひこう→ひこう
		typeMach1 = 1.5	#ひこう=ひこう
		typeMach2 = 1	#ひこう≠ノーマル
		damage = ((Pijotto[1] * 2 / 5 + 2) * Oumu[1] * Pijotto[4] / Kamonegi[5] / 50 + 2) * (85+rand(16)) / 100 * typeComp1 * typeComp2 * typeMach1 * typeMach2
		damage = damage.floor
		waza = Oumu[0]
		
	elsif(opAttack == 4)#ゴッドバード
		typeComp1 = 1	#ひこう→ノーマル
		typeComp2 = 1	#ひこう→ひこう
		typeMach1 = 1.5	#ひこう=ひこう
		typeMach2 = 1	#ひこう≠ノーマル
		damage = ((Pijotto[1] * 2 / 5 + 2) * Godbird[1] * Pijotto[4] / Kamonegi[5] / 50 + 2) * (85+rand(16)) / 100 * typeComp1 * typeComp2 * typeMach1 * typeMach2
		damage = damage.floor
		waza = Godbird[0]
		
	end
		print(Pijotto[0],"の",waza,"！",Kamonegi[0],"に",damage,"のダメージ\n")
		kamonegiH -= damage

end

print(Pijotto[0],"を倒した\n\n")



################################2戦目サイドン####################################
print("チャンピオンのシゲルは",Saidon[0],"を繰り出した。\n\n")

while saidonH > 0 do
	
	#お互いのHPを表示
	print(Saidon[0],"のHP:" ,saidonH," ")
	print(Kamonegi[0],"のHP:" ,kamonegiH," \n")
	
	#選択した技をmyAttackに格納
	print("▷たたかう\n")
	print("1つばさでうつ,2エアスラッシュ,3リーフブレード,4ねっぷう,5すごいきずぐすり,6なんでもなおし")
	myAttack = gets.to_i
	
	if(myAttack == 1)#つばさでうつ
		typeComp1 = 0.5	#ひこう→いわ
		typeComp2 = 1	#ひこう→じめん
		typeMach1 = 1.5	#ひこう:ひこう
		typeMach2 = 1	#ひこう:ノーマル
		damage = ((Kamonegi[1] * 2 / 5 + 2) * Tsubasa[1] * Kamonegi[4] / Saidon[5] / 50 + 2) * (85+rand(16)) / 100 * typeComp1 * typeComp2 * typeMach1 * typeMach2
		damage = damage.floor
		waza = Tsubasa[0]
		
	elsif(myAttack == 2)#エアスラッシュ
		typeComp1 = 0.5	#ひこう→いわ
		typeComp2 = 1	#ひこう→じめん
		typeMach1 = 1.5	#ひこう:ひこう
		typeMach2 = 1	#ひこう:ノーマル
		damage = ((Kamonegi[1] * 2 / 5 + 2) * Easura[1] * Kamonegi[6] / Saidon[7] / 50 + 2) * (85+rand(16)) / 100 * typeComp1 * typeComp2 * typeMach1 * typeMach2
		damage = damage.floor
		waza = Easura[0]
		
	elsif(myAttack == 3)#リーフブレード
		typeComp1 = 2	#くさ→いわ
		typeComp2 = 2	#くさ→じめん
		typeMach1 = 1	#くさ:ひこう
		typeMach2 = 1	#くさ:ノーマル
		damage = ((Kamonegi[1] * 2 / 5 + 2) * LeafBlade[1] * Kamonegi[4] / Saidon[5] / 50 + 2) * (85+rand(16)) / 100 * typeComp1 * typeComp2 * typeMach1 * typeMach2
		damage = damage.floor
		waza = LeafBlade[0]
		
	elsif(myAttack == 4)#ねっぷう
		typeComp1 = 0.5	#ほのお→いわ
		typeComp2 = 1	#ほのお→じめん
		typeMach1 = 1	#ほのお:ひこう
		typeMach2 = 1	#ほのお:ノーマル
		damage = ((Kamonegi[1] * 2 / 5 + 2) * Neppuu[1] * Kamonegi[6] / Saidon[7] / 50 + 2) * (85+rand(16)) / 100 * typeComp1 * typeComp2 * typeMach1 * typeMach2
		damage = damage.floor
		waza = Neppuu[0]
		
	end
		print(Kamonegi[0],"の",waza,"！",Saidon[0],"に",damage,"のダメージ\n")
		saidonH -= damage
		
	
	#ここからサイドンの攻撃
	
	opAttack = rand(4)+1
	
	if(opAttack == 1)#しっぽをふる
		typeComp1 = 1	#ノーマル→ノーマル
		typeComp2 = 1	#ノーマル→ひこう
		typeMach1 = 1	#ノーマル:いわ
		typeMach2 = 1	#ノーマル:じめん
		damage = ((Saidon[1] * 2 / 5 + 2) * Tsubasa2[1] * Saidon[4] / Kamonegi[5] / 50 + 2) * (85+rand(16)) / 100 * typeComp1 * typeComp2 * typeMach1 * typeMach2
		damage = damage.floor
		waza = Shippo[0]
		
	elsif(opAttack == 2)#にらみつける
		typeComp1 = 1	#ノーマル→ノーマル
		typeComp2 = 1	#ノーマル→ひこう
		typeMach1 = 1	#ノーマル:いわ
		typeMach2 = 1	#ノーマル:じめん
		damage = ((Saidon[1] * 2 / 5 + 2) * Fuki[1] * Saidon[6] / Kamonegi[7] / 50 + 2) * (85+rand(16)) / 100 * typeComp1 * typeComp2 * typeMach1 * typeMach2
		damage = damage.floor
		waza = Nirami[0]
		
	elsif(opAttack == 3)#つのドリル
		typeComp1 = 1	#ノーマル→ノーマル
		typeComp2 = 1	#ノーマル→ひこう
		typeMach1 = 1	#ノーマル:いわ
		typeMach2 = 1	#ノーマル:じめん
		damage = ((Saidon[1] * 2 / 5 + 2) * Oumu[1] * Saidon[4] / Kamonegi[5] / 50 + 2) * (85+rand(16)) / 100 * typeComp1 * typeComp2 * typeMach1 * typeMach2
		damage = damage.floor
		waza = Tsuno[0]
		
	elsif(opAttack == 4)#みだれづき
		typeComp1 = 1	#ノーマル→ノーマル
		typeComp2 = 1	#ノーマル→ひこう
		typeMach1 = 1	#ノーマル:いわ
		typeMach2 = 1	#ノーマル:じめん
		damage = ((Saidon[1] * 2 / 5 + 2) * Godbird[1] * Saidon[4] / Kamonegi[5] / 50 + 2) * (85+rand(16)) / 100 * typeComp1 * typeComp2 * typeMach1 * typeMach2
		damage = damage.floor
		waza = Midare[0]
		
	end
		print(Saidon[0],"の",waza,"！",Kamonegi[0],"に",damage,"のダメージ\n")
		kamonegiH -= damage

end

print(Saidon[0],"を倒した\n\n")

########################################3戦目　ナッシー##########################################
print("チャンピオンのシゲルは",Nassi[0],"を繰り出した。\n\n")

while nassiH > 0 do
	
	#お互いのHPを表示
	print(Nassi[0],"のHP:" ,nassiH," ")
	print(Kamonegi[0],"のHP:" ,kamonegiH," \n")
	
	#選択した技をmyAttackに格納
	print("▷たたかう\n")
	print("1つばさでうつ,2エアスラッシュ,3リーフブレード,4ねっぷう,5すごいきずぐすり,6なんでもなおし")
	myAttack = gets.to_i
	
	if(myAttack == 1)#つばさでうつ
		typeComp1 = 2	#ひこう→くさ
		typeComp2 = 1	#ひこう→エスパー
		typeMach1 = 1.5	#ひこう:ひこう
		typeMach2 = 1	#ひこう:ノーマル
		damage = ((Kamonegi[1] * 2 / 5 + 2) * Tsubasa[1] * Kamonegi[4] / Nassi[5] / 50 + 2) * (85+rand(16)) / 100 * typeComp1 * typeComp2 * typeMach1 * typeMach2
		damage = damage.floor
		waza = Tsubasa[0]
		
	elsif(myAttack == 2)#エアスラッシュ
		typeComp1 = 2	#ひこう→くさ
		typeComp2 = 1	#ひこう→エスパー
		typeMach1 = 1.5	#ひこう:ひこう
		typeMach2 = 1	#ひこう:ノーマル
		damage = ((Kamonegi[1] * 2 / 5 + 2) * Easura[1] * Kamonegi[6] / Nassi[7] / 50 + 2) * (85+rand(16)) / 100 * typeComp1 * typeComp2 * typeMach1 * typeMach2
		damage = damage.floor
		waza = Easura[0]
		
	elsif(myAttack == 3)#リーフブレード
		typeComp1 = 0.5	#くさ→くさ
		typeComp2 = 1	#くさ→エスパー
		typeMach1 = 1	#くさ:ひこう
		typeMach2 = 1	#くさ:ノーマル
		damage = ((Kamonegi[1] * 2 / 5 + 2) * LeafBlade[1] * Kamonegi[4] / Nassi[5] / 50 + 2) * (85+rand(16)) / 100 * typeComp1 * typeComp2 * typeMach1 * typeMach2
		damage = damage.floor
		waza = LeafBlade[0]
		
	elsif(myAttack == 4)#ねっぷう
		typeComp1 = 2	#ほのお→くさ
		typeComp2 = 1	#ほのお→エスパー
		typeMach1 = 1	#ほのお:ひこう
		typeMach2 = 1	#ほのお:ノーマル
		damage = ((Kamonegi[1] * 2 / 5 + 2) * Neppuu[1] * Kamonegi[6] / Nassi[7] / 50 + 2) * (85+rand(16)) / 100 * typeComp1 * typeComp2 * typeMach1 * typeMach2
		damage = damage.floor
		waza = Neppuu[0]
		
	end
		print(Kamonegi[0],"の",waza,"！",Nassi[0],"に",damage,"のダメージ\n")
		nassiH -= damage
		
	
	#ここからナッシーの攻撃
	
	opAttack = rand(3)+1
	
	if(opAttack == 1)#ふみつけ
		typeComp1 = 1	#ノーマル→ノーマル
		typeComp2 = 1	#ノーマル→ひこう
		typeMach1 = 1	#ノーマル:くさ
		typeMach2 = 1	#ノーマル:エスパー
		damage = ((Nassi[1] * 2 / 5 + 2) * Fumi[1] * Nassi[4] / Kamonegi[5] / 50 + 2) * (85+rand(16)) / 100 * typeComp1 * typeComp2 * typeMach1 * typeMach2
		damage = damage.floor
		waza = Fumi[0]
		
	elsif(opAttack == 2)#たまなげ
		typeComp1 = 1	#ノーマル→ノーマル
		typeComp2 = 1	#ノーマル→ひこう
		typeMach1 = 1	#ノーマル:くさ
		typeMach2 = 1	#ノーマル:エスパー
		damage = ((Nassi[1] * 2 / 5 + 2) * Tama[1] * Nassi[6] / Kamonegi[7] / 50 + 2) * (85+rand(16)) / 100 * typeComp1 * typeComp2 * typeMach1 * typeMach2
		damage = damage.floor
		waza = Tama[0]
		
	elsif(opAttack == 3)#さいみんじゅつ
		typeComp1 = 1	#エスパー→ノーマル
		typeComp2 = 1	#エスパー→ひこう
		typeMach1 = 1	#エスパー:くさ
		typeMach2 = 1	#エスパー:エスパー
		damage = ((Nassi[1] * 2 / 5 + 2) * Saimin[1] * Nassi[4] / Kamonegi[5] / 50 + 2) * (85+rand(16)) / 100 * typeComp1 * typeComp2 * typeMach1 * typeMach2
		damage = damage.floor
		waza = Saimin[0]
		
	end
		print(Nassi[0],"の",waza,"！",Kamonegi[0],"に",damage,"のダメージ\n")
		nassiH -= damage

end

print(Nassi[0],"を倒した\n\n")

#ここから作ってない。一戦目をコピーして変数名を直すだけで完成。多分1時間前後だと思う。

########################################4戦目　ウインディ##########################################
print("チャンピオンのシゲルは",Uindi[0],"を繰り出した。\n\n")

while uindiH > 0 do
	
	#お互いのHPを表示
	print(Uindi[0],"のHP:" ,uindiH," ")
	print(Kamonegi[0],"のHP:" ,kamonegiH," \n")
	
	#選択した技をmyAttackに格納
	print("▷たたかう\n")
	print("1つばさでうつ,2エアスラッシュ,3リーフブレード,4ねっぷう,5すごいきずぐすり,6なんでもなおし")
	myAttack = gets.to_i
	
	if(myAttack == 1)#つばさでうつ
		typeComp1 = 1	#ひこう→ほのお
		typeComp2 = 1	#ひこう→なし
		typeMach1 = 1.5	#ひこう:ひこう
		typeMach2 = 1	#ひこう:ノーマル
		damage = ((Kamonegi[1] * 2 / 5 + 2) * Tsubasa[1] * Kamonegi[4] / Uindi[5] / 50 + 2) * (85+rand(16)) / 100 * typeComp1 * typeComp2 * typeMach1 * typeMach2
		damage = damage.floor
		waza = Tsubasa[0]
		
	elsif(myAttack == 2)#エアスラッシュ
		typeComp1 = 1	#ひこう→ほのお
		typeComp2 = 1	#ひこう→なし
		typeMach1 = 1.5	#ひこう:ひこう
		typeMach2 = 1	#ひこう:ノーマル
		damage = ((Kamonegi[1] * 2 / 5 + 2) * Easura[1] * Kamonegi[6] / Uindi[7] / 50 + 2) * (85+rand(16)) / 100 * typeComp1 * typeComp2 * typeMach1 * typeMach2
		damage = damage.floor
		waza = Easura[0]
		
	elsif(myAttack == 3)#リーフブレード
		typeComp1 = 0.5	#くさ→ほのお
		typeComp2 = 1	#くさ→なし
		typeMach1 = 1	#くさ:ひこう
		typeMach2 = 1	#くさ:ノーマル
		damage = ((Kamonegi[1] * 2 / 5 + 2) * LeafBlade[1] * Kamonegi[4] / Uindi[5] / 50 + 2) * (85+rand(16)) / 100 * typeComp1 * typeComp2 * typeMach1 * typeMach2
		damage = damage.floor
		waza = LeafBlade[0]
		
	elsif(myAttack == 4)#ねっぷう
		typeComp1 = 0.5	#ほのお→ほのお
		typeComp2 = 1	#ほのお→なし
		typeMach1 = 1	#ほのお:ひこう
		typeMach2 = 1	#ほのお:ノーマル
		damage = ((Kamonegi[1] * 2 / 5 + 2) * Neppuu[1] * Kamonegi[6] / Uindi[7] / 50 + 2) * (85+rand(16)) / 100 * typeComp1 * typeComp2 * typeMach1 * typeMach2
		damage = damage.floor
		waza = Neppuu[0]
		
	end
		print(Kamonegi[0],"の",waza,"！",Uindi[0],"に",damage,"のダメージ\n")
		uindiH -= damage
		
	
	#ここからウインディの攻撃
	
	opAttack = rand(3)+1
	
	if(opAttack == 1)#ほえる
		typeComp1 = 1	#ノーマル→ノーマル
		typeComp2 = 1	#ノーマル→ひこう
		typeMach1 = 1	#ノーマル:ほのお
		typeMach2 = 1	#ノーマル:なし
		damage = ((Uindi[1] * 2 / 5 + 2) * Hoeru[1] * Uindi[4] / Kamonegi[5] / 50 + 2) * (85+rand(16)) / 100 * typeComp1 * typeComp2 * typeMach1 * typeMach2
		damage = damage.floor
		waza = Hoeru[0]
		
	elsif(opAttack == 2)#ひのこ
		typeComp1 = 1	#ほのお→ノーマル
		typeComp2 = 1	#ほのお→ひこう
		typeMach1 = 1.5	#ほのお:ほのお
		typeMach2 = 1	#ほのお:なし
		damage = ((Uindi[1] * 2 / 5 + 2) * Hinoko[1] * Uindi[6] / Kamonegi[7] / 50 + 2) * (85+rand(16)) / 100 * typeComp1 * typeComp2 * typeMach1 * typeMach2
		damage = damage.floor
		waza = Hinoko[0]
		
	elsif(opAttack == 3)#にらみつける
		typeComp1 = 1	#ノーマル→ノーマル
		typeComp2 = 1	#ノーマル→ひこう
		typeMach1 = 1	#ノーマル:ほのお
		typeMach2 = 1	#ノーマル:なし
		damage = ((Uindi[1] * 2 / 5 + 2) * Nirami[1] * Uindi[4] / Kamonegi[5] / 50 + 2) * (85+rand(16)) / 100 * typeComp1 * typeComp2 * typeMach1 * typeMach2
		damage = damage.floor
		waza = Nirami[0]
		
	elsif(opAttack == 4)#とっしん
		typeComp1 = 1	#ノーマル→ノーマル
		typeComp2 = 1	#ノーマル→ひこう
		typeMach1 = 1	#ノーマル:ほのお
		typeMach2 = 1	#ノーマル:なし
		damage = ((Uindi[1] * 2 / 5 + 2) * Toshin[1] * Uindi[4] / Kamonegi[5] / 50 + 2) * (85+rand(16)) / 100 * typeComp1 * typeComp2 * typeMach1 * typeMach2
		damage = damage.floor
		waza = Toshin[0]
		
	end
		print(Uindi[0],"の",waza,"！",Kamonegi[0],"に",damage,"のダメージ\n")
		uindiH -= damage

end

print(Uindi[0],"を倒した\n\n")

########################################5戦目　フーディン##########################################
print("チャンピオンのシゲルは",Fudin[0],"を繰り出した。\n\n")

while fudinH > 0 do
	
	#お互いのHPを表示
	print(Fudin[0],"のHP:" ,fudinH," ")
	print(Kamonegi[0],"のHP:" ,kamonegiH," \n")
	
	#選択した技をmyAttackに格納
	print("▷たたかう\n")
	print("1つばさでうつ,2エアスラッシュ,3リーフブレード,4ねっぷう,5すごいきずぐすり,6なんでもなおし")
	myAttack = gets.to_i
	
	if(myAttack == 1)#つばさでうつ
		typeComp1 = 1	#ひこう→エスパー
		typeComp2 = 1	#ひこう→なし
		typeMach1 = 1.5	#ひこう:ひこう
		typeMach2 = 1	#ひこう:ノーマル
		damage = ((Kamonegi[1] * 2 / 5 + 2) * Tsubasa[1] * Kamonegi[4] / Fudin[5] / 50 + 2) * (85+rand(16)) / 100 * typeComp1 * typeComp2 * typeMach1 * typeMach2
		damage = damage.floor
		waza = Tsubasa[0]
		
	elsif(myAttack == 2)#エアスラッシュ
		typeComp1 = 1	#ひこう→エスパー
		typeComp2 = 1	#ひこう→なし
		typeMach1 = 1.5	#ひこう:ひこう
		typeMach2 = 1	#ひこう:ノーマル
		damage = ((Kamonegi[1] * 2 / 5 + 2) * Easura[1] * Kamonegi[6] / Fudin[7] / 50 + 2) * (85+rand(16)) / 100 * typeComp1 * typeComp2 * typeMach1 * typeMach2
		damage = damage.floor
		waza = Easura[0]
		
	elsif(myAttack == 3)#リーフブレード
		typeComp1 = 1	#くさ→エスパー
		typeComp2 = 1	#くさ→なし
		typeMach1 = 1	#くさ:ひこう
		typeMach2 = 1	#くさ:ノーマル
		damage = ((Kamonegi[1] * 2 / 5 + 2) * LeafBlade[1] * Kamonegi[4] / Fudin[5] / 50 + 2) * (85+rand(16)) / 100 * typeComp1 * typeComp2 * typeMach1 * typeMach2
		damage = damage.floor
		waza = LeafBlade[0]
		
	elsif(myAttack == 4)#ねっぷう
		typeComp1 = 1	#ほのお→エスパー
		typeComp2 = 1	#ほのお→なし
		typeMach1 = 1	#ほのお:ひこう
		typeMach2 = 1	#ほのお:ノーマル
		damage = ((Kamonegi[1] * 2 / 5 + 2) * Neppuu[1] * Kamonegi[6] / Fudin[7] / 50 + 2) * (85+rand(16)) / 100 * typeComp1 * typeComp2 * typeMach1 * typeMach2
		damage = damage.floor
		waza = Neppuu[0]
		
	end
		print(Kamonegi[0],"の",waza,"！",Fudin[0],"に",damage,"のダメージ\n")
		fudinH -= damage
		
	
	#ここからフーディンの攻撃
	
	opAttack = rand(3)+1
	
	if(opAttack == 1)#サイコキネシス
		typeComp1 = 1	#エスパー→ノーマル
		typeComp2 = 1	#エスパー→ひこう
		typeMach1 = 1.5	#エスパー:エスパー
		typeMach2 = 1	#エスパー:なし
		damage = ((Fudin[1] * 2 / 5 + 2) * Saiko[1] * Fudin[4] / Kamonegi[5] / 50 + 2) * (85+rand(16)) / 100 * typeComp1 * typeComp2 * typeMach1 * typeMach2
		damage = damage.floor
		waza = Saiko[0]
		
	elsif(opAttack == 2)#サイケこうせん
		typeComp1 = 1	#エスパー→ノーマル
		typeComp2 = 1	#エスパー→ひこう
		typeMach1 = 1.5	#エスパー:エスパー
		typeMach2 = 1	#エスパー:なし
		damage = ((Fudin[1] * 2 / 5 + 2) * Saike[1] * Fudin[6] / Kamonegi[7] / 50 + 2) * (85+rand(16)) / 100 * typeComp1 * typeComp2 * typeMach1 * typeMach2
		damage = damage.floor
		waza = Saike[0]
		
	elsif(opAttack == 3)#じこさいせい
		typeComp1 = 1	#エスパー→ノーマル
		typeComp2 = 1	#エスパー→ひこう
		typeMach1 = 1.5	#エスパー:エスパー
		typeMach2 = 1	#エスパー:なし
		damage = ((Fudin[1] * 2 / 5 + 2) * Jiko[1] * Fudin[4] / Kamonegi[5] / 50 + 2) * (85+rand(16)) / 100 * typeComp1 * typeComp2 * typeMach1 * typeMach2
		damage = damage.floor
		waza = Jiko[0]
		
	elsif(opAttack == 4)#リフレクター
		typeComp1 = 1	#ノーマル→ノーマル
		typeComp2 = 1	#ノーマル→ひこう
		typeMach1 = 1	#ノーマル:エスパー
		typeMach2 = 1	#ノーマル:なし
		damage = ((Fudin[1] * 2 / 5 + 2) * Rifu[1] * Fudin[4] / Kamonegi[5] / 50 + 2) * (85+rand(16)) / 100 * typeComp1 * typeComp2 * typeMach1 * typeMach2
		damage = damage.floor
		waza = Rifu[0]
		
	end
		print(Fudin[0],"の",waza,"！",Kamonegi[0],"に",damage,"のダメージ\n")
		kamonegiH -= damage

end

print(Fudin[0],"を倒した\n\n")

########################################6戦目　カメックス##########################################
print("チャンピオンのシゲルは",Kamex[0],"を繰り出した。\n\n")

while kamexH > 0 do
	
	#お互いのHPを表示
	print(Kamex[0],"のHP:" ,kamexH," ")
	print(Kamonegi[0],"のHP:" ,kamonegiH," \n")
	
	#選択した技をmyAttackに格納
	print("▷たたかう\n")
	print("1つばさでうつ,2エアスラッシュ,3リーフブレード,4ねっぷう,5すごいきずぐすり,6なんでもなおし")
	myAttack = gets.to_i
	
	if(myAttack == 1)#つばさでうつ
		typeComp1 = 1	#ひこう→エスパー
		typeComp2 = 1	#ひこう→なし
		typeMach1 = 1.5	#ひこう:ひこう
		typeMach2 = 1	#ひこう:ノーマル
		damage = ((Kamonegi[1] * 2 / 5 + 2) * Tsubasa[1] * Kamonegi[4] / Kamex[5] / 50 + 2) * (85+rand(16)) / 100 * typeComp1 * typeComp2 * typeMach1 * typeMach2
		damage = damage.floor
		waza = Tsubasa[0]
		
	elsif(myAttack == 2)#エアスラッシュ
		typeComp1 = 1	#ひこう→エスパー
		typeComp2 = 1	#ひこう→なし
		typeMach1 = 1.5	#ひこう:ひこう
		typeMach2 = 1	#ひこう:ノーマル
		damage = ((Kamonegi[1] * 2 / 5 + 2) * Easura[1] * Kamonegi[6] / Kamex[7] / 50 + 2) * (85+rand(16)) / 100 * typeComp1 * typeComp2 * typeMach1 * typeMach2
		damage = damage.floor
		waza = Easura[0]
		
	elsif(myAttack == 3)#リーフブレード
		typeComp1 = 1	#くさ→エスパー
		typeComp2 = 1	#くさ→なし
		typeMach1 = 1	#くさ:ひこう
		typeMach2 = 1	#くさ:ノーマル
		damage = ((Kamonegi[1] * 2 / 5 + 2) * LeafBlade[1] * Kamonegi[4] / Kamex[5] / 50 + 2) * (85+rand(16)) / 100 * typeComp1 * typeComp2 * typeMach1 * typeMach2
		damage = damage.floor
		waza = LeafBlade[0]
		
	elsif(myAttack == 4)#ねっぷう
		typeComp1 = 1	#ほのお→エスパー
		typeComp2 = 1	#ほのお→なし
		typeMach1 = 1	#ほのお:ひこう
		typeMach2 = 1	#ほのお:ノーマル
		damage = ((Kamonegi[1] * 2 / 5 + 2) * Neppuu[1] * Kamonegi[6] / Kamex[7] / 50 + 2) * (85+rand(16)) / 100 * typeComp1 * typeComp2 * typeMach1 * typeMach2
		damage = damage.floor
		waza = Neppuu[0]
		
	end
		print(Kamonegi[0],"の",waza,"！",Kamex[0],"に",damage,"のダメージ\n")
		kamexH -= damage
		
	
	#ここからカメックスの攻撃
	
	opAttack = rand(3)+1
	
	if(opAttack == 1)#ハイドロポンプ
		typeComp1 = 1	#みず→ノーマル
		typeComp2 = 1	#みず→ひこう
		typeMach1 = 1.5	#みず:みず
		typeMach2 = 1	#みず:なし
		damage = ((Kamex[1] * 2 / 5 + 2) * Saiko[1] * Kamex[4] / Kamonegi[5] / 50 + 2) * (85+rand(16)) / 100 * typeComp1 * typeComp2 * typeMach1 * typeMach2
		damage = damage.floor
		waza = Haidoro[0]
		
	elsif(opAttack == 2)#かみつく
		typeComp1 = 1	#あく→ノーマル
		typeComp2 = 1	#あく→ひこう
		typeMach1 = 1	#あく:みず
		typeMach2 = 1	#あく:なし
		damage = ((Kamex[1] * 2 / 5 + 2) * Kamitsuku[1] * Kamex[6] / Kamonegi[7] / 50 + 2) * (85+rand(16)) / 100 * typeComp1 * typeComp2 * typeMach1 * typeMach2
		damage = damage.floor
		waza = Kamitsuku[0]
		
	elsif(opAttack == 3)#ふぶき
		typeComp1 = 1	#こおり→ノーマル
		typeComp2 = 2	#こおり→ひこう
		typeMach1 = 1	#こおり:みず
		typeMach2 = 1	#こおり:なし
		damage = ((Kamex[1] * 2 / 5 + 2) * Fubuki[1] * Kamex[4] / Kamonegi[5] / 50 + 2) * (85+rand(16)) / 100 * typeComp1 * typeComp2 * typeMach1 * typeMach2
		damage = damage.floor
		waza = Fubuki[0]
		
	elsif(opAttack == 4)#からにこもる
		typeComp1 = 1	#ノーマル→ノーマル
		typeComp2 = 1	#ノーマル→ひこう
		typeMach1 = 1	#ノーマル:みず
		typeMach2 = 1	#ノーマル:なし
		damage = ((Kamex[1] * 2 / 5 + 2) * Karani[1] * Kamex[4] / Kamonegi[5] / 50 + 2) * (85+rand(16)) / 100 * typeComp1 * typeComp2 * typeMach1 * typeMach2
		damage = damage.floor
		waza = Karani[0]
		
	end
		print(Kamex[0],"の",waza,"！",Kamonegi[0],"に",damage,"のダメージ\n")
		kamonegiH -= damage

end

print(Kamex[0],"を倒した\n\n")


print("チャンピオンのシゲルとの勝負に勝った。\n\n")
