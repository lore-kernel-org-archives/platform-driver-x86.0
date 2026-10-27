Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793121177;
	b=aPkQCsOTWqCCGxEikYRdRK6XjZ4qCq0kCTG+Y79wH1Ra9R8zR0TztQ4JdkRCbAZFIvtH
	 xy0qLwUVLvSK11/PeG4aHSblHz4nELb8Xl2SLr0SdB1QyiKyH/pe9Vf1tj7xd/mJKoVgD
	 9834ugb3LiN2fm6f49sHLnGgyOj0q4CxBN6RSk8Z8IfCSz03uOM6dkev02RP6geLOCai0
	 hTQ84Zjuyg9p+NYcQeBo06Q6KYwNj7rDmOObibpCsD+TMUTQKVMROS8MKxef0hw8vzLUB
	 DFpmW0sBhYnFYGa8HjF+r1ZGQEpBH4QBfBOR8aPTXyEuKyUssaPtoeDiL/geXppn8pQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793121177;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=QClNyW5iQFMOagT3dyPfUhIikBary6YtAyIjnpBimdg=;
	b=AHlx61GzY8jsVSqt1N3/+EXqFTpDco34NxDsElS1QwMkp6ZWLw1nNRw85teq4iKAHWAv
	 0OtQ9rIbxZbDW9f1swQQCqKrU/uQ7GTDBANTq/1eiZ4TkglzMwxc5sAM5qGBrGhXSSuAn
	 Ltw4QHDLLyfpmAq8O0Buyq6LrqWT+QI1UEIUrvzIrlSGmyRP2BwSUMNFEIPKShsfwxNgH
	 b4M8k91d/Y+7E90buORbBO2SESKpAoZo9zvkKSKB+OZCj70Ua0eOZW+MUJmolOtm5LiRH
	 lngVX76v57TUO4Ipc1cKYssb2bxAZSjtEYUKTXVv5iPq13XQ1K4M1vcZSH1iL3JoG4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=A0DPTZ+n;
	arc=none smtp.remote-ip=212.227.15.19
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9340606A31A
	for <platform-driver-x86@vger.kernel.org>; Tue, 27 Oct 2026 17:12:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9340606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=A0DPTZ+n
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1793121172; x=1793725972; i=w_armin@gmx.de;
	bh=QClNyW5iQFMOagT3dyPfUhIikBary6YtAyIjnpBimdg=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:From:To:
	 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=A0DPTZ+n9DcrQd6vbPxPNamUXB+m4Oyv+vSgxz5JObSC3Yld9nulyr67HSFW7I/B
	 bOlZDAp58h1UzPQTt9yMdfl1A+ykCXrrGf87NrhFXbu//iPQLh6yNkR5TDt0uIoi9
	 33QHsU17Zz2viiVEMx3BeEBcSix0sAS2Coqruxxw6TXo4+gsDEBcvDXX10+Z8wFnV
	 Hkx/S/fdE0YD4XHtDc9ZUim8GhDg0OpF1MhE8Fhn1y7atMhhJhMDUMvcy7N0Ti476
	 L5F3+hUG59Q5E4z7gzegp3SkYSobqIoxxhx6nmjTBgAyeaGIjfY/WVFLIfvTxODbf
	 pH21a/KiTsqAwnnBFw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MRCK6-1x9ZWi31Ua-00TL2j; Tue, 27
 Oct 2026 18:12:52 +0100
Message-ID: <5bf98aa7-ed41-4711-bbac-82a03ae97b87@gmx.de>
Date: Tue, 27 Oct 2026 18:12:52 +0100
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: OptiPlex 7400 AIO HDMI-IN button requires WMI startup method
From: Armin Wolf <W_Armin@gmx.de>
To: Teodora <teolyub@gmail.com>
Cc: platform-driver-x86@vger.kernel.org
References: <OOZENT.01UBB4ITK3LK2@gmail.com>
 <e0d0d6a5-105e-403d-876b-ab87f0f7e5bc@gmx.de> <GKEFNT.S9KM2CS7X855@gmail.com>
 <721a18ba-d35c-4376-9e16-07739979387c@gmx.de>
