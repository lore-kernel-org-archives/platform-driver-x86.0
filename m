Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C6F723A566
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Feb 2026 00:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771374054; cv=none; b=R63RL8PsiHgY5MIc99at2YGYA5PxyuUYAj8yXKQpIq8AzcnJp4QOPHXm5rdmG+XhUW4rMX+fqnwfbvVcU4Ia7k0OTRDnBksHeWYTQGTDxEGlUf32Y/riHTuaNjbxb+tiB27DtYfloXsM80DC9aRI2Ic3jQSoEVHSgeNS87d3LXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771374054; c=relaxed/simple;
	bh=z87qgzIWhWgMkrtTddsN7xWkZH0ECKVCOmTf0Wp6b3k=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=iX/RJ2SsbrZ3QbYP44yGiPmoFSYVlo4ONPc0kiV3KjvNHMBHj4nO3tUWT9HKOAxh6jdyWHg/LnVlZw4+beQUA2QI+b3/h2fjMv51xHIw4+JOyKFPmwMw9VRnI5ZZW+yFTWaP4IYnCiVSMiLnAyhvbtzGzZKkr+HlP9pvVlyi/RU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H+Zyoze1; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H+Zyoze1"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-126ea4e9694so1023195c88.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 17 Feb 2026 16:20:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771374052; x=1771978852; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mZMLg6aICeZTCOfqDbG6LRjg3ZD9gdLkaHCi4sP0l8o=;
        b=H+Zyoze1khnK9LxlskkmkpcnU1v8mEZs23Otei5pHpRVIZgxoyLy292yAIMwx6bPdV
         duNoVqphA55RBa4rypSaxq5HwSc77WEoUKpEzR1Kn3/NCTVt00Qge7cGT10S+VDDRioZ
         5JRbWHorc2ckjq50uUA3d1Vzs9nsNvHfYYcgPA5T1RoKSoltVMORCIpwI7nulOKi5Oun
         MUfzP3Ss+7qvYx9HAHiTL0yksXXATSGiFV7NEtFB7sUq+TQB+41QXaD6Wh7KcxEKhJ8p
         d53r/ayO/juZfz6UTjgn/yBGGvb3Ph697uYxjEARQbS/wErvwikkHY/Wte9lrmAOSxoN
         ujDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771374052; x=1771978852;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mZMLg6aICeZTCOfqDbG6LRjg3ZD9gdLkaHCi4sP0l8o=;
        b=bvUMPv9oCkF806Cq8vzBlOuvgiMWXIHaxe99RPmTW8My/r7XC8JpA211yTsSomulNe
         DZf4/QWnPvC+7+dCHNtObob8+1eqx0yLhZ8xgbEqj6RKsLug3SvxQO4Rb/pwpLv3Htvv
         ZoL+G1oFzYm7gs2YtWyhQ/kB0ZderhkoxT4RrvPMEAC5ENz0Yq0AgWLGs+jHO93vRi42
         7ZaQwt1E1nw82RKahzB9wdKK++mYqRoq438hM5ob9itrwSzzfsWsJJizFQVm2lVgeZ/Q
         rOJ51EEzAv9coEhhYuOORixnYnt3g7RLapyiTNTM1MCuoQKCVJ5GEk5sJK54fBswLoo0
         wWWw==
X-Forwarded-Encrypted: i=1; AJvYcCU/6GEpWTvxOzbMID90LroWa/doeMSq+gEkebaOj0AIVjVcMnmMfxRQVUdIpPcmr1mmrtTay+GK3qA6wauYIEYZX1HM@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8X7ONzLO64Fbpu1xKYtC9QOCPFpvXgrP9jn3UgA1VOURNue49
	UyGOGXy/LqK0vXfS4owyBH3erkxWyMXId5SwqHlp4xb9USQze0gkQsAT
X-Gm-Gg: AZuq6aLIR5AjQ3ggJGypJ9/7oMLK6f6CLYf8pBt38EK4YMZXi62Cp5hhkVtLFOyumld
	Oew7d8XnbvYi89Kw6mJTl2VA/TzI8M9PZtg+KSGWe8nrk4B3qTSFUQn9KLh6krBEMBotux3OHvN
	X7AXerN+ZcYjYTPRQX63fEKjerRp38pcDCmGIIrHhHBKA0jz7oj51Chqscvcua2Il8/1sdE9bAu
	8Ha5u50mYwuSzVNl4R8nLuc+2BGX7aeEhyDdtLLOx/Pqjdbox6uT7YQImghCpdKAG35Ot2FAcbN
	5mSsmuETV8G6SK9dWSn6gFydt9biy1pkLDimJaHLEepxyz+jjQLF693eOxHV5B8X69pwzZROYXv
	S3f/R5Tjk20A9zvs0N6z7mOr/47dUshxW3UL2pKAGjFMuZDhXROesoERAJ+2U+aWlNrlzAkCygg
	PjeWtEylTaXMdbsQm5kp8NiNrsYzsW49Oq9cqmv3CIuCCQVYXq14/Mfn9F58lqwfGV1jaC9+TzB
	8MkqCZNGhQeinGw3iYh1w==
