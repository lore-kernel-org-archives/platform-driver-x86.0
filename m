Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF9B01847
	for <platform-driver-x86@vger.kernel.org>; Sun, 14 Jul 2024 04:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720932389; cv=none; b=bndJMPtbSa0Jn9Von9v9AW13g9PRuYNVfEpyMfUs1no2/Rcp+CkBDMrqPFDly/hVCzNLJ/zBjPCCmjgy2047kOFy6l++7Oq5hp9OlwUvf08H/XsYUeGhcF/GNe8uXH0UJ3dn/FGSNp5O92WfBGPM7hgMAmOFAuVeBozxcHLzvL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720932389; c=relaxed/simple;
	bh=FfteOQ05lXv3aLn0+1KP3tq/7kbmHlC8ulcn370DWiA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EXr6duzpWwoUIwvPkxAICYyAeaft87oPUuT2FA9I3HV0hu81KSDFK6yYO1ABzQrKZ5cvkwPxx/fq6gwLzHgVw1qsNzAizG+ro/7iOdqaldfqN951iCbcd7QZhOVooDRislpKbHuRhwNWNnplPK7P02r2Gnzzoe9QwzUJGS9yKP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=aelNu2pX; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="aelNu2pX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1720932377; x=1721537177; i=w_armin@gmx.de;
	bh=pDQfl7XgJ/Hh7DSBbQ9PaWoIML0FGVhu+1g4gzXFaqw=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=aelNu2pXx+wWzz+Odt+lD9J6a7s4yiyadYizko+v1pcrsGTaxTPi32uIg1PSsM0h
	 LPG+AeEItXMSU7GXknuk0USD3EFKR0+w9r4KPGFCay9Ud38Ky68fC2r5D+cRPWOKB
	 zrI7vNaOjg39fQqBzYsTph3Zngwh5BeGrNdKpwWkzL/pMXldgQW7LIDko8uuX9C8o
	 arSkR3Q2Xxo8ZHVvIMV6aEAs86ekcneejuQ1cBUGEd4ZYmBIIy/TFUDhEnC9VCo+o
	 shUvmfX47ikxFWB7OOrIeaVdveGsSxtH8KtJMHLC/v1oLXcicpgZzdv7TuljtTzNu
	 31JlI7XzcvRAKjcnag==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [141.30.226.129] ([141.30.226.129]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MV63g-1stmDH391S-00JhDU; Sun, 14
 Jul 2024 06:46:17 +0200
Message-ID: <c41a3e07-05ae-4e45-bafd-19346a8141d8@gmx.de>
Date: Sun, 14 Jul 2024 06:46:16 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: hp-wmi: Fix implementation of the
 platform_profile_omen_get function
To: Alexis Belmonte <alexbelm48@gmail.com>, ilpo.jarvinen@linux.intel.com,
 hdegoede@redhat.com
Cc: platform-driver-x86@vger.kernel.org
References: <ZpFnV8w1558BW7iZ@alexis-pc>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <ZpFnV8w1558BW7iZ@alexis-pc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:WCjUAUsgfyYreX9riqKkQCA4e75N8mQCELXZ+cT7dS7a0hVOs5n
 hGMyMLdMMz+beXH4QrXP3S3GFIekISNA8w1RLyVwd61kPYl9d8JtdM/6bsG86R0I5kZvL1l
 Yb1V/PyZiAiTz77s9uBL56EwQkEvTRgmAWlFqnAch5k0aE9+fDscO8+wV6VM6fqE228PTX/
 l6jQ/qtxil8gFkDcvx2ow==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:zvKuwI4/jgI=;7AW0f81hjwB9h97Th5Fu+Yy43Yh
 /OytDBR8kBgrBT4Xc/syMna12K8uGUmUvSZTwT/6ekukvNScHciwyD5H1XgTA7PzruoL4+eCH
 JzwSk/TTcMAFQepkdg8NbJNaqAyw2oCZJlrN7umvAWBlJ//9Zqwmag907o32I4SVopvUcv2ma
 W07udzC2Xmv/2yIIqvbUM2Ql4xGYEe++KS+Hpuxtpq1Vv9yyOy/aqro8q+5Eyk+1yb/LNz/Tm
 5j87sPkOlpvgr4NFeK3p/r+fzuMVy+sGJMsDJ4h1O45epRswjp0Rax1KYOBktVn1a+wIKT0Pd
 eh+vqtJslTP/aYR0VFNWj33Xz+QDSYBAaI2kKplfyJaIEoKZS6XiFu35r178u/wdNJGFPxcGP
 3ZPbyD2G5vVXLLubYZYHk/cAlQxoHRu/WCAcD1X7ipIW1H/r5y/aLcXG1xGlVd2NZGS1tC/wd
 L4o/+9fxJKw8CWQ/jPIKL2dnJs/vGepu7DpF3mQ8nCpeh5ON+g9c5/nLHIt42O93M6lIrxpgS
 K353grx2+cdHfX3ML6cjdsEiT6cJktxcU4ILms6jYbtU7oMkQ62y9/SlztaHFu64Uf79KhrHe
 knUs3FhYm5J8iKC2ED3BTc+KUIuOC+pk9TWByIkcZZkdeWfJeHSpuZ498t2TxPnwiaa/9zHk9
 ez45VqkcPF9VhTtKikRXTjsZG7M9QAyyDHdrDOM8H4TB5aJUokb5NC74J26eMIIk4ZrCKt7I8
 /kvMk/yCPokMcY2RC0e/tAYO/yw+3lQJo1fmqIDKrcuygnwg0tBdNIpf70yBp7JVatVZKA2ki
 SHrHRhGz1jv7SU4IlsF9jJgQ==

Am 12.07.24 um 19:26 schrieb Alexis Belmonte:

> Fix ill-formed implementation of the platform_profile_omen_get function
> introduced by patch "platform/x86: hp-wmi: Fix platform profile option
> switch"
>
> Signed-off-by: Alexis Belmonte <alexbelm48@gmail.com>
> ---
>   drivers/platform/x86/hp/hp-wmi.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/=
hp-wmi.c
> index c8bcb3e2b344..876e0a97cee1 100644
> --- a/drivers/platform/x86/hp/hp-wmi.c
> +++ b/drivers/platform/x86/hp/hp-wmi.c
> @@ -1238,8 +1238,6 @@ static int platform_profile_omen_get_ec(enum platf=
orm_profile_option *profile)
>   static int platform_profile_omen_get(struct platform_profile_handler *=
pprof,
>   				     enum platform_profile_option *profile)
>   {
> -	enum platform_profile_option selected_platform_profile;
> -
>   	/*
>   	 * We directly return the stored platform profile, as the embedded
>   	 * controller will not accept switching to the performance option whe=
n
> @@ -1253,9 +1251,9 @@ static int platform_profile_omen_get(struct platfo=
rm_profile_handler *pprof,
>   	 * See also omen_powersource_event.
>   	 */
>   	guard(mutex)(&active_platform_profile_lock);
> -	selected_platform_profile =3D active_platform_profile;
> +	*profile =3D active_platform_profile;
>
> -	return selected_platform_profile;
> +	return 0;
>   }
>
>   static bool has_omen_thermal_profile_ec_timer(void)

Looks good to me.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>