Content-Language: en-US
In-Reply-To: <721a18ba-d35c-4376-9e16-07739979387c@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:O0vktrVkv4ELJDAxZ8UwqJ+dBq21cla0wOOYU4nN5243rBgIgSY
 D3Va8+FDtQ9bNoBuuiYzSdfyLHinSCgmgVFKjkJ6zzs/fUHj4wrDIZHCwLOJRNVzCWCFU18
 IXUktb9+JoxxmMvNhD53Ve9HODVFGznaXEQwRbu0yJtZAzivkXipUFJrSd4lxga14MV2trf
 D10xb+tzoyvm77jXr+AHQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:nrgDGg6ZMlY=;dUD6WlMKWg6hSAS+U3QedhMdTQd
 wZkKMdxUk/Yb/dpg5mfoGq0hGENkzAJSPqhGScnd2ri7dFtsh0OJzS2Z2LZPQ4gM0ToNixjAV
 3PQXLBsEcnzk7EhJhxRZQ2Jdm1h7tUx5tr2/0p+io2a1x8O2SEYGTJhRP15m6Rk1NTt8ezr09
 VPnCcWZGChBFEWtuhROB4FhXk+f2Jsof6vMhzQSlFFJnz5ovjs/CssrioCMPhGj9XF2XAwek4
 1PGWtbp4TEKOIeQvOeIMiQzeNvnRx/XeYmsHoY1YtGzLO++iqUKL1Y6dfkvIZJwl+cj3vLt4Z
 05XLFB0+jjeJJvF2xKi5s/F6hL+Rv50NVQYjQ/S3ZCNfV+xbqKJisH2r9vwuAWMH3cAWZuA8w
 ZMAo8Vj59zcrNuNRWn8G4b1qigosFImPa7XPkD0lHis8VS9Crd2Cxe8PFN/0iJKrKACn4V9v5
 R2PAK73okHdMasa7POoy2mBrTwRESCo8Xn6wx3xbmsIyo3LtoMfpfNLmqkPtzqut4wJVkG05Y
 dEeiX0G22JsxbL+ynARTsTg3B+qiEAMACGDfqUcD7K8l4z/SIl4715yCEGfZ/4ijw7YV62e0X
 K6ZvvpYMhtudseIvMU6DMT/du4BJ6CJas0G0/lgNo0fsEzpVDNXDdecVXth+vZXfDxW8KYzec
 0JK4uDQlK4SRaD0kFv5wwzHBHtR2Hu6Z1XB1aksS0jYhjIH2E06qxi0zPB3ZH43oDWC4R+bpx
 kyblNJk89WH0MG6aqXkbV/1ucsvPe6zuswMVhvXnPzirSpEjH/f8hhLCJp63WvmhuHTii9hzA
 WWcDQYlHUmh9c4d/oLdrLbuQVBzdue4cnO6TFK5sS5ET7tqMgXQmM5yKciAUQeciAtKLklbea
 h6dst3d+kFeLSJ2qiKAm6TcENUPCUFanYa4QdK41S/rDMy4rUT5LRewiapRLBMbdSrkOrU2QL
 42FopQznYeA7f2O9u+ztBUb4S9ZZap2b8kMH5zo/7Lcoap47p2DYC3/j+ENGTC1BYD0qjC4uv
 E9IaB191nozd64t+wySnGSzmmf3ufZ5/w30c+A+xst3JmOpSW2wzI3lU6cLNPVoSoLblzPtEa
 Wp9+W3m+W6bePFA5z55DHH+LYVjCpBfccX7V6cETyGQhfHV2QOMJDyNRGjwMH4PyENlCPmmRE
 efFErdFduiDQxmWw5gNLD3koXkFCP8lGJ471VlX8mLFzlLlgKzp/Dp321CX3krvMdk0lVtrhn
 VJUCX8BGsEqkKoz9nHQupOOGHb+KlDmVf86sOe6MXk5hfcGnqlJ+bFuIeNWI8MAwOXvUVD4o3
 DMQR7sfPe4xE9hxolQp2hHp4sJsvyN6XKp9BcpT0lQz/X0DMMQkt/absS1KHt3SgYY7ZogKQT
 jXra2yLFUfj2Cq5GA9ekptYT11t7TFeiq/OccudxTx3UuhPnuvz27g49KsyST7zDDC/IiBkxg
 Z0FRzHHsCDIv1vrvxx/2QCVmoJxtMEp2zLmOS6U+bDUMKtWvcslQ/DZ8iKGl5W3Cdgi2JDLEA
 Y3K2SZvADUL0c0Vhwz5Put7DVMjOig2WLghyc0qdStlGWjG1affPMh5xNOYVF6oUNY4MA0JZj
 IXgbgfXH8sEvdD/WiuRLE5/9Ud+hZ76usa8APTH8dzApVVBIgV4ucUJn61AJ71wdNcRyQH+wV
 gPJQYl8j3w9U8PXCekpHHbDljOHSauMw5ouWtBwuYhbXu2kingvg0Jri+3mcXguuE3HOKVPHp
 NlHVLs//sK4+/jjslPYeaCYQCb07FgFWlKowazZ3dn8mXi0ZcH+Xzom2EwFqNAkWeJL/bqnkF
 DVsDbKzzaa47yWUfoFdYBfB2apccslI3FzdqezNpotR7EYeamdN9KpyXZpJd145ATSIqSuY0A
 pFdXI69WtRhHJwLqEi2E5Br5lJXfGhiNbcwzth5MhwA0f7oSmWPC59KVXUS1ZD075f3ZSc7Td
 vKiylrpuu+XQvUUNw0ZCwJtDp98J4qbSNkuIapihdTcQdR1h53mRH7vSFOj2/6SuJBi6Qjidx
 yd2FLac8FrP1oXwLiLQ3Sr775P4ecAnKHdchg66pJxLUdxTXNSo89emZ0o103PHQUwkxa77AA
 /1z+p0YWDQXJss3rG8cHleMacSYqzb8GvD38nKBzzJuyyL2WEhrzRyLhBqDpfrwxnxK4gKm1h
 q2i6HtTTGVSIkLahMgTyZ3Sxyj9gaXpioaOYNBKgF9DK4dIjhUHkdFHQnh/HW2tCCn+qpO9M/
 Vgnz8CJ5mqx+qr9198RwdmI8XwywDAKHLZfkTbGI7i4sCKdDLORNDG59LyM2UMAMCr1gYOomd
 0VRkbEnpQuuDITNQsrwGA/5NtmIvCrG/FxAkTIRl8dAXJLUMXsk/HRlG1N8mzwDr6GGgYp1ZQ
 3u6UE/40BvP4E25hQRd+o3eDrtlQsZdaZuSk0KsUPoZf57NJM9nGQbccPhaziG4aRqmUD4N0h
 p9gsSf60j+ruCFXc2y2Iv/Rdr5U2QSjWFFbIhEKf0NIXCSc1hWGCWoI7GWO2IbKDsOmE4zodT
 0XSUERUMF1kK7lFGNv/yR6HuL0dLNL0Di5QnVsoEaBcl2YgLzTIRRrcphaUOn3V+KAG7ABVQ/
 CZ+oHdIfpfbBUz/PW/CuEubVEg/kNquvwvisfvTdUrTM0y+//oyJHLyHZy+mi7l4m6oD07Ftm
 Cx5196XJk0YQvBIug/ziQBj2EEtQXM9NACpykm9fSWoEsrt4CEfxNIdV5EAnocOyEZvTr+Ez2
 Lz0VeNDPBoBWhg6Qqr4E6hyulk/ho9zr+wXeUn8STUxRuKsmYfkGmfcI61VxYOzr4tF9eSQsw
 xnalZYuyM5I26H2VECg6ZNdQXEP2K8w20m+slmqHruz5Z17Rmk93K+xsZ7gJHWCsHznp6gNLT
 5xuv1dXt8TaIXHo89Am7/32cpdgxy4dsejlNCAUU0f6FmWKmz/Qwf4UZb4cH8ZWWnYnAimhNq
 dXC/Yx9CNQJRn0Yi/H4d24MES9FZdThN674f0T11DFVAMbxtGNO9NOd9L4O2F5CQOp6iPrg5/
 7V0sm3Oyl3lxrvx0aIAqEvKYEkR4J7UciRllSfFJO6HS1ol2RQcRF2NYo7TJqD/p1fHAMzI6D
 gwT938KEg6X1ZUzrlue12GXtcqdUGTowUhqWhaTBvsXlRr5q7RQ+eFLB1fD1lI/sHPYWHmVDL
 aGUGjzg1N8p3hSwfUKA7fvBENcG0wp+b+Qo/fBbjOLGTgZyTvXZL9im2ZG0XqyX44Q6/uW9KV
 obpnhCCyarRgfyMnTl6ekmhYk+2hR46fg1k/D/HWN+4+K8HmZs99xgnqQmYXzn+EJ+k5PsKi2
 BiZo5qO/JMEzyjCuLKxorRGZOQ7QJ70/UooKGYTJ+/83f+8EYDHgxt/vf5RGL6dTM+5IjQu7p
 Sy8qlvwN2Hm1woYoIMcqL8k5qJvALjkpTQTDRnrHKhpyGwVaPBB8zF2QzWplbWn7jiilZA8vQ
 WRK8VAwGa+osPsju8jGwrF7nHpimQo2jGOqWH7bm6H0ghRSKqts/8OZvgHpm8M0ClVamRumO5
 gmHGTkBahoS4aDT7mnziLwWzWmdcRa8pUXlR7CKPPw9sTGcJpJyUimusfsbRsLYcUvjpFTsg/
 E1I++4Z5RJnRbbPuDyG1PK13T5KhB0KyXxMKwvHZVbYtiQv6Vv9e6086jsLTxE9fPafzK66l1
 OELLjs5JxXnsC9VAnk5bsSVDOFM8szofQuyN74PcUYG+MC8NIWHO2hutwyPyqovZJMC9npocg
 uCdJbOEDSiq0eZIGvn/EaZnZoUd9d4j+0j8dkrgqgHpvtRa7kZQt2V104GaF9E1sRQIP/B2yG
 9LK8c10RZsYYotRZahJznxzhS3IMZYyesrYXcsy1TBCJpZ5e3rRAEciLbU6cdhRZWpakgr/GS
 h+pPoXQFYSKGvaQe5lzpJRByu0zsan/VqAUwdzUv1qd4hVv18TWTFNEkQwp90VRlV/NsMPi3w
 vo0owkcTg+ZQ6M63AK+Czp9j1jNVwBFZjJdLViARhYsHCA12gschNrfQn5Xxz0xmXndqKo+dT
 vUdirCYNOFbn6pp2d1Fkg6h9Indg/pqFtmaKtHkXMKVOUmmwQUBywTRzeLO6RInLw5SsXKw4Q
 gEPKO76mXDsj0/Kh4HRKm0iL7Sb5cw57PNk5rcS3FXnsIUCR1Tp27EU5wb44bmb5KJmxcKWRK
 rsWIGMz4u+CmW7brU40W9mR2pTPmIZTyi80lWytc/KMgEgamWjfKZgk/2BgBGW/pnDBReygVV
 05c9GnqQmm1v+RB9MaQc7eRJrLkDsKujnSPma23u+IXjRyV3Nc/8Yo0N0vEqGfcTrE+ptHlHb
 jVVWKllivy509eF2Xve+QaHooztlmnklcaUwWLPxZyuE/w69cJ3ihVSRaqc14z7BGzXRN1EWN
 fMq+KTRZ4WUx2YhmMv/pfPvcVNxSyN+QfshRh9m8NK3/82wGfWhAkMhn2C6bikc51hefcQxN0
 9BmeZbouBqrKl3cELhYyND/24+D3ubuRYd6qZWckxeiYmN3Acngx9VC16uJIZi1Pw4nKHMb7H
 xSEibnXWJvIGTtT3lnIwHFdkKTZ38eD7HmA+OtdzOy8O03zmR7ffNhbqAtJT4Y4+RunXCwMzU
 reObZmt61QJRugIeAQk2zetUIdr48UUYINBzZNfYlxK0Y+WO5bRsbZDfQQPgVm30olLgkQjFX
 O/mRkuhJjFvSKyCO+gDp08/9+wcC4oUvAQshfBfEbtJsZnY1XGFygianGdpEIOlNAR6yt+H0s
 kVq5DoC1ixnw1f1lxccX3XGKWc43MI/AyzkGfH6AU/dB2T2HN/6rwmnrv+IRtSyDUpfeQohWH
 AhmuClbTnuRWMTSGAmY8QTlww/0q3ym33DxDa6b7u9FKn9irmPW0j7SMgEhzYoDgs10hNHgUf
 zG5HZ+5YBsnpybXZ1cqCWU33Ly+g7Hpyn6BRx/TkQPdaec8n5evfrUuQPO4rjA859BgktQQSw
 Tlt71Trdg8t2BYZOnEfPKg9pRVq3GhzqQEXJ3AWdwXsxz31Mhq2buSLdrETCJiOImt392oc0l
 ajbHCqum+q5yUsg2mq8w9LX6fj6fXDF1Hij2Trnuk0niNKfi3z9xk55htk1D7YYpjES+Qt958
 tDAnqCPZwkHBnpJsim8uY6p1021ddNbIOvK27iCl2OI2QYXRw9+CVPk5kwhIJKkLVlBqwp5YY
 6PpPU/MQLgyZH3Y6yQ3767xcAeSRE4IW9DeiTyu56+Bl/PO+9IVReOMWADdbP4wyUJXmVoU/D
 8+gX3EkwzB/RxQNsLGBIqHeceIEFZxvBvgNjHm3nKWSb8BRgUYAlQmL03KwSveIy60nyF6ftS
 b0FIJ0Kb2lh46MFqInM/4akH3TVW62MyH1kxUYGMSksjUbwE5xJTmenPSsHP0pyI7ZIccDUhs
 f21InguhhT1V+AN1Ul47yrGh2X777zhSrJlAnLFOtXrwCb/cVQKqjwDTBGvzYkXyITNRhGyVD
 TSwC5FQbAgE02LcJPAwcUmfPDmAS8xjSgzq7Lp0C9GEWSBoUptFALCnRjPUCmq5O5JkcGbkBG
 NehxLtUsRFqNUG8CwGseWsuV8TWUxvfkteH7Anlp1vymp2/9fifFZIe+aOxlK9HZ499JWOEuM
 eKDPVcFGy9BV3CRjANgvGT5ZDWMVtbabNwYOjlv7QM/d9sdAly3tDKJc+rD1tc5xsbbC4iB01
 r5FaWaMbdaQoCMbOD+Zpfg5aotdvkzZm9LprE58iccBj3kJfL0uEEDd2AfpU+aormz4UqllbA
 QXo981lCpkEsVtjQcNgcmEyejXYJ+aEQdHBa6UclPjSCm2CXsisfAhvqlQUvjgky22D6h7FbX
 kqEaoNVrmf2moq4imkgpU01WTa0HwPTRSIPJMSG7FqGh+J3QkAC3Rrwuq7A3hBfZciGRuwMm4
 mHifw0PrvbZgiELTcxgtCPy2drTzL25BPSMS0oy7jk4aNCsn3YQI3w/TK7P+DcSClEA70wrVn
 o2MHUphftRdQEP00450z3pqsjxd0TkIMp6y8ZAeEAjTomHW9jcaVVokm6cYOUHHBHH0KH3lp+
 ayLhhn/+EuUGuRS4QSPElnY3oxHcFNTPF3ptIH8znGMsb7xeBo1bfNy2wVBT6gROZzo/4Qrkt
 QBW2uWT0R01POtb4ldFzQVIITvmng06T9fAviglGeP74YN1nUgP4wl/FxB748IlPCepfQKDZv
 WVv0f5wz5vZlTakaUuwKPOphgG3G8OS/dtmS/UJRns19OpR7s6q0fHUxPRgEJ5JNKpXEmd7KJ
 XDoiOd6Bzzf4N++7QhaSUHoGBMih1xcKaV2+xXm9aq5MCPEl8n3gSnYxQgTThl5kAm41f+M38
 4NUdIqtZQc53qNoS6HNECQgC2qz9adS1/GvtPvPhBgTGJ9dcWBx8RYuZYdXDeRSKLlkG5m/US
 AxThjeohdW4TCi5PvggpR7fdNBEOrHhvpOlhpmgQcVIxhun3nuqo3GXGbh5uhS24xTGirGmX9
 l+8wP61rfMusrlj/EmyqRI9OZ4c5NZG0r5yFxPpa/pnSQvPo30JRJ0U3tDhZyv1zKdXda5c4K
 JLkvVAsGbRRbRqKCY8tMeGT1tmSsN8zBlh8Swn8vXT4Cg7WzYaMcwIA4csmnghODZfbStl8M+
 +Js+PUmacwMmLD8TuhXXSI+NP23RkDvpLfcaczX62SI63FqpnWJ/xo8lBWszLUIENxVNTLSoY
 YkjM/p4TjediP1kvomTmOIhIws21gjOxca0gNEkhltt4tPC+huPt22+3uV8RmzBVikSbk8fdF
 4a1J1PUKhUAZ4apTDJ0tnDQLuR88oHQRBjMayocDRJ6ILbLVmIXlCfzDeQ3HDlM8KjZFm+8oT
 Bn3PNf+FdnURvUaSgy8QK7XDf/fa/pNe/hHitE/rmb1Pn5CfX2tTYGzr6oLFpDOq3pU1FYQMR
 nvJO3BRuZ5/9kqSqWEwUkhH8ZNjrz9tkCiBs3TfCLY7uW8lPjOAUmagcdvffWaeYgJ+cu3WSj
 NtuyazBCpDZAshq/br2xwr8LwdY7NE/ESVeXj29u28g8k+JD3iVfeL9OBZ9zKeLeT2wirPPbz
 Et7uOjUpdr6q8oYSTEwqXplbVIHeIvQjfz2ya0TKEXfki2wIFMiJsoYY2ml7esjQmJH3L3Dw9
 mPlungV2ElsZdUZUoOmittL9er7laVgo7rKk3y2G/IH8fdYoV8ouxXcMfAdgY6M716KoUpWfP
 A0JcSrMnOMDFtx5BZpE6ep4NobmCwiurd

