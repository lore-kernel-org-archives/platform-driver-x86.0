Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD3B28E06
	for <platform-driver-x86@vger.kernel.org>; Thu,  4 Jan 2024 18:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bw9AQZgs"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1d3ea5cc137so5834095ad.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 04 Jan 2024 10:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704392895; x=1704997695; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qiGLZCPEF7NWZuh18hQY9lQdCWM2huaY06iqN6WeOUA=;
        b=Bw9AQZgskeuX2jUJAiZih/LeyFvd/oNWsuFId/29tvoy3m8gY57WATAGA1TFAsMYae
         EY2w5tUoG3PguIqIaLcA7nc8bjx98CPL/daBmZJFg/9lWmZsNuP+i1bvw4jteui5LDdh
         9ff1gh6v+TquoZXDDTLm+N8dtPw+ZJIjVchrfj+ykol+KiAWNVfZsHR9zMG5dsJK0RY0
         OidHWLblpBtpLPBYU407qL2WULTc3ug3kmyXWTlzqpP/AR/Fx6hscCahJRcIZOQcc5lV
         d/DakMOMWDfFdgzrwRUqz5h9t9r8INuBzXrQgB4OHnQ15ZWw6+ACMqaUt6ZwPcQNjV5h
         qOww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704392895; x=1704997695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qiGLZCPEF7NWZuh18hQY9lQdCWM2huaY06iqN6WeOUA=;
        b=hdqgKC8vxWEcWXpQa5AslZTggvXs0gq7QlQ/vz7nUcTgZpQiRqxiN1pRyYdYiTbWKv
         JP+S0vnDybJ9p4T/P2SKArcbxrQbPY2y2wO1c4vcTA33jp2MawnrNXXjJjfmG8uz6Bzv
         2bySGyiqjTC4EqfjcmRB5H9TpmTK3/W6gTnkKugFeYKnbCp46ww2wU+ubM184Ukj9oRe
         m27JJp7ATJOdRINO/2saoY11qxY9laO9dgvqfMNQ8+jDOe0sRktDyJqhUFYwGwDJGVG7
         VRePlbN50pPBehU2hLx6prctDQ/Jvoz5HjdtqC8tzX/m5w8oE9ItnwD/g+P2oOmZm5iT
         Bd0A==
X-Gm-Message-State: AOJu0YyIV5zbwiLusjIlVKXvNg2bF26x7pc5O0xS5+ST0TSXiKgFpOcP
	tS50jxlEjhoAi1prxE0c5Bo=
X-Google-Smtp-Source: AGHT+IEH5fDAsbmPt33r0z71kthLrr64B5CZYs/jBDLILvWwVFLjle6634pLTcwu3/LR73GQdE6gWA==
X-Received: by 2002:a17:902:ec87:b0:1d3:f285:ab4 with SMTP id x7-20020a170902ec8700b001d3f2850ab4mr1147029plg.121.1704392894942;
        Thu, 04 Jan 2024 10:28:14 -0800 (PST)
Received: from n0067ax-linux62.localnet ([203.220.179.118])
        by smtp.gmail.com with ESMTPSA id nd14-20020a17090b4cce00b0028ad273525dsm4061408pjb.25.2024.01.04.10.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jan 2024 10:28:14 -0800 (PST)
From: Prajna Sariputra <putr4.s@gmail.com>
To: Alexis Belmonte <alexbelm48@gmail.com>
Cc: hdegoede@redhat.com, platform-driver-x86@vger.kernel.org
Subject:
 Re: [PATCH 2/2] platform/x86: hp-wmi: Add thermal profile support for 8BAD
 boards
Date: Fri, 05 Jan 2024 05:28:09 +1100
Message-ID: <3785739.kQq0lBPeGt@n0067ax-linux62>
In-Reply-To: <9280594.CDJkKcVGEf@n0067ax-linux62>
References: <ZZFGgfsfrU2vuQoI@alexis-pc> <9280594.CDJkKcVGEf@n0067ax-linux62>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday, 3 January 2024 11:21:24 AM AEDT Prajna Sariputra wrote:
> On Sunday, 31 December 2023 9:46:25 PM AEDT Alexis Belmonte wrote:
> > Add 8BAD to the list of boards which have thermal profile selection
> > available. This allows the CPU to draw more power than the default TDP
> > barrier defined by the 'balanced' thermal profile (around 50W), hence
> > allowing it to perform better without being throttled by the embedded
> > controller (around 130W).
> > 
> > We first need to set the HP_OMEN_EC_THERMAL_PROFILE_TIMER_OFFSET to zero.
> > This prevents the timer countdown from reaching zero, making the embedded
> > controller "force-switch" the system's thermal profile back to 'balanced'
> > automatically.
> > 
> > We also need to put a number of specific flags in
> > HP_OMEN_EC_THERMAL_PROFILE_FLAGS_OFFSET when we're switching to another
> > thermal profile:
> > 
> >    - for 'performance', we need to set both HP_OMEN_EC_FLAGS_TURBO and
> >      HP_OMEN_EC_FLAGS_NOTIMER;
> > 
> >    - for 'balanced' and 'powersave', we clear out the register to notify
> >      the system that we want to lower the TDP barrier as soon as possible.
> 
> Do you know if there's a way to check that a given model has this specific timer,
> other than just testing the patch?
> 
> I have an Omen 16-n0000 (8A42), which has a Ryzen 7 6800H and a Radeon
> RX 6650M, and I've been patching the kernel to add it to the omen_thermal_profile_boards
> array for a while now. Just doing that prevents the worst of the throttling from
> happening (GPU dropping from 105W to 35W and the CPU being stuck at like 2GHz
> or less), but currently the GPU still drops to 75W eventually. Switching to
> performance does make it go back to 105W (and even 120W for a bit) before it
> goes back down to 75W, so it makes me wonder if there is actually a timer on my
> model that's doing it rather than just thermal throttling.

