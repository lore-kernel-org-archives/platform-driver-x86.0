Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE321E9B16;
	Wed,  8 Jan 2025 23:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736378011; cv=none; b=hnLp18oDzvnuWQ6x98H2D89GbSsHzbwtXVKwl/WNOwsjIFqYISPdVhO8ueGcFhvYqRr4NN75pXHf2foNTZzjoo0qNkjUAG7ycxd8MtOVD0lObfUNru4NSR5AiP+UdoLB0WdNcSQ1Sjnl49uOBs4OWt5r1kNkEZkK2rrLBxz0vNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736378011; c=relaxed/simple;
	bh=gQYWiUwQi9s1vkl77hB2LWnsAUzsmurc1CnhvOTT8Zc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tw63kOkMzFPrH0IjBER5s3GYBkl+B+y4tI+Y5n8Is/vsLbMAH0aJPrX5Q4hdNiwFlXSs5b2TF2WW2Gn34h6zNOOSwklAQcmgMTfJ8+ltMrKvYZHqoB5OjWOdqeN5XBKCB0jTvURH+DMxCfOX95DOVPhgU3Dm3CDIRFtQ+tHqtVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=qpuiDumj; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="qpuiDumj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1736377996; x=1736982796; i=w_armin@gmx.de;
	bh=CNXvTzR9VfKX/YzY/WRNyPctkBMESRKDhRAmRYC7h7M=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=qpuiDumjtBlp51ls5AytkT0UKsSX45IBUtqWFiRux0mccND/He2yNGIsfId8GHy6
	 O1r1/9kL26zZrB/IGtVv6Ye9ArraNVfHoi7RtPvBkgRurJk2cd9Bp4NuXeISx5lt2
	 SZr7qHLcvV/JQLl/Zbt1A8AhCdsaB66HqDwM8etXW8q1xlEPQX7gFneX8klleXt3B
	 zyOI6ReY1CtGEe9QexukhBtcDobLSy0Mx8waKtjWbt8MnVwtEeA+BKj1HYYCzywGf
	 pJO4nINaPClNvugMFqPwJAMad6wMaYZ2PBpy6HCbWYDiPU51QGR7Mhuy+RcWpUwnW
	 nvrlHjAHmgVH5pQIig==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([91.14.230.110]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MTAFh-1t1FQK3lmh-00L9B5; Thu, 09
 Jan 2025 00:13:16 +0100
Message-ID: <e66d8392-3d8b-4c96-8717-34e51867064b@gmx.de>
Date: Thu, 9 Jan 2025 00:13:14 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] platform/x86: samsung-galaxybook: Add
 samsung-galaxybook driver
To: Joshua Grisham <josh@joshuagrisham.com>
Cc: ilpo.jarvinen@linux.intel.com, hdegoede@redhat.com,
 platform-driver-x86@vger.kernel.org, corbet@lwn.net,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241226153031.49457-1-josh@joshuagrisham.com>
 <0fbe58a9-ecca-437f-aa30-9d3a17c2bd43@gmx.de>
 <CAMF+KeYdshNex2h4kLJari=kXVxgcOZw7GDutJrV6vKC0PTe6A@mail.gmail.com>
 <a8011f0f-1d44-42ec-9089-2da31f3852e2@gmx.de>
 <CAMF+KeZm8LCGsCZ9bosNYRCbv847CcZr+0mWeZtDQsk5QFRuyg@mail.gmail.com>
 <9f257ca1-946d-416f-8741-247592b3866c@gmx.de>
 <CAMF+KeZ0xOdu3LADEeAHAC22=hZFQXnkHM3oxko7E7urNisfGw@mail.gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <CAMF+KeZ0xOdu3LADEeAHAC22=hZFQXnkHM3oxko7E7urNisfGw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:ZKLZZ7xBOmzgPpN5NR0fIZKj0x5JZbOs2X6Lgn4iNETABIQG5Av
 oE4VEuhcNKqJFSIS3zSjWY0aPReTl8Sx3/6gvaCIaVv5iH5TO+1EhSwHKJr59Q2poHB2t7J
 AMFQ7mnpyVSU7DsXpqyjK3lzjUWZDeacmGioFNZv0hoYa1beWCdIcushzNoUBoFsINrjUOO
 xium+zaYB9l57l9B6QbXw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:QKL0oZHx75Y=;NJdhiRFXhIE99buBFeGSMNFU/AY
 X8Or1jpe32cq7aoqIFwUB8xEeyFFqXEp/TIBs6DBhsjKV/7j2Yy3eVFHbALdxUSEpT72FI6kF
 7NQAHW67Y2LxZzsHLuUvtCQvcsV2jutGNRzT1Uj+u/pVZz26UjRyIu131G89JYez3teEcYvZj
 PmbREfL+C9IP/RnHQ4a/eztxkSZ/mPFOzWcTxlzfkISsiF1QdnGDyHRNQJHsStf1A4lHl56s5
 IiNiCLOKyJR+cfif5F9ILroe6bGdwmgAbjGn4zLfgXK5heaTdiRMjXkj09FnjlLsvoR1YmZNg
 EZIGhR8fYB4eYnEql/sRnF/4/6CVk1Wl+QiIDduEJwPF0ErUKE7+Z0bPmVcH/VNTXq02SHUrz
 iidChe982X13jmfzJ2MpB4MEdL9MiaxOgTRZmFvd03qOc6FXQRsl/LVxu/Mjj/1rfAmKc/fuZ
 /PoI8CzGqGefp2yHb3RwWKmk+YvKgPiT57hBvJtjxoLpzokSgf1asnBOV6eVhfftdxfmP2gVD
 C5/ICVP0HeAk5Uf4t6KBsvpuQevB3vc9JAZ72iv4BPsuXtf5uq7wVEc7Mi5nI42xQQdf3V6Dk
 dF54JNV9kPwuMtM9l9IJUrecpdqnh4hTU71SYF67y/Tkx5TxUDtxirUxUf7Ku/rxMPZjr1CSB
 eYVk/Bcnp9j8oFSeictUJuHrXYeQRpuLc6lEc/aolcE6rUjuO7JRDdkEGhA+YxAJkmALBGs1q
 eaJN1Exw1ybSuBI5jKtIh8As66F+GNvEpqStS4qAZiLQKP/jQY9+wG8HaMkqg1ugDwpI47gnd
 R/K0Wpz7V4hjWoYqYK27enynn0Hgn8CVGhfoFGAWVS5FO5Kabo88CI2s0I4vt+b32XLnbrgX0
 PYUy254wWjDTZN29tNn4nHH0VWOx4vo5+vIlggvoKlV7yQCpsCknFxBLJYRh3RN39UkZzY4T1
 7PZDpMqif7UGslC15pDkQIdFGExcPkdKt7uoRVsN4jDaTAg6XPvCgUYgjSGc8SX7Sh7p5A21u
 AC1lgRyxWxzs6/vMYuW0obZp80gknLoYRpUg0XOJnAq+iDgVxRRyUBzjs/9SoyIf0SxGKOzyP
 U/nNUg7Od3RRIo1dmVAy6KMDNjGPID

