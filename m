Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76BD51BBBCA
	for <platform-driver-x86@vger.kernel.org>; Wed, 31 Jul 2024 14:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722437068; cv=none; b=N8+0+eooWssg5rMzzQ3fM7fhmRPc/MJ1mQ/kEDPBZyay3/nnOsqZI/PwvCJRkJl6f3QhdSl2tH8cMVdj+uGy9tBWmdk14QLRu3fuG0Z3J3IS5INnizy7jiXOiBwIDMGk6FD2dbHVTsI9priithoyWpvCWsR1heDHZg7y4l/uQYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722437068; c=relaxed/simple;
	bh=Q7aeHBvZsCyqs9gfKZrg7+fxzjku+RV4f2e4Yz3BG2o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MaMQ6w2STXuhoSL+/PnDas1UVrnvUX2iRwCdOYiut2S5BkUe0PVk8iCHLdnNXaE1L2DzD43KkEv2LiGOJVPNZNF5D7zOb1tByX+bIMfzyRzLcuaL4t/A40d13oktPOpLuS2JfotR20w+nwHDX/A3aP9saq2PVZeLTF1hA7KbdKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=24dx/BSs; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="24dx/BSs"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1fd7509397bso185255ad.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 31 Jul 2024 07:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722437067; x=1723041867; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3i/UQZTZmVMHIMP8zX0Oxg+kXspxWQWqewdCI78OJ+c=;
        b=24dx/BSsU9kx5XSe+vHTZaS4Ptq7EHe+U0VzVlrv4TjJDYCJjV2XntgJZhGLUJpcMq
         lSwIPRJSmMx6rt+Wk9edsvuW5HWmFNV1uKf9E55klt+SI/l/+2x0qiC5Wjqjnk08b/8b
         V8vZxXX/JZdXcyOZNBrJR/8lRweqT/rNYxMtf9QtoynRE+u3SBBmaNOsqYqqq+9K0VdX
         HA41KI+B9KHXUbkE8NO0GSC10+wUXFwLzRrpY9gvbOLtkF4ltk2h2YUZQA+WNwpuJd+0
         0p2BYi+zuJQjSjjNxki0x6Nrb3p1780OT1TOTigsLLAdu0mjhJvbDvDgQWd08TdTRzIX
         Pb7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722437067; x=1723041867;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3i/UQZTZmVMHIMP8zX0Oxg+kXspxWQWqewdCI78OJ+c=;
        b=or1R3Zz1LsTfnny1pVZalIZZ1DwUFp16gsJjrnRIxkh8BJ9KY2qYh/Wvm/Zoe0HwTA
         WOhLa1lrZSZT9nsBsMUw32XgtMVv/OiwceaxMjfjgaNTfvojZscVxNfh15QIMPk7kXI2
         VscxsaXraDjH3rTrI26TnsW9ekalf4cYjIuu9cjNEl17DNY/+LYnR6//nV+0fQzAjaEf
         yvmaV+3kp2FpqDkPYchzvJKKwOtUwdaDyxDemUqyBHCEvrMmPqcRd5Pypyd59BcmE0vF
         mtYpUqMroBJYD2NMKRijBpFTLFcPt4BeayalHyRUMVepMJo4IOIFhFM09tB5fW8pOryw
         Q0nQ==
X-Forwarded-Encrypted: i=1; AJvYcCXA3P45m7cm8FRnpNlcbEgZMVVOvIcUX2u1JVQpf2g2sQmsBG+PWozFHoT+gl9AWwhN53urIGfxDRFBoTTHZLFIE50U4CkhZ/5+nu7MeTW4fmXYiw==
X-Gm-Message-State: AOJu0YwuwfG9bEPoFjKx8FSzBvn/8ePBor7L8SMk0SVrukaJeEHXAP+2
	kY8L419Yj3fcTiiqpOIiF6WPWPNPhtGF+4dEqLBXLzKvLi/01TTj4WR6k2L6QB63f1pupTzQ6v6
	lvY0kuw0m13m36zl3HqydhxvXIY/01ALDo1Ky
X-Google-Smtp-Source: AGHT+IHT6dgiybFBguyPKZHraIwjPlRf5UvjmC4H5jEDjyjyxPUNPPAswow6gAsEyy7iIb7RKn4tT54k3qSAldwwiGg=
X-Received: by 2002:a17:903:1d2:b0:1fd:7724:c772 with SMTP id
 d9443c01a7336-1ff425a6763mr2537055ad.3.1722437066430; Wed, 31 Jul 2024
 07:44:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAGcaFA2sQNRo9UThN-C1NOLtGUJ3sKzc=pEC9wdDWMi501iLsA@mail.gmail.com>
 <20240730120546.1042515-1-mmaslanka@google.com> <87cymu7tgq.ffs@tglx>
