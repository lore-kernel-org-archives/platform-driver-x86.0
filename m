Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC201374CB;
	Thu,  2 Jan 2025 16:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735835810; cv=none; b=GjIVe+tXkaUZQ/xJfdT/KnSBZPdl9VByilBAIkgNKxDWAHf4VLbqNWdCbNGBdwXfbkVhlE50aMGcY+iYmZNANSZLfo6uFhjA2b4C87i6Jg2k98mqwZZj0XF/6p4Szpv8JsrayTXr8V4gZPRZvwT5X3wX6RYzd2xw57BisKu4x5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735835810; c=relaxed/simple;
	bh=HGeKK3+QD1N8xuSRmBHWbhhoiVdFuwp5FQnsksvQ2is=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uny7VI2DQFuGZ+qU4EkwREj6y+2J8TvioFRnv1yebIe7MhjdgO7R+Uwhm2YbewilPhbzrzaQve8g9oqGtnFPhkFj0R7LdbwulQVuiT2zivQyNBTgZzGGXknKMyweJXytrsUq2pXZEruBnpn2v9u/TASf0MeLo0PPch8j+Ya+61w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=fNY4z9fq; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="fNY4z9fq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1735835794; x=1736440594; i=w_armin@gmx.de;
	bh=w3h24sSvfpUAdP1ZUrUcojFdGhHKhpJIZ0TkWOjtZXY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=fNY4z9fqLBJ2VsdfI9vvLuYE+nM+1z6kIEgdbEl0ngjr+Vw1AV311terhaYhHSN+
	 3E230Y5Eihmjxfc+Pcdys/su7x9x9iLKi8mhtoLd/DmQja0pZcxpu7aQZwd5L9hXr
	 gZzSemmeXqDW6WS4io9vr1nO+pLDcjKGrDKicpZEhWDyO7LbM0mcPqZb1mz3ipXGN
	 9WdFnhPi0Kld0aspwuuAzEGUW9f60F+MT6zYZRL+RAERjAJJNTiGZQII1Xb+6hX6L
	 /jwGpFgJt4peFjzZ+nOdYOXWAv4qaARXwKD7mIAYRagjX7UMgmk6FZxt5hQEBGn9I
	 bOsHl/nmUmTeu40ySQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.14] ([91.14.230.110]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MEm2D-1tIB7C3vYp-002Y5S; Thu, 02
 Jan 2025 17:36:34 +0100
Message-ID: <3ac357c0-934b-4d9d-8dcc-7a64b9b82a70@gmx.de>
Date: Thu, 2 Jan 2025 17:36:32 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/20] alienware-wmi: Split DMI table
To: Kurt Borja <kuurtb@gmail.com>, platform-driver-x86@vger.kernel.org
Cc: Dell.Client.Kernel@dell.com, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com, linux-kernel@vger.kernel.org,
 mario.limonciello@amd.com
