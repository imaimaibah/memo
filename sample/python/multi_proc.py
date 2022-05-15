#!/usr/bin/env python
# -*- coding: utf-8 -*-

import multiprocessing as mp

proc = 8
L = 20000

# 各プロセスが実行する計算
def subcalc(queue, p):
    subtotal = 0

    # iの範囲を設定
    ini = L * p / proc
    fin = L * (p+1) / proc

    for i in range(ini, fin):
        for j in range(L):
            subtotal += i * j
    # キューにデータを送る
    queue.put(subtotal)

# キューを作成
queue = mp.Queue()

# 8個のプロセスを用意
'''
ps = [ 
    mp.Process(target=subcalc, args=(queue, 0)),
    mp.Process(target=subcalc, args=(queue, 1)),
    mp.Process(target=subcalc, args=(queue, 2)),
    mp.Process(target=subcalc, args=(queue, 3)),
    mp.Process(target=subcalc, args=(queue, 4)),
    mp.Process(target=subcalc, args=(queue, 5)),
    mp.Process(target=subcalc, args=(queue, 6)),
    mp.Process(target=subcalc, args=(queue, 7))
]

# すべてを開始
for p in ps:
    p.start()
'''
for i in range(8):
  mp.Process(target=subcalc, args=(queue, i)).start()

# キューから結果を回収
total = 0
for i in range(8):
    total += queue.get()   # キューに値が無い場合は、値が入るまで待機になる

print(total)
