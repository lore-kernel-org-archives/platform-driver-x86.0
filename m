Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F4038528E;
	Fri, 27 Dec 2024 04:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735275331; cv=none; b=O8ZW1VT5hJPtchcC6APgF0OKfjqXWNqBg+M/SUW3dTPGKocuoGnrRqABOsllgnNvBSwYFKi2VcnbsgeSGkn2HUB9TUh9hqWrFwdxErFAg4PcdZCrQ0XOHXBhkZq0JUnVK5GGJT11uprKGI+btcf+zf8m1RBEKUAs3ILMCElghPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735275331; c=relaxed/simple;
	bh=e95pII5ZAR44rsComEYbnaQJ7At6rK762bNtz604TG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eIO08aSxigzE12+s2/tKof8T+tt3xpjNl88cL9xSk8i3VTSuVdFhKTs/sLWk5AY3uia3k1kytmtnV1BU38h8XoB4DsiT89N0HT5n5ebYvaLEqOe2DxiU1H1w3+rzJqnVnUcxKrMw5SIVqCAM9Gm69F0WweWs6DktHNlGhC6MPLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GDBDshz0; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GDBDshz0"
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-85b88a685e6so2889615241.2;
        Thu, 26 Dec 2024 20:55:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735275325; x=1735880125; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4kzTt6G2wusX/U67GmXs2WFarZerLNMbfiSofUn83U0=;
        b=GDBDshz0/h5YA1iriUPlo5LHKD5jYxZ6qTLV+yepc5TmHAIC3JIyuKqGDAyGmy8X4a
         RvqtQKMwE0bLKfo2uxUDmIGcH3z3ioyW51Pc7wjqVunwuFonXCtCtnGeUUEFh5BOuYrj
         WOeEKr+HaLHn1866raBDK9Vlli8rTNDUtijlq/Jki6jefcVk4hcAOJ8F3EXOyXyPjR4S
         A6Rv22kOnWKrzj4RhyQiTyYYXg1UQor3X7Eqt4I5Mb68ax1aD0dLekCyhH/g3FgEIt08
         MGnvpxpDMWPsLAEE8Mfgc4hxhCLEyDXSXf0x/dA2DP6lV9InTIMF8HKxRXiaj7CX2w2z
         /NXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735275325; x=1735880125;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4kzTt6G2wusX/U67GmXs2WFarZerLNMbfiSofUn83U0=;
        b=rwePitzk0/r7hRT3koK2rXTppm/9j0bG0bFeTeN9o3kLlf43Qb9k3GhAybVsBbXBOo
         4efxMoURoFvcnrO76GMfuP6nbelQavoBsq1lVAxvXtQA0OPTma76rP0EnKb4eJ+JTzWt
         SJmsKfWxQaEERoxaxWZR1ftZTOEuwwoCIGHGV7yQeWKF6Wr28YlbZvHLeAD+AB8Fv/Hk
         2Gfzs4Rv5e4eC5FgYK6ikma1Am7ZPp0xyJ408o+X4NUUzOF9cY/mnTQh0eHUkqfmZ5jL
         2w71Wgt8XyaCkcbxtACDNeUyjX/c3mnaLROMbydVNPYTjsLElMqsclEDOHeYJQ83I2Dn
         15Pg==
X-Forwarded-Encrypted: i=1; AJvYcCXsgN5lEUuKo29YVgyNG3D5T7Z07uh651dafph2hAxsmCnpTgwlUhQOOKTE/krxjtrf3ZJRz4/hQ6K6Z0M=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKuoH2zspByxqZyTS5ravyuYHHMNLbUtnQqlAl+RnZmlJnanGm
	mH1jUsvk5qglis9lSyj4fzzuG8gvg9jhwurD4rsq8Zb3gJYvN/lX
