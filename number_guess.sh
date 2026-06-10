#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))

echo "Enter your username:"
read USERNAME

# データベースからユーザー情報を取得
USER_INFO=$($PSQL "SELECT games_played, best_game FROM gamedata WHERE username='$USERNAME'")

# 取得結果が空かどうか判定、ないなら新規、あるならデータ
if [[ -z $USER_INFO ]]
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  # 新規ユーザーをデータベースに登録
  INSERT_USER_RESULT=$($PSQL "INSERT INTO gamedata(username, games_played) VALUES('$USERNAME', 0)")
else
  # 既存ユーザーの場合、取得したデータを分解して変数に代入
  echo "$USER_INFO" | while IFS="|" read GAMES_PLAYED BEST_GAME
  do
    echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  done
fi

echo "Guess the secret number between 1 and 1000:"
GUESS_COUNT=0

while true
do
  read GUESS
  
  # 入力が整数かどうかのチェック
  if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
    continue
  fi

  # 試行回数を+1
  ((GUESS_COUNT++))

  # 判定処理
  if [[ $GUESS -eq $SECRET_NUMBER ]]
  then
    echo "You guessed it in $GUESS_COUNT tries. The secret number was $SECRET_NUMBER. Nice job!"
    break
  elif [[ $GUESS -gt $SECRET_NUMBER ]]
  then
    echo "It's lower than that, guess again:"
  else
    echo "It's higher than that, guess again:"
  fi
done

# ゲーム後のデータベース更新
# プレイ回数+1
UPDATE_GAMES_RESULT=$($PSQL "UPDATE gamedata SET games_played = games_played + 1 WHERE username='$USERNAME'")

# 現在のベストスコアを取得
CURRENT_BEST=$($PSQL "SELECT best_game FROM gamedata WHERE username='$USERNAME'")

# 初回クリア、または今回のスコアが既存のベストスコアより小さい場合に更新
if [[ -z $CURRENT_BEST || $GUESS_COUNT -lt $CURRENT_BEST ]]
then
  UPDATE_BEST_RESULT=$($PSQL "UPDATE gamedata SET best_game = $GUESS_COUNT WHERE username='$USERNAME'")
fi