Am 24.10.26 um 21:14 schrieb Armin Wolf:
> Am 24.10.26 um 21:09 schrieb Teodora:
>> Hi Armin,
>>
>> Thanks for your response. Attached is the requested acpidump.
>>
>> Regarding the other methods on the same WMI interface:=20
>> DellOSDService.exe appears to invoke=20
>> AcpiOSD_WMBC_method::PegaOemNotificationStartUp. The companion=20
>> MediaButtons.exe also has WMI execution paths for=20
>> PegaOemNotificationBrightnessUP and PegaOemNotificationBrightnessDown.=
=20
>> I did not find call paths for PegaOemNotificationStop,=20
>> PegaOemNotificationRSVD1, or PegaOemNotificationRSVD2, however.
>>
>> There is also a separate AcpiOSD_WMBB_method interface used by=20
>> DellOSDService.exe for a method named PegaOemReturnUBFR, but that=20
>> appears to be a different WMI interface.
>>
>> I can boot back into Windows and retrieve the WmiMethodId qualifiers=20
>> for all of the WMBC methods if that would be useful, but I have not=20
>> done that yet.
>>
>> Thanks
>=20
> Thanks, but i do not think that this will be necessary, the ACPI tables=
=20
> should already contain the necessary data. I will check tomorrow and=20
> report back if i need any additional data from you.
>=20
> Armin Wolf

