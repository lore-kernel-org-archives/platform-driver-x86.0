Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C407530E0C0;
	Sat,  7 Mar 2026 15:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772898988; cv=none; b=OW7Wlr+9SfKyxmb/eDLijMxTiLbmbkJUQQYiLWnTJ8BSxaFNVtML/NEQBICK/D8JwulcWEONj0kLta35hza9XU6XmYDpyM6hbUreWW7A40xVol3AMml6ab4w9ai/QO8occV2+zSJWPX97X6+VY+pG0Pcpka0BOF9ucuSakTyBZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772898988; c=relaxed/simple;
	bh=jgSugF1qXQ7nYEgFcwvZ3QCONeq1RjUjMK7zb8VTRms=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QxPL5Q5h6aTFGMSvNdSMkWYsSwBb7lbo06FLX0ogAi/w8Sl222EbCM5cZaCf9XBkC+EJ7AvVneQAnkift0/CGI4eGiEPW3+m1GgTKf3lAZv0mHbNN8Mbxegi/0/JEs7qZ2SSCxb5pVGjt8Gb59Xtmio3pMY+72fCa4U737JeXqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=Fwc+jeTv; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="Fwc+jeTv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1772898971; x=1773503771; i=w_armin@gmx.de;
	bh=Cv1wtpyoRdRoTaCwKCPcNX/7gl3uRA01Svh21Z5FYXA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Fwc+jeTvhf7UpqPnbsRwzaqGMrOpeAU9pjE5PA19Xsr7ySC48oSXicTuV40PJCUu
	 JYCCZjKi7K4XOw0JavNpTL3Ns0x9M4GWrt5nuLX2aMeGvagsuP2ha6erjiTTmeCVB
	 Bp9vkUXOoCxSOLOj7E7cMH4C7qrgLvqNaqLvr0xQFYQEunHdYm1g10JmLY0R8smsg
	 wKHdcrlNDKh6hmgVsFo4O/oxxyDkvab5xKwX6Ki0DXr7lL5znKpOO29gWrnJH6+MV
	 oIqSN2btu0puJP4uoohmwFgN6UBi6xiwKbVluMdDftREtvbIMGA2epxaQKJZh+4xb
	 xDLvGj51HLNVIMpsFg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MZktZ-1wBoSq2P8p-00OvLv; Sat, 07
 Mar 2026 16:56:11 +0100
Message-ID: <08bb562a-fbd6-4c73-8913-478cf46fc3c6@gmx.de>
Date: Sat, 7 Mar 2026 16:56:07 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/5] platform/x86/uniwill: Readd Schenker system vendor
 for XMG FUSION
To: Werner Sembach <wse@tuxedocomputers.com>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260303225440.504358-1-wse@tuxedocomputers.com>
 <20260303225440.504358-5-wse@tuxedocomputers.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20260303225440.504358-5-wse@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:+Nh27FLEMXXt4axteFcK4O1nc6Z3QsjLD/A6ijQtv6LdmE4skSe
 ZUHcebIpvcHS+S1l6uC58U5HoCbutofi36MraEP8Y6DEw3HcgvHcc9XpeLRQIWSmwKmDXxS
 ArPLZKAZ4nhFgGLUhu5J+iU5JjIFfPIReKXaNCPuA0/Jn1lNmpY5Pr7wEoglNSKyUnZ1Ykf
 tu2/R8cjt/k0hFOnCUeuA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:xivjgaBsQvY=;kq88b2r7Pm9S2447V7bRyNLl7cb
 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

Am 03.03.26 um 23:54 schrieb Werner Sembach:

> Readd entries with Schenker system vendor for the XMG FUSION, I'm not
> entierly sure if this combi exists, but to be on the safe side to avoid
> regressions.

That was not really what i meant with "preserving the old entries". Please=
 do not
change the system vendor string to "TUXEDO" for the XMG Fusion 15 inside t=
he previous
patch, as this might cause problems when bisecting.

Instead i suggest you do the following:
1. Add two new DMI entries for the XMG Fusion 15 with the "TUXEDO" system =
vendor string.
2. Apply features across all TUXEDO devices, including the new entries.

This also allows us to backport the patch adding the two new entries.

Thanks,
Armin Wolf

> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> ---
>   drivers/platform/x86/uniwill/uniwill-acpi.c | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
>
> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platf=
orm/x86/uniwill/uniwill-acpi.c
> index 83c60ac6d2fdd..56504e06cfb71 100644
> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
> @@ -2008,6 +2008,22 @@ static struct uniwill_device_descriptor pf5pu1g_d=
escriptor __initdata =3D {
>   };
>  =20
>   static const struct dmi_system_id uniwill_dmi_table[] __initconst =3D =
{
> +	{
> +		.ident =3D "XMG FUSION 15 (L19)",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "SchenkerTechnologiesGmbH"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "LAPQC71A"),
> +		},
> +		.driver_data =3D &lapqc71a_lapqc71b_descriptor,
> +	},
> +	{
> +		.ident =3D "XMG FUSION 15 (L19)",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "SchenkerTechnologiesGmbH"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "LAPQC71B"),
> +		},
> +		.driver_data =3D &lapqc71a_lapqc71b_descriptor,
> +	},
>   	{
>   		.ident =3D "XMG FUSION 15 (L19)",
>   		.matches =3D {