X-Received: by 2002:a05:7022:78f:b0:11b:f056:a1b3 with SMTP id a92af1059eb24-1273adc697bmr6928123c88.11.1771374052243;
        Tue, 17 Feb 2026 16:20:52 -0800 (PST)
Received: from ehlo.thunderbird.net (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12742b62274sm21466346c88.3.2026.02.17.16.20.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 16:20:51 -0800 (PST)
Date: Tue, 17 Feb 2026 16:20:49 -0800
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>,
 =?ISO-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Hans de Goede <hansg@kernel.org>
CC: Armin Wolf <W_Armin@gmx.de>, Jonathan Corbet <corbet@lwn.net>,
 Rong Zhang <i@rong.moe>, Kurt Borja <kuurtb@gmail.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_2/6=5D_platform/x86=3A_lenovo-wmi-oth?=
 =?US-ASCII?Q?er=3A_Limit_adding_attributes_to_supported_devices?=
User-Agent: Thunderbird for Android
In-Reply-To: <d6ff122a-1ccc-422f-9c24-b95106469d9e@app.fastmail.com>
References: <20260215061339.2842486-1-derekjohn.clark@gmail.com> <20260215061339.2842486-3-derekjohn.clark@gmail.com> <d6ff122a-1ccc-422f-9c24-b95106469d9e@app.fastmail.com>
Message-ID: <71066F1E-9310-490E-BE72-48D0547C9539@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On February 17, 2026 3:54:09 PM PST, Mark Pearson <mpearson-lenovo@squebb=
=2Eca> wrote:
>On Sun, Feb 15, 2026, at 1:12 AM, Derek J=2E Clark wrote:
>> Adds lwmi_is_attr_01_supported, and only creates the attribute subfolde=
r
>> if the attribute is supported by the hardware=2E Due to some poorly
>> implemented BIOS, this is a multi-step sequence of events=2E This is
>> because:
>> - Some BIOS support getting the capability data from custom mode (0xff)=
,
>>   while others only support it in no-mode (0x00)=2E
>> - Similarly, some BIOS support get/set for the current value from custo=
m
>>   mode (0xff), while others only support it in no-mode (0x00)=2E
>> - Some BIOS report capability data for a method that is not fully
>>   implemented=2E
>> - Some BIOS have methods fully implemented, but no complimentary
>>   capability data=2E
>>
>> To ensure we only expose fully implemented methods with corresponding
>> capability data, we check each outcome before reporting that an
>> attribute can be supported=2E
>>
>
>The Legion's aren't in the Linux program (with an asterisk for the Legion=
 Go/Go2) - but if there's anywhere it's tracked or highlighted which platfo=
rms differ/have issues let me know=2E Not sure how widespread the issues is=
?
>
>I can try and let the Legion team know that there are platforms which (li=
kely) aren't following the internal specs=2E It might be possible to improv=
e things for future platforms?
>
>Mark

It's a mixture of different generations and models with different issues, =
I'm not really tracking it anywhere=2E Part of the issue is the spec has ad=
ded/updated methods over time and the deprecated ones are still being used =
by hardware out in the world=2E I think this pattern is fairly good for mos=
t things=2E TBS I've recently found (from testers) that some things just ne=
ed dedicated methods instead of the generic macros (CPU/GPU OC status for e=
xample) so I'll drop any of those in the series for now and add them back l=
ater=2E All in all IDK if there is much value in tracking these issues outs=
ide bug reports, as fixing them would likely require BIOS updates for hardw=
are that is 2-4 generations old at this point and I highly doubt Lenovo int=
ends to do something like that=2E

It's a fairly complicated and evolving spec, so my goal is to be at least =
95% compatible=2E I don't think we'll be at 100% ever due to the wide array=
 of different hardware that's available=2E I=2Ee=2E the latest spec has ARM=
 specific capdata as well so we may need to eventually move the driver to s=
omewhere else, maybe platform/wmi? That's a discussion for later though as =
I have no experience with DT/ARM or a device that has it=2E

- Derek


