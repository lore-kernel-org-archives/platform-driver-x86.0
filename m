Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902B928690
	for <platform-driver-x86@vger.kernel.org>; Sun, 11 Oct 2026 01:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791681325; cv=none; b=gAczpZHOdAUx8zIwDTb035Wz+Gn7EQG7cUM7OK/5iLGKhzTX9WNjMMaSRb0uLy4oEyYwtvx763BDX49I+eFG7eUGnR6at2MEsdWCqUhfnLdNdNJGrFCTfyyVhEm6U9laBsZK6bzGu+g4+n4Eqwebre4E/+cvheHcfLgHZLpnNjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791681325; c=relaxed/simple;
	bh=/dVKWw6beF8L9AjG77lVW5ywqbGTrZSaFJJDJY/oMYo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iWAdWpE7i4u4SU3aVFGgxf5Nw3rQI59lIxN7KB527eH46J2FtUImy6cCt55fziPd1CRSTHUgAtNMiwMgKzUPt/09AhJXe/wmFN0dIb6WzQnhjExfk6TAzOls+ZJ/pJGQDFJL6R4GrM2arWXTQSfGOR99Y3jmTzOCtZOGdoy9FTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=QG7gIB68; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="QG7gIB68"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1791681318; x=1792286118; i=w_armin@gmx.de;
	bh=/dVKWw6beF8L9AjG77lVW5ywqbGTrZSaFJJDJY/oMYo=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=QG7gIB68lCmfJ+5kbwCxHKSAsL976vwac8DyzsI4nbgamx5e8Pcn3X9NF2+sYaec
	 lg9X8ycCr10Nq47/jP5r/JgT6xqqf1A16g2qD4FlwBxV8h41wEmaLXZHpWQV3XHZv
	 0Nnn9p4nkrA88h9c0gprFkoSuvoECslyPuC65So1PCSwamXYVsuFW5BXrqR2jS+m6
	 hnJavJ1FkkzEwtHYWSMwdxOGuDyE6cB86qrMnroIUKQAsoqNmfUXqt/epCjtduEMX
	 hB5z2q1+8njFCUxF4mE5OQElvj8YiG5Zl4UvPA54WYWJYRrkcqQ8H/mlMfk0Fp2Yo
	 zbhYYXoBjIvbLvwdxQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M8hVB-1xKOzX1COP-000mrX; Sun, 11
 Oct 2026 03:15:18 +0200
Message-ID: <1720cd41-9685-4edf-9653-511c396b2302@gmx.de>
Date: Sun, 11 Oct 2026 03:15:17 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Hardware support request] uniwill-laptop: MECHREVO Yilong15Pro
 GM5HG0A keyboard backlight
