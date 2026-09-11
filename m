Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC4B5A0AC8;
	Fri, 11 Sep 2026 20:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789160269; cv=none; b=KN8g6zhXGiNAnG25TJ12G9/ZhpNN5F2UDU3AVHw5msPt8nNcs0Dh0Br+PBhxab4oBlGK1j7SddGAI6Vs29a/cU+xZmB8Q6Qi30l0cPJMHbzDV4RkXW8fQf/XGFI+XFm2YKDjPOyXFEKslSHrvhBBh6pVOvCZ/yW93U87+uX/f7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789160269; c=relaxed/simple;
	bh=sZK7CbjdlSUgEkXgIfxnNweOVZmftjHUNEeTCUYTEUs=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Br+DyEMxOWIInBOdo/a5nQ8th/7WPQ1juq2ata4q/0yAJdkEjnxJkWP0b/kqUwgi4jZjTtaA6S5iL6nMpMM3r8x+gbH6idYvY9Xpc9fTAYrEISjDuJflMawxmfH6v08AQ0Rksjp4NuHiuzUK5Vu97kQQ1bQvHKI05w73LsT6RAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=ARaHvgr5; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="ARaHvgr5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1789160255; x=1789765055; i=w_armin@gmx.de;
	bh=sZK7CbjdlSUgEkXgIfxnNweOVZmftjHUNEeTCUYTEUs=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:From:To:
	 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=ARaHvgr5/6PSf1EJeLXnhFQwKSpDVEk5iKs7gvb60lf9/h6ddFjLiI7DYfMgNced
	 Pim5wcum6sxZLDsXJqn0szXv3Rt2GzDAH6PC9d3Dk5cxEKyDWY64Lbt3YMbtV8a2L
	 pDeIKeaBT2FWIXUNME2Esf7CQNSx/suQFI5TAc1inXUa2jDhk/F3YPe36Gis7Dhcv
	 krJqnfFT3pJbl1qBaRB30X3RsGkczk0PCyFXbJHH+wGvXqGT+g9uR49xzPqFRwbGD
	 IqKJJRCLCFaoS2jUwHi+0ICw482NYtBmW8JiRtcd2aQQKFDsU9CMvq1XedendooyJ
	 8SX8+T0H/mXaci9GdA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MwQXH-1wmmXz3aQ1-00r1lY; Fri, 11
 Sep 2026 22:57:34 +0200
Message-ID: <ee20cde5-a1f9-4f59-a651-a406952f3e78@gmx.de>
Date: Fri, 11 Sep 2026 22:57:34 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] platform/x86: uniwill-laptop: Fix brightness
 notify for 3 level keyboards
From: Armin Wolf <W_Armin@gmx.de>
To: Werner Sembach <wse@tuxedocomputers.com>, Hans de Goede
 <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260822003012.851574-1-wse@tuxedocomputers.com>
 <c84328eb-0126-4558-8241-a41e641f9681@gmx.de>
Content-Language: en-US
In-Reply-To: <c84328eb-0126-4558-8241-a41e641f9681@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:rTTft4mD9KhtmgPlYpja0XAfOHl+C89N+U6sSuo2CiLwZyOBRAf
 5z32a3/cPNWp/gyS24vwFUlIzufNkP8mxE090HadyCok4xcRoQGDEgOPY9k1ca7uO+tUeLk
 ztaA3TF/ItTPloLxVKh3TO0Bqi1cenhNUq6qg00gmK4lhdZMfDYa6uok4Dj+O7A5b9pMkaC
 XweoEEz1VDPDlJa+HnTYg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:z7NnzfALCf0=;cig9D97FuiQpg3D5Y2qedpNuH+6
 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
 7+EC8VICq1UVepP1eW9MxyxV6i9hLYqDnOA==

Am 26.08.26 um 23:37 schrieb Armin Wolf:

> Am 22.08.26 um 02:28 schrieb Werner Sembach:
>
>> The devices with 3 brightness level keyboards send
>> UNIWILL_OSD_KB_LED_LEVEL0, UNIWILL_OSD_KB_LED_LEVEL2, and
>> UNIWILL_OSD_KB_LED_LEVEL4 and not UNIWILL_OSD_KB_LED_LEVEL0,
>> UNIWILL_OSD_KB_LED_LEVEL1, and UNIWILL_OSD_KB_LED_LEVEL2.
>>
>> This patch maps the events correctly to brightness levels 0, 1, and 2.
>
> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
>
What is the status of this series?

Thanks,
Armin Wolf

>> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
>> ---
>> V1->V2: Use the events as source of truth for brightness_hw_changed=20
>> value
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 again to avoid a race =
condition as Armin had pointed out.
>> V2->V3: Return error for unexpected brightness level count.
>>
>> =C2=A0 drivers/platform/x86/uniwill/uniwill-acpi.c | 26 +++++++++++++++=
++++++
>> =C2=A0 1 file changed, 26 insertions(+)
>>
>> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c=20
>> b/drivers/platform/x86/uniwill/uniwill-acpi.c
>> index 7a2eeaec4c961..5df3611919ce3 100644
>> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
>> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
>> @@ -1631,6 +1631,32 @@ static int uniwill_notify_kbd_led(struct=20
>> uniwill_data *data, int brightness)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct led_classdev *led_cdev;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int ret;
>> =C2=A0 +=C2=A0=C2=A0=C2=A0 /*
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * The devices with 3 brightness level keyboar=
ds send
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * UNIWILL_OSD_KB_LED_LEVEL0, UNIWILL_OSD_KB_L=
ED_LEVEL2, and
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * UNIWILL_OSD_KB_LED_LEVEL4 which need to be =
mapped to 0, 1,=20
>> and 2.
>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
>> +=C2=A0=C2=A0=C2=A0 switch (data->kbd_led_max_brightness) {
>> +=C2=A0=C2=A0=C2=A0 case 4:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>> +=C2=A0=C2=A0=C2=A0 case 2:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 switch (brightness) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case 0:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bre=
ak;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case 2:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bri=
ghtness =3D 1;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bre=
ak;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case 4:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bri=
ghtness =3D 2;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bre=
ak;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 default:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
urn -EINVAL;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>> +=C2=A0=C2=A0=C2=A0 default:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (data->kbd_led_single_color)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 led_cdev =3D &da=
ta->kbd_led_cdev;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else
>>
>> base-commit: 54745d563114b74f6fecebce68cd020d06c1772b
>
