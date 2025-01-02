Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D83E149C4F;
	Thu,  2 Jan 2025 19:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735846644; cv=none; b=P/HjXvTMizyoEf/4A7Kgxt4Yh28boMmo0GTz/LcvNjxCcf3sVAmA1kek/18EqkdIQYFW5Q8a/lrUimSObKOLXClOOHgmlWZbMSnK92wJvozyKafujRyTOfXeqcT7BrwMeC7oLATXu3x/n5M/q4k/rBinR5Vhx/vAoVYZ0oKd1yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735846644; c=relaxed/simple;
	bh=RghteIhX4rzxc1n4mwHiZm28KGf21zOvRiRi6wsIzto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ph/Zb1uU6DmPAFY84giKVa4flaBVu7RZd/AYYmZNzUVh9ORNrXmZyqwjdbCm4LWhBKz3dz6f/xIRqceT3pPcMbyye4j+C9/r7MzaLwf/I9/XfS2xD7G8IfeM5f5uTwBLdmaxmKs8QZ5wKOqdoKJNMsrztLp+hqkAOklMdquAW/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U619W/92; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U619W/92"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6dd43aa1558so76171836d6.0;
        Thu, 02 Jan 2025 11:37:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735846641; x=1736451441; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YMu7ONABm6OlTtfpkU1sHj7LhBgkdB0YZvZbbOdJh0Q=;
        b=U619W/92Xe/ks5VLRH8mXP/F/DtnMy57svsbgPGMHs408Yfzr0L47/vWHNXCGeFN4H
         qK75iTftFLPFOvymbFtnYZ6j34PP455pVEkweaoVc6dYCBqRBZhsgGCttrbw3rTDjWnU
         MRX23+b/iKyB4AMWH5/6FMCDrM0b35PdxTvfa/mA5bM/4ONOnfExM6d1SVQCJ41b+WL6
         etPGFBFgbDGVQXfmfkTwblp4VaV8L1fuMXs9PBCPAjCVA4Y+aYogUk/gXCFExfUO6wvq
         acha630Vww7fEeOo9B6+20iGsN44bMiPQyc496+zT7FpIqdvD99kj8gKt0oLzX2sK03b
         Y9+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735846641; x=1736451441;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YMu7ONABm6OlTtfpkU1sHj7LhBgkdB0YZvZbbOdJh0Q=;
        b=ebfu0VNwaf3q1uqGm61hDzCgEgY8AlyIEx4TbEBwfvDjzgeljbKBiU5irumg4/NihV
         4xdISIIyS+Yh3dElnBALiJKKROmhT4b2erv7K00Mbad7q447mUOg5nwB0DrF5e+ivJtJ
         FNlpmhJ0vYvpOA5eshRmLFo7hsqjCc5r3h9tiMkwwjjLj4LEMIoTX4FA0fdWftX+SqGS
         YQiIS+ciOB6ETuNEDkuddjBgY0U+f3RdxkymenT/44i20mlGr6c3oLgwUk/8aM7/tBrH
         g3FgBJbUX/83FRZB8JGhoB30wdqDvgmPuoajcLbQ4n5s31aniY8wCxdNcCtsGsIlhPE4
         6euA==
X-Forwarded-Encrypted: i=1; AJvYcCXCXgHXJ1KhTbNjnOVE3Chbn1pcIu+d7iubSx5ILdKxXAc3v89HWsis0wt0c6pfU1Z/ZzSOEyNUSlOAFD0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzoEeJPrtxi6LdodYRb+hB8SdtG5V3Z1KCNPiyyZHkmzfmc6A53
	yGCphevplmazPVtcq1CA2JiDXFKmGQRhm9V/AQb/GJLr8nrTRuAqoxwf1w==
X-Gm-Gg: ASbGncuhQISLUyhzpVTOfwYW8U00eeuIE3aTaEhGMXgcRoKDFb0CDRz6TwKVWE7SOU1
	zBG47wNK/CeqsrAnv6q2A2zuUmK+livRetfuDErsOGHcuVSpVZh2zaW3IuTh0YOjFuasjg7t4qF
	6QEjKdRDsqEILOI7Sm1Skd0LuzRHQitSM6GoTLu57DFJczS4dmIhzPgGEgcWrfT1SQEPFDYpOOa
	UA/Wt20ar5Kc8TQ7/GAOqTapkj7bxt8fB8NXf1PaQUTw2bVwUyFnus0
