Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3D5F4F1;
	Sun,  5 Jan 2025 13:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736082391; cv=none; b=WwCuuelSEHuSyNEDjWXmUIQuEsss3AAr4JISTilgCT5AVyTEO9DINpeyr3hJBVqk4BvTcgM3q45xz5nUnhSmYXGwgC0EYONUdhRSG6lZSahiTp2R3gfuSqpTaE8wnE2cNQH0YpYGdp+AfvS5iM/U+1Gz1D2OgH3MCrwmG9WRvy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736082391; c=relaxed/simple;
	bh=Cz5lQvvdZqqKQEiidBk3vKK7SBvgeDVv8kNJiWopD0s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xf7b2ikTYrpMN5yqM/Su0pVhYx4aWoLZSpFUDunub5ZtnbPPl/f5yeuR0DuznIf1ztnlf0mZ5KMdteGaPCFE2wt2IDa+EwWHvRDY9kweZR4IwmCUDAxMMWEhJ9sFdD4dLNJ1v4LWLES+fUJFN8wgsA78oWKJLy1MbW5oB+18M0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=ui6ErgWE; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="ui6ErgWE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1736082380; x=1736687180; i=w_armin@gmx.de;
	bh=Av10RyJ5RREhRw6B4ZwBfnOAcxtQY2geNbUADFWRruY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=ui6ErgWEDByLMYAu/K69wGYNVsFKGB/X3qrJu+UmCBWshA9luZZ14+H7XQopYMlg
	 S5JB/66/qxnccSBBMVU0g3jfgEiXWvXf2qNGQcIOArNRluAA+zvd9dWqKMyrtrtI8
	 OteWkPCrDi5aSAhuVIQkazv6ahLf2IyW4B2lcrpJpYv237Dojwp9qBgVaBvHJL/ae
	 wGIk51SpkfZ+11X08guSkdhgsVt1qGvJ3NyFOeqXCmF+lg3N9IbO5LzRA5jrbujjt
	 E3vpfejbMix4mpyQFfpeTLZESlO6OPg71caXCmMvAzXBoGHj6ShONBJSCxik7c1kX
	 85ii65uLXLvSffS9nw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.14] ([91.14.230.110]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1McY8d-1u2fcU3L9Z-00qXG9; Sun, 05
 Jan 2025 14:06:19 +0100
Message-ID: <33ef8a61-f8ff-4e74-91dd-3781447f643b@gmx.de>
Date: Sun, 5 Jan 2025 14:06:18 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] platform/x86: acer-wmi: use an ACPI bitmap to set
 the platform profile choices
To: Kurt Borja <kuurtb@gmail.com>, Hridesh MG <hridesh699@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250104-platform_profile-v2-0-b58164718903@gmail.com>
 <20250104-platform_profile-v2-2-b58164718903@gmail.com>
 <yanuo2ninpaaj2z46zfqcikttbe3asbjldo2apazuktv6yezti@gfseorovandn>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <yanuo2ninpaaj2z46zfqcikttbe3asbjldo2apazuktv6yezti@gfseorovandn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:7VkUPRnY8tPzbHYc6KxBRobPKMyAA/QAaSm24Nlbba4Q7o+Le7l
 Ne5+OAmoTD2OAlsvv6SuO++aunxUw6qVKNGf7IKOwHBHxjJJuaIK4NpQYrjmBd0jkVPvRqF
 4hoYcEXjNSV8i1CDJuGe0iR9c71YRdL3ZDnkgvaPufILpxSXapHGIxhyoUlirNJWLmjC3mY
 /q/1I+Fvi9TYc6WLr+A6g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:LLARTCN6bc0=;GoLcDHWXPKes12Ss8X1fn3/ckD2
 ikieOGI/5drST/wSxWC6gLEoaDxNsQyHnONZU7t6HxTsDrni6zXwGoG92x/8hvXpmP7k5+muD
 FJGpvpKC/JMF4cdDRDzF0v6kaQPxNwEXrWi2f62BTpup/6dIHt4BlCkKZUDkKp98p5MSLHk+A
 a1ouli8JrvC9ul5T/8yWmie2a/P3eoxOTfulh4dPw87Uqb6EhIGSrqkRLQcfiz7IPiu9zdA9c
 XM+xXJEdUVAX8Ox0yFaEpR2yxsOUhMRIHTBMEWtvhDdV0UeTpV6QluoADy/GRC4SMzoKZIUgM
 yb9X6dgw0e3LFIxCT8lv/oe2IQ8wuzAcjI67RSElhiDpNtDNoTGJx6EAUXURT8z0U4g2PbtXz
 RbekjUKc8B1mRvgy9ifCyv7tJoM+3C1J4kVhJ+pe1IqOpTiT3yxfySE2zJXVj2gFNbXEzgaSM
 zD0X6Z/N5wQM3UvXYTSUrcelSb+sBr0gnnCkThAUTHnBj1ziWlEamTk453+wPiVy68bW3FFch
 H1Xfn1d0cuEsFA3q9UPdt0L91YVwJc1srRjgDSbGF81uU6vw1GG1HKv/sUl2SLu1NvjNIIlHf
 pj+LKuuS08BqLgPrwP9NO2VjD81KMk2npYrqjoD0tRBTMMo67kjqH1FRvEIZvFguToho2ngep
 6ORmq9BLNNXNBMyhZKZAS+cyIEUwNO0skW2beEpQGQ9QMz0lCCXw/Jpb5QAW1sPAP6r0ST8mS
 Qm6tR0oEysWElHumfHHuPEFlIsS8syVkY0hF3twbnWyWWKZUq6eVYJr3YzGw85Seg0hz7PJiw
 obJsyWKRAtzflSd7W40ZdUKGNwmNjB6zT2PKMDKVAIlnHHq2ZLIbLIj1w4S42wD/cZFdkAn8h
 9kxb1RApUVpmWqMLHWmwSkVg2BMMAACR5y3VDZKvEisLzhusG15LV0iAImxHnzqHe8l2zDbZq
 9YpCZIgeoTi6f7dNkbdplhWhEgcC3Kksc7yeONFmXpSL/TEqbH2lINN6jeUhp305zmRMxGtri
 yTiTyxYhEvAIkNwA16eTgl/EYVrN7e6ehYbbPOV9MFJc1JWps9fEelArhWpP0HvA4PwPwsxnA
 SFAyI3SvtIhuIABC+jfR+ohZLx9CLa

