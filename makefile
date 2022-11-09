﻿#----------------------------------------------------------#
# ディレクトリパス定義

## srcディレクトリ
SRCDIRPATH=.\src

## 生成する場所の指定
BINDIRPATH=.\bin

#----------------------------------------------------------#
# 生成する対象の指定

## 対象のプロジェクト
TARGET=$(BINDIRPATH)\Main

## 対象リスト
all: $(TARGET)

#----------------------------------------------------------#
# コンパイラ関連の定義

## コンパイラの指定
CCX=g++

## 最適化について
OPTIMIZE=-o2

## C++のバージョン指定
CPP_VERSION=-std=c++11

## インクルードの指定 ( -Iでやるやつ )
ICOMMAND=

## リンカのフラグ
LDFLAG=-O0

## コンパイラフラグ
CFLAG=$(OPTIMIZE) $(CPP_VERSION) $(ICOMMAND)

## リンクする独自ソースコード
LINKAGEFILES=$(SRCDIRPATH)\main.o

MINGW_STATIC_LINKAGE=-static-libgcc -static-libstdc++ -static -lpthread

#----------------------------------------------------------#
# コンパイル

## 対象プロジェクトのコンパイル
$(TARGET): $(LINKAGEFILES)
	$(CCX) $(CFLAG) -o $@ $< $(MINGW_STATIC_LINKAGE) -mwindows

## 必要なオブジェクトファイルのコンパイル
main.o:
	$(CCX) -c $<

#----------------------------------------------------------#
# 後始末

## 削除系
clean:
	@rm -rf $(LINKAGEFILES) $(TARGET)
