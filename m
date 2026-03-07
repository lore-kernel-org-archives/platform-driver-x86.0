Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0E337CD49;
	Sat,  7 Mar 2026 21:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772920642; cv=pass; b=orHH7BMgUCTqPaiAJKNs6bImZPak87xXSfU/E5qdNfKiRvAuKdr/LdAHQDllW+9uke/2httqL4rm5YRQKlrttNOI/b7dU7d4CjDM48+hqSiRXc7JzN5gzbnP8U7aJG/oWKfK5iDDZlQUCFpii2E+9C8tOHopf8YTNYQnXf16wVM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772920642; c=relaxed/simple;
	bh=fpf1t2YDJPemw4QCM2Jtbc2eGfK+hoxl6F5t0wG7UPw=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=mwTN8AuSC6uN+nzrIXO959NgtQM+T309ocRSl+qS3q5MrLP394XrRW1Pt/nMDNjFW7lU58rHNecNkmxDdGW+8kxRQuiZwHquXJ7n7xp1m6G2jDwBkONiLbJFv7ViLiNDNMWtnkOn3Gmcq6d5BjSwD9cOTWvN0c0ymj/mhLqICpg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=Ue5F+Vlm; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="Ue5F+Vlm"
ARC-Seal: i=1; a=rsa-sha256; t=1772920616; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GWE9np1lnh1G8u441bfQuDuzNArKzjtYX0sfBU5wYSDutq5m4E40y2fxxuMTo7QeD5G6iNbRtTJijbtc2vjYLbBPk5j389z6RYrhKWOd/mrwHmK0eF0B+XAue6cB/eeJUtJ/3J8Zrf2aysDJ1UaU9/mvlxP5hwRqqxuKxtDpoUE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1772920616; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=d1QBglOGjp2JLCYeWIfTJ8nOUCSvY0VjhKdOk1r84M4=; 
	b=CCiNE4AiTFMcfwRCPG9LSQEs5tj8Q8OHrEIaXOsvIHY6hgfMVd8EDoKLPCMh5rDa642KWcI3hk8msIS3BCuUoHRpuKXY6oyDnQMnL4EHPP9xfivBqfrCsBjNfScPmHTmk7Q1CW+ajJNeEVxdZZJUuuef5DtQ4Ws3dKIWaxPrqMc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772920616;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=d1QBglOGjp2JLCYeWIfTJ8nOUCSvY0VjhKdOk1r84M4=;
	b=Ue5F+Vlm3oZjijTxmLCNGgVfFSUGPFY8ylP7DZYXlioL8pUrVrNX/0UFvxRqMlUK
	jIXw17AVf0j/kZFngteeWtzfZu2K0zEPCcg20AI7i8ok0N5gdNrn/4DHsCeGRRXlDNU
	wqFbmzese6SZlN/pSTpA3RArXPmglknA6P2glR6hmErgIWwM+zkyGUummoEH5S/yxI3
	3cq6R+napC5TAU9fwzpWcaYjK377KFwb+HfpTIfEPuquQ7MTubcgTwKR3usncrgxuEk
	+scghxjnqK4AXS7Y1gTDce5/uz6gmHip/BmMMFvmlb8c8lmmhrRFJ2S047gz1mlHKZz
	jjxuILf+2Q==
Received: by mx.zohomail.com with SMTPS id 177292061386576.4871767164235;
	Sat, 7 Mar 2026 13:56:53 -0800 (PST)
Message-ID: <f963610b6a159e513b146566e57a1d1de7cf78b7.camel@rong.moe>
Subject: Re: [RFC v3 4/4] platform/x86/amd: dptc: Add device entries for
 handheld PCs
From: Rong Zhang <i@rong.moe>
To: Antheas Kapenekakis <lkml@antheas.dev>, Mario.Limonciello@amd.com
Cc: W_Armin@gmx.de, sashal@kernel.org, Shyam-Sundar.S-k@amd.com, 
	derekjohn.clark@gmail.com, denis.benato@linux.dev,
 linux-kernel@vger.kernel.org, 	platform-driver-x86@vger.kernel.org
In-Reply-To: <20260307115516.26892-5-lkml@antheas.dev>
References: <20260307115516.26892-1-lkml@antheas.dev>
	 <20260307115516.26892-5-lkml@antheas.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 08 Mar 2026 05:51:34 +0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-8 
X-ZohoMailClient: External

Hi Antheas,