X-Gm-Gg: ASbGncvXaoxm9rVwBam8P77EhaP/weVbeTBknc3lGTtCO7H70JR4HtIRVDFFipQJzXR
	kkzUkfy1M/8EhIQawGZE1brp/3f56GvLvY0EY61DNYzXse9mqEgeqZdM0ErRec/lJ90GX/Abhff
	LI0pi092QcFUVigtGxWIjA2PZKJ4QQJLmwPVbWUebFDmcK98hIAC9B3AYpUmxd96blE3evmQ7U4
	ogQQ6Myqh0X3biTphe0dtGVft/HCCO4AX0w+iyzrgREnTz0tUd94g==
X-Google-Smtp-Source: AGHT+IHzA/9S4qg5+tUh/DRf8VWhmxQ79yAJQXq7wZr3Q/VYFckHNxwb5IHleCRZ55JFVcXBm+LAVQ==
X-Received: by 2002:a05:6102:951:b0:4b1:1a24:e19c with SMTP id ada2fe7eead31-4b2cc35fe84mr22033658137.7.1735275324915;
        Thu, 26 Dec 2024 20:55:24 -0800 (PST)
Received: from alphacentauri ([2800:bf0:82:1159:1ea9:11b1:7af9:1277])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b2bf81560fsm2993816137.0.2024.12.26.20.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Dec 2024 20:55:24 -0800 (PST)
Date: Thu, 26 Dec 2024 23:55:21 -0500
From: Kurt Borja <kuurtb@gmail.com>
To: Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com, 
	mario.limonciello@amd.com, hdegoede@redhat.com, linux-kernel@vger.kernel.org, 
	Dell.Client.Kernel@dell.com
Subject: Re: [PATCH 13/20] alienware-wmi: Split DMI table
Message-ID: <r2yoc6dmpjvl2ihhlnj7ppylq5ykaibz2mpb6roezimmkxwmyv@q6uc27vjf5t3>
References: <20241221055917.10555-1-kuurtb@gmail.com>
 <20241221055917.10555-14-kuurtb@gmail.com>
 <02ff9ba4-87d2-436f-bf2a-33b4296505dd@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <02ff9ba4-87d2-436f-bf2a-33b4296505dd@gmx.de>

On Fri, Dec 27, 2024 at 04:55:28AM +0100, Armin Wolf wrote:
> Am 21.12.24 um 06:59 schrieb Kurt Borja:
> 
> > Split thermal features into a new DMI table to support upcoming file
> > split.
> 
> Could it be that you also decided to reorder the quirk entries?

No. I'll make this split lower in the file, so it doesn't mess up the
diff.

If I did reorder it by accident I will fix it.

