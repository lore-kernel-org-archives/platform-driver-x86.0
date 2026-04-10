Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E576231197B;
	Fri, 10 Apr 2026 17:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775842360; cv=none; b=feDxjMGm3ADpVNJW8RCvmGKul5CVxgNJadGA6YczZKGpkUF0MW9DjPKsr4Q08LFwcw1yrHB4UytAtm+t2MkK4mifK5K8lh6BzRJChuzfHQadctCCXCgn02BIPZP6/icJiQNZaJeS5BHrYUouoBlXfGXvGf3A+5pb1slBjL58zvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775842360; c=relaxed/simple;
	bh=cTWAmDioDPnrVbimR8A26jRjqDTLtiMjqi0u01YZKG0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cysuz0u1ynZmMJ9KxOpx6Ig/YSXgxJ0nL+n+5eCP4udPMWBQQqAHG0eu2YDIi3T8E4iCvpJYoHsRxx3EJ8Q8BoFaL/IV0/5Mv/5VEFqrQnRDV4HpmrRb5vnAIgzBJup6BUw+e85HYLewrKA5i3HqcEePdf8umF9PksSVsbtpwkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=a8aGMRBz; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="a8aGMRBz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1775842353; x=1776447153; i=w_armin@gmx.de;
	bh=cTWAmDioDPnrVbimR8A26jRjqDTLtiMjqi0u01YZKG0=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=a8aGMRBz6HIvKV2tZXh7Qcj6jo1V3I2jOYbIKjAQuTZT0EPb3c/TWw3L3mbleFT/
	 EXBeYTRcUJfVeRzRHTM6MOdzL4gdZlrX4V6U4AUspVL1gZOoHJJmAP9I7USbUbnVP
	 uFLTtPg2AcC02DRUi2b6azfxTJmnbR8FXSXU5RggiAx/vyo8MV2h3haMYwdHa/qv9
	 5OKFDg1+ubzCkrt/0B59YKHbRSuK/STFvde3KsKbZt3vZ2aI08LmBwqw/acjNybRo
	 eLLcggBFwb9b/KjrfHJlnW+ZU4vmHth3Ablh6jIrxMfqzH4CREX456ypkYrF44lJu
	 UqbscaJLuC3EKlvRIA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MMGN2-1vvN1r01Y6-00LONs; Fri, 10
 Apr 2026 19:32:33 +0200
Message-ID: <641163be-6d3c-4d4b-b437-7a960188d0a0@gmx.de>
Date: Fri, 10 Apr 2026 19:32:32 +0200
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
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <b184557e-545d-4829-847e-b52655757e10@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:K1CO7cV7Lc9fvtKs5nvhr5knoaruB+KsNZkyiIiYgyvOGTfhY5L
 2pGy99yLqoAwt3olXcT9tUOWb2YeAJ+S7RFh0vOXYY2Q6MjYCIP7Gf7uiYzQnuykR/sv5oV
 jaVmKmNK7OojlPodY917avAgKgBJ/BYzzds3hQ10HJcNhQbvK35VZBuK/uXKB5mLHzfVjDi
 c29JfMa5jfFTQFr6ATgzw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:WymqyZAUj4k=;/Wsve3YRCp9+dcy7eyceKdRZMHK
 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

Am 09.04.26 um 01:08 schrieb Werner Sembach:

>
> Am 06.04.26 um 21:36 schrieb Armin Wolf:
>> Users might want to force-enable all possible features even on
>> machines with a valid device descriptor. Until now the "force"
>> module param was ignored on such machines. Fix this to make
>> it easier to test for support of new features.
>>
>> Fixes: d050479693bb ("platform/x86: Add Uniwill laptop driver")
>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
>> ---
>> =C2=A0 drivers/platform/x86/uniwill/uniwill-acpi.c | 8 ++++++--
>> =C2=A0 1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c=20
>> b/drivers/platform/x86/uniwill/uniwill-acpi.c
>> index 5551f193c2c1..7c7ea0e76966 100644
>> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
>> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
>> @@ -2481,8 +2481,6 @@ static int __init uniwill_init(void)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!force)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 return -ENODEV;
>> =C2=A0 -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Assume that the d=
evice supports all features */
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 device_descriptor.features =
=3D UINT_MAX;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pr_warn("Loading=
 on a potentially unsupported device\n");
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>> @@ -2500,6 +2498,12 @@ static int __init uniwill_init(void)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 device_descripto=
r =3D *descriptor;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0 +=C2=A0=C2=A0=C2=A0 if (force) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Assume that the device s=
upports all features */
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 device_descriptor.features =
=3D UINT_MAX;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pr_warn("Enabling potential=
ly unsupported features\n");
>> +=C2=A0=C2=A0=C2=A0 }
>> +
> this should already exclude the potentially harmfull "charging threshold=
"

I decided to keep this patch small so that it can be picked up by the stab=
le team
without much fuss. Personally i believe that the charging limit should be =
dealt with
inside the last patch where we add support for the (safe) charging modes.

Thanks,
Armin Wolf

>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D platform_driver_register(&uniwil=
l_driver);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
