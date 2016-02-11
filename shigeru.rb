=begin

変数の説明
tpC typeC

相手が技を選ぶアルゴリズムができてない。

ダメージ計算式
（（攻撃側のレベル × 2 ÷ 5 ＋ 2）× 技の威力 × 攻撃側の能力値 ÷
 防御側の能力値 ÷ 50 ＋ 2）×（85～100）÷ 100 

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

#ダメージ計算の関数
def getDamage(atL,wazaIryoku,atA,dfB,typeComp1,typeComp2,typeMach1,typeMach2)
    damage = ((atL * 2/5 + 2) * wazaIryoku * atA / dfB / 50 + 2) * (85 + rand(16)) / 100 * typeComp1 * typeComp2 * typeMach1 * typeMach2
    damage = damage.floor
	  damage
end

#HP計算の関数
def getHP(syuzokuti, kotaiti,  doryokuti, lv)
	status = (syuzokuti * 2 + kotaiti + doryokuti/4) * lv/100 + 10 + lv
	status
end

#ABCDS計算の関数
def getABCDS(syuzokuti, kotaiti,  doryokuti, lv)
	status = (syuzokuti * 2 + kotaiti + doryokuti/4) * lv/100 + 5
	status
end

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
	
	if(myAttack == 1)	#つばさでうつ
		atL = Kamonegi[1]
		skP = Tsubasa[1]
		atA = Kamonegi[4]
		dfB = Pijotto[5]
		tpC1 = 1	#ひこう→ノーマル
		tpC2 = 1	#ひこう→ひこう
		tpM1 = 1.5	#ひこう=ひこう
		tpM2 = 1	#ひこう≠ノーマル
		waza = Tsubasa[0]
		
	elsif(myAttack == 2)#エアスラッシュ
		atL = Kamonegi[1]
		skP = Easura[1]
		atA = Kamonegi[6]
		dfB = Pijotto[7]
		tpC1 = 1	#ひこう→ノーマル
		tpC2 = 1	#ひこう→ひこう
		tpM1 = 1.5	#ひこう=ひこう
		tpM2 = 1	#ひこう≠ノーマル		
		waza = Easura[0]
		
	elsif(myAttack == 3)#リーフブレード
		atL = Kamonegi[1]
		skP = LeafBlade[1]
		atA = Kamonegi[4]
		dfB = Pijotto[5]
		tpC1 = 1	#くさ→ノーマル
		tpC2 = 0.5	#くさ→ひこう
		tpM1 = 1	#くさ≠ひこう
		tpM2 = 1	#くさ≠ノーマル		
		waza = LeafBlade[0]
		
	elsif(myAttack == 4)#ねっぷう
		atL = Kamonegi[1]
		skP = Neppuu[1]
		atA = Kamonegi[6]
		dfB = Pijotto[7]
		tpC1 = 1	#ほのお→ノーマル
		tpC2 = 1	#ほのお→ひこう
		tpM1 = 1	#ほのお≠ひこう
		tpM2 = 1	#ほのお≠ノーマル		
		waza = Neppuu[0]		
	end
		damage = getDamage(atL,skP,atA,dfB,tpC1,tpC2,tpM1,tpM2)
		print(Kamonegi[0],"の",waza,"！",Pijotto[0],"に",damage,"のダメージ\n")
		pijottoH -= damage
		
	
	#ここからピジョットの攻撃
	
	opAttack = rand(4)+1
	
	if(opAttack == 1)#つばさでうつ
		atL = Pijotto[1]
		skP = Tsubasa2[1]
		atA = Pijotto[4]
		dfB = Kamonegi[5]
		tpC1 = 1	#ひこう→ノーマル
		tpC2 = 1	#ひこう→ひこう
		tpM1 = 1.5	#ひこう=ひこう
		tpM2 = 1	#ひこう≠ノーマル
		waza = Tsubasa2[0]
		
	elsif(opAttack == 2)#ふきとばし
		atL = Pijotto[1]
		skP = Fuki[1]
		atA = Pijotto[6]
		dfB = Kamonegi[7]
		tpC1 = 1	#ひこう→ノーマル
		tpC2 = 1	#ひこう→ひこう
		tpM1 = 1.5	#ひこう=ひこう
		tpM2 = 1	#ひこう≠ノーマル
		waza = Fuki[0]
		
	elsif(opAttack == 3)#オウムがえし
		atL = Pijotto[1]
		skP = Oumu[1]
		atA = Pijotto[4]
		dfB = Kamonegi[5]
		tpC1 = 1	#ひこう→ノーマル
		tpC2 = 1	#ひこう→ひこう
		tpM1 = 1.5	#ひこう=ひこう
		tpM2 = 1	#ひこう≠ノーマル		
		waza = Oumu[0]
		
	elsif(opAttack == 4)#ゴッドバード
		atL = Pijotto[1]
		skP = Godbird[1]
		atA = Pijotto[4]
		dfB = Kamonegi[5]
		tpC1 = 1	#ひこう→ノーマル
		tpC2 = 1	#ひこう→ひこう
		tpM1 = 1.5	#ひこう=ひこう
		tpM2 = 1	#ひこう≠ノーマル		
		waza = Godbird[0]
		
	end
		damage = getDamage(atL,skP,atA,dfB,tpC1,tpC2,tpM1,tpM2)
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
		atL = Kamonegi[1]
		skP = Tsubasa[1]
		atA = Kamonegi[4]
		dfB = Saidon[5]
		tpC1 = 0.5	#ひこう→いわ
		tpC2 = 1	#ひこう→じめん
		tpM1 = 1.5	#ひこう:ひこう
		tpM2 = 1	#ひこう:ノーマル
		waza = Tsubasa[0]
		
	elsif(myAttack == 2)#エアスラッシュ
		atL = Kamonegi[1]
		skP = Easura[1]
		atA = Kamonegi[6]
		dfB = Saidon[7]
		tpC1 = 0.5	#ひこう→いわ
		tpC2 = 1	#ひこう→じめん
		tpM1 = 1.5	#ひこう:ひこう
		tpM2 = 1	#ひこう:ノーマル
		waza = Easura[0]
		
	elsif(myAttack == 3)#リーフブレード
		atL = Kamonegi[1]
		skP = LeafBlade[1]
		atA = Kamonegi[4]
		dfB = Saidon[5]
		tpC1 = 2	#くさ→いわ
		tpC2 = 2	#くさ→じめん
		tpM1 = 1	#くさ:ひこう
		tpM2 = 1	#くさ:ノーマル
		waza = LeafBlade[0]
		
	elsif(myAttack == 4)#ねっぷう
		atL = Kamonegi[1]
		skP = Neppuu[1]
		atA = Kamonegi[6]
		dfB = Saidon[7]
		tpC1 = 0.5	#ほのお→いわ
		tpC2 = 1	#ほのお→じめん
		tpM1 = 1	#ほのお:ひこう
		tpM2 = 1	#ほのお:ノーマル
		waza = Neppuu[0]
		
	end
		damage = getDamage(atL,skP,atA,dfB,tpC1,tpC2,tpM1,tpM2)
		print(Kamonegi[0],"の",waza,"！",Saidon[0],"に",damage,"のダメージ\n")
		saidonH -= damage
		
	
	#ここからサイドンの攻撃
	
	opAttack = rand(4)+1
	
	if(opAttack == 1)#しっぽをふる
		atL = Saidon[1]
		skP = Shippo[1]
		atA = Saidon[4]
		dfB = Kamonegi[5]
		tpC1 = 1	#ノーマル→ノーマル
		tpC2 = 1	#ノーマル→ひこう
		tpM1 = 1	#ノーマル:いわ
		tpM2 = 1	#ノーマル:じめん
		waza = Shippo[0]
		
	elsif(opAttack == 2)#にらみつける
		atL = Saidon[1]
		skP = Nirami[1]
		atA = Saidon[4]
		dfB = Kamonegi[5]
		tpC1 = 1	#ノーマル→ノーマル
		tpC2 = 1	#ノーマル→ひこう
		tpM1 = 1	#ノーマル:いわ
		tpM2 = 1	#ノーマル:じめん
		waza = Nirami[0]
		
	elsif(opAttack == 3)#つのドリル
		atL = Saidon[1]
		skP = Tsuno[1]
		atA = Saidon[4]
		dfB = Kamonegi[5]
		tpC1 = 1	#ノーマル→ノーマル
		tpC2 = 1	#ノーマル→ひこう
		tpM1 = 1	#ノーマル:いわ
		tpM2 = 1	#ノーマル:じめん
		waza = Tsuno[0]
		
	elsif(opAttack == 4)#みだれづき
		atL = Saidon[1]
		skP = Midare[1]
		atA = Saidon[4]
		dfB = Kamonegi[5]
		tpC1 = 1	#ノーマル→ノーマル
		tpC2 = 1	#ノーマル→ひこう
		tpM1 = 1	#ノーマル:いわ
		tpM2 = 1	#ノーマル:じめん
		waza = Midare[0]
		
	end
		damage = getDamage(atL,skP,atA,dfB,tpC1,tpC2,tpM1,tpM2)
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
		atL = Kamonegi[1]
		skP = Tsubasa[1]
		atA = Kamonegi[4]
		dfB = Nassi[5]
		tpC1 = 2	#ひこう→くさ
		tpC2 = 1	#ひこう→エスパー
		tpM1 = 1.5	#ひこう:ひこう
		tpM2 = 1	#ひこう:ノーマル
		waza = Tsubasa[0]
		
	elsif(myAttack == 2)#エアスラッシュ
		atL = Kamonegi[1]
		skP = Easura[1]
		atA = Kamonegi[6]
		dfB = Nassi[7]
		tpC1 = 2	#ひこう→くさ
		tpC2 = 1	#ひこう→エスパー
		tpM1 = 1.5	#ひこう:ひこう
		tpM2 = 1	#ひこう:ノーマル
		waza = Easura[0]
		
	elsif(myAttack == 3)#リーフブレード
		atL = Kamonegi[1]
		skP = LeafBlade[1]
		atA = Kamonegi[4]
		dfB = Nassi[5]
		tpC1 = 0.5	#くさ→くさ
		tpC2 = 1	#くさ→エスパー
		tpM1 = 1	#くさ:ひこう
		tpM2 = 1	#くさ:ノーマル
		waza = LeafBlade[0]
		
	elsif(myAttack == 4)#ねっぷう
		atL = Kamonegi[1]
		skP = Neppuu[1]
		atA = Kamonegi[6]
		dfB = Nassi[7]
		tpC1 = 2	#ほのお→くさ
		tpC2 = 1	#ほのお→エスパー
		tpM1 = 1	#ほのお:ひこう
		tpM2 = 1	#ほのお:ノーマル
		waza = Neppuu[0]
		
	end
		damage = getDamage(atL,skP,atA,dfB,tpC1,tpC2,tpM1,tpM2)
		print(Kamonegi[0],"の",waza,"！",Nassi[0],"に",damage,"のダメージ\n")
		nassiH -= damage
		
	
	#ここからナッシーの攻撃
	
	opAttack = rand(3)+1
	
	if(opAttack == 1)#ふみつけ
		atL = Nassi[1]
		skP = Fumi[1]
		atA = Nassi[4]
		dfB = Kamonegi[5]
		tpC1 = 1	#ノーマル→ノーマル
		tpC2 = 1	#ノーマル→ひこう
		tpM1 = 1	#ノーマル:くさ
		tpM2 = 1	#ノーマル:エスパー
		waza = Fumi[0]
		
	elsif(opAttack == 2)#たまなげ
		atL = Nassi[1]
		skP = Tama[1]
		atA = Nassi[4]
		dfB = Kamonegi[5]
		tpC1 = 1	#ノーマル→ノーマル
		tpC2 = 1	#ノーマル→ひこう
		tpM1 = 1	#ノーマル:くさ
		tpM2 = 1	#ノーマル:エスパー
		waza = Tama[0]
		
	elsif(opAttack == 3)#さいみんじゅつ
		atL = Nassi[1]
		skP = Saimin[1]
		atA = Nassi[4]
		dfB = Kamonegi[5]
		tpC1 = 1	#エスパー→ノーマル
		tpC2 = 1	#エスパー→ひこう
		tpM1 = 1	#エスパー:くさ
		tpM2 = 1	#エスパー:エスパー
		waza = Saimin[0]
		
	end
		damage = getDamage(atL,skP,atA,dfB,tpC1,tpC2,tpM1,tpM2)
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
		atL = Kamonegi[1]
		skP = Tsubasa[1]
		atA = Kamonegi[4]
		dfB = Uindi[5]
		tpC1 = 1	#ひこう→ほのお
		tpC2 = 1	#ひこう→なし
		tpM1 = 1.5	#ひこう:ひこう
		tpM2 = 1	#ひこう:ノーマル
		waza = Tsubasa[0]
		
	elsif(myAttack == 2)#エアスラッシュ
		atL = Kamonegi[1]
		skP = Easura[1]
		atA = Kamonegi[6]
		dfB = Uindi[7]
		tpC1 = 1	#ひこう→ほのお
		tpC2 = 1	#ひこう→なし
		tpM1 = 1.5	#ひこう:ひこう
		tpM2 = 1	#ひこう:ノーマル
		waza = Easura[0]
		
	elsif(myAttack == 3)#リーフブレード
		atL = Kamonegi[1]
		skP = LeafBlade[1]
		atA = Kamonegi[4]
		dfB = Uindi[5]
		tpC1 = 0.5	#くさ→ほのお
		tpC2 = 1	#くさ→なし
		tpM1 = 1	#くさ:ひこう
		tpM2 = 1	#くさ:ノーマル
		waza = LeafBlade[0]
		
	elsif(myAttack == 4)#ねっぷう
		atL = Kamonegi[1]
		skP = Neppuu[1]
		atA = Kamonegi[6]
		dfB = Uindi[7]
		tpC1 = 0.5	#ほのお→ほのお
		tpC2 = 1	#ほのお→なし
		tpM1 = 1	#ほのお:ひこう
		tpM2 = 1	#ほのお:ノーマル
		waza = Neppuu[0]
		
	end
		damage = getDamage(atL,skP,atA,dfB,tpC1,tpC2,tpM1,tpM2)
		print(Kamonegi[0],"の",waza,"！",Uindi[0],"に",damage,"のダメージ\n")
		uindiH -= damage
		
	
	#ここからウインディの攻撃
	
	opAttack = rand(3)+1
	
	if(opAttack == 1)#ほえる
		atL = Uindi[1]
		skP = Hoeru[1]
		atA = Uindi[4]
		dfB = Kamonegi[5]
		tpC1 = 1	#ノーマル→ノーマル
		tpC2 = 1	#ノーマル→ひこう
		tpM1 = 1	#ノーマル:ほのお
		tpM2 = 1	#ノーマル:なし
		waza = Hoeru[0]
		
	elsif(opAttack == 2)#ひのこ
		atL = Uindi[1]
		skP = Hinoko[1]
		atA = Uindi[4]
		dfB = Kamonegi[5]
		tpC1 = 1	#ほのお→ノーマル
		tpC2 = 1	#ほのお→ひこう
		tpM1 = 1.5	#ほのお:ほのお
		tpM2 = 1	#ほのお:なし
		waza = Hinoko[0]
		
	elsif(opAttack == 3)#にらみつける
		atL = Uindi[1]
		skP = Nirami[1]
		atA = Uindi[4]
		dfB = Kamonegi[5]
		tpC1 = 1	#ノーマル→ノーマル
		tpC2 = 1	#ノーマル→ひこう
		tpM1 = 1	#ノーマル:ほのお
		tpM2 = 1	#ノーマル:なし
		waza = Nirami[0]
		
	elsif(opAttack == 4)#とっしん
		atL = Uindi[1]
		skP = Toshin[1]
		atA = Uindi[4]
		dfB = Kamonegi[5]
		tpC1 = 1	#ノーマル→ノーマル
		tpC2 = 1	#ノーマル→ひこう
		tpM1 = 1	#ノーマル:ほのお
		tpM2 = 1	#ノーマル:なし
		waza = Toshin[0]
		
	end
		damage = getDamage(atL,skP,atA,dfB,tpC1,tpC2,tpM1,tpM2)
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
		atL = Kamonegi[1]
		skP = Tsubasa[1]
		atA = Kamonegi[4]
		dfB = Fudin[5]
		tpC1 = 1	#ひこう→エスパー
		tpC2 = 1	#ひこう→なし
		tpM1 = 1.5	#ひこう:ひこう
		tpM2 = 1	#ひこう:ノーマル
		waza = Tsubasa[0]
		
	elsif(myAttack == 2)#エアスラッシュ
		atL = Kamonegi[1]
		skP = Easura[1]
		atA = Kamonegi[6]
		dfB = Fudin[7]
		tpC1 = 1	#ひこう→エスパー
		tpC2 = 1	#ひこう→なし
		tpM1 = 1.5	#ひこう:ひこう
		tpM2 = 1	#ひこう:ノーマル
		waza = Easura[0]
		
	elsif(myAttack == 3)#リーフブレード
		atL = Kamonegi[1]
		skP = LeafBlade[1]
		atA = Kamonegi[4]
		dfB = Fudin[5]
		tpC1 = 1	#くさ→エスパー
		tpC2 = 1	#くさ→なし
		tpM1 = 1	#くさ:ひこう
		tpM2 = 1	#くさ:ノーマル
		waza = LeafBlade[0]
		
	elsif(myAttack == 4)#ねっぷう
		atL = Kamonegi[1]
		skP = Neppuu[1]
		atA = Kamonegi[6]
		dfB = Fudin[7]
		tpC1 = 1	#ほのお→エスパー
		tpC2 = 1	#ほのお→なし
		tpM1 = 1	#ほのお:ひこう
		tpMach2 = 1	#ほのお:ノーマル
		waza = Neppuu[0]
		
	end
		damage = getDamage(atL,skP,atA,dfB,tpC1,tpC2,tpM1,tpM2)
		print(Kamonegi[0],"の",waza,"！",Fudin[0],"に",damage,"のダメージ\n")
		fudinH -= damage
		
	
	#ここからフーディンの攻撃
	
	opAttack = rand(3)+1
	
	if(opAttack == 1)#サイコキネシス
		atL = Fudin[1]
		skP = Saiko[1]
		atA = Fudin[6]
		dfB = Kamonegi[7]
		tpC1 = 1	#エスパー→ノーマル
		tpC2 = 1	#エスパー→ひこう
		tpM1 = 1.5	#エスパー:エスパー
		tpM2 = 1	#エスパー:なし
		waza = Saiko[0]
		
	elsif(opAttack == 2)#サイケこうせん
		atL = Fudin[1]
		skP = Saike[1]
		atA = Fudin[6]
		dfB = Kamonegi[7]
		tpC1 = 1	#エスパー→ノーマル
		tpC2 = 1	#エスパー→ひこう
		tpM1 = 1.5	#エスパー:エスパー
		tpM2 = 1	#エスパー:なし
		waza = Saike[0]
		
	elsif(opAttack == 3)#じこさいせい
		atL = Fudin[1]
		skP = Jiko[1]
		atA = Fudin[6]
		dfB = Kamonegi[7]
		tpC1 = 1	#エスパー→ノーマル
		tpC2 = 1	#エスパー→ひこう
		tpM1 = 1.5	#エスパー:エスパー
		tpM2 = 1	#エスパー:なし
		waza = Jiko[0]
		
	elsif(opAttack == 4)#リフレクター
		atL = Fudin[1]
		skP = Rifu[1]
		atA = Fudin[4]
		dfB = Kamonegi[5]
		tpC1 = 1	#ノーマル→ノーマル
		tpC2 = 1	#ノーマル→ひこう
		tpM1 = 1	#ノーマル:エスパー
		tpM2 = 1	#ノーマル:なし
		waza = Rifu[0]
		
	end
		damage = getDamage(atL,skP,atA,dfB,tpC1,tpC2,tpM1,tpM2)
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
		atL = Kamonegi[1]
		skP = Tsubasa[1]
		atA = Kamonegi[4]
		dfB = Kamex[5]
		tpC1 = 1	#ひこう→エスパー
		tpC2 = 1	#ひこう→なし
		tpM1 = 1.5	#ひこう:ひこう
		tpM2 = 1	#ひこう:ノーマル
		waza = Tsubasa[0]
		
	elsif(myAttack == 2)#エアスラッシュ
		atL = Kamonegi[1]
		skP = Easura[1]
		atA = Kamonegi[6]
		dfB = Kamex[7]
		tpC1 = 1	#ひこう→エスパー
		tpC2 = 1	#ひこう→なし
		tpM1 = 1.5	#ひこう:ひこう
		tpM2 = 1	#ひこう:ノーマル
		waza = Easura[0]
		
	elsif(myAttack == 3)#リーフブレード
		atL = Kamonegi[1]
		skP = LeafBlade[1]
		atA = Kamonegi[4]
		dfB = Kamex[5]
		tpC1 = 1	#くさ→エスパー
		tpC2 = 1	#くさ→なし
		tpM1 = 1	#くさ:ひこう
		tpM2 = 1	#くさ:ノーマル
		waza = LeafBlade[0]
		
	elsif(myAttack == 4)#ねっぷう
		atL = Kamonegi[1]
		skP = Neppuu[1]
		atA = Kamonegi[6]
		dfB = Kamex[7]
		tpC1 = 1	#ほのお→エスパー
		tpC2 = 1	#ほのお→なし
		tpM1 = 1	#ほのお:ひこう
		tpM2 = 1	#ほのお:ノーマル
		waza = Neppuu[0]
		
	end
		damage = getDamage(atL,skP,atA,dfB,tpC1,tpC2,tpM1,tpM2)
		print(Kamonegi[0],"の",waza,"！",Kamex[0],"に",damage,"のダメージ\n")
		kamexH -= damage
		
	
	#ここからカメックスの攻撃
	
	opAttack = rand(3)+1
	
	if(opAttack == 1)#ハイドロポンプ
		atL = Kamex[1]
		skP = Haidoro[1]
		atA = Kamex[4]
		dfB = Kamonegi[5]
		tpC1 = 1	#みず→ノーマル
		tpC2 = 1	#みず→ひこう
		tpM1 = 1.5	#みず:みず
		tpM2 = 1	#みず:なし
		waza = Haidoro[0]
		
	elsif(opAttack == 2)#かみつく
		atL = Kamex[1]
		skP = Kamitsuku[1]
		atA = Kamex[4]
		dfB = Kamonegi[5]
		tpC1 = 1	#あく→ノーマル
		tpC2 = 1	#あく→ひこう
		tpM1 = 1	#あく:みず
		tpM2 = 1	#あく:なし
		waza = Kamitsuku[0]
		
	elsif(opAttack == 3)#ふぶき
		atL = Kamex[1]
		skP = Fubuki[1]
		atA = Kamex[4]
		dfB = Kamonegi[5]
		tpC1 = 1	#こおり→ノーマル
		tpC2 = 2	#こおり→ひこう
		tpM1 = 1	#こおり:みず
		tpM2 = 1	#こおり:なし
		waza = Fubuki[0]
		
	elsif(opAttack == 4)#からにこもる
		atL = Kamex[1]
		skP = Karani[1]
		atA = Kamex[4]
		dfB = Kamonegi[5]
		tpC1 = 1	#ノーマル→ノーマル
		tpC2 = 1	#ノーマル→ひこう
		tpM1 = 1	#ノーマル:みず
		tpM2 = 1	#ノーマル:なし
		waza = Karani[0]
		
	end
		damage = getDamage(atL,skP,atA,dfB,tpC1,tpC2,tpM1,tpM2)
		print(Kamex[0],"の",waza,"！",Kamonegi[0],"に",damage,"のダメージ\n")
		kamonegiH -= damage

end

print(Kamex[0],"を倒した\n\n")


print("チャンピオンのシゲルとの勝負に勝った。\n\n")

