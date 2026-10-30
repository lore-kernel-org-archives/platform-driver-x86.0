Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793345628;
	b=IeOaPye3WV3b65dnTQKjMJYTHMDzY2qciad+VhClvG2IS4MuXXHpN0/XIh4d9Gnb19Oo
	 LHxSeie/EXEsE9FX++aFq60MApHMqeYiy8hUk8K9mGuhgd1iwjjMRQuBQ8qs5MmiNEq20
	 ZYFgwAUDOCAGiPHC1buiZwJJgz0x0hlhGz69nvds93cIHsvkHNckw7bigo3oNEFF7u0Hd
	 aOzBdmN68CEzDO5pdVqth/csvRXYBTst7z54pV92Mnt9XFIg5J28Ldv/WdS22JuQ/PBjg
	 6hn56j4qRGT/nLOo3fHGmCliwRCGepu2Gu25tGOin8Nm9Ews6l4wiWecW0mDFyZ+Sbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793345628;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=ykKROtBmTTNl5nAn/KX6FyLmKvO/klHGhdfJwaL+bRE=;
	b=Lc1N5Qf6LtCo/+p8pwoSd2oJdQ5zHxfB5Ue4as5vz9C5z4ZahyolhuQnixX8I7In8a+0
	 B1KO6u3MXDCQiHugZndol6uVV4NuwhtxTIk+dqpxGg0LZlbnnCSPdKzzejq6rUD33dJKB
	 1G3NOsqGIgMd/TYcyZalF0FPKEMTJzhrekle8PRAi7XIULFqi3r7BTCdQps73y1RyDjqh
	 6aTmJyieiERLB0se23U1YvmsWS0owjbyaUKWC0MjN0PmMarNpDx5HvB01HYYYAMTCwUcb
	 clT8mxkXSDxFGAFfWzULzsY68VNjxov28CGYi/umVoW1ctKydYVq6OEu7+761KsFH1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=MMJvZwZj;
	arc=none smtp.remote-ip=212.227.15.18
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 885EA606A320
	for <platform-driver-x86@vger.kernel.org>; Fri, 30 Oct 2026 07:33:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 885EA606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=MMJvZwZj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1793345619; x=1793950419; i=w_armin@gmx.de;
	bh=ykKROtBmTTNl5nAn/KX6FyLmKvO/klHGhdfJwaL+bRE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=MMJvZwZjnIBdJR/uwD8xqtXVGbaIGITCF1C8KJ/JB+uhRu7QGp/+c8nKVYvRxkW0
	 x0oek1Gq7VqDcxzauIM26ZDUw+6rryfQ2lGVnW2oKC21Hl2yUXSfF0YMwLWBjhQZt
	 yKKqCfYXBgRAaQQvkhAXg4QE6xKanSWBlIM9aU+x0PC3qxlipQaZWXBBKqN3wYffj
	 3rjUrSiGG3p5YQ3t2fyjER1eSZTe0Qi/VcJoZPFXX/uzzcushWcBqzWO4Yym5QfOI
	 QEV48AKoGru1C2WVUtCJsAjJzr1UlRTdrS1r+kcVSgMui1LO2i5gsnfVHCJE8Bel6
	 9TSABBOINltYqbDhlA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M72sP-1xT2Eu0iA3-009LTw; Fri, 30
 Oct 2026 08:33:39 +0100
Message-ID: <377e5035-04cc-4424-ac4a-890921b209ec@gmx.de>
Date: Fri, 30 Oct 2026 08:33:38 +0100
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
Subject: Re: [REGRESSION] hp_bioscfg causes boot failure on model HP Laptop
 15-bs1xx
To: Julien <julien82453@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, regressions@lists.linux.dev,
 jorge.lopez2@hp.com
References: <CAJOGg3x1KWjXrMpXoCDEMAV10i4Utk8E+hoJx7UW6Lr3uDkbEA@mail.gmail.com>
 <e46ea453-5a56-4009-8b33-900166345905@gmx.de>
 <CAJOGg3zRpJeaoZh=bSqcH7w4exu1Dvcwi73WRBEO0sfbFrpqKA@mail.gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <CAJOGg3zRpJeaoZh=bSqcH7w4exu1Dvcwi73WRBEO0sfbFrpqKA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:b0GyIeyY7HqQfSaZeX+jufoRg7V8Boiv2ykAAWKYDTRdRzLFem6
 oO9yIWXc4kpSG+5PFACR/fL6E/nmqoiPAQNCrVBRC2LkLVE1mzE1kzyNGgnV8OAUC1w6LGL
 H/hotIxMSrj0quIkGEgC+EkxjSXX665Uf65VnYfXfjKuu9FnjT4O/yNykIZDzLTG33Apomz
 EtHDBMMT3wMlPk5EujO8A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:vn52wzbUsnI=;E18j+F4zPQfm91ddncl1DWw8u2k
 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

Am 25.10.26 um 12:34 schrieb Julien:
> The same thing. The system hangs as soon as I load the module. I think
> it is a firmware quirk. I'll try to dig more in the next days.
>=20

I see, can you share the output of "acpidump"?

Thanks,
Armin Wolf

> On Sat, Oct 24, 2026 at 6:01=E2=80=AFAM Armin Wolf <W_Armin@gmx.de> wrot=
e:
>>
>> Am 22.10.26 um 16:29 schrieb Julien:
>>> Since commit 467d4afc6caa ("platform/x86: hp-bioscfg: Fix automatic
>>> module loading"), the hp_bioscfg module is automatically loaded on HP
>>> Laptop 15-bs1xx.
>>>
>>> This module causes the system to hang during boot. Blacklisting
>>> hp_bioscfg allows the laptop to boot successfully.
>>>
>>> Sometimes the screen will go black but there is no kernel panic
>>> screen. When I get to see logs, there are no messages related to
>>> hp-bioscfg. I suspect the system crashes before it can display them
>>> because on a normal boot the next message I would see is "Module
>>> hp_bioscfg is blacklisted".
>>>
>>> I think the hp_bioscfg module should be disable on this hp model until
>>> a fix can be found.
>>>
>>> #regzbot introduced: 467d4afc6caa
>>>
>>
>> What happens when you load the module manually after booting the system=
?
>> Does dmesg contains any interesting messages in this case?
>>
>> Thanks,
>> Armin Wolf
>=20