References: <20241229194506.8268-2-kuurtb@gmail.com>
 <20241229194506.8268-15-kuurtb@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20241229194506.8268-15-kuurtb@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:xwNxPcC7dAj35RbRGo3P3ECWr8ZBVJvfn0txTXE37FkWhJyDmC8
 hIlC13LGyikaZUrjCSybr802kCL4W7BcxB80j7EmZB9Cy/+WSGLsuTU8WIQIX74OqxB9BVw
 2Khys4w1H44/eE8Fjksb8AzsPIElkWp5/tlyRkYt1MWZezItPs14ACeO+kp5m603CEf6R3U
 DCPKA490mq2dHmibhVNOA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:WlXXbMr3UTQ=;lLPpnq85iIotZ8LpD+ru8oXUaqt
 L+yEQ48wvYt21gzwDD6+iZL3cW/UGBu35Qbbdkz8+dEbedWZDP/W3M4cCMqEYa1P6o6E1/Zb6
 hbUwzGjlGAti1wCex66KJlz9hMmoHiLQ0BiLq5TpSGn+NsYaK3N4r+j6rI32BiBnduXSISjhZ
 gzbnkzGXLW6EQsn+S0gvpdonBfP11Jb407n/3qL4MhonxNErWJPVgiSKPSGo+zPwFOPaIgB3H
 w9FF6bsCmso5CVdhfegQj3qZgTX+BWnTlnHR4e5zO1631jZ5cMkj7zjtmOZz7jxJCOxJUVeig
 rDzhmQ5JOKKY55RxWuVqBVDeIBHQmwHA7XbR7pFDpfxqHhlTxw5CVu/g/JIR1PS7pclBBcqYd
 0oV9zZXPYtaOk8gYgU/GvgCCYJ//KlF6pcxsQEWUqgat2OdwxJMfqvNAWSw+NeR8J4Hk6ss9u
 Mee5VxXaqqOhTILqK33vreoNvZ83ZXrfJRJITOuWpOvOs9tWQO/0YditSJHsf4pAcAfL/uOwb
 pC4A5UkrcyQB5ZUTu7AONoCiow2nZnkI79Ea+dA/pVqesxWc8t/mQ3+maXnUz1MKmGTqjzpLo
 /jW5rWGwOanQutJIT6AbvVHsaP9d+CvDcglyoW+/G7nVt6uBkrdXNflikiTdasAVCPlQfYq3k
 Tq38G5ZjnHGykLJpvJIWVFLB08TiP+mbuUk0a+ciAT4VgtBXh8BBGpOiFHkte0dtpy1Q79w28
 RAnrSIZpeyJ3tOqnDIoYmLx4pbwKtEdWYzGeXpCRV+6IhY1uc/Os3pqi0/OFB/woynheQnaUM
 F466/M9f4P6VynojOI+mUK6AuAJp1OsPdx6tfqNKiJE+lvGPw5c0zo4GhGbr7VFqlyYXfDVaz
 qmwLIuKb9Se5HDrJlfl9y4way76ZhGiPzX8n/wmwuMKT1jdfUn+YwUvS+hMTNCMnF9I7tQnDL
 WCF7eHDRCQPwGVOZEVROL4PGGceIC3jjpsFeE9bXsYo4ONqVaZfEbMzwyrEhveVfU9Cwbw/4z
 IBINm+y63L3Vh9c3uT0GWGIr8RyW2nPlllE+otkxaJuh+3/JaLWwx1z5CUGCqtTd7Kuex6kJB
 u1NBMq0xVKcRQKDL2j1O64i5K5BM1O

Am 29.12.24 um 20:45 schrieb Kurt Borja:

