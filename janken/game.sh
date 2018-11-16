#/bin/bash
##############################################
#シェルスクリプト練習用じゃんけんゲーム
#ver 0.1 2018/11/17
##############################################
#変数
#input : ユーザーのキー入力
#com_hand : コンピュータの手の演算元ランダムな数字(0-2)
#com_hand_dec : 決定されたコンピュータの手
##############################################
#ディレクトリ移動
cd $(pwd)

#説明
echo "コンピュータとじゃんけんをしましょう、出す手を入力してください"

#キー入力関数
function key_input () {
echo "グー・チョキ・パーのどれかを入力してください"

#キー入力
echo -n "あなたの手 : "
read input

#試験用
#echo $input

}

#入力
key_input

if [ $input != "グー" && $input != "チョキ" && $input != "パー" ]; then
 echo "入力規則を満たしていません、不正はいけませんよ？"
 key_input
fi

#コンピュータの手を決定、ファイル出力
#コンピュータの手はランダム関数から呼び出した数字を3で割ってあまりの数字で3パターンに分岐
#ルール　0=グー 1=チョキ 2=パー
echo $(($RANDOM % 3)) > ./com_tmp

#コンピュータの手を変数に格納
com_hand=$(cat ./com_tmp)

#コンピュータの手を演算可能な形に変更
#何らかの原因で変換できなかった場合はエラーを出力して異常終了
if [ $com_hand = 0 ]; then
 com_hand_dec="グー"
elif [ $com_hand = 1 ]; then
 com_hand_dec="チョキ"
elif [ $com_hand = 2 ]; then
 com_hand_dec="パー"
else
 echo "コンピュータの手が正しく処理されませんでした、ゲームを終了します"
 exit 1;
fi

#コンピュータの手とユーザーの手を表示
echo "コンピュータの手 : "$com_hand_dec
#echo "あなたの手："$input

#勝敗を判定
if [ $com_hand_dec = $input ]; then
 echo "あいこです、もう一度遊びましょう"
 exit 0;
fi

if [ $com_hand_dec = "グー" ]; then
 if [ $input = "パー" ]; then
  echo "おめでとうございます！あなたの勝ちです！"
  exit 0;
 else
  echo "残念、あなたの負けです。外出は控えましょう。"
  exit 0;
 fi
fi

if [ $com_hand_dec = "チョキ" ]; then
 if [ $input = "グー" ]; then
  echo "おめでとうございます！あなたの勝ちです！"
  exit 0;
 else
  echo "残念、あなたの負けです。壺を買ったりしないようにしましょう。"
  exit 0;
 fi
fi

if [ $com_hand_dec = "パー" ]; then
 if [ $input = "チョキ" ]; then
  echo "おめでとうございます！あなたの勝ちです！"
  exit 0;
 else
  echo "残念、あなたの負けです。転ばないように注意しましょう。"
  exit 0;
 fi
fi