On Sat, 2026-03-07 at 12:55 +0100, Antheas Kapenekakis wrote:
> Add limit tables and DMI entries for AMD APU-based handheld devices:
>=20
>  - 15W class: AYANEO AIR
>  - 18W class: AYANEO AIR Plus/Pro
>  - 25W class: AYANEO AIR 1S, NEXT/KUN
>  - 28W class: GPD Win Mini/4/Max 2, GPD Duo, GPD Pocket 4, AYANEO 2,
>                OrangePi NEO-01, SuiPlay0X1
>  - 30W class: AYANEO FLIP/GEEK/SLIDE/3, AOKZOE A1/A1X/A2,
>                OneXPlayer F1Pro/2/X1/G1, AYN Loki Max, Zeenix Pro
>=20
> Also add SoC strings for Ryzen AI, Z1, Ryzen 8000/7040/6000/5000
> families, extending support beyond the initial AI MAX series.
>=20
> Assisted-by: Claude:claude-opus-4-6
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---
>  drivers/platform/x86/amd/dptc.c | 409 ++++++++++++++++++++++++++++++++
>  1 file changed, 409 insertions(+)
>=20
> diff --git a/drivers/platform/x86/amd/dptc.c b/drivers/platform/x86/amd/d=
ptc.c
> index 1f07e2e6f278..a3d582e48cd3 100644
> --- a/drivers/platform/x86/amd/dptc.c
> +++ b/drivers/platform/x86/amd/dptc.c
> @@ -85,6 +85,66 @@ static const struct dptc_param_desc dptc_params[DPTC_N=
UM_PARAMS] =3D {
>  		   1, ALIB_ID_TEMP_TARGET },
>  };
> =20
> +/* 15W class: AYANEO AIR (Ryzen 5 5560U) */
> +static const struct dptc_device_limits limits_15w =3D { .params =3D {
> +	[DPTC_PPT_PL1_SPL]  =3D {  0,  5, 10, 15,  18 },
> +	[DPTC_PPT_PL2_SPPT] =3D {  0,  5, 10, 15,  18 },
> +	[DPTC_PPT_PL3_FPPT] =3D {  0,  5, 12, 18,  22 },
> +	[DPTC_CPU_TEMP]     =3D { 60, 70, 85, 90, 100 },
> +}, .profiles =3D {
> +	[PLATFORM_PROFILE_LOW_POWER]   =3D { .vals =3D {  5,  5,  8, 0 } },
> +	[PLATFORM_PROFILE_BALANCED]    =3D { .vals =3D { 10, 12, 15, 0 } },
> +	[PLATFORM_PROFILE_PERFORMANCE] =3D { .vals =3D { 15, 15, 18, 0 } },
> +}};
> +
> +/* 18W class: AYANEO AIR Plus/Pro (Ryzen 5 5560U, Ryzen 7 5825U) */
> +static const struct dptc_device_limits limits_18w =3D { .params =3D {
> +	[DPTC_PPT_PL1_SPL]  =3D {  0,  5, 15, 18,  22 },
> +	[DPTC_PPT_PL2_SPPT] =3D {  0,  5, 15, 18,  22 },
> +	[DPTC_PPT_PL3_FPPT] =3D {  0,  5, 15, 20,  25 },
> +	[DPTC_CPU_TEMP]     =3D { 60, 70, 85, 90, 100 },
> +}, .profiles =3D {
> +	[PLATFORM_PROFILE_LOW_POWER]   =3D { .vals =3D {  5,  5,  8, 0 } },
> +	[PLATFORM_PROFILE_BALANCED]    =3D { .vals =3D { 12, 14, 15, 0 } },
> +	[PLATFORM_PROFILE_PERFORMANCE] =3D { .vals =3D { 18, 18, 20, 0 } },
> +}};
> +
> +/* 25W class: Ryzen 5000 handhelds (AYANEO NEXT, KUN) */
> +static const struct dptc_device_limits limits_25w =3D { .params =3D {
> +	[DPTC_PPT_PL1_SPL]  =3D {  0,  4, 15, 25,  32 },
> +	[DPTC_PPT_PL2_SPPT] =3D {  0,  4, 20, 27,  35 },
> +	[DPTC_PPT_PL3_FPPT] =3D {  0,  4, 25, 30,  37 },
> +	[DPTC_CPU_TEMP]     =3D { 60, 70, 85, 90, 100 },
> +}, .profiles =3D {
> +	[PLATFORM_PROFILE_LOW_POWER]   =3D { .vals =3D {  8,  8, 12, 0 } },
> +	[PLATFORM_PROFILE_BALANCED]    =3D { .vals =3D { 15, 17, 20, 0 } },
> +	[PLATFORM_PROFILE_PERFORMANCE] =3D { .vals =3D { 25, 27, 30, 0 } },
> +}};
> +
> +/* 28W class: GPD Win series, AYANEO 2, OrangePi NEO-01 */
> +static const struct dptc_device_limits limits_28w =3D { .params =3D {
> +	[DPTC_PPT_PL1_SPL]  =3D {  0,  4, 15, 28,  32 },
> +	[DPTC_PPT_PL2_SPPT] =3D {  0,  4, 20, 30,  35 },
> +	[DPTC_PPT_PL3_FPPT] =3D {  0,  4, 25, 32,  37 },
> +	[DPTC_CPU_TEMP]     =3D { 60, 70, 85, 90, 100 },
> +}, .profiles =3D {
> +	[PLATFORM_PROFILE_LOW_POWER]   =3D { .vals =3D {  8,  8, 12, 0 } },
> +	[PLATFORM_PROFILE_BALANCED]    =3D { .vals =3D { 15, 17, 22, 0 } },
> +	[PLATFORM_PROFILE_PERFORMANCE] =3D { .vals =3D { 25, 28, 32, 0 } },
> +}};
> +
> +/* 30W class: OneXPlayer, AYANEO FLIP/GEEK/SLIDE/3, AOKZOE */
> +static const struct dptc_device_limits limits_30w =3D { .params =3D {
> +	[DPTC_PPT_PL1_SPL]  =3D {  0,  4, 15, 30,  40 },
> +	[DPTC_PPT_PL2_SPPT] =3D {  0,  4, 20, 32,  43 },
> +	[DPTC_PPT_PL3_FPPT] =3D {  0,  4, 25, 41,  50 },
> +	[DPTC_CPU_TEMP]     =3D { 60, 70, 85, 90, 100 },
> +}, .profiles =3D {
> +	[PLATFORM_PROFILE_LOW_POWER]   =3D { .vals =3D {  8,  8, 12, 0 } },
> +	[PLATFORM_PROFILE_BALANCED]    =3D { .vals =3D { 15, 17, 25, 0 } },
> +	[PLATFORM_PROFILE_PERFORMANCE] =3D { .vals =3D { 25, 28, 41, 0 } },
> +}};
> +
>  /* AI MAX Handheld class: GPD Win 5 */
>  static const struct dptc_device_limits limits_maxhh =3D { .params =3D {
>  	[DPTC_PPT_PL1_SPL]  =3D {  0,  4, 25,  80, 100 },
> @@ -103,11 +163,60 @@ static const char * const dptc_soc_table[] =3D {
>  	"AMD RYZEN AI MAX+ 395",
>  	"AMD RYZEN AI MAX+ 385",
>  	"AMD RYZEN AI MAX 380",
> +	/* Ryzen AI */
> +	"AMD Ryzen AI 9 HX 370",
> +	"AMD Ryzen AI HX 360",

What's "AMD Ryzen AI HX 360"? Did you mean "AMD Ryzen AI 9 H 365"
(Chinese-specific model id) and "AMD Ryzen AI 9 365" (other regions)?

> +	/* Z1 - Extreme before plain Z1 */
> +	"AMD Ryzen Z1 Extreme",
> +	"AMD Ryzen Z1",

You don't need both since strstr("AMD Ryzen Z1") matches "AMD Ryzen Z1
Extreme".

Thanks,
Rong

> +	/* Ryzen 8000 */
> +	"AMD Ryzen 7 8840U",
> +	/* Ryzen 7040 */
> +	"AMD Ryzen 7 7840U",
> +	/* Ryzen 6000 */
> +	"AMD Ryzen 7 6800U",
> +	"AMD Ryzen 7 6600U",
> +	/* Ryzen 5000 */
> +	"AMD Ryzen 7 5800U",
> +	"AMD Ryzen 7 5700U",
> +	"AMD Ryzen 5 5560U",
>  	NULL,
>  };
> =20
>  static const struct dmi_system_id dptc_dmi_table[] =3D {
>  	/* GPD */
> +	{
> +		.ident =3D "GPD Win Mini",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "G1617-01"),
> +		},
> +		.driver_data =3D (void *)&limits_28w,
> +	},
> +	{
> +		.ident =3D "GPD Win Mini 2024",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "G1617-02"),
> +		},
> +		.driver_data =3D (void *)&limits_28w,
> +	},
> +	{
> +		.ident =3D "GPD Win Mini 2024",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "G1617-02-L"),
> +		},
> +		.driver_data =3D (void *)&limits_28w,
> +	},
> +	{
> +		.ident =3D "GPD Win 4",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "G1618-04"),
> +		},
> +		.driver_data =3D (void *)&limits_28w,
> +	},
>  	{
>  		.ident =3D "GPD Win 5",
>  		.matches =3D {
> @@ -116,6 +225,306 @@ static const struct dmi_system_id dptc_dmi_table[] =
=3D {
>  		},
>  		.driver_data =3D (void *)&limits_maxhh,
>  	},
> +	{
> +		.ident =3D "GPD Win Max 2",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "G1619-04"),
> +		},
> +		.driver_data =3D (void *)&limits_28w,
> +	},
> +	{
> +		.ident =3D "GPD Win Max 2 2024",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "G1619-05"),
> +		},
> +		.driver_data =3D (void *)&limits_28w,
> +	},
> +	{
> +		.ident =3D "GPD Duo",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "G1622-01"),
> +		},
> +		.driver_data =3D (void *)&limits_28w,
> +	},
> +	{
> +		.ident =3D "GPD Duo",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "G1622-01-L"),
> +		},
> +		.driver_data =3D (void *)&limits_28w,
> +	},
> +	{
> +		.ident =3D "GPD Pocket 4",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "G1628-04"),
> +		},
> +		.driver_data =3D (void *)&limits_28w,
> +	},
> +	{
> +		.ident =3D "GPD Pocket 4",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "G1628-04-L"),
> +		},
> +		.driver_data =3D (void *)&limits_28w,
> +	},
> +	/* OrangePi */
> +	{
> +		.ident =3D "OrangePi NEO-01",
> +		.matches =3D {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "OrangePi"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "NEO-01"),
> +		},
> +		.driver_data =3D (void *)&limits_28w,
> +	},
> +	/* AYN */
> +	{
> +		.ident =3D "AYN Loki Max",
> +		.matches =3D {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ayn"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Loki Max"),
> +		},
> +		.driver_data =3D (void *)&limits_30w,
> +	},
> +	/* Tectoy (Zeenix Pro =3D Loki Max) */
> +	{
> +		.ident =3D "Zeenix Pro",
> +		.matches =3D {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Tectoy"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Zeenix Pro"),
> +		},
> +		.driver_data =3D (void *)&limits_30w,
> +	},
> +	/* AOKZOE */
> +	{
> +		.ident =3D "AOKZOE A1 AR07",
> +		.matches =3D {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "AOKZOE"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "AOKZOE A1 AR07"),
> +		},
> +		.driver_data =3D (void *)&limits_30w,
> +	},
> +	{
> +		.ident =3D "AOKZOE A1 Pro",
> +		.matches =3D {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "AOKZOE"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "AOKZOE A1 Pro"),
> +		},
> +		.driver_data =3D (void *)&limits_30w,
> +	},
> +	{
> +		.ident =3D "AOKZOE A1X",
> +		.matches =3D {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "AOKZOE"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "AOKZOE A1X"),
> +		},
> +		.driver_data =3D (void *)&limits_30w,
> +	},
> +	{
> +		.ident =3D "AOKZOE A2 Pro",
> +		.matches =3D {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "AOKZOE"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "AOKZOE A2 Pro"),
> +		},
> +		.driver_data =3D (void *)&limits_30w,
> +	},
> +	/* OneXPlayer (Intel variants filtered by SoC table) */
> +	{
> +		.ident =3D "ONEXPLAYER F1Pro",
> +		.matches =3D {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONEXPLAYER F1Pro"),
> +		},
> +		.driver_data =3D (void *)&limits_30w,
> +	},
> +	{
> +		.ident =3D "ONEXPLAYER F1 EVA-02",
> +		.matches =3D {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONEXPLAYER F1 EVA-02"),
> +		},
> +		.driver_data =3D (void *)&limits_30w,
> +	},
> +	{
> +		.ident =3D "ONEXPLAYER 2",
> +		.matches =3D {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
> +			DMI_MATCH(DMI_BOARD_NAME, "ONEXPLAYER 2"),
> +		},
> +		.driver_data =3D (void *)&limits_30w,
> +	},
> +	{
> +		.ident =3D "ONEXPLAYER X1 A",
> +		.matches =3D {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONEXPLAYER X1 A"),
> +		},
> +		.driver_data =3D (void *)&limits_30w,
> +	},
> +	{
> +		.ident =3D "ONEXPLAYER X1z",
> +		.matches =3D {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONEXPLAYER X1z"),
> +		},
> +		.driver_data =3D (void *)&limits_30w,
> +	},
> +	{
> +		.ident =3D "ONEXPLAYER X1Pro",
> +		.matches =3D {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONEXPLAYER X1Pro"),
> +		},
> +		.driver_data =3D (void *)&limits_30w,
> +	},
> +	{
> +		.ident =3D "ONEXPLAYER G1 A",
> +		.matches =3D {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONEXPLAYER G1 A"),
> +		},
> +		.driver_data =3D (void *)&limits_30w,
> +	},
> +	/* AYANEO - 15W */
> +	{
> +		.ident =3D "AYANEO AIR",
> +		.matches =3D {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "AIR"),
> +		},
> +		.driver_data =3D (void *)&limits_15w,
> +	},
> +	/* AYANEO - 18W */
> +	{
> +		.ident =3D "AYANEO AIR Plus",
> +		.matches =3D {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "AIR Plus"),
> +		},
> +		.driver_data =3D (void *)&limits_18w,
> +	},
> +	{
> +		.ident =3D "AYANEO AIR Pro",
> +		.matches =3D {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "AIR Pro"),
> +		},
> +		.driver_data =3D (void *)&limits_18w,
> +	},
> +	/* AYANEO - 25W */
> +	{
> +		.ident =3D "AYANEO AIR 1S",
> +		.matches =3D {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> +			DMI_MATCH(DMI_BOARD_NAME, "AIR 1S"),
> +		},
> +		.driver_data =3D (void *)&limits_25w,
> +	},
> +	{
> +		.ident =3D "AYANEO NEXT Advance",
> +		.matches =3D {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "NEXT Advance"),
> +		},
> +		.driver_data =3D (void *)&limits_25w,
> +	},
> +	{
> +		.ident =3D "AYANEO NEXT Lite",
> +		.matches =3D {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "NEXT Lite"),
> +		},
> +		.driver_data =3D (void *)&limits_25w,
> +	},
> +	{
> +		.ident =3D "AYANEO NEXT Pro",
> +		.matches =3D {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "NEXT Pro"),
> +		},
> +		.driver_data =3D (void *)&limits_25w,
> +	},
> +	{
> +		.ident =3D "AYANEO NEXT",
> +		.matches =3D {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "NEXT"),
> +		},
> +		.driver_data =3D (void *)&limits_25w,
> +	},
> +	{
> +		.ident =3D "AYANEO KUN",
> +		.matches =3D {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "KUN"),
> +		},
> +		.driver_data =3D (void *)&limits_25w,
> +	},
> +	{
> +		.ident =3D "AYANEO KUN",
> +		.matches =3D {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "AYANEO KUN"),
> +		},
> +		.driver_data =3D (void *)&limits_25w,
> +	},
> +	/* AYANEO - 28W */
> +	{
> +		.ident =3D "AYANEO 2",
> +		.matches =3D {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> +			DMI_MATCH(DMI_BOARD_NAME, "AYANEO 2"),
> +		},
> +		.driver_data =3D (void *)&limits_28w,
> +	},
> +	{
> +		.ident =3D "SuiPlay0X1",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Mysten Labs, Inc."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "SuiPlay0X1"),
> +		},
> +		.driver_data =3D (void *)&limits_28w,
> +	},
> +	/* AYANEO - 30W */
> +	{
> +		/* DMI_MATCH catches all FLIP variants (DS, KB, 1S DS, 1S KB) */
> +		.ident =3D "AYANEO FLIP",
> +		.matches =3D {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> +			DMI_MATCH(DMI_BOARD_NAME, "FLIP"),
> +		},
> +		.driver_data =3D (void *)&limits_30w,
> +	},
> +	{
> +		/* DMI_MATCH catches GEEK and GEEK 1S */
> +		.ident =3D "AYANEO GEEK",
> +		.matches =3D {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> +			DMI_MATCH(DMI_BOARD_NAME, "GEEK"),
> +		},
> +		.driver_data =3D (void *)&limits_30w,
> +	},
> +	{
> +		.ident =3D "AYANEO SLIDE",
> +		.matches =3D {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "SLIDE"),
> +		},
> +		.driver_data =3D (void *)&limits_30w,
> +	},
> +	{
> +		.ident =3D "AYANEO 3",
> +		.matches =3D {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "AYANEO 3"),
> +		},
> +		.driver_data =3D (void *)&limits_30w,
> +	},
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(dmi, dptc_dmi_table);