> 
> Thanks,
> Armin WOlf
> 
> > 
> > Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> > ---
> >   drivers/platform/x86/dell/alienware-wmi.c | 163 +++++++++-------------
> >   1 file changed, 69 insertions(+), 94 deletions(-)
> > 
> > diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platform/x86/dell/alienware-wmi.c
> > index 0a0b72dc61ea..8ea08f5f8810 100644
> > --- a/drivers/platform/x86/dell/alienware-wmi.c
> > +++ b/drivers/platform/x86/dell/alienware-wmi.c
> > @@ -118,8 +118,6 @@ struct quirk_entry {
> >   	u8 hdmi_mux;
> >   	u8 amplifier;
> >   	u8 deepslp;
> > -	bool thermal;
> > -	bool gmode;
> >   };
> > 
> >   static struct quirk_entry *quirks;
> > @@ -130,8 +128,6 @@ static struct quirk_entry quirk_inspiron5675 = {
> >   	.hdmi_mux = 0,
> >   	.amplifier = 0,
> >   	.deepslp = 0,
> > -	.thermal = false,
> > -	.gmode = false,
> >   };
> > 
> >   static struct quirk_entry quirk_unknown = {
> > @@ -139,8 +135,6 @@ static struct quirk_entry quirk_unknown = {
> >   	.hdmi_mux = 0,
> >   	.amplifier = 0,
> >   	.deepslp = 0,
> > -	.thermal = false,
> > -	.gmode = false,
> >   };
> > 
> >   static struct quirk_entry quirk_x51_r1_r2 = {
> > @@ -148,8 +142,6 @@ static struct quirk_entry quirk_x51_r1_r2 = {
> >   	.hdmi_mux = 0,
> >   	.amplifier = 0,
> >   	.deepslp = 0,
> > -	.thermal = false,
> > -	.gmode = false,
> >   };
> > 
> >   static struct quirk_entry quirk_x51_r3 = {
> > @@ -157,8 +149,6 @@ static struct quirk_entry quirk_x51_r3 = {
> >   	.hdmi_mux = 0,
> >   	.amplifier = 1,
> >   	.deepslp = 0,
> > -	.thermal = false,
> > -	.gmode = false,
> >   };
> > 
> >   static struct quirk_entry quirk_asm100 = {
> > @@ -166,8 +156,6 @@ static struct quirk_entry quirk_asm100 = {
> >   	.hdmi_mux = 1,
> >   	.amplifier = 0,
> >   	.deepslp = 0,
> > -	.thermal = false,
> > -	.gmode = false,
> >   };
> > 
> >   static struct quirk_entry quirk_asm200 = {
> > @@ -175,8 +163,6 @@ static struct quirk_entry quirk_asm200 = {
> >   	.hdmi_mux = 1,
> >   	.amplifier = 0,
> >   	.deepslp = 1,
> > -	.thermal = false,
> > -	.gmode = false,
> >   };
> > 
> >   static struct quirk_entry quirk_asm201 = {
> > @@ -184,26 +170,6 @@ static struct quirk_entry quirk_asm201 = {
> >   	.hdmi_mux = 1,
> >   	.amplifier = 1,
> >   	.deepslp = 1,
> > -	.thermal = false,
> > -	.gmode = false,
> > -};
> > -
> > -static struct quirk_entry quirk_g_series = {
> > -	.num_zones = 2,
> > -	.hdmi_mux = 0,
> > -	.amplifier = 0,
> > -	.deepslp = 0,
> > -	.thermal = true,
> > -	.gmode = true,
> > -};
> > -
> > -static struct quirk_entry quirk_x_series = {
> > -	.num_zones = 2,
> > -	.hdmi_mux = 0,
> > -	.amplifier = 0,
> > -	.deepslp = 0,
> > -	.thermal = true,
> > -	.gmode = false,
> >   };
> > 
> >   static int __init dmi_matched(const struct dmi_system_id *dmi)
> > @@ -242,133 +208,140 @@ static const struct dmi_system_id alienware_quirks[] __initconst = {
> >   	},
> >   	{
> >   		.callback = dmi_matched,
> > -		.ident = "Alienware m17 R5",
> > +		.ident = "Alienware X51 R1",
> >   		.matches = {
> >   			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
> > -			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware m17 R5 AMD"),
> > +			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware X51"),
> >   		},
> > -		.driver_data = &quirk_x_series,
> > +		.driver_data = &quirk_x51_r1_r2,
> >   	},
> >   	{
> >   		.callback = dmi_matched,
> > -		.ident = "Alienware m18 R2",
> > +		.ident = "Alienware X51 R2",
> >   		.matches = {
> >   			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
> > -			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware m18 R2"),
> > +			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware X51 R2"),
> >   		},
> > -		.driver_data = &quirk_x_series,
> > +		.driver_data = &quirk_x51_r1_r2,
> >   	},
> >   	{
> >   		.callback = dmi_matched,
> > -		.ident = "Alienware x15 R1",
> > +		.ident = "Alienware X51 R3",
> >   		.matches = {
> >   			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
> > -			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware x15 R1"),
> > +			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware X51 R3"),
> >   		},
> > -		.driver_data = &quirk_x_series,
> > +		.driver_data = &quirk_x51_r3,
> >   	},
> >   	{
> >   		.callback = dmi_matched,
> > -		.ident = "Alienware x17 R2",
> > +		.ident = "Dell Inc. Inspiron 5675",
> > +		.matches = {
> > +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> > +			DMI_MATCH(DMI_PRODUCT_NAME, "Inspiron 5675"),
> > +		},
> > +		.driver_data = &quirk_inspiron5675,
> > +	},
> > +	{}
> > +};
> > +
> > +struct awcc_features {
> > +	bool gmode;
> > +};
> > +
> > +static struct awcc_features g_series_features = {
> > +	.gmode = true,
> > +};
> > +
> > +static struct awcc_features x_series_features = {
> > +	.gmode = false,
> > +};
> > +
> > +static const struct dmi_system_id awcc_dmi_table[] __initconst = {
> > +	{
> > +		.ident = "Alienware m17 R5",
> >   		.matches = {
> >   			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
> > -			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware x17 R2"),
> > +			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware m17 R5 AMD"),
> >   		},
> > -		.driver_data = &quirk_x_series,
> > +		.driver_data = &x_series_features,
> >   	},
> >   	{
> > -		.callback = dmi_matched,
> > -		.ident = "Alienware X51 R1",
> > +		.ident = "Alienware m18 R2",
> >   		.matches = {
> >   			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
> > -			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware X51"),
> > +			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware m18 R2"),
> >   		},
> > -		.driver_data = &quirk_x51_r1_r2,
> > +		.driver_data = &x_series_features,
> >   	},
> >   	{
> > -		.callback = dmi_matched,
> > -		.ident = "Alienware X51 R2",
> > +		.ident = "Alienware x15 R1",
> >   		.matches = {
> >   			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
> > -			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware X51 R2"),
> > +			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware x15 R1"),
> >   		},
> > -		.driver_data = &quirk_x51_r1_r2,
> > +		.driver_data = &x_series_features,
> >   	},
> >   	{
> > -		.callback = dmi_matched,
> > -		.ident = "Alienware X51 R3",
> > +		.ident = "Alienware x17 R2",
> >   		.matches = {
> >   			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
> > -			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware X51 R3"),
> > +			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware x17 R2"),
> >   		},
> > -		.driver_data = &quirk_x51_r3,
> > +		.driver_data = &x_series_features,
> >   	},
> >   	{
> > -		.callback = dmi_matched,
> >   		.ident = "Dell Inc. G15 5510",
> >   		.matches = {
> >   			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> >   			DMI_MATCH(DMI_PRODUCT_NAME, "Dell G15 5510"),
> >   		},
> > -		.driver_data = &quirk_g_series,
> > +		.driver_data = &g_series_features,
> >   	},
> >   	{
> > -		.callback = dmi_matched,
> >   		.ident = "Dell Inc. G15 5511",
> >   		.matches = {
> >   			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> >   			DMI_MATCH(DMI_PRODUCT_NAME, "Dell G15 5511"),
> >   		},
> > -		.driver_data = &quirk_g_series,
> > +		.driver_data = &g_series_features,
> >   	},
> >   	{
> > -		.callback = dmi_matched,
> >   		.ident = "Dell Inc. G15 5515",
> >   		.matches = {
> >   			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> >   			DMI_MATCH(DMI_PRODUCT_NAME, "Dell G15 5515"),
> >   		},
> > -		.driver_data = &quirk_g_series,
> > +		.driver_data = &g_series_features,
> >   	},
> >   	{
> > -		.callback = dmi_matched,
> >   		.ident = "Dell Inc. G3 3500",
> >   		.matches = {
> >   			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> >   			DMI_MATCH(DMI_PRODUCT_NAME, "G3 3500"),
> >   		},
> > -		.driver_data = &quirk_g_series,
> > +		.driver_data = &g_series_features,
> >   	},
> >   	{
> > -		.callback = dmi_matched,
> >   		.ident = "Dell Inc. G3 3590",
> >   		.matches = {
> >   			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> >   			DMI_MATCH(DMI_PRODUCT_NAME, "G3 3590"),
> >   		},
> > -		.driver_data = &quirk_g_series,
> > +		.driver_data = &g_series_features,
> >   	},
> >   	{
> > -		.callback = dmi_matched,
> >   		.ident = "Dell Inc. G5 5500",
> >   		.matches = {
> >   			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> >   			DMI_MATCH(DMI_PRODUCT_NAME, "G5 5500"),
> >   		},
> > -		.driver_data = &quirk_g_series,
> > -	},
> > -	{
> > -		.callback = dmi_matched,
> > -		.ident = "Dell Inc. Inspiron 5675",
> > -		.matches = {
> > -			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> > -			DMI_MATCH(DMI_PRODUCT_NAME, "Inspiron 5675"),
> > -		},
> > -		.driver_data = &quirk_inspiron5675,
> > +		.driver_data = &g_series_features,
> >   	},
> > -	{}
> >   };
> > 
> > +struct awcc_features *awcc;
> > +
> >   struct color_platform {
> >   	u8 blue;
> >   	u8 green;
> > @@ -1009,7 +982,7 @@ static int thermal_profile_set(struct platform_profile_handler *pprof,
> > 
> >   	priv = container_of(pprof, struct awcc_priv, pp_handler);
> > 
> > -	if (quirks->gmode) {
> > +	if (awcc->gmode) {
> >   		u32 gmode_status;
> >   		int ret;
> > 
> > @@ -1077,7 +1050,7 @@ static int create_thermal_profile(struct wmi_device *wdev)
> >   	if (bitmap_empty(priv->pp_handler.choices, PLATFORM_PROFILE_LAST))
> >   		return -ENODEV;
> > 
> > -	if (quirks->gmode) {
> > +	if (awcc->gmode) {
> >   		priv->supported_thermal_profiles[PLATFORM_PROFILE_PERFORMANCE] =
> >   			WMAX_THERMAL_MODE_GMODE;
> > 
> > @@ -1328,7 +1301,7 @@ static int wmax_wmi_probe(struct wmi_device *wdev, const void *context)
> >   	};
> >   	int ret = 0;
> > 
> > -	if (quirks->thermal)
> > +	if (awcc)
> >   		ret = alienware_awcc_setup(wdev);
> >   	else
> >   		ret = alienware_alienfx_setup(&pdata);
> > @@ -1338,7 +1311,7 @@ static int wmax_wmi_probe(struct wmi_device *wdev, const void *context)
> > 
> >   static void wmax_wmi_remove(struct wmi_device *wdev)
> >   {
> > -	if (quirks->thermal)
> > +	if (awcc)
> >   		alienware_awcc_exit(wdev);
> >   	else
> >   		alienware_alienfx_exit(wdev);
> > @@ -1362,6 +1335,18 @@ static struct wmi_driver alienware_wmax_wmi_driver = {
> > 
> >   static int __init alienware_wmax_wmi_init(void)
> >   {
> > +	const struct dmi_system_id *id;
> > +
> > +	id = dmi_first_match(awcc_dmi_table);
> > +	if (id)
> > +		awcc = id->driver_data;
> > +
> > +	if (force_platform_profile)
> > +		awcc = &x_series_features;
> > +
> > +	if (force_gmode)
> > +		awcc = &g_series_features;
> > +
> >   	return wmi_driver_register(&alienware_wmax_wmi_driver);
> >   }
> > 
> > @@ -1378,16 +1363,6 @@ static int __init alienware_wmi_init(void)
> >   	if (quirks == NULL)
> >   		quirks = &quirk_unknown;
> > 
> > -	if (force_platform_profile)
> > -		quirks->thermal = true;
> > -
> > -	if (force_gmode) {
> > -		if (quirks->thermal)
> > -			quirks->gmode = true;
> > -		else
> > -			pr_warn("force_gmode requires platform profile support\n");
> > -	}
> > -
> >   	if (wmi_has_guid(WMAX_CONTROL_GUID)) {
> >   		interface = WMAX;
> >   		ret = alienware_wmax_wmi_init();
