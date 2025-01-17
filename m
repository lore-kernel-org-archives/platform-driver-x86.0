Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D724B1A2390;
	Fri, 17 Jan 2025 17:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737134125; cv=none; b=Uv3k0ff0S1F1oNjNs6ZVsWq35nZs5eFP9GmjSbpWVzLNeptgEHdalSGXonLddi5LLLgzkW+i5F9x/i5YlO0hQSdbEyAm5yv+aGKc/Svq0pLncki0mLu8MogjNA7/OfdkFjoRs7qbqu+Hq/cYJn2usHQxm1FpThjV+L3CbnG+rjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737134125; c=relaxed/simple;
	bh=2wcUQzHnlr+p957i7HMNm0NnGd2V15gwnsqD829HkBM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=d5my4U1vFjm+Awzu/J1MhekUlapIlEIUDbPnc0OxBiO0dc9ZcRkM3aRzoBu7fKPd5vQ7BdNgMePvzQekd0FRJHWzx85wGE4K1GaHWv5YDx0ICgS7RC1IXNJP9Z6A79FmKfm7GCqPi1+bwcSR04Hs33siR/DyS8oa17vnZIlA4J4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C16W9czx; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C16W9czx"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7b6ed0de64aso238045185a.0;
        Fri, 17 Jan 2025 09:15:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737134123; x=1737738923; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jDk9/dy5U5rJhf5VTf4VVyJNki1UVahLaoZD4qQu4TQ=;
        b=C16W9czxpVTEuuUaqZKjiScbuw++8XI8OI5xUrRb68r+PagIE9YTpzxw/TMzslhrl5
         xBNVt05qXc3olYz4mn8VdcEzlGKUPKjKoMhlCCXZj+Zl82PKcAe1kXCk+XfWJSYI6iOf
         EROCPmQSACRqXid27T+sfp+S0XBm2MH0n/ll1voT+Gpgnxx+pWxvtoDJt/pxJsRZ+pGO
         l5pudFLy6F9GYwEBk3hOyARv4kFLmeQzkw2EV5HW0BUIs8E2jMkBAjP/nSPkz//Cn7Of
         gOEdqVLS3js0ueRuVxYdAR9sa+1AzNqHmIr/2DkXoR6eFmwrL0ArW9NmgtgjqAcOHdwH
         1QJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737134123; x=1737738923;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jDk9/dy5U5rJhf5VTf4VVyJNki1UVahLaoZD4qQu4TQ=;
        b=Px8p3d7fevynehjOUcwhqrD2rtPi3CHt7psqR/vO5595NwnIS4/XPL69wcvAVoRnUq
         qLRfgNr6n1f2wHEgKabbNhR8gNI3c+TbEOX4ycQyJfwbUQceLqmXvdcE3Nnvgg6mQngO
         1YJBIxMYkrqQE0K5+zBYPnbcXQqB/Y37ZiB+d7SE7athiOBzTeLEszctsLru1xNC6gQY
         fS7GXCHvhtQDTw51IOnIFJw1L8NDUA9QkxRs0lHhywr9fMU5VrkFNGJjD2b0sb0qaVAm
         9wEJB3hNek1+HugQmwmTH5VFLdOvTUhTEAqOc6oC59iIwDaT1MKSDsJU993p8PGsdnHq
         /Q7A==
X-Forwarded-Encrypted: i=1; AJvYcCUpxzhuBPRa56k1ltMrV3MJ3CtDAGLyRJ1pM+1RdJPiGk664oia5/CscxTgjNEU0mTvZuAdgY/bl2UErpDfogKdFrhubQ==@vger.kernel.org, AJvYcCVfUsQEw60ytFH8hgOb8ao7yYvViV2kag2Ms9V45HlbYob9i5defXM0wNz0LtzQDyKMiqC7iS8ZxfaERA4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6CRamwTiOW4uQbhCJqdUtdUsM/CbEZAome9Y4ImXhA1pOuJI0
	/iQlYP7YT+4WTVzGGSqEjrPWB5TGMuwFtbZXtzd7+tmnMyfAwZsd
X-Gm-Gg: ASbGncuWwJTmhbYo3rMcNrHtysPhjxhSuaLDHkted9EKLDaskB91E0OkCjo4T9U4Nm9
	xm+Cw4LuuehZPBPaKFwk9sFwbv/AzltZtF0zkoNy37615zmrnKQ1nrJT6sJ3b/7n/IjSdX1qBgX
	3AYyBwOjOU+1hOCcN9UHNTgoxICBnV+6uSeRnwGknGIMmZyKjdHNKoVVaheXzgyHMnj0c2OCG6o
	CvXvj0MEzU7LLF5GBc1PUQNrJmTZeTtrrtRCg7MmyEnsFxz