I ended up just testing the patch for myself (after adding my model number to
the arrays), and it does improve the GPU performance further for me, instead
of the GPU dropping to 75W after 2-4 minutes it is now able to maintain at least
100W even after 10 minutes (tested with Quake 2 RTX). So, it seems like the timer
thing also applies to my Omen 16-n0000 (8A42). That performance also roughly
matches up with how notebookcheck.net says my Omen performs in their review
(103W performance, 72W balanced), so it'd be great if you can also include my
model in your patch.
> 
> > 
> > The third flag defined in the hp_thermal_profile_omen_flags enum,
> > HP_OMEN_EC_FLAGS_JUSTSET, is present for completeness.
> > 
> > To prevent potential behaviour breakage with other Omen models, a
> > separate omen_timed_thermal_profile_boards array has been added to list
> > which boards expose this behaviour.
> > 
> > Performance benchmarking was done with the help of silver.urih.com and
> > Google Chrome 120.0.6099.129, on Gnome 45.2, with the 'performance'
> > thermal profile set:
> > 
> > |                  | Performance |     Stress |   TDP |
> > |------------------|-------------|------------|-------|
> > |    with my patch |      P84549 |    S0.1891 |  131W | 
> > | without my patch |      P44084 |    S0.1359 |   47W |
> > 
> > The TDP measurements were done with the help of the s-tui utility,
> > during the load.
> > 
> > There is still work to be done:
> > 
> >    - tune the CPU and GPU fans to better cool down and enhance
> >      performance at the right time; right now, it seems that the fans are
> >      not properly reacting to thermal/performance events, which in turn
> >      either causes thermal throttling OR makes the fans spin way too long,
> >      even though the temperatures have lowered down
> 
> Yeah, that's also a problem with my model, where with a heavy CPU only workload
> the CPU would boost high and almost immediately run into thermal throttling and
> stays throttled for like a few minutes before the fans ramp up even a little,
> which is why I'm not sure that adding my model to the list upstream would be a
> good idea. My CPU doesn't seem to boost all that high though, I don't remember
> the performance mode making much of a difference the last time I tested it.

