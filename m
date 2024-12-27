Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F68735976;
	Fri, 27 Dec 2024 03:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735271748; cv=none; b=nY4MI2Fi3acOiquKRcN1gSiUfy5Th6952x2OIbUXWJCLwT7ZxPKnDjTwSevQ/4+yS9uazTuk+lmMMwBMVoD4jFGnb1l3xVWTZ9qR++WxdhofPuhisi/o3kJAYGeZL3YAu0rRge3ZtQFNfuXQDgweDN7LZcGR6I7SOvdkNlDT/7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735271748; c=relaxed/simple;
	bh=5MOGaoeP8/S1hyP5raBa6LBaDvH32fQsmXId/o/K2QI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FahCt/VsX6UbQitIEUucTl4t7Z9GTkzOSZ/PfyKbOaCPCWgTpsZ84156e3CCbRyb0JOitfjKK6yVVxaDeQ1rKVuC49Ch0edyrf1dJahF86/QVAEvLayY9UIo6TN93IVRu5/un4naWdffi7Lku8nQ6lDmI3AMf+feqLqaEg2y4qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=eyzdfTqT; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="eyzdfTqT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1735271730; x=1735876530; i=w_armin@gmx.de;
	bh=BVVekMu0FHjZeY2VxJp6381jJDdnALcxFfC5OO3JqHM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=eyzdfTqTwlf9hTeR6ZXe8p8+O1KXK/2Qhvj9GkSFF4ZemWYSxA5xY3jurdoTthZj
	 LZbcru07a+tC2t33RcP5UTQx1WMFpHKBs9AgFZO6h2L7DJAl7g/dErBlHHHhBf0cc
	 JwXf5c4xql6YQxQW+PJdK5a6nKVf38bnT/lhnmOT8Tx42CEt6oF7FxQbo6IhR7h8w
	 Fq16iifHtK+S4m6nHMEoQhuQK1AT2zKO9KA+S92y/DBVclPEhDQFBlBbDbchgvPV5
	 KVjv3gCG8iKwf7RhaO8qx1JHT3GSEkKcNjpda4A11YEaBpgjE1gwuc6xSbsTu4FOS
	 UtEsCNcdgZ91XT7tIg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.14] ([91.14.230.110]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N3bSt-1tZij321at-011Tbn; Fri, 27
 Dec 2024 04:55:30 +0100
Message-ID: <02ff9ba4-87d2-436f-bf2a-33b4296505dd@gmx.de>
Date: Fri, 27 Dec 2024 04:55:28 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/20] alienware-wmi: Split DMI table
To: Kurt Borja <kuurtb@gmail.com>, platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com, mario.limonciello@amd.com,
 hdegoede@redhat.com, linux-kernel@vger.kernel.org,
 Dell.Client.Kernel@dell.com
