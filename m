Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8737307496
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Jun 2025 23:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750807515; cv=none; b=AngYctU2VWgZ02oFBXkr76kBf6nMG+Tff2IKv6oqs0JyQmjJZRLhOD/r194/Tn82dd+BAkgwWeqOdpRZDUfM3InrMmEHBi73azXB0fI8Ngyn7de8AqQNkgN7fgWH1vZm77O2s9tkKWwCqGqwpTPQsx133SlV7V9PMHDvgYnpjnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750807515; c=relaxed/simple;
	bh=q4O+Bt05ne+l3ajADhIXZsJxTA4G47Xx+gyG7tp32sg=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:References:
	 Cc:From:In-Reply-To; b=d4Vf82NXKxKsnToQi0Amy0V5WXFX7WNDqZpXue+Mf0axtGr5jyNlN5Ttj6uW2sJed18yHWDCneFXUOpTTrDnx++/RN+R60UrQnR/ZxbKv1AXdMN/dHLE0o1priupMMr3S1O+CeALlld5ldjYgHuO960wK4VgplKGi5id2j3C/sE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=WOGpYLI8; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="WOGpYLI8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1750807511; x=1751412311; i=w_armin@gmx.de;
	bh=q4O+Bt05ne+l3ajADhIXZsJxTA4G47Xx+gyG7tp32sg=;
	h=X-UI-Sender-Class:Content-Type:Message-ID:Date:MIME-Version:
	 Subject:To:References:Cc:From:In-Reply-To:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=WOGpYLI8EvXvaTUcb457ZWUbzMTtY5tlPV4Lcm4V0GqXcPV6LUfAGJ554drqPG2b
	 2TTk9I3GkIXyz67b04DFc5Py1N1FgLf1e/PlrL75PQsdBcMuMUIuZhXUOr7NHSRXH
	 5HYnHyeEtjIVpYFz9q2647WtPkPyIuIZsatj0ekGuqhXVTu/AOfPOxvUEHTk71iuo
	 qMxwmqciOFZ88GVZZxumjQ6z0EfXhMhfhV5OPKsUGLUA3Ug3UH44fRhiURCnMyM7F
	 1crsnOzV79rhwS5CbggkSAmyn7dELpTVjOq/0KWbjeKI9uWQJJhOyrUyR10NMMpcn
	 GxB3hwf1ByCzJQZCcw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MgNh7-1uxDAX2BdH-00ewjI; Wed, 25
 Jun 2025 01:25:10 +0200
Content-Type: multipart/mixed; boundary="------------Frz1k0AOPYBHiVerG0Lh1r5d"
Message-ID: <26ac7c41-13f6-4b3b-b2ea-43e130a5a40d@gmx.de>
Date: Wed, 25 Jun 2025 01:25:09 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: lenovo_wmi_hotkey_utilities probe failure regression on IdeaPad 5
 Pro 14ACN6 (6.15.x)
To: Andrei Tescula <atescula@gmail.com>
References: <2eda8f9b-9421-4068-87ae-ccfd834649bc@gmail.com>
 <48e0d534-6ebf-4cd4-95c5-d74d1af10ac1@gmx.de>
 <68eb51ec-e5e3-474a-84f5-aa1145016baa@gmail.com>
Content-Language: en-US
Cc: "platform-driver-x86@vger.kernel.org"
 <platform-driver-x86@vger.kernel.org>
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <68eb51ec-e5e3-474a-84f5-aa1145016baa@gmail.com>
X-Provags-ID: V03:K1:3JcDUWbOIIsKVK90FxWW6Iv5GXY5skGqagqwCJdHEOzWeAKSKa+
 bmivbct4MBK5NdcFYJ/XmgBZIcnP0LiBicHco8qXXoMoaWmsvm7AVTsEbnZH7JYAiW817Xg
 y0IF+Nzpl2nWTL//9LBlNsYmgwAuO6UHgxP2tX/SmQCntvoE2Nb4r6thbyRmkdiSalYLeKn
 b92OuyELUdMkb+CGAGfyA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:dhI0jSBDO98=;pOMGVMuS8DBS+jcQt9UEIrtqdZj
 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
 +KKj0w8Dbcg==

This is a multi-part message in MIME format.
--------------Frz1k0AOPYBHiVerG0Lh1r5d
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Am 24.06.25 um 23:19 schrieb Andrei Tescula:

> Hello,
>
> Sorry, on a short holiday.
> Here is acpidump attached.
>
> For any other info I will be available full starting 1st July 2025
>
> Cheers
>
> Andrei Tescula

Thank you, please reply to all next time so others can access the ACPI dat=
a too.

I seems that your device simply does not support the LEDs controlled by th=
is driver,
however instead of just doing nothing the driver seems to interpret this a=
s an error.

Can you compile kernel modules? If yes then please test if the attached ke=
rnel module
does not produce any error messages when loaded.

Thanks,
Armin Wolf

>
> On 6/22/25 22:27, Armin Wolf wrote:
>> Am 18.06.25 um 07:58 schrieb Andrei Tescula:
>>
>>> Hardware: Lenovo IdeaPad 5 Pro 14ACN6 (82L7)
>>> BIOS: GECN39WW(V1.23) 10/30/2024
>>>
>>> Regression:
>>> - Working: 6.14.10-arch1-1 and earlier
>>> - Broken: 6.15.x
>>> - Also working: linux-lts
>>>
>>> Error message:
>>> lenovo_wmi_hotkey_utilities CE6C0974-0407-4F50-88BA-4FC3B6559AD8:=20
>>> probe with driver lenovo_wmi_hotkey_utilities failed with error -5
>>>
>>> Impact:
>>> - Error message appears in dmesg/journalctl
>>> - Functionality not affected (hotkeys work via ideapad_laptop driver)
>>> - Purely cosmetic but indicates improper driver probing
>>>
>>> Additional info:
>>> - ideapad_laptop module loaded and working correctly
>>> - All hotkeys (Fn+F1-F12) function properly
>>> - WMI GUID CE6C0974-0407-4F50-88BA-4FC3B6559AD8 probe fails with -EIO
>>
>> Hi,
>>
>> can you share the output of "acpidump"?
>>
>> Thanks,
>> Armin Wolf
>>

--------------Frz1k0AOPYBHiVerG0Lh1r5d
Content-Type: application/zip; name="lenovo-wmi-hotkey.zip"
Content-Disposition: attachment; filename="lenovo-wmi-hotkey.zip"
Content-Transfer-Encoding: base64

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

--------------Frz1k0AOPYBHiVerG0Lh1r5d--
