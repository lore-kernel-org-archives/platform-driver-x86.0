Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818092CCB0
	for <platform-driver-x86@vger.kernel.org>; Thu,  4 Jan 2024 21:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kS85VvdY"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3374e332124so759549f8f.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 04 Jan 2024 13:56:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704405414; x=1705010214; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s04J/YHQ1BsMZHIlJmHiIlrWgezkUGBB4e0Rr2nZ75Q=;
        b=kS85VvdY3x7ojP4vrUy7IEKCgym6/Cb0VZySpA8vL4jCua0Y8cGwR8vDq6Y2tnXdB5
         KjvfvoBR2YzoxwQUVqPXdAwSYrbTNa21kLM+62AK4iP1wzMuh9lI7mD570VApgOZGfkU
         s0V5VnUVX8+GyQYqHpXAh5L+IOqvYSVhMJMPGFZ4tvhf+M9fjXPvHIeN2mg+P/o1wPgM
         JcIZWOpd8NRjV03jA4wlmZOviiRZSWAZA9YIyKkalFyOjbehVMO1MHBbYclas6pKgqR6
         5qazfig0OAzQ0ldhd+qzanSHsV0dlMtM0KRcW/dXVMdhKv7dfLxfEs8EUbx1cc3xodgr
         2AsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704405414; x=1705010214;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s04J/YHQ1BsMZHIlJmHiIlrWgezkUGBB4e0Rr2nZ75Q=;
        b=cpy8M8EfxcMpSOajPzkI71EX0btBUW7sD/Y4NNniLeXy9bFlA6gjtryTdEfh5fKvKn
         aJzDeW66ggmyiRjs345vRhweFqcMWm8417abtzFzHbgNST7+LZQHkIJSe8eRxeVt/EB5
         HWl8+bJkgfCmxo4fVtNmCycIU/sBFQ+GC9ZBdhB9YK6GwYqs/1H0bUGGLo076C2D/lkx
         JaOh7l8lKY6v/7V6udrs8G77pRk7xAPifLuwnWqusZcTBWBBkLmC4Go0oWIaU7la4cgY
         Lj4VogFKo9E2bbktc5NK8laeb2WfxEgks3enzbQQJcKapxM3SGHhyafaOlf66apOQWNH
         ZcvQ==
X-Gm-Message-State: AOJu0Yy5TjG7Pts4TnpK6rJQxTFo5BTD6nKJS/qI4RUgGU4iIpGhifHZ
	o5v+0nwMrHtVT+fOX+w9N6zjByZWICf0NA==
X-Google-Smtp-Source: AGHT+IFIungfgQqHQeA5HS4APb7hoqGOQ+U4HshBB0LeMjMb+asC4fT9SD2H2H0RlY2tbJcvJ0XD2A==
X-Received: by 2002:adf:e0c7:0:b0:334:b335:e667 with SMTP id m7-20020adfe0c7000000b00334b335e667mr687158wri.20.1704405414324;
        Thu, 04 Jan 2024 13:56:54 -0800 (PST)
Received: from alexis-pc (cust-west-par-46-193-0-235.cust.wifirst.net. [46.193.0.235])
        by smtp.gmail.com with ESMTPSA id f11-20020a5d50cb000000b00336ebf27d59sm157983wrt.78.2024.01.04.13.56.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jan 2024 13:56:54 -0800 (PST)
Date: Thu, 4 Jan 2024 22:56:52 +0100
From: Alexis Belmonte <alexbelm48@gmail.com>
To: Prajna Sariputra <putr4.s@gmail.com>
Cc: ilpo.jarvinen@linux.intel.com, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 2/2] platform/x86: hp-wmi: Add thermal profile support
 for 8BAD boards
Message-ID: <ZZcppP1mp5mAYh9K@alexis-pc>
References: <ZZFGgfsfrU2vuQoI@alexis-pc>
 <9280594.CDJkKcVGEf@n0067ax-linux62>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9280594.CDJkKcVGEf@n0067ax-linux62>

