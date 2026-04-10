Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2FE3DD531;
	Fri, 10 Apr 2026 21:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775857525; cv=none; b=MYPF7yGr5WNdG4YY4BQ/iMmnM707n2futEVc0PsLS+LXeVtKFlHaUrFgA8vFpllJVx0tpfLlci86bZwKJXYm+9/gUF1PhySQCaeMM7gTMkF2qBhncfgKsoIoosEr0bZO5I6C8vguce2EzDbMfyRNASsTaLzdOUDPxyES6UdEqGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775857525; c=relaxed/simple;
	bh=2fCrrPsvugNB8wadbVyMoAV9jmKv1CaIcm+ta0bjJD4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TV83XdsDL74xmvN3Zeg1pcrwibDpW2YjYVPRuut3dTVsG6s+ETD8yZ8ixeFGjNmn/jOS9gqZrVxZ+AD1u91sQYRmLp/ADMwvP7gJvyhoqhicv26bqXE8etjcwLmQ8r4m9whpgLKoew6j/n+G1NR2e5kRE8YRwqFSSvZBE8lEsaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=Yu9vvZyr; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="Yu9vvZyr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1775857514; x=1776462314; i=w_armin@gmx.de;
	bh=2fCrrPsvugNB8wadbVyMoAV9jmKv1CaIcm+ta0bjJD4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Yu9vvZyr9H3ppnR/mhdH4CoUowhxyCvdnyVpMhs3KfWIAugmwHUGIB1PxzUs1Aqh
	 fYlVPTaSPDcHcGH+kLI36a9wksF4ELt4oYgWwNY2QLza+HxfgLnN7N4lkPMuyq9b+
	 zjfm1voE4qsetpb4gzW6NABopB6Kq7+VAlSeayIGVJEZWVUzTvYTdlwy3D0JEFoNV
	 rEg4WMaRwKFsAHelDoY5bEqflGhALg/qx4426VZEXIKe4kAhTZzBRDxIQ0RB08q72
	 h2rIwDJMg1AAAwd43gQxX0K9TE8zjNKyPZXnIel+5gKeVNs0wW0EpbIRhiUoRZAcs
	 JHP9ZAoGGdP4ma0C9w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Msq2E-1vINco3ARk-00rh48; Fri, 10
 Apr 2026 23:45:14 +0200
Message-ID: <f64047a9-c0b7-411e-ba19-78a2976f0e44@gmx.de>
Date: Fri, 10 Apr 2026 23:45:13 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] platform/x86: uniwill-laptop: Fix behavior of "force"
 module param
To: Werner Sembach <wse@tuxedocomputers.com>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260406193653.7799-1-W_Armin@gmx.de>
 <20260406193653.7799-4-W_Armin@gmx.de>
 <b184557e-545d-4829-847e-b52655757e10@tuxedocomputers.com>
 <641163be-6d3c-4d4b-b437-7a960188d0a0@gmx.de>
 <d8de9606-da5d-4977-8636-89386a3a7a99@tuxedocomputers.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <d8de9606-da5d-4977-8636-89386a3a7a99@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ekqIKEWW2LMFisE/jB3pG8zPsZr6jBS6OoJjwMFaz8vGqwaUwbD
 04WHANjb+kGEirFx8j9ZpaPtEQcZ+NgyU2dW5YHNq0+juU2qooo8iP+iWQHEXzxsEMddAYm
 SfEmxhra0csyXlkOjnE5rTe8Twpn+7WEaqKqt2HlUJJT1la5zUn7SMTH5D394HX/Y5XS0oF
 jCu2C/9idokTxjohX9JRw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:OlDYVOBmTW8=;Cv9p8/D6xxrnscQQo67FFUlgq6n
 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

Am 10.04.26 um 22:30 schrieb Werner Sembach:

>
> Am 10.04.26 um 19:32 schrieb Armin Wolf:
>> Am 09.04.26 um 01:08 schrieb Werner Sembach:
>>
>>>
>>> Am 06.04.26 um 21:36 schrieb Armin Wolf:
>>>> Users might want to force-enable all possible features even on
>>>> machines with a valid device descriptor. Until now the "force"
>>>> module param was ignored on such machines. Fix this to make
>>>> it easier to test for support of new features.
>>>>
>>>> Fixes: d050479693bb ("platform/x86: Add Uniwill laptop driver")
>>>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
>>>> ---
>>>> =C2=A0 drivers/platform/x86/uniwill/uniwill-acpi.c | 8 ++++++--
>>>> =C2=A0 1 file changed, 6 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c=20
>>>> b/drivers/platform/x86/uniwill/uniwill-acpi.c
>>>> index 5551f193c2c1..7c7ea0e76966 100644
>>>> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
>>>> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
>>>> @@ -2481,8 +2481,6 @@ static int __init uniwill_init(void)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!force)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 return -ENODEV;
>>>> =C2=A0 -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Assume that the=
 device supports all features */
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 device_descriptor.feature=
s =3D UINT_MAX;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pr_warn("Loadi=
ng on a potentially unsupported device\n");
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>>>> @@ -2500,6 +2498,12 @@ static int __init uniwill_init(void)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 device_descrip=
tor =3D *descriptor;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>> =C2=A0 +=C2=A0=C2=A0=C2=A0 if (force) {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Assume that the device=
 supports all features */
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 device_descriptor.feature=
s =3D UINT_MAX;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pr_warn("Enabling potenti=
ally unsupported features\n");
>>>> +=C2=A0=C2=A0=C2=A0 }
>>>> +
>>> this should already exclude the potentially harmfull "charging=20
>>> threshold"
>>
>> I decided to keep this patch small so that it can be picked up by the=
=20
>> stable team
>> without much fuss. Personally i believe that the charging limit=20
>> should be dealt with
>> inside the last patch where we add support for the (safe) charging=20
>> modes.
>
> Stable should get this protection too, and it is just one more line.
>
> Could even be an own patch with just that line
>
Agree, i will do this in the v2 series.

Thanks,
Armin Wolf

>>
>> Thanks,
>> Armin Wolf
>>
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D platform_driver_register(&uniw=
ill_driver);
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>