In-Reply-To: <87cymu7tgq.ffs@tglx>
From: =?UTF-8?Q?Marek_Ma=C5=9Blanka?= <mmaslanka@google.com>
Date: Wed, 31 Jul 2024 16:44:14 +0200
Message-ID: <CAGcaFA1HJBYacvDAkZAO9HNhT2dZO7OdgcBYb59p7OJkVqQ6Fw@mail.gmail.com>
Subject: Re: [PATCH v3] platform/x86:intel/pmc: Enable the ACPI PM Timer to be
 turned off when suspended
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>, David E Box <david.e.box@intel.com>, 
	Hans de Goede <hdegoede@redhat.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, 
	platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas

On Tue, Jul 30, 2024 at 6:08=E2=80=AFPM Thomas Gleixner <tglx@linutronix.de=
> wrote:
>
> Marek!
>
> On Tue, Jul 30 2024 at 12:05, Marek Maslanka wrote:
> > Allow to disable ACPI PM Timer on suspend and enable on resume. A
> > disabled timer helps optimise power consumption when the system is
> > suspended. On resume the timer is only reactivated if it was activated
> > prior to suspend, so unless the ACPI PM timer is enabled in the BIOS,
> > this won't change anything.
> >
> >  include/linux/clocksource.h           |  2 ++
> >  kernel/time/clocksource.c             | 22 +++++++++++++
>
> The changelog is completely silent about the core code change. That's
> not how it works.
>
> Add the core code change as a separate patch with a proper justification
> and not hide it in the pile of the PMC changes without cc'ing the
> relevant maintainers. It's documented how this works, no?

Ok

>
> > +/*
> > + * Enable or disable APCI PM Timer
> > + *
> > + * @return: Previous APCI PM Timer enabled state
> > + */
> > +static bool pmc_core_enable_apci_pm_timer(struct pmc_dev *pmcdev, bool=
 enable)
> > +{
> > +     struct pmc *pmc =3D pmcdev->pmcs[PMC_IDX_MAIN];
> > +     const struct pmc_reg_map *map =3D pmc->map;
> > +     char cs_name[32];
> > +     bool state;
> > +     u32 reg;
> > +
> > +     if (!map->acpi_pm_tmr_ctl_offset)
> > +             return false;
> > +
> > +     clocksource_current_cs_name(cs_name, sizeof(cs_name));
> > +     if (strncmp(cs_name, "acpi_pm", sizeof(cs_name)) =3D=3D 0)
> > +             return false;
> > +
> > +     clocksource_suspend_cs_name(cs_name, sizeof(cs_name));
> > +     if (strncmp(cs_name, "acpi_pm", sizeof(cs_name)) =3D=3D 0)
> > +             return false;
>
> How would ACPI/PM ever be selected as a suspend clocksource? It's not
> marked CLOCK_SOURCE_SUSPEND_NONSTOP.
>
> There is a reason why clocksources have suspend/resume and
> enable/disable callbacks. The latter allow you to turn it completely off
> when it is not in use.
>
> Something like the below should work. It's uncompiled, but you get the
> idea.
>
> Thanks,
>
>         tglx
> ---
> --- a/drivers/clocksource/acpi_pm.c
> +++ b/drivers/clocksource/acpi_pm.c
> @@ -63,12 +63,40 @@ static u64 acpi_pm_read(struct clocksour
>         return (u64)read_pmtmr();
>  }
>
> +static bool acpi_pm_enabled;
> +
> +static void (*enable_callback)(bool enable);
> +
> +bool acpi_pm_register_enable_callback(void (*cb)(bool enable))
> +{
> +       enable_callback =3D cb;
> +       if (cb)
> +               cb(acpi_pm_enabled);
> +}
> +
> +static int acpi_pm_enable(struct clocksource *cs)
> +{
> +       acpi_pm_enabled =3D true;
> +       if (enable_callback)
> +               enable_callback(true);
> +       return 0;
> +}
> +
> +static void acpi_pm_disable(struct clocksource *cs)
> +{
> +       acpi_pm_enabled =3D false;
> +       if (enable_callback)
> +               enable_callback(false);
> +}
> +
>  static struct clocksource clocksource_acpi_pm =3D {
>         .name           =3D "acpi_pm",
>         .rating         =3D 200,
>         .read           =3D acpi_pm_read,
>         .mask           =3D (u64)ACPI_PM_MASK,
>         .flags          =3D CLOCK_SOURCE_IS_CONTINUOUS,
> +       .enable         =3D acpi_pm_enable,
> +       .disable        =3D acpi_pm_disable,
>  };
>
Thanks. I'll try do this in that way. But I need to disable/enable
ACPI PM timer only on suspend/resume, so I'll use suspend/resume
callbacks.
