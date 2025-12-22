Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750112264DC
	for <platform-driver-x86@vger.kernel.org>; Mon, 22 Dec 2025 10:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766400297; cv=none; b=GCvtEGEMIeuzTfCyGtgmQCWtIitse2z/wGCjoDpWQP/6wh3Jc+HIMwXuD7MFGkwcX4AUdUcDQqJQR0gXJY+Iyn7PAdivc3Pe4PCfrqFu9M2FU1rx6X3P9iUZxK9NRmrMgFujR87Nw6XdbxR4p0MjUo/vrktwqrIn/gU65TnadtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766400297; c=relaxed/simple;
	bh=EPACU3NG1hHLFcX0DiGcRb34TrV8oFmHcQFcuICEEk8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tpI4Zk9A6YTMOwPeQI356V8/6lH4Hh9zki8C8Zd3vM9wBsIIN4kR/mWQMEoXUTtg0Bp195TT1n90DOtFILVtOc/R7OCbzbIOBAVvQAO8FZb36T0ejUN+Q1vrFsWacSYv5kc+cCi5Y6995aT7rVtlGHGouoN5sw2fSKYOX98nRFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ard288iu; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ard288iu"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-37a33b06028so33178691fa.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 22 Dec 2025 02:44:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766400294; x=1767005094; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qQE/LH62Sbw4ndYdvZhBLEm6Dus4d7R8l3tz7tXypxE=;
        b=ard288iuPmuxQpceB8EKvU9RSw7DW0hZ527B+M/BRacA52YHogy2B7nNjzUeqduT9n
         1mTkdIAp39lCRFvGBrx5rFju0Um9VegdjrKOjA3lpIYgVsrw8Dg0yMCeKShA7kEb2Zaw
         7PSMQ4nX3x1h8FIuN3oQYCWTKVXzBaDVBxo6S6HvoMPjS1a2XpC2FkkMCAiFBuwzAt3r
         nqA/cYgJhorjhyIqw4B+E967vHARwGE5Fd8Lfdrqal1fD6H3WsJF85Dm9VCnQsz4oWqM
         ylAn068KJpJLp8CONH9B2YdVTUC+7zSkmu6/P83mFa5xwT1jvUIkyE8PF09v9UQIozVY
         pSug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766400294; x=1767005094;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qQE/LH62Sbw4ndYdvZhBLEm6Dus4d7R8l3tz7tXypxE=;
        b=e1+b3gPcc+Dbd60ia/dR15BeMrnKinIEd1lzuGp4zvXJaKpUGFe1mBszMNvftr6AhB
         wDty0wN+vTgm0S/wsf6HMUhNd2f8cfbS7G2uES2cOUyeRQV2XuKehln5n/sGE50Ba607
         zgKu1HYS/2xO6mVSIJI15gqIYdeXAUJjJ0YWjgo/YNZbOBQyEvNsR667ereRthOo495y
         SkUsYAGvqGhXR4l5Dzw1Enn6SbMBrHipddDLoiskJmVSsb+IEm119UQ5MTgpJy4XBlED
         y8GMMhocTzlbQyekPtYw4E5i4JwRRo5Bxe/W+AA9Jr25zEEx+uCuklcixGkpfuBzyOKr
         mSqg==
X-Forwarded-Encrypted: i=1; AJvYcCXv/o5C9RKlV2Ssci/t2/ZKNx2R9VNcQZmPIMyFGpuyMHTwll49RZYyoB7a5S5I0bn4CE1nsPagb+N++Hbf4h4XN3ZQ@vger.kernel.org
X-Gm-Message-State: AOJu0YyCGP8/Hj70P2vocoeCrlWWUR++j6AJmeccjPl1qs9b+y/hfrN5
	bJ+Iou2MLqEPabDNbl9DkpELpwJQ3bwlILMCIM1s8TC4+lAF7Z013Oz+hoRk/Y6novijhBhbFql
	/0r9DI5UQQjrAh+540/LNrmLIVv6yM1k=
X-Gm-Gg: AY/fxX4yVxChSPw5UBBc189T551On1T4KyuvwhvNjOjfNo0m1/F6LCIFLPHJluyxTYD
	AfVxzxp5Byg7wTBAMbkweoatlanOpKDksIz//GJkKjkFvIuG9rKi+DaFfStqj2J8RSFAhLXC/y7
	90vZ+trRm77qtINQWMJ5Uye2FpqS344kxJtWSNKjsqZdluaAwET9o0smY3lR5Xs8QIM6IHakR0y
	Tnn3NrODE1e7X5ZeFyCmxoGyVmJJ/y6DM8Mtez90LaK2hKPUruHzlJFxG9OLJJpi+BQ9lHQqH2u
	STcmUKckoR+OEs4/dnYzyWMLSQ==