On Wed, Jan 03, 2024 at 11:21:24AM +1100, Prajna Sariputra wrote:
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

I haven't been able to figure out so yet -- there's a 'device_list.json'
file (IIRC) defined somewhere in the Omen Control Center app which I came
across, but no simple way of universally checking if this behavior is
active :[

I think I remember that I've seen another model ID near mine being defined,
so I think I *could* add it directly to both lists though, so that's
that.

> I have an Omen 16-n0000 (8A42), which has a Ryzen 7 6800H and a Radeon
> RX 6650M, and I've been patching the kernel to add it to the omen_thermal_profile_boards
> array for a while now. Just doing that prevents the worst of the throttling from
> happening (GPU dropping from 105W to 35W and the CPU being stuck at like 2GHz
> or less), but currently the GPU still drops to 75W eventually. Switching to
> performance does make it go back to 105W (and even 120W for a bit) before it
> goes back down to 75W, so it makes me wonder if there is actually a timer on my
> model that's doing it rather than just thermal throttling.

I think you've answered it yourself with your other mail ;]

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

I totally agree with you -- I just wanted to make sure that my patch was
conform enough with the rest of the codebae before making further progress :]

> Also, for what it's worth I had a conversation with one of the folks who wrote
> the platform profile code (Enver Balalic) a few months ago, and they said the
> profiles are just fan speed control modes on their Omen model.

I've made some reverse engineering on the Omen Control Center app through a
Windows VM, and I came across a few WMI calls in a class (IIRC `HpaClient`, or
something similar to that name) that do reads to this fan curve.

I haven't yet found the parts that do writes unfortunately, that also
needs to be browsed through. :[

The ACPI table that handles those WMI "methods" is the `SSDT` one --
I've disassembled it with `iasl`, which really helped figuring out the
expected data structures.

There's also a post on Reddit which talks about this feature; since this
was posted 2 years ago, I'd say that at least *some* models support
this -- but maybe I'm just misinterpreting it?

https://www.reddit.com/r/HPOmen/comments/poxe2i/new_hp_omen_update_adds_option_for_manual_fan/

> I ended up just testing the patch for myself (after adding my model number to
> the arrays), and it does improve the GPU performance further for me, instead
> of the GPU dropping to 75W after 2-4 minutes it is now able to maintain at least
> 100W even after 10 minutes (tested with Quake 2 RTX). So, it seems like the timer
> thing also applies to my Omen 16-n0000 (8A42). That performance also roughly
> matches up with how notebookcheck.net says my Omen performs in their review
> (103W performance, 72W balanced), so it'd be great if you can also include my
> model in your patch.

Glad to hear that it helps! Your model will be part of both lists next time I
send my updated patches for a "refreshed" review :]

> I just ran more tests with the CPU performance, and it seems that I might have
> misremembered how bad the fan curve was, since I have been limiting the CPU
> frequency to 4GHz instead of letting the CPU do its thing by itself (max boost is
> 4.7GHz), if I go back to the latter then with a heavily multithreaded workload
> (like compiling the kernel) the fans ramp up high within a few seconds of the
> CPU reaching 100C on its hottest core, and the CPU seems to maintain that
> temperature (or the sensors just don't report values above 100C, not sure). That
> seems worrying given that the supposed max operating temperature for the CPU
> (Ryzen 7 6800H) is 95C, but then again that probably won't be the case when gaming,
> which is the main use case for these laptops anyway.

This is definitely problematic yet also what I kind of experience, even
though we both have a completely different combination of CPUs and GPUs
-- at least we can say that the "draft" patches work regardless of the
backed hardware, which is good to hear :]

Thanks for testing out my patch -- as I've said to Ilpo, I won't be able to do
much progress for a few weeks BUT I'm still on it as soon as I'm available
again!

Alexis