References: <20241221055917.10555-1-kuurtb@gmail.com>
 <20241221055917.10555-14-kuurtb@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20241221055917.10555-14-kuurtb@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:nfZYMEO1454KfRQ40QY8jAjcAWQWNZAn11YTPoRi/kZKjhK0r9s
 ywf6yO4Jco64upEaMZEU0tnBy24g54RcxfXA4apUU3dpVFiG08G0X+O7Gr8829nNOSohi9o
 aDHZ9+b7TcNIZiFkkRi6EC5v9guMnj+9ShGql0oqw1KCxkkKS+NOsVKT2vig2DpLdfgJUHw
 dGN5+EopmVCYMtybt+vXw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ZSkYbsAlMrA=;zBPgmTmkPtI6SZCjba80Zoqwklg
 IH52nOAO+fJ4KpZvK6SeKpfGqBSCNpe+QmoXc7RqhqkXlh59iQ6GiYazJECaYELN5OkEypewl
 xOw6jtzUBec7pfXGy+7CNYjkPp28DKwhI3xx7tPDCRq6eQeB3FaSIgLdjfAtY3dSlPMhsDg5h
 veghoWjuE9pQomLPOAZwymwi5j4t2uVTtpl/1w6JpS7+vZ0/FWHSIZVbIZJU6TAffQKiLgtjV
 LesI89b+RnueGYGDLKgdChPn0/Vwpv2fUIWeA2CcBg0J6Rd70aKPNIxtnG+8cymLGcYlDRE/e
 qaBGtLSR1+K5rpTV3QPBnhpvLZ7fYbSWddGkuju2bdS8ZylUK6LjhQ0oxdALTouniYpwZZooy
 qCEMavBJtxALtoHJiMt+YwhE7dMvzJUvon2ycyNkii4yc+yXlO4nvRW9loiCg5kLReLd33R9S
 c4AN5SVFXmUweKoI2hkpnIB1O+hoPDPf7xTruBz+DKMrZq6gHHt422mY+dk/RfsMs07Z2RZZA
 1ikPrEvMG3mFSOSVsHlaJN+1RYewXp31Vh/DIM8LRRcNyM8AkbSmnZj/yptITxQZ/x21BdGn5
 NAr0ME/JXX0z/mI74afMCI21zgv6/928Hz4hGgVyCK/qL5IbNnRIZmqmgGQizAVW4mBxq7WER
 gMf8JfbK05MJqzF7afOLufxLj1I3CawjiKrlhcc/fv0/RZqzi9LLiooJ11Xj1QS4GtW3ISInx
 VAT67i3Qk7ELpBSKeR1A3B9Y9UXaHcxCnrOgZZVQGQtVGygOfTp1p4Civb9mHDUkW54m4UnMG
 kBflHbZXl28VNPtzLagYRTC8ZKpwztkMci4ve+QA5Pjsuy1a1p4YYpgb3E79FnFIj3TSXgi1E
 Ow4Vgyv0PkQHFC++MT2ItSsmdgHQu5tJXLbeWfLv2fzCTmZF0RFp1dJYSK0voeTR3EUkXqWzm
 lJp56NvnSVu8xcGwaP6sMW8zQ3UpcBFYw1Wz1bUeNjUN4CH4meHpPDZXl10+90Zsq1T50/sK7
 Do5c3qx3Q3K451qDPaFauwrfPc/J/jprdx54AO//mZI2GtxZeR1lfGBlSJFu0ljKZBoAVXXZ1
 AG4cOLXIyK7x+AKUZROUx4H19JtCju

Am 21.12.24 um 06:59 schrieb Kurt Borja:

> Split thermal features into a new DMI table to support upcoming file
> split.

Could it be that you also decided to reorder the quirk entries?

Thanks,
Armin WOlf