> Split thermal features into a new DMI table to support upcoming file
> split. While at it rename quirk_entry -> alienfx_features and change
> hdmi_mux, amplifier and deepslp types to bool, because they are already
> being implicitly used as bools.
>
> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> ---
>   drivers/platform/x86/dell/alienware-wmi.c | 319 ++++++++++------------
>   1 file changed, 147 insertions(+), 172 deletions(-)
>
> diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platfor=
m/x86/dell/alienware-wmi.c
> index f80e7d488b9d..b9daf22efdbe 100644
> --- a/drivers/platform/x86/dell/alienware-wmi.c
> +++ b/drivers/platform/x86/dell/alienware-wmi.c
> @@ -113,97 +113,63 @@ static const enum platform_profile_option wmax_mod=
e_to_platform_profile[THERMAL_
>   	[THERMAL_MODE_BASIC_PERFORMANCE]		=3D PLATFORM_PROFILE_PERFORMANCE,
>   };
>
> -struct quirk_entry {
> +struct alienfx_quirks {
>   	u8 num_zones;
> -	u8 hdmi_mux;
> -	u8 amplifier;
> -	u8 deepslp;
> -	bool thermal;
> -	bool gmode;
> +	bool hdmi_mux;
> +	bool amplifier;
> +	bool deepslp;
>   };
>
> -static struct quirk_entry *quirks;
> +static struct alienfx_quirks *quirks;
>
>
> -static struct quirk_entry quirk_inspiron5675 =3D {
> +static struct alienfx_quirks quirk_inspiron5675 =3D {
>   	.num_zones =3D 2,
> -	.hdmi_mux =3D 0,
> -	.amplifier =3D 0,
> -	.deepslp =3D 0,
> -	.thermal =3D false,
> -	.gmode =3D false,
> +	.hdmi_mux =3D false,
> +	.amplifier =3D false,
> +	.deepslp =3D false,
>   };
>
> -static struct quirk_entry quirk_unknown =3D {
> +static struct alienfx_quirks quirk_unknown =3D {
>   	.num_zones =3D 2,
> -	.hdmi_mux =3D 0,
> -	.amplifier =3D 0,
> -	.deepslp =3D 0,
> -	.thermal =3D false,
> -	.gmode =3D false,
> +	.hdmi_mux =3D false,
> +	.amplifier =3D false,
> +	.deepslp =3D false,
>   };
>
> -static struct quirk_entry quirk_x51_r1_r2 =3D {
> +static struct alienfx_quirks quirk_x51_r1_r2 =3D {
>   	.num_zones =3D 3,
> -	.hdmi_mux =3D 0,
> -	.amplifier =3D 0,
> -	.deepslp =3D 0,
> -	.thermal =3D false,
> -	.gmode =3D false,
> +	.hdmi_mux =3D false,
> +	.amplifier =3D false,
> +	.deepslp =3D false,
>   };
>
> -static struct quirk_entry quirk_x51_r3 =3D {
> +static struct alienfx_quirks quirk_x51_r3 =3D {
>   	.num_zones =3D 4,
> -	.hdmi_mux =3D 0,
> -	.amplifier =3D 1,
> -	.deepslp =3D 0,
> -	.thermal =3D false,
> -	.gmode =3D false,
> -};
> -
> -static struct quirk_entry quirk_asm100 =3D {
> -	.num_zones =3D 2,
> -	.hdmi_mux =3D 1,
> -	.amplifier =3D 0,
> -	.deepslp =3D 0,
> -	.thermal =3D false,
> -	.gmode =3D false,
> -};
> -
> -static struct quirk_entry quirk_asm200 =3D {
> -	.num_zones =3D 2,
> -	.hdmi_mux =3D 1,
> -	.amplifier =3D 0,
> -	.deepslp =3D 1,
> -	.thermal =3D false,
> -	.gmode =3D false,
> +	.hdmi_mux =3D false,
> +	.amplifier =3D true,
> +	.deepslp =3D false,
>   };
>
> -static struct quirk_entry quirk_asm201 =3D {
> +static struct alienfx_quirks quirk_asm100 =3D {
>   	.num_zones =3D 2,
> -	.hdmi_mux =3D 1,
> -	.amplifier =3D 1,
> -	.deepslp =3D 1,
> -	.thermal =3D false,
> -	.gmode =3D false,
> +	.hdmi_mux =3D true,
> +	.amplifier =3D false,
> +	.deepslp =3D false,
>   };
>
> -static struct quirk_entry quirk_g_series =3D {
> +static struct alienfx_quirks quirk_asm200 =3D {
>   	.num_zones =3D 2,
> -	.hdmi_mux =3D 0,
> -	.amplifier =3D 0,
> -	.deepslp =3D 0,
> -	.thermal =3D true,
> -	.gmode =3D true,
> +	.hdmi_mux =3D true,
> +	.amplifier =3D false,
> +	.deepslp =3D true,
>   };
>
> -static struct quirk_entry quirk_x_series =3D {
> +static struct alienfx_quirks quirk_asm201 =3D {
>   	.num_zones =3D 2,
> -	.hdmi_mux =3D 0,
> -	.amplifier =3D 0,
> -	.deepslp =3D 0,
> -	.thermal =3D true,
> -	.gmode =3D false,
> +	.hdmi_mux =3D true,
> +	.amplifier =3D true,
> +	.deepslp =3D true,
>   };
>
>   static int __init dmi_matched(const struct dmi_system_id *dmi)
> @@ -240,42 +206,6 @@ static const struct dmi_system_id alienware_quirks[=
] __initconst =3D {
>   		},
>   		.driver_data =3D &quirk_asm201,
>   	},
> -	{
> -		.callback =3D dmi_matched,
> -		.ident =3D "Alienware m17 R5",
> -		.matches =3D {
> -			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
> -			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware m17 R5 AMD"),
> -		},
> -		.driver_data =3D &quirk_x_series,
> -	},
> -	{
> -		.callback =3D dmi_matched,
> -		.ident =3D "Alienware m18 R2",
> -		.matches =3D {
> -			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
> -			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware m18 R2"),
> -		},
> -		.driver_data =3D &quirk_x_series,
> -	},
> -	{
> -		.callback =3D dmi_matched,
> -		.ident =3D "Alienware x15 R1",
> -		.matches =3D {
> -			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
> -			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware x15 R1"),
> -		},
> -		.driver_data =3D &quirk_x_series,
> -	},
> -	{
> -		.callback =3D dmi_matched,
> -		.ident =3D "Alienware x17 R2",
> -		.matches =3D {
> -			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
> -			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware x17 R2"),
> -		},
> -		.driver_data =3D &quirk_x_series,
> -	},
>   	{
>   		.callback =3D dmi_matched,
>   		.ident =3D "Alienware X51 R1",
> @@ -303,60 +233,6 @@ static const struct dmi_system_id alienware_quirks[=
] __initconst =3D {
>   		},
>   		.driver_data =3D &quirk_x51_r3,
>   	},
> -	{
> -		.callback =3D dmi_matched,
> -		.ident =3D "Dell Inc. G15 5510",
> -		.matches =3D {
> -			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> -			DMI_MATCH(DMI_PRODUCT_NAME, "Dell G15 5510"),
> -		},
> -		.driver_data =3D &quirk_g_series,
> -	},
> -	{
> -		.callback =3D dmi_matched,
> -		.ident =3D "Dell Inc. G15 5511",
> -		.matches =3D {
> -			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> -			DMI_MATCH(DMI_PRODUCT_NAME, "Dell G15 5511"),
> -		},
> -		.driver_data =3D &quirk_g_series,
> -	},
> -	{
> -		.callback =3D dmi_matched,
> -		.ident =3D "Dell Inc. G15 5515",
> -		.matches =3D {
> -			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> -			DMI_MATCH(DMI_PRODUCT_NAME, "Dell G15 5515"),
> -		},
> -		.driver_data =3D &quirk_g_series,
> -	},
> -	{
> -		.callback =3D dmi_matched,
> -		.ident =3D "Dell Inc. G3 3500",
> -		.matches =3D {
> -			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> -			DMI_MATCH(DMI_PRODUCT_NAME, "G3 3500"),
> -		},
> -		.driver_data =3D &quirk_g_series,
> -	},
> -	{
> -		.callback =3D dmi_matched,
> -		.ident =3D "Dell Inc. G3 3590",
> -		.matches =3D {
> -			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> -			DMI_MATCH(DMI_PRODUCT_NAME, "G3 3590"),
> -		},
> -		.driver_data =3D &quirk_g_series,
> -	},
> -	{
> -		.callback =3D dmi_matched,
> -		.ident =3D "Dell Inc. G5 5500",
> -		.matches =3D {
> -			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> -			DMI_MATCH(DMI_PRODUCT_NAME, "G5 5500"),
> -		},
> -		.driver_data =3D &quirk_g_series,
> -	},
>   	{
>   		.callback =3D dmi_matched,
>   		.ident =3D "Dell Inc. Inspiron 5675",
> @@ -411,7 +287,7 @@ struct awcc_priv {
>
>   struct alienfx_priv {
>   	struct platform_device *pdev;
> -	struct quirk_entry *quirks;
> +	struct alienfx_quirks *quirks;
>   	struct led_classdev global_led;
>   	struct color_platform colors[4];
>   	u8 global_brightness;
> @@ -432,6 +308,103 @@ struct alienfx_platdata {
>
>   static u8 interface;
>
> +struct awcc_quirks {
> +	bool gmode;
> +};
> +
> +static struct awcc_quirks g_series_features =3D {
> +	.gmode =3D true,
> +};
> +
> +static struct awcc_quirks x_series_features =3D {
> +	.gmode =3D false,
> +};
> +
> +static const struct dmi_system_id awcc_dmi_table[] __initconst =3D {
> +	{
> +		.ident =3D "Alienware m17 R5",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware m17 R5 AMD"),
> +		},
> +		.driver_data =3D &x_series_features,
> +	},
> +	{
> +		.ident =3D "Alienware m18 R2",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware m18 R2"),
> +		},
> +		.driver_data =3D &x_series_features,
> +	},
> +	{
> +		.ident =3D "Alienware x15 R1",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware x15 R1"),
> +		},
> +		.driver_data =3D &x_series_features,
> +	},
> +	{
> +		.ident =3D "Alienware x17 R2",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware x17 R2"),
> +		},
> +		.driver_data =3D &x_series_features,
> +	},
> +	{
> +		.ident =3D "Dell Inc. G15 5510",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Dell G15 5510"),
> +		},
> +		.driver_data =3D &g_series_features,
> +	},
> +	{
> +		.ident =3D "Dell Inc. G15 5511",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Dell G15 5511"),
> +		},
> +		.driver_data =3D &g_series_features,
> +	},
> +	{
> +		.ident =3D "Dell Inc. G15 5515",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Dell G15 5515"),
> +		},
> +		.driver_data =3D &g_series_features,
> +	},
> +	{
> +		.ident =3D "Dell Inc. G3 3500",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "G3 3500"),
> +		},
> +		.driver_data =3D &g_series_features,
> +	},
> +	{
> +		.ident =3D "Dell Inc. G3 3590",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "G3 3590"),
> +		},
> +		.driver_data =3D &g_series_features,
> +	},
> +	{
> +		.ident =3D "Dell Inc. G5 5500",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "G5 5500"),
> +		},
> +		.driver_data =3D &g_series_features,
> +	},
> +};
> +
> +struct awcc_quirks *awcc;
> +
>   static int alienware_wmi_command(struct wmi_device *wdev, u32 method_i=
d,
>   				 void *in_args, size_t in_size, u32 *out_data)
>   {
> @@ -1013,7 +986,7 @@ static int thermal_profile_set(struct platform_prof=
ile_handler *pprof,
>   {
>   	struct awcc_priv *priv =3D container_of(pprof, struct awcc_priv, pp_h=
andler);
>
> -	if (quirks->gmode) {
> +	if (awcc->gmode) {
>   		u32 gmode_status;
>   		int ret;
>
> @@ -1079,7 +1052,7 @@ static int create_thermal_profile(struct wmi_devic=
e *wdev)
>   	if (bitmap_empty(priv->pp_handler.choices, PLATFORM_PROFILE_LAST))
>   		return -ENODEV;
>
> -	if (quirks->gmode) {
> +	if (awcc->gmode) {
>   		priv->supported_thermal_profiles[PLATFORM_PROFILE_PERFORMANCE] =3D
>   			WMAX_THERMAL_MODE_GMODE;
>
> @@ -1319,7 +1292,7 @@ static int wmax_wmi_probe(struct wmi_device *wdev,=
 const void *context)
>   	struct platform_device *pdev;
>   	int ret;
>
> -	if (quirks->thermal) {
> +	if (awcc) {
>   		ret =3D alienware_awcc_setup(wdev);
>   	} else {
>   		ret =3D alienware_alienfx_setup(&pdata);
> @@ -1335,7 +1308,7 @@ static int wmax_wmi_probe(struct wmi_device *wdev,=
 const void *context)
>
>   static void wmax_wmi_remove(struct wmi_device *wdev)
>   {
> -	if (quirks->thermal)
> +	if (awcc)
>   		alienware_awcc_exit(wdev);
>   	else
>   		alienware_alienfx_exit(wdev);
> @@ -1359,6 +1332,18 @@ static struct wmi_driver alienware_wmax_wmi_drive=
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

Please add a check here if awcc is not NULL and keep "pr_warn("force_gmode=
 requires platform profile support\n")"
if awcc is NULL.


Thanks,
Armin Wolf

> +
>   	return wmi_driver_register(&alienware_wmax_wmi_driver);
>   }
>
> @@ -1375,16 +1360,6 @@ static int __init alienware_wmi_init(void)
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
