Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C611B3948
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Dec 2024 12:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735044947; cv=none; b=PXm6GqJ2svkB53TZnE6qMe6e2lOQq72XVkUkEMkU/L62ofbreY+c8735inuvh3Wg6sIini+vBHEPBT0qZ0Sf6CfKp+7Hp+W6HxzJ1paYNeJ61k5AGcovNlQxGGOQ2qLMSAD8173sbtw5dE8CP6eLmLOHU2G06XTm/JUoV3kydNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735044947; c=relaxed/simple;
	bh=4TF6QUcK+09jdzjQIMv5NqU4OQGqHpYmh3DNwBbGJ6I=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=XWwx1PUTsF6OEsp5z/gtn+ijhNEnImGOGhOHxGpzE4McaRJ4HfOhIqBafzRK5S4d5NdPACOKzmB5fu680W5zCOey3vhIt1Sx5IyXhbOm/bTf+wQq/4Ob+JI7Q7zYeiKbXtnDbL+njbzplue2BgRlTq2T7xONYYnQlhHEGpnZRlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=Dn6bVwuW; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="Dn6bVwuW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1735044942; x=1735649742; i=w_armin@gmx.de;
	bh=4TF6QUcK+09jdzjQIMv5NqU4OQGqHpYmh3DNwBbGJ6I=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:From:To:
	 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Dn6bVwuWzrkzFoZsPRAIsVU5XLfPse/GuePch8lvLTC6OuYgsf6Xqa/+aRlQoTi5
	 dseAAlvPZv/f4bWjnNFqTPdNPp33UNGFHjHJz4ct1a+x6ujUOSci9zNLEWC4Y4PoG
	 793MG76wrUhLO46kthtopdvMUVSVJeV1YER6iyLvjmRq+IiZmF6lBwahQ2hSuSPKc
	 ypDW8RA5I/U4M1kSvLJwhG+XvRBMj5DtNtmAM68uV4Vsgor3cLRdsrvkDN4geiIQ3
	 8au+TXK/xdIG55agTxgb6LSLb4aRDm0syjloRE0DrBidileEhVfEOChETpMQ0AQnu
	 941w5ajP+Ne6bW0LTw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.14] ([91.14.230.110]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MNswE-1tAkUQ2NGi-00P9wv; Tue, 24
 Dec 2024 13:55:42 +0100
Message-ID: <d7be714c-3103-42ee-ad15-223a3fe67f80@gmx.de>
Date: Tue, 24 Dec 2024 13:55:41 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: acer-wmi: Nitro button doesn't produce a WMI event
From: Armin Wolf <W_Armin@gmx.de>
To: Hridesh MG <hridesh699@gmail.com>
Cc: platform-driver-x86@vger.kernel.org
References: <CALiyAom1xDH6A0Q2WNHCMUcpMJfM3pXO2DaW=bgHGUi8ZOpBbQ@mail.gmail.com>
 <8b8749c1-59c8-4f95-a43e-055cf94f9597@gmx.de>
 <CALiyAo=R1kcvwRpw22s=YU0YHUxR8T_WHLwSvDr=8Ahsenn-jA@mail.gmail.com>
 <9c625119-e46e-464b-933d-9c836577f454@gmx.de>
 <CALiyAo=7kVi4ipA5-xDfRYQ-gqyza0woYHUzwGuW5BccLOVHgg@mail.gmail.com>
 <209f39ab-a312-45b5-981c-8324d9b8cd90@gmx.de>
 <CALiyAo=GpKN2Aty5c3Bw0Vh4U16vgUP29pZkaeBsOKw8kcK29w@mail.gmail.com>
 <c5124fb9-74af-4c90-9edc-ddb3517cd9ac@gmx.de>
 <CALiyAok0_JKE+BkUQxHHH8Z39FHq5bW0Hb1Gk-MYHgDy0yFoMA@mail.gmail.com>
 <cea0918c-7c7d-49e1-8b33-b952b64d67f1@gmx.de>
Content-Language: en-US
In-Reply-To: <cea0918c-7c7d-49e1-8b33-b952b64d67f1@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:x5baOGwE8gLIBVs/EYzvUkcLh8+fWdoejQTrPunvz5xs/p0pXKT
 TFqopbCklvnwOn6iMAS1hoKTr/aIKiRLNvfx+jYP5UKScz1SxWmnmEYihgF9fwnpolZE09C
 0R52AqnJB7kY18yLG36YYWkgFQypCPt/TEst9/3dQ/sH84xUhZOuvq/W5T9o4B4HNe43qwm
 qBfWH/QjlcoMUNDAENBDA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Gp6DoHCWvj0=;NiwVMKVECazCuC9vTLABJdle3Eg
 0Itcw1DeNjCQ2mV/uJ+rzu/B44qYVbZWKNy5F+Nrhowaa0d2noBKOmGYg1t6D6rSsYdAniSsA
 3+gRCGQb10VNimynbqzXKkfrxxk3TTBf5t+ao/HfY4Cyo2vHWPjGlyfo57jeUwP/Agp/eKHKl
 kmS2O9zInJad3COYEzOmO7kw+tzHVl/hb5++Njmvi4BKC6P4LMLE+547+l1o3ZiIjeC9P/CLu
 UU0WKR5bRF9dtb76YujsPIcQrz/3CrPzN1w16ryh2mQiClGdj4FzxMhU4Bn59ga9QXd+WkSgp
 r7blC7eTmAv9Uy+wNhRdUFHF7ZRt4V9BMbVgw4FYAuRY3KdKUY0i1qZ1+jpv8Ah9D7lRV/xrt
 rpZVtnclNcHVP4ktlcXtypyM2qsLU0HfLfZftohpRFGddgQrguWDq1W+tyXh8S+aC6zaFU4t0
 nZnQr05Kh7dJ74nWgmsh8waFe7mptvfuXSX9USMUZ+TgT+qORgTVbMIsNho6BbjVpYh1JkMLa
 42gMIbQr/c/TlxKIgBDt14X3BJiEJOw7GMBcjsgdy4O/qxcmfzsKSncS/LZWSYIB4GMw0n0r0
 8Fiq+zOxkjkaYHCeKUFBDllNq1vGdio8UyzyddDFZMgJo5HRbJh1+imq/dvptxiNGAPJFM51e
 d3fBW2H4yl2DhSH4dJhzrLKO16HIHzYPirarqif9dUTo5zuzDD+cRXu91FjTleHu8pPtKzT7L
 MTPew5MEgY6aEdzqVnt9Kl97me49k4upsLgvAv3Rk6NizEuXA2cIsu9HfoqCpA0beR4z6Y3NM
 RJ5gkBS6wJ9l7eWwnKxLXw2Mj83hBLUJ4ZKUOHPtk0NSTysgB9Kyl1LCc/+W0Uo9nciKzu/m/
 n6+AvLvFL5opGwcKOUf3qSiqJFm6wrbmrun8pXCvQs8RxdZLLOXCNIrsEVszRN8alGxU0K20e
 YriPmNKMGjV7aqgM8+n3i5JFZZvA1SSQ5fMPMVbu9Jqxmn41e9bT5YYNR9sUfsa+tMiiP5n5I
 3psMVFskooCvdnIiXdX4YysQiBdq9rEcpfHOqINlaMe06C5r8jC2QcAUCnrmUH8eSUFttPf27
 kyAYZZGSEFT9TSN4YYmKExJcdAp4TP

Am 24.12.24 um 00:06 schrieb Armin Wolf:

> Am 18.12.24 um 09:00 schrieb Hridesh MG:
>
>> 18-Dec-2024 3:14:04 am Armin Wolf <W_Armin@gmx.de>:
>>
>> > Am 17.12.24 um 21:52 schrieb Hridesh MG:
>> >>> Also can you tell me what special OC calls are necessary on your
>> machine? I know of another user
>> >>> which might suffer from the same problem.
>> >> Yep, there's only one call - SetGamingMiscSetting (Method ID: 21)
>> > Are the other OC WMI calls still submitted by the Windows application?
>>
>> This is the only WMI call made for enabling OC.
>>
> Could you figure out what arguments where passed to this WMI method call?
>
> Thanks,
> Armin Wolf

Ignore my previous request, i totally forgot about your previous emails.

This WMI call is already supported by the driver and exposed to userspace using the platform profile interface.
It seems however that your device:

- does only support the turbo profile and not the other OC settings

- only supports a subset of the platform profile choices

- uses a different EC address for storing the current platform profile

Can you test kernel patches? I can prepare a patch for you which:

- puts your device on the necessary whitelists

- fixes the platform profile handling

Thanks,
Armin Wolf

