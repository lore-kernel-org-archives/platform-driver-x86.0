Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A821607B0
	for <platform-driver-x86@vger.kernel.org>; Wed, 31 Jul 2024 21:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722462116; cv=none; b=ZXoiva78TThi85YLXqJ2j/AsqA2vr0Uf2oxFs9622jHkSr+Wxlxy0q9NAfNzYAhiiZT9Ud0riv/iVXTHDjSTY1Do168iPI8DSbWlhoMK+Vr6Yk+p2WbLvsB2kt5L5L/OR2sWVpBqvX8VRwvSKr0i9C4i19Lu0qHUQdNfo4z3t/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722462116; c=relaxed/simple;
	bh=zZElUYldmDzgQuphMgfXWpLtIj/r+SVAwEBvbhYXLD8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JuT5LETjk+WCYUXtTXSoekaFUdgsKjWeIh3MOhLP6/a+mkrslIf0d7FjX6oC8BeisKrRCUYvFDWdSrQHxad7fIRYi5NCYqJ7yHl3LPL5d5ecYvU7j0v6dM/cSidP91utI9r9R0AGEMFELebBfSnv032MJ3TPvw/nUpzrGrePcTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PPvOK2HG; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PPvOK2HG"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1fed726aefcso254265ad.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 31 Jul 2024 14:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722462114; x=1723066914; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lp+ZDZtsalW0iDFvVAFHVGlMo3iBSTkryMerEp56V/w=;
        b=PPvOK2HGN8q5PyS3ejjkSXKa6yv8eoH/G9SVTNwBJib0TqvwXNL9wkqOXMSBaHAvtw
         9WLEZUqsjDfRo4oud8MmKdP0kX1lYlWIA+apW1zpZpLR6la1n6KVtcYOuU7d5BLawYEp
         LJmH1/LNRPdu9Ry0kY+QELiv8p2NVq9F5DcCuU7ninf9FxZ+sizI50SBQMHLhE30lkKV
         YXc2S8Vd2/tCJZ73ZRQuIGztQjv9d9WpZywsAXnnNGTZmd3MIWW0rPY0QLlsVK0i3R3b
         l1zd5d5N+D8YXKP6UCL7NdSzq485ALm/l7P7p3vKquD8cvsfALo5Sj4C43TbbEp+T8BB
         TcjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722462114; x=1723066914;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lp+ZDZtsalW0iDFvVAFHVGlMo3iBSTkryMerEp56V/w=;
        b=gZ7G6bdKSRUF9XkQkR/PdNxOZSU4o34G2n+aVbkGp6u2z3x+F57w7biTK6paRJ/gIL
         /LCm+ewGeQ+uOADl9HAaCDIA81jAaEUAjSCVu8COCcPg+dGIvJquAO0iCRoph3bFuy2z
         vSLzHa9kC5U5zGyhRpnXHm4Ok2SAQZPEjxvktLrbB9DHkGfkwq9ovSepv9diaf2GANLS
         xd2ssn5o/wJtnz2v7mixmo9Wz50QTKxcFX1kjwfGLsxOg4aTdD1lKO3ytFPecuJf/F2j
         OMCBz67QLgh2Pb+V2Ia+tcbgNJJEvT2kbPMO4tmD1dmobKgAw8MF1Mb5Nni1s7OvU58s
         Go1w==
X-Forwarded-Encrypted: i=1; AJvYcCVU37bwZyens88uyJ93IaMXash6IetpIrsk9cKqIrmiYwfqW8jTANaHVUqjvE1NXEWklNzcmdDgsN2njEpfX9Lum4AyW9XOVsjcB/ruL+nNCegFVQ==
X-Gm-Message-State: AOJu0YzWlpp/oiL/WfC9p6jEuDtJusuYPmpCSu6gVSN9F2jXHeDywS2n
	WDWpvuzudHrgR1DYy9ge+A+Vr90jKb3sCTW+yvCdVIw5KkV/6QLzhXVeOFyVofSqqhKXDWC+4oG
	/L7wrV4EGS0ZbcZsAm2FAx0KFqxpUYl2Cvtxl
X-Google-Smtp-Source: AGHT+IHsqdePuJoMVgSC9ErCcWVhAgUj6ulbl+RXBmvCpwvueyXgTBgXy2i8DrlFYBWcVH3E1FiSpRDhQ+4qoYNyZeY=
X-Received: by 2002:a17:903:248:b0:1f9:dc74:6c2b with SMTP id
 d9443c01a7336-1ff4ef37cdamr48505ad.29.1722462114260; Wed, 31 Jul 2024
 14:41:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAGcaFA2sQNRo9UThN-C1NOLtGUJ3sKzc=pEC9wdDWMi501iLsA@mail.gmail.com>
 <20240730120546.1042515-1-mmaslanka@google.com> <87cymu7tgq.ffs@tglx>
 <CAGcaFA1HJBYacvDAkZAO9HNhT2dZO7OdgcBYb59p7OJkVqQ6Fw@mail.gmail.com> <87h6c55xnp.ffs@tglx>
In-Reply-To: <87h6c55xnp.ffs@tglx>
From: =?UTF-8?Q?Marek_Ma=C5=9Blanka?= <mmaslanka@google.com>
Date: Wed, 31 Jul 2024 23:41:42 +0200
Message-ID: <CAGcaFA2eXzzCVqG-DSWDb1gruV4FemRC3W+dgRub7GgcOyf7yQ@mail.gmail.com>
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

On Wed, Jul 31, 2024 at 6:33=E2=80=AFPM Thomas Gleixner <tglx@linutronix.de=
> wrote:
>
> Marek!
>
> On Wed, Jul 31 2024 at 16:44, Marek Ma=C5=9Blanka wrote:
> > On Tue, Jul 30, 2024 at 6:08=E2=80=AFPM Thomas Gleixner <tglx@linutroni=
x.de> wrote:
> >> On Tue, Jul 30 2024 at 12:05, Marek Maslanka wrote:
> >> +static void acpi_pm_disable(struct clocksource *cs)
> >> +{
> >> +       acpi_pm_enabled =3D false;
> >> +       if (enable_callback)
> >> +               enable_callback(false);
> >> +}
> >> +
> >>  static struct clocksource clocksource_acpi_pm =3D {
> >>         .name           =3D "acpi_pm",
> >>         .rating         =3D 200,
> >>         .read           =3D acpi_pm_read,
> >>         .mask           =3D (u64)ACPI_PM_MASK,
> >>         .flags          =3D CLOCK_SOURCE_IS_CONTINUOUS,
> >> +       .enable         =3D acpi_pm_enable,
> >> +       .disable        =3D acpi_pm_disable,
> >>  };
> >>
> > Thanks. I'll try do this in that way. But I need to disable/enable
> > ACPI PM timer only on suspend/resume, so I'll use suspend/resume
> > callbacks.
>
> Why? What's the point of keeping it running when nothing uses it?
>
> Thanks,
>
>         tglx

In case of Intel CPUs the watchdog (iTCO/wdat_wdt) is driven by ACPI PM
Timer. But it may also be used by others that I don't know about, so I don'=
t
want to disable it.

Best
Marek