X-Google-Smtp-Source: AGHT+IF/q8zIS9QMzvYsDya0hZuw6R1l31bhmgmkkM+u4Xiday3cQMopILRTqe8yBARKba9eYdK2YQ==
X-Received: by 2002:a05:6214:5087:b0:6d3:7a47:2034 with SMTP id 6a1803df08f44-6dd2330b2e4mr738562146d6.3.1735846641268;
        Thu, 02 Jan 2025 11:37:21 -0800 (PST)
Received: from alphacentauri ([2800:bf0:179:113e:f067:4e25:4298:6451])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dd18e3c3ffsm134035786d6.13.2025.01.02.11.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 11:37:20 -0800 (PST)
Date: Thu, 2 Jan 2025 14:37:17 -0500
From: Kurt Borja <kuurtb@gmail.com>
To: Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com, 
	hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com, linux-kernel@vger.kernel.org, 
	mario.limonciello@amd.com
Subject: Re: [PATCH v2 13/20] alienware-wmi: Split DMI table
Message-ID: <h44lprievl6oxj7knwqmfnuwigp3obcrlhwpie2i5aqc4nhevv@xxen7giolgn3>
References: <20241229194506.8268-2-kuurtb@gmail.com>
 <20241229194506.8268-15-kuurtb@gmail.com>
 <3ac357c0-934b-4d9d-8dcc-7a64b9b82a70@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3ac357c0-934b-4d9d-8dcc-7a64b9b82a70@gmx.de>

