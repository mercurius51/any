#/bin/bash
##############################################
#シェルスクリプト練習用じゃんけんゲーム
#ver 0.2 2018/11/17
##############################################
#変数
#input : ユーザーのキー入力
#com_hand : コンピュータの手の演算元ランダムな数字(0-2)
#pl_hand : ユーザー入力に対応した値
#RESULT : 結果代入用変数
##############################################

echo "コンピュータとじゃんけんをしましょう、出す手を入力してください"

while [ -z "$RESULT" ] || [ $RESULT -eq 0 ]; do
  function key_input () {
  echo "グー・チョキ・パーのどれかを入力してください"

  printf "あなたの手 : "
  read input

  case $input in
    "グー")
      pl_hand=0
      return 0;
      ;;
   "チョキ")
      pl_hand=1
      return 0;
      ;;
   "パー")
      pl_hand=2
      return 0;
      ;;
        *)
      echo "入力規則を満たしていません、不正はいけませんよ？"
      key_input
      ;;
  esac
  }

  key_input

  com_hand=$(($RANDOM % 3))

  if [ $com_hand = 0 ]; then
    echo "コンピュータの手 : グー"
  elif [ $com_hand = 1 ]; then
    echo "コンピュータの手 : チョキ"
  elif [ $com_hand = 2 ]; then
    echo "コンピュータの手 : パー"
  else
    echo "コンピュータの手が正しく処理されませんでした、ゲームを終了します"
    exit 1;
  fi

  RESULT=$((com_hand - pl_hand))
  if [ $RESULT -eq 1 ] || [ $RESULT -eq -2 ]; then
    echo "おめでとうございます！あなたの勝ちです！"
    exit 0;
  elif [ $RESULT -eq -1 ] || [ $RESULT -eq 2 ]; then
    echo "残念、あなたの負けです。壺を買ったりしないようにしましょう。"
    exit 0;
  else
    echo "あいこです、もう一度遊びましょう"
  fi
done
