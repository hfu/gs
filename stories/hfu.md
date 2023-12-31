# Smart Maps x GS Concept & Implementation

[![hackmd-github-sync-badge](https://hackmd.io/zmyDo8PMTnWdUf_jyIYj4A/badge)](https://hackmd.io/zmyDo8PMTnWdUf_jyIYj4A)


# Concept
## 私（hfu）にとっての背景
1. 11月にソウルで開催される[国連オープンGIS合同ワークショップ](https://foss4g.asia/2023/un-open-gis/)のテーマは、「平和と人道のための開かれたGIS」である。
2. ガザ地区（Gaza Strip: GS）の急性的状況のもとで、地図技術者である私が、自然な[人道的感覚](https://www.jrc.or.jp/about/principle/)である「あらゆる状況下において人間の苦痛を予防し軽減することに、...努力する」欲求を封殺することなく、そうではなくて、現実的に何らかの価値を、自らの技能を最大に活用する方向で、生みたいと思う。
3. 急性的状況における行動ということで、2011-03-11/12の動きを振り返る。2011-03-11は東京にあって発災時は会議中であった。幹部を行くべきところに出して会議終了の作業をし、当日は勤務地までは戻れず東京の会議室で仮眠させていただいて、翌朝は早いうちに上野駅近辺で直上の上司とタクシーをつかまえ勤務地に戻って勤務に戻ることができた。勤務上の作業は命じられたことを実施するということで集中はできたが、休息時に、自分の技能をより使えないかと考えてしまうことが多かった。
4. あのような急性期に自分の技能を使うことを考えた場合に第一に思いついたのは、現地情報の集約であり、Ushahidiインスタンスが立ち上がるべきだと思った。こちらはsinsai.infoが立ち上がってくれたことで私には安心となった。第二に思いついたのは、共有されるべき情報が情報通信基盤の都合で共有されるべき方に伝わらないことになるリスクを削減することであった。これに該当する作業は、2011-03-12以降に自分なりに実施した。
5. 今、私がSMGで実施してスマート地図バザールも、上記4の第二に相当するものである。私の技能を用いて、地理空間的認識をより多くの人に与える、つまり「伝える」を強化し保護する、ということが、人道的急性期において、私の人道的欲求を職業的専門性に沿って満たす方法であるように思える。

## 発想
1. スマート地図バザールを使って、ガザ地区について基礎的で信頼できるリファレンス情報の伝達を支援するべきである。
2. 情報通信の観点から、分散ウェブ技術の能力を付加してスケールするということが貢献の一つとなる。
3. もう一つの貢献は、PMTilesなどのウェブ地図技術を付加して、GISのスキルがない人にも地理空間的認識を与えることを狙うことが貢献のもう一つとなる。
4. 具体的には、UN OCHAの[State of Palestine - Subnational Administrative Boundaries](https://data.humdata.org/dataset/cod-ab-pse?)をPMTilesにしてスマート地図バザールにのせ、Observableで可視化する、ということをやってみる。
5. 上記4データは、2023-10-22の週に修正されるそうだ。それを待って生産に入るような速度感で良いだろう。

## ルール: "virtual service"
1. 我々は[赤十字の７原則](https://www.jrc.or.jp/about/principle/)を尊敬している。とりわけ、この活動は**奉仕/service**であって非職業的リソースの範囲内で無償で行うことに留意する。
2. とりわけ日本のカルチャーを見渡した時に、これがやりがい搾取的な状況を作らないことに留意したい。自らに対してもやりがい搾取をするべきではない。「あなたには貢献できることはある。しかし、あなたの代わりになる人はいくらでもいる。あなたが代替不能な人間であると思ってはいけない。あなたが必要とされているとも思うべきではない。あなたが自然に持っている人道的な欲求を素直に満たす器がここにある」というような観点を持って、**静か**に進めたい。
3. この**静か**という概念を少し練ってみると、あまり前に出ずに、余暇時間で実践できる範囲で後方支援をするということになると思う。そもそも地理空間情報支援は後方支援であることが多い。virtual secondment というコンセプトもあるので、そこから借りて、とりあえず virtual service　という名を当ててみることにする。

## 地理空間情報分野の特性の分析
- 地理空間情報関係の作業は、一般的に「後方支援」の範囲内になることが多いような気がする。
- 個別分野の間接部門として地理空間情報が取り扱われることが多い中で、地理空間情報をテーマに据えることは「個別分野ではなく、横断性の高い分野」という分野取りをすることを意味するように思える。
- その「横断性」をなるべく高いレベルで発揮することが、急性的状況の中で創出する価値を高めることになる気がする。
- 地理空間認識能力の提供によって、個別分野の業務の「時間を奪う」のではなく、個別分野の業務の「時間を削減する」ことを狙うべきである。

## 私(hfu)の技能の分析
- 私の技能は「情報への正当なアクセスが技術的理由によって阻害されることを予防すること」と整理できるように思える。
- ウェブ地図へのアクセスが止まらないよう、情報通信インフラを支えてきた経験があり、それを活用して惑星間ファイルシステムによる地理空間情報のホスティングプロジェクトである「スマート地図バザール」を主な棲家にしている。

## 施策としての分析
- この施策は保護 protection と能力付与 empowerment を与えているだろうか。与えているとしたら、状況下にいる人たち（被害を受けている人たち、現場で助けている人たち）に与えていると思うのは烏滸がましく不正確であるように思える。むしろ、地図技術者が地図技術者に保護と能力付与を試みているように思える。地図技術者はおそらく後方支援者である。地図技術者が実施するのは保護や能力付与というよりは、全体のオペレーションにおける後方支援である。間接業務である後方支援を行う地図技術者間で組織を超えた保護と能力付与を行う試み、と位置付ける方向で仮説を立てた方が、正確で現実的であるように思える。
- 地図技術者が地図技術者を助ける、ということである。
- それを通じて、地図技術者が地図技術者として繁栄する世界を作る。なぜならば、地図技術者が繁栄する世界は、ルールやエビデンスに基づく意思決定や実施がされる世界であり、よってより良い世界（a better world）であるからである。

# Implementation
実際に手を動かしてみよう。

## [OSMFJ PMTiles](https://wiki.openstreetmap.org/wiki/Japan/OSMFJ_Tileserver#PMTiles)からGS分を切り出してホスト

### GSの範囲のGeoJSONをとる
[HDX](https://data.humdata.org/dataset/cod-ab-pse?)のpse_adm_pamop_20231019_SHP.zip (1.7M; Updated: 20 October 2023)を入手し、QGISで切り出しを行った。

切り出したデータは GeoJSON にして https://github.com/hfu/gs/blob/main/gs.geojson においている。これは United Nations OCHA occupied Palestinian territory (oPt) の CC-BY データであるということになる。

上記データのローデータは https://raw.githubusercontent.com/hfu/gs/main/gs.geojson であるということになる。

### OSMFJ PMTiles を切り出し
最近の go-pmtiles を使って、次のコマンドで切り出すことができる。

```zsh
pmtiles extract --region=gs.geojson https://tile.openstreetmap.jp/static/planet.pmtiles gs.pmtiles
```

これで作ることができた　gs.pmtiles の大きさは5.9MBと良好だ。

このサイズであれば、ということで、とりあえず GitHub に[あげた](https://github.com/hfu/gs/blob/main/gs.pmtiles)。amx-project/kuwanauchi メソッドである。

(c) OpenStreetMap contributors.

GitHub Pages を　enable したので、`https://hfu.github.io/gs/gs.pmtiles` というアドレスで取り扱えるようになった。

PMTiles をホストしたときに最初に行うことは、PMTiles Viewerでチェックすることだ。

https://protomaps.github.io/PMTiles/?url=https://hfu.github.io/gs/gs.pmtiles から次のスクリーンショットの通りの表示が得られており、データはうまく切り出せたことがわかった。

![screenshot](https://user-images.githubusercontent.com/18297/277114871-5f804cfe-fb17-4598-9f16-f370a2a2b858.png)

### OSMFJ スタイルを適用
次にスタイルをあてる。

https://tile.openstreetmap.jp/styles/osm-bright-ja/style.json の src を `pmtiles://https://hfu.github.io/gs/gs.pmtiles` に入れ替えたものを作り、それをホストすれば良い。

入れ替え版 style.json は　`jq` でやってみることにしよう。

ホストは、StackBlitz でそれをやることにしよう。

#### jq
jq で一歩前進。こういった形で作業を進めていきます。

```zsh
curl https://tile.openstreetmap.jp/styles/osm-bright-ja/style.json | jq '.sources'
```

実際、sourcesを書き換えるには、

```zsh=
curl https://tile.openstreetmap.jp/styles/osm-bright-ja/style.json | jq '.sources |= {"openmaptiles": {"type": "vector", "minzoom": 0, "maxzoom": 14, "url": "pmtiles://https://hfu.github.io/gs/gs.pmtiles", "attribution": "OpenStreetMap contributors"}}' | jq 'del(.layers[] | select(.source == "takeshima" or .source == "hoppo"))'
```

これで作ったファイルを https://github.com/hfu/gs/blob/main/styles/osm-bright-ja/style.json　= https://hfu.github.io/gs/styles/osm-bright-ja/style.json に置きました。

このスタイルファイルを読み込むサイトを、次の２箇所に作った。

- [Observable](https://observablehq.com/d/0f3af92460e4567c)
- [StackBlitz](https://stackblitz.com/edit/vitejs-vite-efkwym?file=src%2FApp.tsx)