X-Google-Smtp-Source: AGHT+IH72PBRsdoOknbo3MczWGwFq4tV0lDx8/ZMMUBj67fItj3mOauD030aZbUkiUNWLgupTqiJrg==
X-Received: by 2002:a05:620a:3912:b0:7bc:de68:e932 with SMTP id af79cd13be357-7be5243f616mr1804070485a.23.1737134122685;
        Fri, 17 Jan 2025 09:15:22 -0800 (PST)
Received: from localhost ([2800:bf0:82:1159:c837:3446:190b:188d])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8642cab2d48sm573451241.1.2025.01.17.09.15.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jan 2025 09:15:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 17 Jan 2025 12:15:19 -0500
Message-Id: <D74INHNOTI0S.C7WFNTL0VLXA@gmail.com>
Subject: Re: [PATCH v4 07/14] platform/x86: alienware-wmi: Split DMI table
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Kurt Borja" <kuurtb@gmail.com>, <platform-driver-x86@vger.kernel.org>
Cc: =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, "Armin
 Wolf" <W_Armin@gmx.de>, "Mario Limonciello" <mario.limonciello@amd.com>,
 "Hans de Goede" <hdegoede@redhat.com>, <Dell.Client.Kernel@dell.com>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20250117081347.8573-1-kuurtb@gmail.com>
 <20250117081347.8573-8-kuurtb@gmail.com>
In-Reply-To: <20250117081347.8573-8-kuurtb@gmail.com>