I just ran more tests with the CPU performance, and it seems that I might have
misremembered how bad the fan curve was, since I have been limiting the CPU
frequency to 4GHz instead of letting the CPU do its thing by itself (max boost is
4.7GHz), if I go back to the latter then with a heavily multithreaded workload
(like compiling the kernel) the fans ramp up high within a few seconds of the
CPU reaching 100C on its hottest core, and the CPU seems to maintain that
temperature (or the sensors just don't report values above 100C, not sure). That
seems worrying given that the supposed max operating temperature for the CPU
(Ryzen 7 6800H) is 95C, but then again that probably won't be the case when gaming,
which is the main use case for these laptops anyway.
> 
> Also, for what it's worth I had a conversation with one of the folks who wrote
> the platform profile code (Enver Balalic) a few months ago, and they said the
> profiles are just fan speed control modes on their Omen model.
> 
> > 
> >    - expose the CPU and GPU fan curves to user-land so that they can be
> >      controlled just like what the Omen Gaming Hub utility proposes to
> >      its users;
> > 
> > Signed-off-by: Alexis Belmonte <alexbelm48@gmail.com>
> > ---
> >  drivers/platform/x86/hp/hp-wmi.c | 63 +++++++++++++++++++++++++++++++-
> >  1 file changed, 61 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
> > index 95282c3a02ed..79caf5d79e05 100644
> > --- a/drivers/platform/x86/hp/hp-wmi.c
> > +++ b/drivers/platform/x86/hp/hp-wmi.c
> > @@ -38,6 +38,8 @@ MODULE_ALIAS("wmi:5FB7F034-2C63-45E9-BE91-3D44E2C707E4");
> >  #define HPWMI_EVENT_GUID "95F24279-4D7B-4334-9387-ACCDC67EF61C"
> >  #define HPWMI_BIOS_GUID "5FB7F034-2C63-45e9-BE91-3D44E2C707E4"
> >  
> > +#define HP_OMEN_EC_THERMAL_PROFILE_FLAGS_OFFSET 0x62
> > +#define HP_OMEN_EC_THERMAL_PROFILE_TIMER_OFFSET 0x63
> >  #define HP_OMEN_EC_THERMAL_PROFILE_OFFSET 0x95
> >  
> >  #define zero_if_sup(tmp) (zero_insize_support?0:sizeof(tmp)) // use when zero insize is required
> > @@ -57,7 +59,7 @@ static const char * const omen_thermal_profile_boards[] = {
> >  	"874A", "8603", "8604", "8748", "886B", "886C", "878A", "878B", "878C",
> >  	"88C8", "88CB", "8786", "8787", "8788", "88D1", "88D2", "88F4", "88FD",
> >  	"88F5", "88F6", "88F7", "88FE", "88FF", "8900", "8901", "8902", "8912",
> > -	"8917", "8918", "8949", "894A", "89EB"
> > +	"8917", "8918", "8949", "894A", "89EB", "8BAD"
> >  };
> >  
> >  /* DMI Board names of Omen laptops that are specifically set to be thermal
> > @@ -68,6 +71,14 @@ static const char * const omen_thermal_profile_force_v0_boards[] = {
> >  	"8607", "8746", "8747", "8749", "874A", "8748"
> >  };
> >  
> > +/* DMI board names of Omen laptops that have a thermal profile timer which will
> > + * cause the embedded controller to set the thermal profile back to
> > + * "balanced" when reaching zero.
> > + */
> > +static const char * const omen_timed_thermal_profile_boards[] = {
> > +	"8BAD"
> > +};
> > +
> >  /* DMI Board names of Victus laptops */
> >  static const char * const victus_thermal_profile_boards[] = {
> >  	"8A25"
> > @@ -184,6 +194,12 @@ enum hp_thermal_profile_omen_v1 {
> >  	HP_OMEN_V1_THERMAL_PROFILE_COOL		= 0x50,
> >  };
> >  
> > +enum hp_thermal_profile_omen_flags {
> > +	HP_OMEN_EC_FLAGS_TURBO		= 0x04,
> > +	HP_OMEN_EC_FLAGS_NOTIMER	= 0x02,
> > +	HP_OMEN_EC_FLAGS_JUSTSET	= 0x01,
> > +};
> > +
> >  enum hp_thermal_profile_victus {
> >  	HP_VICTUS_THERMAL_PROFILE_DEFAULT		= 0x00,
> >  	HP_VICTUS_THERMAL_PROFILE_PERFORMANCE		= 0x01,
> > @@ -451,7 +467,11 @@ static int hp_wmi_get_tablet_mode(void)
> >  
> >  static int omen_thermal_profile_set(int mode)
> >  {
> > -	char buffer[2] = {0, mode};
> > +	/* The Omen Control Center actively sets the first byte of the buffer to
> > +	 * 255, so let's mimic this behaviour to be as close as possible to
> > +	 * the original software.
> > +	 */
> > +	char buffer[2] = {-1, mode};
> >  	int ret;
> >  
> >  	ret = hp_wmi_perform_query(HPWMI_SET_PERFORMANCE_MODE, HPWMI_GM,
> > @@ -1203,6 +1221,28 @@ static int platform_profile_omen_get(struct platform_profile_handler *pprof,
> >  	return 0;
> >  }
> >  
> > +static bool has_omen_thermal_profile_ec_timer(void)
> > +{
> > +	const char *board_name = dmi_get_system_info(DMI_BOARD_NAME);
> > +
> > +	if (!board_name)
> > +		return false;
> > +
> > +	return match_string(omen_timed_thermal_profile_boards,
> > +			    ARRAY_SIZE(omen_timed_thermal_profile_boards),
> > +			    board_name) >= 0;
> > +}
> > +
> > +inline int omen_thermal_profile_ec_flags_set(enum hp_thermal_profile_omen_flags flags)
> > +{
> > +	return ec_write(HP_OMEN_EC_THERMAL_PROFILE_FLAGS_OFFSET, flags);
> > +}
> > +
> > +inline int omen_thermal_profile_ec_timer_set(char value)
> > +{
> > +	return ec_write(HP_OMEN_EC_THERMAL_PROFILE_TIMER_OFFSET, value);
> > +}
> > +
> >  static int platform_profile_omen_set(struct platform_profile_handler *pprof,
> >  				     enum platform_profile_option profile)
> >  {
> > @@ -1240,6 +1280,24 @@ static int platform_profile_omen_set(struct platform_profile_handler *pprof,
> >  	if (err < 0)
> >  		return err;
> >  
> > +	if (has_omen_thermal_profile_ec_timer()) {
> > +		err = omen_thermal_profile_ec_timer_set(0);
> > +		if (err < 0)
> > +			return err;
> > +
> > +		enum hp_thermal_profile_omen_flags flags;
> > +
> > +		if (profile == PLATFORM_PROFILE_PERFORMANCE)
> > +			flags = HP_OMEN_EC_FLAGS_NOTIMER |
> > +				HP_OMEN_EC_FLAGS_TURBO;
> > +		else
> > +			flags = 0;
> > +
> > +		err = omen_thermal_profile_ec_flags_set(flags);
> > +		if (err < 0)
> > +			return err;
> > +	}
> > +
> >  	return 0;
> >  }
> >  
> > 
> 
> 
> 
> 
> 
> 