>
> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> ---
>   drivers/platform/x86/dell/alienware-wmi.c | 163 +++++++++-------------
>   1 file changed, 69 insertions(+), 94 deletions(-)
>
> diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platfor=
m/x86/dell/alienware-wmi.c
> index 0a0b72dc61ea..8ea08f5f8810 100644
> --- a/drivers/platform/x86/dell/alienware-wmi.c
> +++ b/drivers/platform/x86/dell/alienware-wmi.c
> @@ -118,8 +118,6 @@ struct quirk_entry {
>   	u8 hdmi_mux;
>   	u8 amplifier;
>   	u8 deepslp;
> -	bool thermal;
> -	bool gmode;
>   };
>
>   static struct quirk_entry *quirks;
> @@ -130,8 +128,6 @@ static struct quirk_entry quirk_inspiron5675 =3D {
>   	.hdmi_mux =3D 0,
>   	.amplifier =3D 0,
>   	.deepslp =3D 0,
> -	.thermal =3D false,
> -	.gmode =3D false,
>   };
>
>   static struct quirk_entry quirk_unknown =3D {
> @@ -139,8 +135,6 @@ static struct quirk_entry quirk_unknown =3D {
>   	.hdmi_mux =3D 0,
>   	.amplifier =3D 0,
>   	.deepslp =3D 0,
> -	.thermal =3D false,
> -	.gmode =3D false,
>   };
>
>   static struct quirk_entry quirk_x51_r1_r2 =3D {
> @@ -148,8 +142,6 @@ static struct quirk_entry quirk_x51_r1_r2 =3D {
>   	.hdmi_mux =3D 0,
>   	.amplifier =3D 0,
>   	.deepslp =3D 0,
> -	.thermal =3D false,
> -	.gmode =3D false,
>   };
>
>   static struct quirk_entry quirk_x51_r3 =3D {
> @@ -157,8 +149,6 @@ static struct quirk_entry quirk_x51_r3 =3D {
>   	.hdmi_mux =3D 0,
>   	.amplifier =3D 1,
>   	.deepslp =3D 0,
> -	.thermal =3D false,
> -	.gmode =3D false,
>   };
>
>   static struct quirk_entry quirk_asm100 =3D {
> @@ -166,8 +156,6 @@ static struct quirk_entry quirk_asm100 =3D {
>   	.hdmi_mux =3D 1,
>   	.amplifier =3D 0,
>   	.deepslp =3D 0,
> -	.thermal =3D false,
> -	.gmode =3D false,
>   };
>
>   static struct quirk_entry quirk_asm200 =3D {
> @@ -175,8 +163,6 @@ static struct quirk_entry quirk_asm200 =3D {
>   	.hdmi_mux =3D 1,
>   	.amplifier =3D 0,
>   	.deepslp =3D 1,
> -	.thermal =3D false,
> -	.gmode =3D false,
>   };
>
>   static struct quirk_entry quirk_asm201 =3D {
> @@ -184,26 +170,6 @@ static struct quirk_entry quirk_asm201 =3D {
>   	.hdmi_mux =3D 1,
>   	.amplifier =3D 1,
>   	.deepslp =3D 1,
> -	.thermal =3D false,
> -	.gmode =3D false,
> -};
> -
> -static struct quirk_entry quirk_g_series =3D {
> -	.num_zones =3D 2,
> -	.hdmi_mux =3D 0,
> -	.amplifier =3D 0,
> -	.deepslp =3D 0,
> -	.thermal =3D true,
> -	.gmode =3D true,
> -};
> -
> -static struct quirk_entry quirk_x_series =3D {
> -	.num_zones =3D 2,
> -	.hdmi_mux =3D 0,
> -	.amplifier =3D 0,
> -	.deepslp =3D 0,
> -	.thermal =3D true,
> -	.gmode =3D false,
>   };
>
>   static int __init dmi_matched(const struct dmi_system_id *dmi)
> @@ -242,133 +208,140 @@ static const struct dmi_system_id alienware_quir=
ks[] __initconst =3D {
>   	},
>   	{
>   		.callback =3D dmi_matched,
> -		.ident =3D "Alienware m17 R5",
> +		.ident =3D "Alienware X51 R1",
>   		.matches =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
> -			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware m17 R5 AMD"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware X51"),
>   		},
> -		.driver_data =3D &quirk_x_series,
> +		.driver_data =3D &quirk_x51_r1_r2,
>   	},
>   	{
>   		.callback =3D dmi_matched,
> -		.ident =3D "Alienware m18 R2",
> +		.ident =3D "Alienware X51 R2",
>   		.matches =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
> -			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware m18 R2"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware X51 R2"),
>   		},
> -		.driver_data =3D &quirk_x_series,
> +		.driver_data =3D &quirk_x51_r1_r2,
>   	},
>   	{
>   		.callback =3D dmi_matched,
> -		.ident =3D "Alienware x15 R1",
> +		.ident =3D "Alienware X51 R3",
>   		.matches =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
> -			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware x15 R1"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware X51 R3"),
>   		},
> -		.driver_data =3D &quirk_x_series,
> +		.driver_data =3D &quirk_x51_r3,
>   	},
>   	{
>   		.callback =3D dmi_matched,
> -		.ident =3D "Alienware x17 R2",
> +		.ident =3D "Dell Inc. Inspiron 5675",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Inspiron 5675"),
> +		},
> +		.driver_data =3D &quirk_inspiron5675,
> +	},
> +	{}
> +};
> +
> +struct awcc_features {
> +	bool gmode;
> +};
> +
> +static struct awcc_features g_series_features =3D {
> +	.gmode =3D true,
> +};
> +
> +static struct awcc_features x_series_features =3D {
> +	.gmode =3D false,
> +};
> +
> +static const struct dmi_system_id awcc_dmi_table[] __initconst =3D {
> +	{
> +		.ident =3D "Alienware m17 R5",
>   		.matches =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
> -			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware x17 R2"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware m17 R5 AMD"),
>   		},
> -		.driver_data =3D &quirk_x_series,
> +		.driver_data =3D &x_series_features,
>   	},
>   	{
> -		.callback =3D dmi_matched,
> -		.ident =3D "Alienware X51 R1",
> +		.ident =3D "Alienware m18 R2",
>   		.matches =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
> -			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware X51"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware m18 R2"),
>   		},
> -		.driver_data =3D &quirk_x51_r1_r2,
> +		.driver_data =3D &x_series_features,
>   	},
>   	{
> -		.callback =3D dmi_matched,
> -		.ident =3D "Alienware X51 R2",
> +		.ident =3D "Alienware x15 R1",
>   		.matches =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
> -			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware X51 R2"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware x15 R1"),
>   		},
> -		.driver_data =3D &quirk_x51_r1_r2,
> +		.driver_data =3D &x_series_features,
>   	},
>   	{
> -		.callback =3D dmi_matched,
> -		.ident =3D "Alienware X51 R3",
> +		.ident =3D "Alienware x17 R2",
>   		.matches =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
> -			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware X51 R3"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware x17 R2"),
>   		},
> -		.driver_data =3D &quirk_x51_r3,
> +		.driver_data =3D &x_series_features,
>   	},
>   	{
> -		.callback =3D dmi_matched,
>   		.ident =3D "Dell Inc. G15 5510",
>   		.matches =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
>   			DMI_MATCH(DMI_PRODUCT_NAME, "Dell G15 5510"),
>   		},
> -		.driver_data =3D &quirk_g_series,
> +		.driver_data =3D &g_series_features,
>   	},
>   	{
> -		.callback =3D dmi_matched,
>   		.ident =3D "Dell Inc. G15 5511",
>   		.matches =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
>   			DMI_MATCH(DMI_PRODUCT_NAME, "Dell G15 5511"),
>   		},
> -		.driver_data =3D &quirk_g_series,
> +		.driver_data =3D &g_series_features,
>   	},
>   	{
> -		.callback =3D dmi_matched,
>   		.ident =3D "Dell Inc. G15 5515",
>   		.matches =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
>   			DMI_MATCH(DMI_PRODUCT_NAME, "Dell G15 5515"),
>   		},
> -		.driver_data =3D &quirk_g_series,
> +		.driver_data =3D &g_series_features,
>   	},
>   	{
> -		.callback =3D dmi_matched,
>   		.ident =3D "Dell Inc. G3 3500",
>   		.matches =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
>   			DMI_MATCH(DMI_PRODUCT_NAME, "G3 3500"),
>   		},
> -		.driver_data =3D &quirk_g_series,
> +		.driver_data =3D &g_series_features,
>   	},
>   	{
> -		.callback =3D dmi_matched,
>   		.ident =3D "Dell Inc. G3 3590",
>   		.matches =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
>   			DMI_MATCH(DMI_PRODUCT_NAME, "G3 3590"),
>   		},
> -		.driver_data =3D &quirk_g_series,
> +		.driver_data =3D &g_series_features,
>   	},
>   	{
> -		.callback =3D dmi_matched,
>   		.ident =3D "Dell Inc. G5 5500",
>   		.matches =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
>   			DMI_MATCH(DMI_PRODUCT_NAME, "G5 5500"),
>   		},
> -		.driver_data =3D &quirk_g_series,
> -	},
> -	{
> -		.callback =3D dmi_matched,
> -		.ident =3D "Dell Inc. Inspiron 5675",
> -		.matches =3D {
> -			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> -			DMI_MATCH(DMI_PRODUCT_NAME, "Inspiron 5675"),
> -		},
> -		.driver_data =3D &quirk_inspiron5675,
> +		.driver_data =3D &g_series_features,
>   	},
> -	{}
>   };
>
> +struct awcc_features *awcc;
> +
>   struct color_platform {
>   	u8 blue;
>   	u8 green;
> @@ -1009,7 +982,7 @@ static int thermal_profile_set(struct platform_prof=
ile_handler *pprof,
>
>   	priv =3D container_of(pprof, struct awcc_priv, pp_handler);
>
> -	if (quirks->gmode) {
> +	if (awcc->gmode) {
>   		u32 gmode_status;
>   		int ret;
>
> @@ -1077,7 +1050,7 @@ static int create_thermal_profile(struct wmi_devic=
e *wdev)
>   	if (bitmap_empty(priv->pp_handler.choices, PLATFORM_PROFILE_LAST))
>   		return -ENODEV;
>
> -	if (quirks->gmode) {
> +	if (awcc->gmode) {
>   		priv->supported_thermal_profiles[PLATFORM_PROFILE_PERFORMANCE] =3D
>   			WMAX_THERMAL_MODE_GMODE;
>
> @@ -1328,7 +1301,7 @@ static int wmax_wmi_probe(struct wmi_device *wdev,=
 const void *context)
>   	};
>   	int ret =3D 0;
>
> -	if (quirks->thermal)
> +	if (awcc)
>   		ret =3D alienware_awcc_setup(wdev);
>   	else
>   		ret =3D alienware_alienfx_setup(&pdata);
> @@ -1338,7 +1311,7 @@ static int wmax_wmi_probe(struct wmi_device *wdev,=
 const void *context)
>
>   static void wmax_wmi_remove(struct wmi_device *wdev)
>   {
> -	if (quirks->thermal)
> +	if (awcc)
>   		alienware_awcc_exit(wdev);
>   	else
>   		alienware_alienfx_exit(wdev);
> @@ -1362,6 +1335,18 @@ static struct wmi_driver alienware_wmax_wmi_drive=
r =3D {
>
>   static int __init alienware_wmax_wmi_init(void)
>   {
> +	const struct dmi_system_id *id;
> +
> +	id =3D dmi_first_match(awcc_dmi_table);
> +	if (id)
> +		awcc =3D id->driver_data;
> +
> +	if (force_platform_profile)
> +		awcc =3D &x_series_features;
> +
> +	if (force_gmode)
> +		awcc =3D &g_series_features;
> +
>   	return wmi_driver_register(&alienware_wmax_wmi_driver);
>   }
>
> @@ -1378,16 +1363,6 @@ static int __init alienware_wmi_init(void)
>   	if (quirks =3D=3D NULL)
>   		quirks =3D &quirk_unknown;
>
> -	if (force_platform_profile)
> -		quirks->thermal =3D true;
> -
> -	if (force_gmode) {
> -		if (quirks->thermal)
> -			quirks->gmode =3D true;
> -		else
> -			pr_warn("force_gmode requires platform profile support\n");
> -	}
> -
>   	if (wmi_has_guid(WMAX_CONTROL_GUID)) {
>   		interface =3D WMAX;
>   		ret =3D alienware_wmax_wmi_init();