Am 04.01.25 um 18:18 schrieb Kurt Borja:

> On Sat, Jan 04, 2025 at 08:59:21PM +0530, Hridesh MG wrote:
>> Currently the choices for the platform profile are hardcoded. There is
>> an ACPI bitmap accessible via WMI that specifies the supported profiles=
,
>> use this bitmap to dynamically set the choices for the platform profile=
.
>>
>> Link: https://lore.kernel.org/platform-driver-x86/ecb60ee5-3df7-4d7e-8e=
bf-8c162b339ade@gmx.de/
>> Signed-off-by: Hridesh MG <hridesh699@gmail.com>
>> ---
>>   drivers/platform/x86/acer-wmi.c | 36 ++++++++++++++++++++++++++------=
----
>>   1 file changed, 26 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/ace=
r-wmi.c
>> index 5370056fb2d03a768162f2f1643ef27dc6deafa8..f6c47deb4c452fc193f22c4=
79c730aecb1e69e44 100644
>> --- a/drivers/platform/x86/acer-wmi.c
>> +++ b/drivers/platform/x86/acer-wmi.c
>> @@ -33,6 +33,7 @@
>>   #include <linux/units.h>
>>   #include <linux/unaligned.h>
>>   #include <linux/bitfield.h>
>> +#include <linux/bitops.h>
>>
>>   MODULE_AUTHOR("Carlos Corbacho");
>>   MODULE_DESCRIPTION("Acer Laptop WMI Extras Driver");
>> @@ -1983,6 +1984,7 @@ acer_predator_v4_platform_profile_set(struct plat=
form_profile_handler *pprof,
>>   static int acer_platform_profile_setup(struct platform_device *device=
)
>>   {
>>   	if (quirks->predator_v4) {
>> +		unsigned long supported_profiles;
>>   		int err;
>>
>>   		platform_profile_handler.name =3D "acer-wmi";
>> @@ -1992,16 +1994,30 @@ static int acer_platform_profile_setup(struct p=
latform_device *device)
>>   		platform_profile_handler.profile_set =3D
>>   			acer_predator_v4_platform_profile_set;
>>
>> -		set_bit(PLATFORM_PROFILE_PERFORMANCE,
>> -			platform_profile_handler.choices);
>> -		set_bit(PLATFORM_PROFILE_BALANCED_PERFORMANCE,
>> -			platform_profile_handler.choices);
>> -		set_bit(PLATFORM_PROFILE_BALANCED,
>> -			platform_profile_handler.choices);
>> -		set_bit(PLATFORM_PROFILE_QUIET,
>> -			platform_profile_handler.choices);
>> -		set_bit(PLATFORM_PROFILE_LOW_POWER,
>> -			platform_profile_handler.choices);
>> +		err =3D WMID_gaming_get_misc_setting(ACER_WMID_MISC_SETTING_SUPPORTE=
D_PROFILES,
>> +						   (u8 *)&supported_profiles);
>> +		if (err)
>> +			return err;
>> +
>> +		if (test_bit(ACER_PREDATOR_V4_THERMAL_PROFILE_QUIET, &supported_prof=
iles))
>> +			set_bit(PLATFORM_PROFILE_QUIET,
>> +				platform_profile_handler.choices);
>> +
>> +		if (test_bit(ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED, &supported_p=
rofiles))
>> +			set_bit(PLATFORM_PROFILE_BALANCED,
>> +				platform_profile_handler.choices);
>> +
>> +		if (test_bit(ACER_PREDATOR_V4_THERMAL_PROFILE_PERFORMANCE, &supporte=
d_profiles))
>> +			set_bit(PLATFORM_PROFILE_BALANCED_PERFORMANCE,
>> +				platform_profile_handler.choices);
>> +
>> +		if (test_bit(ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO, &supported_prof=
iles))
>> +			set_bit(PLATFORM_PROFILE_PERFORMANCE,
>> +				platform_profile_handler.choices);
>> +
>> +		if (test_bit(ACER_PREDATOR_V4_THERMAL_PROFILE_ECO, &supported_profil=
es))
>> +			set_bit(PLATFORM_PROFILE_LOW_POWER,
>> +				platform_profile_handler.choices);
> As Armin mentioned, with this approach you may still select unsupported
> profiles in acer_thermal_profile_change(). You should either handle that
> in this patch or move this patch to the end of the series.
>
> ~ Kurt

Correct.

I suggest that you simply reorder the patches so that this patch comes aft=
er the platform_profile_cycle() patch.

Thanks,
Armin Wolf

>>
>>
>>   		err =3D platform_profile_register(&platform_profile_handler);
