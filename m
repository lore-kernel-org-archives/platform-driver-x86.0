Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61BAF2C681
	for <platform-driver-x86@vger.kernel.org>; Thu,  4 Jan 2024 21:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dYHjlVhW"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-33677fb38a3so866001f8f.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 04 Jan 2024 13:20:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704403249; x=1705008049; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gqYENL+VvJTzdBxLe2anXMWlpp8J0tjMM5OnjSFbRxE=;
        b=dYHjlVhWhgv8dgGgBzOHtZnhdro/uC+Azv5CwJ9FQtbtmG4ZU2CR8wioMFhQ/4p3qk
         2/qwx0dWmj4PAxHkbgHMEgDlKk9fswNqEZcKOR/nBvag5adeSlQH28ATe5ePJ66KcbR+
         OxKZXTqbmqGe61hULQzhhY7tukl0ifg+H4ijGygRqPSdMSRmAFpxDcUiBUcX/aBQPmSx
         fALayro0yS0AVsKsJiEISQAxAW4ZLiwNPMh4xImdHF+QGeCAd2H01g32yokQbUaFwajn
         61qathRYSszCztV1N5NqDIl69YWeZVk6WtX+l6jEGKelSC/mpotytKYwgWWKeHeco5DQ
         tndA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704403249; x=1705008049;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gqYENL+VvJTzdBxLe2anXMWlpp8J0tjMM5OnjSFbRxE=;
        b=OY62V3x826w8BJ/PuS6YqM2DptUiltewBUpCUjEJkeOUxk1J+z6+9CQ4UAqVUmVYXa
         D5+mGGjWJoTb87kq8ZCzjX34OJYEWg5fYNhrXT4YIhVegOBrrAq14lVYbrs2qDh28PTz
         erCM+8yxmyJmvJjHBkfEs1zsgB4/KzMGym9E2GpD6a07hlfcO1wyoKC+8KdZ8GbxUOX6
         uKPkcNKTBbrNswNZ+Rvh4aBLFothz5janNzam2QY442Mdrb9ICSEhA28pYN6N2n2Wk4O
         TScMuRDA+jmkBJH8dyt79g0LaQ/rguAoKyfWtrZRnNXUvOnnJ8kvi79IRFkuB6Yg+27e
         Ivfw==
X-Gm-Message-State: AOJu0YwMHBhbaisREEHUyi/eUS8ApxzpzZwasUchWedmjnm481t9izGM
	djEgfmopBaET+0sOY0NsCAo=
X-Google-Smtp-Source: AGHT+IHlq9gHFHKhP6R96Ipu+Nfc3/A9JrbFdN7SAgE8gE8IdpoOc8SJYF3HiHNq1EafEwaNzM3Irg==
X-Received: by 2002:adf:db06:0:b0:337:4698:5bcb with SMTP id s6-20020adfdb06000000b0033746985bcbmr623909wri.119.1704403249173;
        Thu, 04 Jan 2024 13:20:49 -0800 (PST)
Received: from alexis-pc (cust-west-par-46-193-0-235.cust.wifirst.net. [46.193.0.235])
        by smtp.gmail.com with ESMTPSA id s11-20020adfdb0b000000b00336ebf93416sm123812wri.17.2024.01.04.13.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jan 2024 13:20:48 -0800 (PST)
Date: Thu, 4 Jan 2024 22:20:47 +0100
From: Alexis Belmonte <alexbelm48@gmail.com>
To: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, putr4.s@gmail.com
Subject: Re: [PATCH 2/2] platform/x86: hp-wmi: Add thermal profile support
 for 8BAD boards
Message-ID: <ZZchL7XUz54tJVMs@alexis-pc>
References: <ZZFGgfsfrU2vuQoI@alexis-pc>
 <e12b3ce3-f3e8-5d6f-ecb0-37f1e4778644@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e12b3ce3-f3e8-5d6f-ecb0-37f1e4778644@linux.intel.com>

On Thu, Jan 04, 2024 at 08:00:15PM +0200, Ilpo Järvinen wrote:
> On Sun, 31 Dec 2023, Alexis Belmonte wrote:
> 
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
> > 
> > The third flag defined in the hp_thermal_profile_omen_flags enum,
> > HP_OMEN_EC_FLAGS_JUSTSET, is present for completeness.
> 
> I don't understand this. Based on the name of the flag, I'd have expected 
> it has to be set (but its purpose is not known), but the code below does 
> not do that?

It does not indeed, that's what I meant by 'completeness'. I defined it as a way
to show that I acknowledged the existence of that bit in the register, but I do
not use it.

I can comment it (or even remove it) if necessary.

On Thu, Jan 04, 2024 at 08:00:15PM +0200, Ilpo Järvinen wrote:
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
> 
> u8 ?
> 
> I know this driver uses char in many place but if this is binary data, u8 
> is the correct type (and the other char instances should be converted 
> to u8 too eventually).
>

Alright, I did not know about this. I am a first timer to this driver
and the whole Linux kernel source code, so I'm happy to learn things
from this experience! :]

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
> 
> Please put this to the usual place (beginning of the block or function).
> I know it's now possible to place them anywhere because of what cleanup.h 
> requires but lets not start to spread them all around just because we can,
> it makes finding the declaration harder, you could also initialize to 0 
> so you don't need the else branch below.
> 
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
> 
OK, this should be fixed now.
> 
> -- 
>  i.
> 

Thank you for reviewing my 2nd patch -- I've also noticed that I've missed
another detail in my first patch, so I'll send both of them right after this
e-mail so as to separate all of this from my answers to your questionings and
remarks.

I might be slightly less reactive for one or two weeks, as I've started my 2nd
year at my IT school; but I won't go away, as the laptop that I'm implementing
support for is also the same laptop that I daily drive, so I'm pretty much
obligated to finish this, soon or later! :]

Alexis