Am 08.01.25 um 23:00 schrieb Joshua Grisham:

> Den tis 7 jan. 2025 kl 19:56 skrev Armin Wolf <W_Armin@gmx.de>:
>> Is this non-ultra performance mode any different than the ultra performance mode
>> in terms of performance gains, fan speed, etc?
>>
>  From what I can tell it ramps up the performance even more and might
> even also ramp up the performance of the GPU (these devices have a
> second dedicated GPU) a bit more. My understanding is that even for
> these models, "Performance" is considered a high performance mode, but
> that "Ultra" is like "super performance" ?
>
> Fan speed I think is mostly controlled based on temperature but it
> could also be that some thresholds are adjusted etc. All of this is
> unfortunately embedded within the EC so you cannot really see any
> voltage, clock, etc, or other differences on the CPU when these modes
> are used, even though it is clear from basic stress testing especially
> with the "Silent" / low-power mode that the CPU has been severely
> limited.
>
>> PLATFORM_PROFILE_CUSTOM is meant to signal that the platform is not in a well-defined
>> profile state, usually due to manual tuning. So please do not use it for ULTRA.
>>
> Thank you yes I also realized this a bit more when I read through some
> of the proposed changes to other drivers in the mailing list!
>
>>> If this is possible, then my best guess for the logic for this mapping
>>> in samsung-galaxybook could be changed to loop the "supported modes"
>>> forwards instead of backwards, and just let the "legacy" modes be
>>> written first (as they seem to always come first in the list), and
>>> then in case the non-legacy mode exists later in the array, it will
>>> just replace the already-mapped legacy value with the new non-legacy
>>> value, and thus skip any kind of condition-based checking/mapping
>>> entirely. Is that sort of more like what you had in mind?
>> Can you be sure that legacy performance modes are always placed before non-legacy
>> performance modes?
>>
>> If no then i suggest that you iterate over all supported modes and if you encounter
>> a legacy performance mode you check if the associated platform profile slot was already
>> taken by a non-legacy performance mode. If that is the case you ignore that legacy performance
>> mode.
>>
>> If you are sure that the order is always the same then you can of course simplify this by
>> iterating forward. I will leave it to you to choose which one to implement, as you seem
>> to have more knowledge about the underlying hardware than me.
>>
> So far the order has always been the same for all devices I have seen
> from users in the community, it is just that certain modes are or are
> not present in the list depending on their support. However, based on
> your comment I think it is maybe safe to add a bit more logic just in
> case the modes suddenly come in a different or random order on some
> new device. I have also now simplified the mapping so it is mostly 1:1
> with one exception: if Ultra is found, then I map it to performance
> and re-map what was Performance to balanced-performance. Otherwise and
> for all other devices without Ultra, it is 1:1.
>
> I have also tightened up and streamlined the logic a tiny bit so
> hopefully it will feel slightly more straight-forward in the new v5.
> This feels like an ok compromise if we should be using exactly the
> profiles which are currently available .. how does this sound?

OK, i can live with that. Looking forward to the v5 revision :).

Thanks,
Armin Wolf

>> [...]
>> Thanks,
>> Armin Wolf
>>
> Thank you!
> Joshua
>