On Thu, Jan 02, 2025 at 05:36:32PM +0100, Armin Wolf wrote:
> Am 29.12.24 um 20:45 schrieb Kurt Borja:
> 
> > Split thermal features into a new DMI table to support upcoming file
> > split. While at it rename quirk_entry -> alienfx_features and change
> > hdmi_mux, amplifier and deepslp types to bool, because they are already
> > being implicitly used as bools.
> > 
> > Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> > ---
> >   drivers/platform/x86/dell/alienware-wmi.c | 319 ++++++++++------------
> >   1 file changed, 147 insertions(+), 172 deletions(-)
> > 
> > diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platform/x86/dell/alienware-wmi.c
> > index f80e7d488b9d..b9daf22efdbe 100644
> > --- a/drivers/platform/x86/dell/alienware-wmi.c
> > +++ b/drivers/platform/x86/dell/alienware-wmi.c
> > @@ -113,97 +113,63 @@ static const enum platform_profile_option wmax_mode_to_platform_profile[THERMAL_
> >   	[THERMAL_MODE_BASIC_PERFORMANCE]		= PLATFORM_PROFILE_PERFORMANCE,
> >   };
> > 
> > -struct quirk_entry {
> > +struct alienfx_quirks {
> >   	u8 num_zones;
> > -	u8 hdmi_mux;
> > -	u8 amplifier;
> > -	u8 deepslp;
> > -	bool thermal;
> > -	bool gmode;
> > +	bool hdmi_mux;
> > +	bool amplifier;
> > +	bool deepslp;
> >   };
> > 
> > -static struct quirk_entry *quirks;
> > +static struct alienfx_quirks *quirks;
> > 
> > 
> > -static struct quirk_entry quirk_inspiron5675 = {
> > +static struct alienfx_quirks quirk_inspiron5675 = {
> >   	.num_zones = 2,
> > -	.hdmi_mux = 0,
> > -	.amplifier = 0,
> > -	.deepslp = 0,
> > -	.thermal = false,
> > -	.gmode = false,
> > +	.hdmi_mux = false,
> > +	.amplifier = false,
> > +	.deepslp = false,
> >   };
> > 
> > -static struct quirk_entry quirk_unknown = {
> > +static struct alienfx_quirks quirk_unknown = {
> >   	.num_zones = 2,
> > -	.hdmi_mux = 0,
> > -	.amplifier = 0,
> > -	.deepslp = 0,
> > -	.thermal = false,
> > -	.gmode = false,
> > +	.hdmi_mux = false,
> > +	.amplifier = false,
> > +	.deepslp = false,
> >   };
> > 
> > -static struct quirk_entry quirk_x51_r1_r2 = {
> > +static struct alienfx_quirks quirk_x51_r1_r2 = {
> >   	.num_zones = 3,
> > -	.hdmi_mux = 0,
> > -	.amplifier = 0,
> > -	.deepslp = 0,
> > -	.thermal = false,
> > -	.gmode = false,
> > +	.hdmi_mux = false,
> > +	.amplifier = false,
> > +	.deepslp = false,
> >   };
> > 
> > -static struct quirk_entry quirk_x51_r3 = {
> > +static struct alienfx_quirks quirk_x51_r3 = {
> >   	.num_zones = 4,
> > -	.hdmi_mux = 0,
> > -	.amplifier = 1,
> > -	.deepslp = 0,
> > -	.thermal = false,
> > -	.gmode = false,
> > -};
> > -
> > -static struct quirk_entry quirk_asm100 = {
> > -	.num_zones = 2,
> > -	.hdmi_mux = 1,
> > -	.amplifier = 0,
> > -	.deepslp = 0,
> > -	.thermal = false,
> > -	.gmode = false,
> > -};
> > -
> > -static struct quirk_entry quirk_asm200 = {
> > -	.num_zones = 2,
> > -	.hdmi_mux = 1,
> > -	.amplifier = 0,
> > -	.deepslp = 1,
> > -	.thermal = false,
> > -	.gmode = false,
> > +	.hdmi_mux = false,
> > +	.amplifier = true,
> > +	.deepslp = false,
> >   };
> > 
> > -static struct quirk_entry quirk_asm201 = {
> > +static struct alienfx_quirks quirk_asm100 = {
> >   	.num_zones = 2,
> > -	.hdmi_mux = 1,
> > -	.amplifier = 1,
> > -	.deepslp = 1,
> > -	.thermal = false,
> > -	.gmode = false,
> > +	.hdmi_mux = true,
> > +	.amplifier = false,
> > +	.deepslp = false,
> >   };
> > 
> > -static struct quirk_entry quirk_g_series = {
> > +static struct alienfx_quirks quirk_asm200 = {
> >   	.num_zones = 2,
> > -	.hdmi_mux = 0,
> > -	.amplifier = 0,
> > -	.deepslp = 0,
> > -	.thermal = true,
> > -	.gmode = true,
> > +	.hdmi_mux = true,
> > +	.amplifier = false,
> > +	.deepslp = true,
> >   };
> > 
> > -static struct quirk_entry quirk_x_series = {
> > +static struct alienfx_quirks quirk_asm201 = {
> >   	.num_zones = 2,
> > -	.hdmi_mux = 0,
> > -	.amplifier = 0,
> > -	.deepslp = 0,
> > -	.thermal = true,
> > -	.gmode = false,
> > +	.hdmi_mux = true,
> > +	.amplifier = true,
> > +	.deepslp = true,
> >   };
> > 
> >   static int __init dmi_matched(const struct dmi_system_id *dmi)
> > @@ -240,42 +206,6 @@ static const struct dmi_system_id alienware_quirks[] __initconst = {
> >   		},
> >   		.driver_data = &quirk_asm201,
> >   	},
> > -	{
> > -		.callback = dmi_matched,
> > -		.ident = "Alienware m17 R5",
> > -		.matches = {
> > -			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
> > -			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware m17 R5 AMD"),
> > -		},
> > -		.driver_data = &quirk_x_series,
> > -	},
> > -	{
> > -		.callback = dmi_matched,
> > -		.ident = "Alienware m18 R2",
> > -		.matches = {
> > -			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
> > -			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware m18 R2"),
> > -		},
> > -		.driver_data = &quirk_x_series,
> > -	},
> > -	{
> > -		.callback = dmi_matched,
> > -		.ident = "Alienware x15 R1",
> > -		.matches = {
> > -			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
> > -			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware x15 R1"),
> > -		},
> > -		.driver_data = &quirk_x_series,
> > -	},
> > -	{
> > -		.callback = dmi_matched,
> > -		.ident = "Alienware x17 R2",
> > -		.matches = {
> > -			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
> > -			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware x17 R2"),
> > -		},
> > -		.driver_data = &quirk_x_series,
> > -	},
> >   	{
> >   		.callback = dmi_matched,
> >   		.ident = "Alienware X51 R1",
> > @@ -303,60 +233,6 @@ static const struct dmi_system_id alienware_quirks[] __initconst = {
> >   		},
> >   		.driver_data = &quirk_x51_r3,
> >   	},
> > -	{
> > -		.callback = dmi_matched,
> > -		.ident = "Dell Inc. G15 5510",
> > -		.matches = {
> > -			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> > -			DMI_MATCH(DMI_PRODUCT_NAME, "Dell G15 5510"),
> > -		},
> > -		.driver_data = &quirk_g_series,
> > -	},
> > -	{
> > -		.callback = dmi_matched,
> > -		.ident = "Dell Inc. G15 5511",
> > -		.matches = {
> > -			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> > -			DMI_MATCH(DMI_PRODUCT_NAME, "Dell G15 5511"),
> > -		},
> > -		.driver_data = &quirk_g_series,
> > -	},
> > -	{
> > -		.callback = dmi_matched,
> > -		.ident = "Dell Inc. G15 5515",
> > -		.matches = {
> > -			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> > -			DMI_MATCH(DMI_PRODUCT_NAME, "Dell G15 5515"),
> > -		},
> > -		.driver_data = &quirk_g_series,
> > -	},
> > -	{
> > -		.callback = dmi_matched,
> > -		.ident = "Dell Inc. G3 3500",
> > -		.matches = {
> > -			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> > -			DMI_MATCH(DMI_PRODUCT_NAME, "G3 3500"),
> > -		},
> > -		.driver_data = &quirk_g_series,
> > -	},
> > -	{
> > -		.callback = dmi_matched,
> > -		.ident = "Dell Inc. G3 3590",
> > -		.matches = {
> > -			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> > -			DMI_MATCH(DMI_PRODUCT_NAME, "G3 3590"),
> > -		},
> > -		.driver_data = &quirk_g_series,
> > -	},
> > -	{
> > -		.callback = dmi_matched,
> > -		.ident = "Dell Inc. G5 5500",
> > -		.matches = {
> > -			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> > -			DMI_MATCH(DMI_PRODUCT_NAME, "G5 5500"),
> > -		},
> > -		.driver_data = &quirk_g_series,
> > -	},
> >   	{
> >   		.callback = dmi_matched,
> >   		.ident = "Dell Inc. Inspiron 5675",
> > @@ -411,7 +287,7 @@ struct awcc_priv {
> > 
> >   struct alienfx_priv {
> >   	struct platform_device *pdev;
> > -	struct quirk_entry *quirks;
> > +	struct alienfx_quirks *quirks;
> >   	struct led_classdev global_led;
> >   	struct color_platform colors[4];
> >   	u8 global_brightness;
> > @@ -432,6 +308,103 @@ struct alienfx_platdata {
> > 
> >   static u8 interface;
> > 
> > +struct awcc_quirks {
> > +	bool gmode;
> > +};
> > +
> > +static struct awcc_quirks g_series_features = {
> > +	.gmode = true,
> > +};
> > +
> > +static struct awcc_quirks x_series_features = {
> > +	.gmode = false,
> > +};
> > +
> > +static const struct dmi_system_id awcc_dmi_table[] __initconst = {
> > +	{
> > +		.ident = "Alienware m17 R5",
> > +		.matches = {
> > +			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
> > +			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware m17 R5 AMD"),
> > +		},
> > +		.driver_data = &x_series_features,
> > +	},
> > +	{
> > +		.ident = "Alienware m18 R2",
> > +		.matches = {
> > +			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
> > +			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware m18 R2"),
> > +		},
> > +		.driver_data = &x_series_features,
> > +	},
> > +	{
> > +		.ident = "Alienware x15 R1",
> > +		.matches = {
> > +			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
> > +			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware x15 R1"),
> > +		},
> > +		.driver_data = &x_series_features,
> > +	},
> > +	{
> > +		.ident = "Alienware x17 R2",
> > +		.matches = {
> > +			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
> > +			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware x17 R2"),
> > +		},
> > +		.driver_data = &x_series_features,
> > +	},
> > +	{
> > +		.ident = "Dell Inc. G15 5510",
> > +		.matches = {
> > +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> > +			DMI_MATCH(DMI_PRODUCT_NAME, "Dell G15 5510"),
> > +		},
> > +		.driver_data = &g_series_features,
> > +	},
> > +	{
> > +		.ident = "Dell Inc. G15 5511",
> > +		.matches = {
> > +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> > +			DMI_MATCH(DMI_PRODUCT_NAME, "Dell G15 5511"),
> > +		},
> > +		.driver_data = &g_series_features,
> > +	},
> > +	{
> > +		.ident = "Dell Inc. G15 5515",
> > +		.matches = {
> > +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> > +			DMI_MATCH(DMI_PRODUCT_NAME, "Dell G15 5515"),
> > +		},
> > +		.driver_data = &g_series_features,
> > +	},
> > +	{
> > +		.ident = "Dell Inc. G3 3500",
> > +		.matches = {
> > +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> > +			DMI_MATCH(DMI_PRODUCT_NAME, "G3 3500"),
> > +		},
> > +		.driver_data = &g_series_features,
> > +	},
> > +	{
> > +		.ident = "Dell Inc. G3 3590",
> > +		.matches = {
> > +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> > +			DMI_MATCH(DMI_PRODUCT_NAME, "G3 3590"),
> > +		},
> > +		.driver_data = &g_series_features,
> > +	},
> > +	{
> > +		.ident = "Dell Inc. G5 5500",
> > +		.matches = {
> > +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> > +			DMI_MATCH(DMI_PRODUCT_NAME, "G5 5500"),
> > +		},
> > +		.driver_data = &g_series_features,
> > +	},
> > +};
> > +
> > +struct awcc_quirks *awcc;
> > +
> >   static int alienware_wmi_command(struct wmi_device *wdev, u32 method_id,
> >   				 void *in_args, size_t in_size, u32 *out_data)
> >   {
> > @@ -1013,7 +986,7 @@ static int thermal_profile_set(struct platform_profile_handler *pprof,
> >   {
> >   	struct awcc_priv *priv = container_of(pprof, struct awcc_priv, pp_handler);
> > 
> > -	if (quirks->gmode) {
> > +	if (awcc->gmode) {
> >   		u32 gmode_status;
> >   		int ret;
> > 
> > @@ -1079,7 +1052,7 @@ static int create_thermal_profile(struct wmi_device *wdev)
> >   	if (bitmap_empty(priv->pp_handler.choices, PLATFORM_PROFILE_LAST))
> >   		return -ENODEV;
> > 
> > -	if (quirks->gmode) {
> > +	if (awcc->gmode) {
> >   		priv->supported_thermal_profiles[PLATFORM_PROFILE_PERFORMANCE] =
> >   			WMAX_THERMAL_MODE_GMODE;
> > 
> > @@ -1319,7 +1292,7 @@ static int wmax_wmi_probe(struct wmi_device *wdev, const void *context)
> >   	struct platform_device *pdev;
> >   	int ret;
> > 
> > -	if (quirks->thermal) {
> > +	if (awcc) {
> >   		ret = alienware_awcc_setup(wdev);
> >   	} else {
> >   		ret = alienware_alienfx_setup(&pdata);
> > @@ -1335,7 +1308,7 @@ static int wmax_wmi_probe(struct wmi_device *wdev, const void *context)
> > 
> >   static void wmax_wmi_remove(struct wmi_device *wdev)
> >   {
> > -	if (quirks->thermal)
> > +	if (awcc)
> >   		alienware_awcc_exit(wdev);
> >   	else
> >   		alienware_alienfx_exit(wdev);
> > @@ -1359,6 +1332,18 @@ static struct wmi_driver alienware_wmax_wmi_driver = {
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
> 
> Please add a check here if awcc is not NULL and keep "pr_warn("force_gmode requires platform profile support\n")"
> if awcc is NULL.

Sure!

> 
> 
> Thanks,
> Armin Wolf
> 
> > +
> >   	return wmi_driver_register(&alienware_wmax_wmi_driver);
> >   }
> > 
> > @@ -1375,16 +1360,6 @@ static int __init alienware_wmi_init(void)
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