I have written a experimental kernel patch based on your custom kernel=20
module, check the attached zip file. Can you check if building and=20
loading this kernel module correctly enables notifications? Please also=20
check that unloading said module produces no warnings in dmesg.

Thanks,
Armin Wolf

>>
>> On Sat, Oct 24 2026 at 20:52:25 +02:00:00, Armin Wolf <W_Armin@gmx.de>=
=20
>> wrote:
>>> Am 24.10.26 um 15:48 schrieb Teodora:
>>>> Hi,
>>>>
>>>> I have a Dell OptiPlex 7400 All-in-One machine and have been=20
>>>> =7Finvestigating why its physical HDMI-In/source button works under=
=20
>>>> Windows =7Fbut not under Linux. I wanted to flag a potential solution=
,=20
>>>> though I am =7Fnot a kernel developer but was hoping that perhaps thi=
s=20
>>>> could help the =7Fcommunity.
>>>>
>>>> So, my system details are:
>>>>
>>>> - Dell OptiPlex 7400 All-in-One
>>>> - Fedora 44
>>>> - Kernel: 7.2.11-200.fc44.x86_64
>>>> - dell-wmi-aio is present and loaded
>>>>
>>>> While investigating the Dell Windows OSD software, I found that the=
=20
>>>> =7Fbutton generates a WMI event through Acpi_OSD_event, GUID:=20
>>>> =7F02314822-307C-4F66-BF0E-48AEAEB26CC8. The GDat payload generated=
=20
>>>> when =7Fpressing the source button begins 02 00 00 00 F2 DD which=20
>>>> corresponds to =7Fevent/scancode 0xDDF2.
>>>>
>>>> More importantly, Dell's OSD service invokes another WMI method=20
>>>> during =7Fstartup:
>>>>
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 Class: AcpiOSD_WMBC_method
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 GUID: 2D703EE8-36AC-4F88-BDB5-7556CE6B2946
>>>>
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 Method: PegaOemNotificationStartUp
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 WmiMethodId: 1
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 Description: "Invoked by AP when system up."
>>>>
>>>> Linux exposes this WMI interface on the machine, with instance_count=
=20
>>>> =3D =7F1. I wrote a minimal test WMI driver which binds only to this=
=20
>>>> GUID and =7Finvokes: wmidev_invoke_procedure(wdev, 0, 1, &input);=20
>>>> using an empty =7Finput buffer.
>>>>
>>>> The result is reproducible: After a normal Linux boot, the HDMI/=20
>>>> source =7Fbutton does not switch the display. Then loading the test=
=20
>>>> driver invokes =7FWMI method 1 and the firmware reports success.=20
>>>> Immediately after, the =7Fphysical source button works correctly and=
=20
>>>> switches the panel to HDMI- =7FIn. The test module can then be=20
>>>> unloaded and the physical button =7Fcontinues to work.
>>>>
>>>> After rebooting, the problem returns until method 1 is invoked=20
>>>> again. =7FThis suggests that PegaOemNotificationStartUp is a one-shot=
=20
>>>> firmware =7Finitialization which Dell's Windows software performs at=
=20
>>>> startup but =7FLinux currently does not.
>>>
>>> Interesting, can you share the output of acpidump?
>>>
>>>>
>>>> Below I am sharing the small module I use as a workaround; this is=20
>>>> =7Floaded once on boot.
>>>>
>>>> // SPDX-License-Identifier: GPL-2.0
>>>>
>>>> #include <linux/module.h>
>>>> #include <linux/kernel.h>
>>>> #include <linux/wmi.h>
>>>>
>>>> #define DELL_OSD_WMI_GUID "2D703EE8-36AC-4F88-BDB5-7556CE6B2946"
>>>> #define DELL_OSD_STARTUP_METHOD 1
>>>>
>>>> static int dell_osd_probe(struct wmi_device *wdev, const void *contex=
t)
>>>> {
>>>> =C2=A0 struct wmi_buffer input =3D {
>>>> =C2=A0=C2=A0 .length =3D 0,
>>>> =C2=A0=C2=A0 .data =3D NULL,
>>>> =C2=A0 };
>>>>
>>>> =C2=A0 u8 instances;
>>>> =C2=A0 int ret;
>>>>
>>>> =C2=A0 (void)context;
>>>>
>>>> =C2=A0 instances =3D wmidev_instance_count(wdev);
>>>>
>>>> =C2=A0 dev_info(&wdev->dev,
>>>> =C2=A0=C2=A0=C2=A0 "Dell OSD test: WMI device found, instance count =
=3D %u\n",
>>>> =C2=A0=C2=A0=C2=A0 instances);
>>>>
>>>> =C2=A0 if (instances < 1) {
>>>> =C2=A0=C2=A0 dev_err(&wdev->dev,
>>>> =C2=A0=C2=A0=C2=A0 "Dell OSD test: no WMI instance 0 available\n");
>>>> =C2=A0=C2=A0 return -ENODEV;
>>>> =C2=A0 }
>>>>
>>>> =C2=A0 dev_info(&wdev->dev,
>>>> =C2=A0=C2=A0=C2=A0 "Dell OSD test: calling PegaOemNotificationStartUp=
, method ID=20
>>>> 1\n");
>>>>
>>>> =C2=A0 ret =3D wmidev_invoke_procedure(
>>>> =C2=A0=C2=A0 wdev,
>>>> =C2=A0=C2=A0 0,
>>>> =C2=A0=C2=A0 DELL_OSD_STARTUP_METHOD,
>>>> =C2=A0=C2=A0 &input
>>>> =C2=A0 );
>>>>
>>>> =C2=A0 if (ret < 0) {
>>>> =C2=A0=C2=A0 dev_err(&wdev->dev,
>>>> =C2=A0=C2=A0=C2=A0 "Dell OSD test: startup method failed: %d\n",
>>>> =C2=A0=C2=A0=C2=A0 ret);
>>>> =C2=A0=C2=A0 return ret;
>>>> =C2=A0 }
>>>>
>>>> =C2=A0 dev_info(&wdev->dev,
>>>> =C2=A0=C2=A0=C2=A0 "Dell OSD test: startup method returned success\n"=
);
>>>>
>>>> =C2=A0 return 0;
>>>> }
>>>>
>>>> static const struct wmi_device_id dell_osd_id_table[] =3D {
>>>> =C2=A0 {
>>>> =C2=A0=C2=A0 .guid_string =3D DELL_OSD_WMI_GUID,
>>>> =C2=A0 },
>>>> =C2=A0 { }
>>>> };
>>>>
>>>> MODULE_DEVICE_TABLE(wmi, dell_osd_id_table);
>>>>
>>>> static struct wmi_driver dell_osd_driver =3D {
>>>> =C2=A0 .driver =3D {
>>>> =C2=A0=C2=A0 .name =3D "dell-osd-wmi-test",
>>>> =C2=A0 },
>>>> =C2=A0 .id_table =3D dell_osd_id_table,
>>>> =C2=A0 .probe =3D dell_osd_probe,
>>>> =C2=A0 .no_singleton =3D true,
>>>> };
>>>>
>>>> module_wmi_driver(dell_osd_driver);
>>>>
>>>> MODULE_AUTHOR("Dell OptiPlex 7400 AIO experimental test");
>>>> MODULE_DESCRIPTION("Experimental Dell OSD WMI startup-method test");
>>>> MODULE_LICENSE("GPL");
>>>>
>>>> I hope this would be useful as not having this function has been=20
>>>> such a =7Fbugbear for me over the years, especially on a business=20
>>>> machine.
>>>>
>>>> Thanks,
>>>> Teodora
>>>
>>> Nice work, i will try to check if other devices expose the same=20
>>> firmware interface. If yes then we can for sure have a small driver=20
>>> initializing this during probe.
>>>
>>> Does the OEM software invoke any other methods on this WMI device?
>>>
>>> Thanks,
>>> Armin Wolf
>>>
>>
>=20
>=20