X-Google-Smtp-Source: AGHT+IExMt04YgNdjSch5W1UnJS7Eolr2o03dJzdazxnxqvXjjm1CocRsWnJHKYTzcX8r4YlfDwnucSvyur3DniW6rw=
X-Received: by 2002:a05:651c:1617:b0:37a:2c75:7d83 with SMTP id
 38308e7fff4ca-381215b054bmr36246051fa.13.1766400293314; Mon, 22 Dec 2025
 02:44:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251221210218.12274-1-timwassink.dev@gmail.com> <b02a7c96-9653-4ab2-ac4a-86d365af1a2d@gmail.com>
In-Reply-To: <b02a7c96-9653-4ab2-ac4a-86d365af1a2d@gmail.com>
From: Tim Wassink <timwassink.dev@gmail.com>
Date: Mon, 22 Dec 2025 11:44:42 +0100
X-Gm-Features: AQt7F2rh9KAQ1OwVVI4849iBACCxHSc-sMIK23Hu0PZZpk6ce00qIzboCdxHtss
Message-ID: <CAD4HHcVKCL-9CV5kWH_6oz0jmh=+eXP-xU7cm2FvAHHucrPF7w@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: asus-nb-wmi: add quirk_asus_ignore_fan for UX3405MA
To: Denis Benato <benato.denis96@gmail.com>
Cc: Corentin Chary <corentin.chary@gmail.com>, "Luke D. Jones" <luke@ljones.dev>, 
	Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 21, 2025 at 10:01 PM Denis Benato <denis.benato@somemail.com> w=
rote:
> On 12/21/25 22:01, Tim Wassink wrote:
> > The ASUS Zenbook 14 (UX3405MA) uses a newer WMI interface for thermal
> > management that does not support the legacy WMI fan control methods.
> > Currently, this results in ENODEV (-19) errors in dmesg when the driver
> > attempts to fetch factory fan curve defaults.
> >
> > Add a quirk to use quirk_asus_ignore_fan to silence these errors and
> > signal that legacy fan control is intentionally unsupported, as thermal
> > policies are handled through the platform_profile interface.
>
> It is my understanding that this patch suppresses the error,
> while maintaining the current behavior in every other aspect,
> correct?

I am actually not sure anymore if this patch is ok, as it introduces a
trade-off regarding telemetry.

While the patch successfully silences the ENODEV (-19) errors, I have
verified locally that it also inhibits the registration of the fan
telemetry in hwmon. This means the read-only 'fan1_input' (RPM) is no
longer available to the user.

I initially followed the precedent of commit 82cc5c6c624c ("platform/x86:
asus-wmi: Ignore fan on E410MA"), which can be found here:
https://lore.kernel.org/all/20221221-asus-fan-v1-2-e07f3949725b@weissschuh.=
net/

Now I realize that case was specifically for a fanless system. The
UX3405MA does have a physical fan
which remains functional via the platform_profile (AIPT) interface
after this patch, as confirmed by stress testing.

I thought this quirk was the standard way to handle it, but I am not
so sure anymore.

Best regards,
Tim

On Mon, Dec 22, 2025 at 3:54=E2=80=AFAM Denis Benato <benato.denis96@gmail.=
com> wrote:
>
>
> On 12/21/25 22:01, Tim Wassink wrote:
> > The ASUS Zenbook 14 (UX3405MA) uses a newer WMI interface for thermal
> > management that does not support the legacy WMI fan control methods.
> > Currently, this results in ENODEV (-19) errors in dmesg when the driver
> > attempts to fetch factory fan curve defaults.
> >
> > Add a quirk to use quirk_asus_ignore_fan to silence these errors and
> > signal that legacy fan control is intentionally unsupported, as thermal
> > policies are handled through the platform_profile interface.
> It is my understanding that this patch suppresses the error,
> while maintaining the current behavior in every other aspect,
> correct?
> > Signed-off-by: Tim Wassink <timwassink.dev@gmail.com>
> > ---
> >  drivers/platform/x86/asus-nb-wmi.c | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/=
asus-nb-wmi.c
> > index 6a62bc5b02fd..eaa8abe506cb 100644
> > --- a/drivers/platform/x86/asus-nb-wmi.c
> > +++ b/drivers/platform/x86/asus-nb-wmi.c
> > @@ -544,6 +544,15 @@ static const struct dmi_system_id asus_quirks[] =
=3D {
> >               },
> >               .driver_data =3D &quirk_asus_zenbook_duo_kbd,
> >       },
> > +     {
> > +             .callback =3D dmi_matched,
> > +             .ident =3D "ASUS Zenbook 14 UX3405MA",
> > +             .matches =3D {
> > +                     DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."=
),
> > +                     DMI_MATCH(DMI_PRODUCT_NAME, "UX3405MA"),
> > +             },
> > +             .driver_data =3D &quirk_asus_ignore_fan,
> > +     },
> >       {
> >               .callback =3D dmi_matched,
> >               .ident =3D "ASUS ROG Z13",