To: bifangknt <bifangknt@qq.com>
Cc: platform-driver-x86 <platform-driver-x86@vger.kernel.org>
References: <tencent_B151EE01B6705AB1C44E1D81C38D9D4C7D07@qq.com>
 <750f97be-7d45-41b1-84e2-3fbb9229f602@gmx.de>
 <tencent_EAAEE9BC1F36ECF8E88372E7B025D0AA270A@qq.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <tencent_EAAEE9BC1F36ECF8E88372E7B025D0AA270A@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:vYML8jBniRhh2Q0aSofyN8C1vSc7wrG2mSV59jVyzhWnUcAUUOB
 KmP2vWIaH9xJQfufGthr3ch4wojt6l6DDKWpogg5c/zCq1uTjY1idRnuo6wvL03EGaug6dO
 CLbCS46TaXFY/Cyyvy/P0pCJKIl471bYyjwjcBJrJ6LZY+lURmBz2sbuok8Sfl5sVuREQM6
 C/7Ai1RRo84d4vVP/z6Kw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:I7qbafTTwBY=;Fv3TNZ5wBU5hq5IBkI9wxHfy5bc
 yzxO8o+j13VL/kUbdMAiueYNW8g7G6c8VN6cXa/KjbF/DgIxFzfHZS+oIek7Hh1PLVvY4DP4G
 z87v87F1W+MhLCVEIP3JLV3MJtJbmlK7le/uDRJ4374lt1dzQHGILrJfqP0sht6nb30uZNzJi
 ql1EWA+NLb67tLXmy+tHxxrMImCEcIetFEDJQILq5WMgg4kDJSf4lJPhbMnuAMJKk6sNyEFbp
 2kNMtsrwTHy9nHuroEtCue6OJzYi1/buygM/u7SgGV4ZAkQx/vrKTOq2VNaP/xgUOC9BVK6nO
 IIfMVKH1GYV+lgczbCYuoXBEx7fiuZXr1rzQUapmlMpEuIutkrRGC/DfiGDhe1iJvdhjfORVv
 ynczKX3cCDbz6d9rD2qLH5laLLMnOwqHmEWcMq/ZWH8sO8tML6G53faV2uJ7ocFnmpjwT62/9
 BLzKUfFQtg1YDOnNUYHG4x0pJMDTdh/yRa7mQuO3VothQqQwTASP8pjpYX41TqiPVMEbG2h3J
 6Gz0OB8ApYKCAAk4500wKT+HeoBPQG/SiHbIEragN0a3VgVDUjWQ1I7T0o2wlT/pF6kzLUDva
 PI+bwb+fPhQ2T0RCUMMZqg/J7Qw2rY2vbIamhJKhruRelY2edQocJPqWkYAENm9L2Y05sQKJ6
 fbVhPFzmEb2U1XDPJ8k6HJy19q7xYsyHp+fhIviiI5OK6i81CSqQHNVRPy7XMXN0SZ8bK3Ztr
 PBPjeVzctATt+UoIk/xYbGTxkAU9icyeo47Eth+AnYziqeB2qz7aW//gAK7lOO3RIYUagCOPm
 r4h7+AwgzFIbG2Jz5pYvmgqQqVFO8GSDvga1SrtxyTfgFuDKvxnMouoZHjiRE6rsZZYKCFXF2
 E+/CCjB8O5FVyTFka4p3bA75X4bWxCpZNqXDv9k7L1gbcyzc8e1CGsyah/jw+ik7HLmJ9lb2m
 SeVO7WVdqhZMCgtLSdBOFUoqqVU7VFbeJbyLFN7P1b5bTXQ7KGOwHI/EBexW8dbNvwe2erzZ4
 UkGuoFWrYevfSgLOFOS8/HSGrMurGNHheavfTNcnfMr43xbsqJbiOn+4p0iY6Pwt4ksaMG4fG
 toMnaWGcJK3aElZzcXqD53ZPjF+5oNShpJLSv0ZI/OaKgzPNXvQQz1A1bAYeGuFc4YVofq7do
 x8sn6VTRDz6WF7+UhkUOdadU9UbLE3gmafsUbFdSh50WvSwUdHxcTvdx+t+W6fwAaQ2HuCx6R
 wEvRxAGpKLEoWWDIXF1Ft0ZWJg2ybtjiBZIsnQeiHtz88VuGxoeArnSSopElnueF5u4eGmHMx
 82UAglAv9lkLhXzfTdwqtkZs6f5fCp+U4dRLXPtCbipr5VEqwqwwjJXVfS63TenOWJI7oAwCu
 VSQE/oBCv7PDtP1TYKVfnwGBoG+dlhV9H/ENKmb4JruUIonPtT8pfIDtBGsqXBbASJvWPaOwS
 Uns9+cWvMqs4F4qfzVThWvskCN3EsXmCmAXoHdVELxgZ0sH8DHA/hNR4EcWWuLLTO4qNWtBIt
 ZP8qDCXOCgq/5telr+oJFVsbz7IY6kZDJXgoh/rAxw95ruL33Lu5w7IovFJiYMZwdVlJ78ovi
 JVpfUNbV0Eol/oI4OzyJuRUEbMju7WY2K5FfpB8wH3lCim9UDnlb5MAd2TS/coX8JCcRR2YVD
 DvWRaTvdhwtzUvdJEdHkdGgv1Woy9Kb/uBLyIUlSWWXM/tkTm5HZOq0kphwXs03aY0X8fLvdb
 mM4yspQZDV+bz5+bUNwniQ4RBiS3qZ4d4aPtXPvMPC6Hkt1UUafOPm5tOolJDfRDPptPsO7+u
 038IshxZBQSvkraf0L1MRxtMAfttGi9MxZ7YwZmpX9zjfD+HCe7lAyqhgTm8Y/FRPRre1PII0
 fPumg31XR9S5o89WD2JamFLfevXt6Ho1ZFX8p/Q6BUUocogUNTPc+w05sCQXzJmbJl5fsC3Bd
 86vDh8vBd3Gld49/6f6lbngR6D5KVEgxqg8sEuzwTia5bCLtFc+V+q5j3/8nFPO5N3VhpL7wE
 fuM6r3EfRoR2eUCbXVO+AaIO4uhNUfKyQ7fAIf0twSamHS18ZjAzSwbvBWlPWagaKPcRdzOob
 rctR1ClYyjSTYzGyWTkkyDV1P4y8Dg7XFsoRsLFOY/A7Hyp4eOmpLQA0PCAB7R/Z3FffaeUNw
 iBs5d0ObH48cjERpi4YjLJ131NnjKNxxYi3VYIhj8frLVn9BHRjdU08+fc5m4J//peYwM4gWZ
 KHZNEPTtsE5Xtux3L0Z3aMrxGpfBw0gPpRygHZkRrEMPAxcHMd1tf8+JVrbIQfmRwsD9mnCe4
 5N9TuLcmHJMvAzv1f131X6KmEOk1tg+A30FkUlxir2mApLUO2wUUCFoCCZQq3f23JmckHXnIw
 /GfCM3Z5kLmYWoSpE5W6KaSUo3v4XMkmtLEY9iwtv4KrIZmCDMGPe3ssrIJ8A1xhqEw4Z1Dqb
 T58ewmAeqxauRi5GwLnn0CkTERdF5gszbAQgtx0U/9Ckik9meSuI8340vX/TUsynLa26c3wUc
 mLVw4qc31Uo07yunJOmRxrqaQNnkgoTe4p8BO5oflpUM6RyH69iyZI/6IiMh45pv16oNJU1GL
 MGo4+JN8fAM4GoLj+uHj7Rv9OZV8B7cB/3vOvsF5GMNtu+t0a26/mGCXMrBEgruBAABMegqPQ
 uO7VXSHyKV6QuvT5H+iCbm5RLxbo1m37BXcYWgqFtEU2KJQ2X61JnWk+BP4wc9r1g6KZqhYOY
 JpUWB8bjLQPB/VbiKiwve9jdWRFIS6pW9OlL4fIWL8OhDEWzaS8yJ3GzWBi1iMuaN6vdZjGZ9
 QJplEC74FrdaCsXD3iD4HPKC/K+CCmQlhOh/5FUsUeT84/O5awID8g+GIArqbGHPw+QHcagAY
 LkZ4trumWMGT8ABt+ePK07FW3MVIVSyjuylVw38PYvzygKZ8XBZWEiTcvyCWQvpAXDc3BOl3M
 nj3bbLT5R8JGMkDH5Hdu4Q22Q2xZFmclVpMet6gJHeaRDa/vnXmRUj3wASLj/at2WKyzR25yv
 RCbdOJDEfZl/RlQaV7o1sUuRN60voHFh36YzMAtzIqdMeSgbVbWfPUo8dhMj0ROYyCZovS+WB
 sO6Dzr4CvlCS+/gLJjDrzAY14huFljAQRUEV96uv9xstihDxCmRgoTf1Bq2V2peGxBJJl31Yq
 5vfmHCaG8qdoNZ2xzxHpkBruMXrHXyE2FfoKFTpHOPhFrJ+OM07diMiVwquOFhowg7rUGKscf
 shk+/YHORHpZFTLXYQyRNRVtUoRWgiXMQ9SR6g95UOTKiM61e50NhVFF+iwDTiYqYjQCgT/y3
 9V7+p4rtMhLv9Nlb8Y9kAmnPD0yPVpMI4SIuDnC3ZD7qY8LyZIHBZd1RfecubSl/Kq9c15pFK
 OqPeT9Q4ijM8tlZ+lIpLSKpv776tfxHOCY5rVgOpd1y0LabtOCQz2RXXNahBV7jOBxM7aE8am
 E8myfs2iauFoXHHSZn89K2pPi2wosD8RFudZjbf2VQWCF73EgV50Y+Wq7AtR/ddsGzBX1jRhN
 80cYHGFa5CCyFN2pPVAS5t2Y9hHXZqnjSPJb8MB4l5ynpSuodnAPvfrdPoSsKNLgTlxWU9VMU
 FaRtUibw1taBZm75n2vSKZPnjHJnx956dVCusy3XtXLVVGOzGxntm8uOXfD/8cGUdZLVoB0ud
 AdusEJ5jB0lfuwe3AduXvOfx5lLakxormMCietWIfl5yY5R59gmKu8xVHF+CGoshs2388OJXO
 NUhz5FbGE3AhHh84lAumU9tsBFiXTA8c60TNVPnYfDho9qbHLBGMkxoiSn1ECMXa5NBiv8jwE
 aggn7t6LGnR/FwAByXbRD6jqEVrWNqKt78LlYU1ndtxWDxQZw8qit0AFTMzfkscWeM6W7Bh9U
 URHyX50DGQ0FyJ8D7W0A5STljaiPmbXxqUh1XJj4eJyMX3JlufBj1goQtiDHz5iImqytwe3No
 pLnNcBOZL+s5nhJaaLHq+dA+jlKDkcLZjRQazWMWEjnWMnXB6AKZCWLaGbFplMh8WDN0YhO7K
 OLMn8LWNnWR49sgrJkRpbBq8I9DK4j5uW2hWoUyZlcPCdUjM/1PAbiIXvYNbZmBpWgGyC5h8h
 HvtOYsvsb7hpMIasiThiFNOYajv5zmwQRrUL/iUGJIm/cINkBEIZEhFNVIU4IkDEXXRmH+M5z
 T9m6liLu6sPPAHxWdhYBU2Jr9E4GeUFBNr47T5qPRftzh+3lkROdpm2mBeB2wkFH1D4scYo4x
 ypEECjDjXyqshRNHLKZYk0IJ1amGicnYeCyNPSHJIL077GGo8zIFfYiLFRQZkDFwmwvst6mZS
 yuxPc1lJtxuDExX+OHXsWX/MaB4Jzg6MbTCtU0JvE+7oelEWcv9yxdca9TdMMyI+TV4q9D6Z6
 jRps/LfGBdidcTxXeBfuSp1te1bMVz+Of+ZHhVDmYXcUMTsm8fwoyHKzssIPw77Fst++kFLDq
 vRPC79wigl/ib8p7SLdUWRjaifACqnspVodkpx5xcCqaSulNbphN9ZgGMr9uHOzcOLNPUxPcr
 ZBIZRJoyXOsHzC61FAl2hoh0HeQ+k7a5ZsXZ1uGQM/eaVRhK10M1jMayRoCjnvUiOJOmiAnEO
 wgio9DSEwT6sOMcyjn8uzTffZUruZCPPn5/+AmUoyxbxJet0TVlIG9z6Xe2ZVPHA65ymQACMq
 LjMTnooDQw4LOEDkEy2wZNoyHlvZVbMXDJulkjmKyrqnz4b6QVLobyQ2YjY5MdZqmSGVWH0qU
 Qj4YDYvbuzNW2MMa5yTPCHHHFrsZJ5K96XrxYhFqhSQg14IpqmCAweCyygxwbZbs6gisBVgUL
 uNUHcdYHbKOBM+LPn/ULNo7o8jAINc9SvXWCUXn1Xd24V7XAxBaKRYS7IhGZknUethwnJvDq2
 0YKXsHeN+n2g5AwvN6JJi9HsXJXYAH82zYyEHrkwQO/9+ODi5zhq5L7or6jUtSmtdkGuOpnHi
 46Vo53X/xsvnepeAzt+VTFHdrxh1ByR6lDVZpIr0rZlc834Ar2zFaEJtxK2qh034rQ826zqAf
 TFQdjmDH4VtWTQPFQ8++Y2S+OulDIcEaVwnUHt0p/Op4EAw+Gqb9kQM0EAykGZlrmT/0ImNi+
 LmgyUEWLWw+FBbqQq6czUegATn3UrnNh4b3xyV9r8VW6m4bAjbv92TgdxS3ND6QCNWj8b/y2A
 PJDEu9b/7Ew/wpGgVZuFu0NAOUfu0Rm0pOFy8UwJrNbZMtAbaFV4W5GjHq8/Hg4xNgf/GTOrx
 m9W7Ra9xk3/A9nYyN2BKKU/VdSZ/YBITUYivSPqTQd8fCSkkR+LP40FodS112kvM7NCVOTeho
 ZsQLS1ygHrH3vb9dONW3kGHJdixQpOcAjetvgx/1uRFvRDiSzoQCNWNT0IqX6Y2ZKEqc8Y0ck
 1BNYAebWCY1nhp86/AmbRoXVuWUPB38AUpWVFSg0lKN9XkDaKNjK1bNjmdOmg8mFPxLye7QLZ
 s1XSmUH/Dr/TbeS2jnpy17RQumSs9vd05uXVnnH1cCD2YbdRWCcCbP+SHhXQIl7IqAjv2fyln
 ErwJuYZMb0CC14Ef4fgMfHyzGQMOp43Jc/Vtw+LQwtt2+o91oGk7WJYWdVtk9NscF6vFEnKTj
 fmONJ1VPn6PBs4WOpCX1CD5BonFOTy3FEBiSgYvhv2fLdw2ZYAlqSHQTnUjyYVdwFxgmQ+QIa
 S6caR8B3sfCxixCGDyt3DFw+lImQlNPPFLQIJ6Zg7aaTNpTRMH/+FBZ1+EO11Xi07kQrPT3Lv
 dwFph9V07KNBhscTFMyu/DQA3Q9IMGxesNC7EjIzAEkjgKJAq3UOeEY0YF/slBjOgXc4cslyG
 AavPT+put85B5XodMwuSvcqfhrEhHEjf5qd34VefVf8K3JL4eSLhsleOputysyFntZSTn98nk
 If2HOEGU81zQqgC7VVtweznsTYexK3TgyQziYfAT6ivb6W04pJOdn1pIH74QXf9aBor6Dl4/6
 Z7n9H/FEoT+QbFo14Bcriz2uR7Jsp0AvmwlQ6vmrOz0NsRkgfEShLISQM0InYhaLENB4EjV23
 imS4z+a4FW23/9CJ3wmpsrke/uqFWgbIpKs+BDwOPF6Nu89eD7HnxSM0DTxCU1dbInR3bJhWw
 smXmBtPRu27aUMXcMImP4ehw1teCwO9SmqLFPpc8UeZQ081G8L5Nt366tFxl0tPDUYXbFMHL+
 q1J3JWrau3qmWze5aR5yb5u8gkJqkIaLCkjTrG+24ggVGOVV4fo849yp3DWXj64rSz+KIXgca
 5lmoziJjUvXH1m26bPqAb8WPsJjl+253HqhMST6SEZbtlzUh79vdvTmR47ogaetQcfwZA+NpO
 onqt7Ku6d676Nyf7G9CjohSBGbR+t0gMsXDsaBPpAUQtOyHn+jFIEgLonIXDhNB6ZrxCa/qbL
 xm+MuVWaDBrIdg9gKdh+ihm4dWu6kxvIRzchMHCVyn+H2HZgHyH5tcXPbsaSd4n74YkLrgRst
 Q4hTSfkdDoFGh161s8PQ6gqpB8bhu4JEEBsVAI=

Am 10.10.26 um 04:48 schrieb bifangknt:

> Hello Armin,
>
> I tested the modified driver you attached, built against Fedora's 7.2.8-200.fc44.x86_64 kernel.
> The keyboard-only module was unloaded first.
>
> The driver loads and binds to INOU0000:00 without force or any other module parameters.
> Its DMI alias matches my machine, and keyboard backlight control works. max_brightness is 4.
> I have tested manual loading without force; I have not installed it for a reboot/autoload test.
>
> As expected, touchpad_toggle_enable and usb_c_power_priority are no longer exposed.
>
> For ctgp_offset, I chose the ACPI-table check you offered.
> I have attached the acpidump output as acpidump-for-maintainer.txt.
> I omitted only the MSDM table containing Windows activation information; the other tables are retained, including DSDT and all 28 SSDTs.
>
> Thank you.
> bifang

Thanks, accoding to your ACPI table it seems that ctgp_offset is supported on your device.

I will send the necessary patch together with the next uniwill-related patch series.

Thanks,
Armin Wolf