On Fri Jan 17, 2025 at 3:13 AM -05, Kurt Borja wrote:
> Split thermal features into a new DMI table to support upcoming file
> split. While at it:
>
> Rename quirk_entry -> alienfx_features,
> Rename quirks -> alienfx
>
> and change hdmi_mux, amplifier and deepslp types to bool, because they ar=
e
> already being implicitly used as bools.
>
> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> ---
>  drivers/platform/x86/dell/alienware-wmi.c | 337 ++++++++++------------
>  1 file changed, 158 insertions(+), 179 deletions(-)
>
> diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platform=
/x86/dell/alienware-wmi.c
> index 877b3d9d7cab..5d9816521072 100644
> --- a/drivers/platform/x86/dell/alienware-wmi.c
> +++ b/drivers/platform/x86/dell/alienware-wmi.c
> @@ -113,102 +113,68 @@ static const enum platform_profile_option wmax_mod=
e_to_platform_profile[THERMAL_
>  	[THERMAL_MODE_BASIC_PERFORMANCE]		=3D PLATFORM_PROFILE_PERFORMANCE,
>  };
> =20
> -struct quirk_entry {
> +struct alienfx_quirks {
>  	u8 num_zones;
> -	u8 hdmi_mux;
> -	u8 amplifier;
> -	u8 deepslp;
> -	bool thermal;
> -	bool gmode;
> +	bool hdmi_mux;
> +	bool amplifier;
> +	bool deepslp;
>  };
> =20
> -static struct quirk_entry *quirks;
> +static struct alienfx_quirks *alienfx;
> =20
> =20
> -static struct quirk_entry quirk_inspiron5675 =3D {
> +static struct alienfx_quirks quirk_inspiron5675 =3D {
>  	.num_zones =3D 2,
> -	.hdmi_mux =3D 0,
> -	.amplifier =3D 0,
> -	.deepslp =3D 0,
> -	.thermal =3D false,
> -	.gmode =3D false,
> +	.hdmi_mux =3D false,
> +	.amplifier =3D false,
> +	.deepslp =3D false,
>  };
> =20
> -static struct quirk_entry quirk_unknown =3D {
> +static struct alienfx_quirks quirk_unknown =3D {
>  	.num_zones =3D 2,
> -	.hdmi_mux =3D 0,
> -	.amplifier =3D 0,
> -	.deepslp =3D 0,
> -	.thermal =3D false,
> -	.gmode =3D false,
> +	.hdmi_mux =3D false,
> +	.amplifier =3D false,
> +	.deepslp =3D false,
>  };
> =20
> -static struct quirk_entry quirk_x51_r1_r2 =3D {
> +static struct alienfx_quirks quirk_x51_r1_r2 =3D {
>  	.num_zones =3D 3,
> -	.hdmi_mux =3D 0,
> -	.amplifier =3D 0,
> -	.deepslp =3D 0,
> -	.thermal =3D false,
> -	.gmode =3D false,
> +	.hdmi_mux =3D false,
> +	.amplifier =3D false,
> +	.deepslp =3D false,
>  };
> =20
> -static struct quirk_entry quirk_x51_r3 =3D {
> +static struct alienfx_quirks quirk_x51_r3 =3D {
>  	.num_zones =3D 4,
> -	.hdmi_mux =3D 0,
> -	.amplifier =3D 1,
> -	.deepslp =3D 0,
> -	.thermal =3D false,
> -	.gmode =3D false,
> +	.hdmi_mux =3D false,
> +	.amplifier =3D true,
> +	.deepslp =3D false,
>  };
> =20
> -static struct quirk_entry quirk_asm100 =3D {
> +static struct alienfx_quirks quirk_asm100 =3D {
>  	.num_zones =3D 2,
> -	.hdmi_mux =3D 1,
> -	.amplifier =3D 0,
> -	.deepslp =3D 0,
> -	.thermal =3D false,
> -	.gmode =3D false,
> +	.hdmi_mux =3D true,
> +	.amplifier =3D false,
> +	.deepslp =3D false,
>  };
> =20
> -static struct quirk_entry quirk_asm200 =3D {
> +static struct alienfx_quirks quirk_asm200 =3D {
>  	.num_zones =3D 2,
> -	.hdmi_mux =3D 1,
> -	.amplifier =3D 0,
> -	.deepslp =3D 1,
> -	.thermal =3D false,
> -	.gmode =3D false,
> +	.hdmi_mux =3D true,
> +	.amplifier =3D false,
> +	.deepslp =3D true,
>  };
> =20
> -static struct quirk_entry quirk_asm201 =3D {
> +static struct alienfx_quirks quirk_asm201 =3D {
>  	.num_zones =3D 2,
> -	.hdmi_mux =3D 1,
> -	.amplifier =3D 1,
> -	.deepslp =3D 1,
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
> +	.hdmi_mux =3D true,
> +	.amplifier =3D true,
> +	.deepslp =3D true,
>  };
> =20
>  static int __init dmi_matched(const struct dmi_system_id *dmi)
>  {
> -	quirks =3D dmi->driver_data;
> +	alienfx =3D dmi->driver_data;
>  	return 1;
>  }
> =20
> @@ -240,42 +206,6 @@ static const struct dmi_system_id alienware_quirks[]=
 __initconst =3D {
>  		},
>  		.driver_data =3D &quirk_asm201,
>  	},
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
>  	{
>  		.callback =3D dmi_matched,
>  		.ident =3D "Alienware X51 R1",
> @@ -303,60 +233,6 @@ static const struct dmi_system_id alienware_quirks[]=
 __initconst =3D {
>  		},
>  		.driver_data =3D &quirk_x51_r3,
>  	},
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
>  	{
>  		.callback =3D dmi_matched,
>  		.ident =3D "Dell Inc. Inspiron 5675",
> @@ -431,6 +307,103 @@ struct alienfx_platdata {
> =20
>  static u8 interface;
> =20
> +struct awcc_quirks {
> +	bool gmode;
> +};
> +
> +static struct awcc_quirks g_series_quirks =3D {
> +	.gmode =3D true,
> +};
> +
> +static struct awcc_quirks generic_quirks =3D {
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
> +		.driver_data =3D &generic_quirks,
> +	},
> +	{
> +		.ident =3D "Alienware m18 R2",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware m18 R2"),
> +		},
> +		.driver_data =3D &generic_quirks,
> +	},
> +	{
> +		.ident =3D "Alienware x15 R1",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware x15 R1"),
> +		},
> +		.driver_data =3D &generic_quirks,
> +	},
> +	{
> +		.ident =3D "Alienware x17 R2",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware x17 R2"),
> +		},
> +		.driver_data =3D &generic_quirks,
> +	},
> +	{
> +		.ident =3D "Dell Inc. G15 5510",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Dell G15 5510"),
> +		},
> +		.driver_data =3D &g_series_quirks,
> +	},
> +	{
> +		.ident =3D "Dell Inc. G15 5511",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Dell G15 5511"),
> +		},
> +		.driver_data =3D &g_series_quirks,
> +	},
> +	{
> +		.ident =3D "Dell Inc. G15 5515",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Dell G15 5515"),
> +		},
> +		.driver_data =3D &g_series_quirks,
> +	},
> +	{
> +		.ident =3D "Dell Inc. G3 3500",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "G3 3500"),
> +		},
> +		.driver_data =3D &g_series_quirks,
> +	},
> +	{
> +		.ident =3D "Dell Inc. G3 3590",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "G3 3590"),
> +		},
> +		.driver_data =3D &g_series_quirks,
> +	},
> +	{
> +		.ident =3D "Dell Inc. G5 5500",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "G5 5500"),
> +		},
> +		.driver_data =3D &g_series_quirks,
> +	},
> +};
> +
> +struct awcc_quirks *awcc;

I just noticed this should be static. I'll fix for v5 after Armin's
feedback.

~ Kurt

> <snip>
