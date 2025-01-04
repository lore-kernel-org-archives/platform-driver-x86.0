Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD8711CA0;
	Sat,  4 Jan 2025 18:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736014829; cv=none; b=ZaoeQ/kJVbFd3M0sOVFYHbUtJaHxU5oav86SKYkQT74twQvHT0oe7cI87Sd+bT/+DJsSDSL2+mqUt+GFwxvIhA9okB+QzmQi+btaUERXZbKeoQ8AaJLp+Jhg3y248dda3WOBYxu4VflVBa9fPzEOOQjZYIyG/zh3I8By2SCsxik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736014829; c=relaxed/simple;
	bh=w+KkRCs850i2PCnXKjxjGth+wyLEkr1bSW3WhZBt9s4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MomN7AevfRA5WIa5p0q/6Y+XY36g7zsVh+1fQ8nuoEGdkCquKLXKYxKtMNUveRW4WydbacetCRPhGCURB7pH7X4wZFWW6GWscdYzUboOfHw4gUm1WSXVavgOyjF4AtsA33RUAyNh2jFdHQDKairNWwg2WmU7VjM25+d4cBvQhN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dQwczea2; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dQwczea2"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2f441904a42so19075488a91.1;
        Sat, 04 Jan 2025 10:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736014827; x=1736619627; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aXRqqu5WId6L9d78unIqsrWDVzr6YRQpPYEyKG8XjUs=;
        b=dQwczea2nY0hJRHhT2/XLx/mCy1PsL2kKzef5JFeN+hI8vQ2ihDpIm3MBgeypvtR9+
         1KoWqjxdLjT2oBP+VEj/gcfpoATzXAtZ05lSS16q/PpmM7vC4wUvHMYOva2WdfwMswbZ
         lQQG8fT6x0JN3tWKdKFapAjQWEpE4BCg4dwgxq58WAzU1ygGBIwZwPAla6oX7XnnLlSD
         Q6MZbwxzjPDRvVSCVrPQBvQQythYcpacKgoR95+ZA6oFUwrJjBdN1OyIxfAFU2ILFJpz
         uMI2tQFijKYmCY99Tm3BqHVSt/RE74/9QqcAzeBNdduKpM0zykCjgUVRmggRX2yJWsBu
         VdXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736014827; x=1736619627;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aXRqqu5WId6L9d78unIqsrWDVzr6YRQpPYEyKG8XjUs=;
        b=NnmroqAt4OT/Uddi1rIkM+9zziWGrFz2ejHBMZhZpAG6YCNPm+I7uWPIyqEqAVm3+z
         EaKRI5geCmCx0htkLyUMfL6CwKaNlfjOUGNrlpGsErQTiar1KsF4LGph6nRUlN2xvp5y
         KTW4S0p+j8Ku5+++ihnrIiZ11A2jA69EryAySWDfG0NQ2srkIQG7ue9Y/hBG7LdpdQqp
         5IuT8R288hofmTc/I2vlvXgonox9B7nEn+QB0soRwCdnPLyGHNW5x6HU1SGOBzijBFDF
         tadEnBNiyPlgX4HbteEQpQX1hOyF44Jz/UkebZY/b7ifUjg6PUEoy0DLA1rR4et6zuU9
         hNkA==
X-Forwarded-Encrypted: i=1; AJvYcCV4O00uhJ8DYUNY2XqXShak7gD1Qk1jewphgDCwh4ou6Bj/77s/8yAIkmgMeIIFcDslJCuhrbUpfvB5j0GbFJwYOt99AQ==@vger.kernel.org, AJvYcCXqqpFIcNzGRpfODKl4WuNlnS8MvfsGEmVtqTetSVrHfgxdVvq/QeQoGajMhZ2TpXcz4m/u5lGeU4WaaTA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8hXjIG7+t7Y7r2o2Ttgg33YBeEBGDoh4MBrZCs0+nG1+3EIM2
	qdKhSRJz1pasiLYHksR/KFqVurJVFsc/At57ksc+UApThPob5sVzA9/HX6LwzoSaHIy8Plie7RS
	lO1gezazkV2wJqBerLaJ0FTGkVx4=
X-Gm-Gg: ASbGncu64sBOdYwzOXiapd0dxp0tor0PSogJkDT7MBtzWCEefHuN9S8v7W1g/fAbAK5
	9tueCA3aP41PSoZcP/vrmsqmKWIN3bkPciN5CPUs=
X-Google-Smtp-Source: AGHT+IEVL4/g3p19wYgRUXJEpXcyGCEkeJdmvlP9NspU8Okqxr/j8baYv5zkChM18WkqOjnUPxCAhsg/xou/QT8TdvM=
X-Received: by 2002:a17:90b:2b8f:b0:2ee:f1e3:fd21 with SMTP id
 98e67ed59e1d1-2f452eb3cecmr71765423a91.25.1736014827052; Sat, 04 Jan 2025
 10:20:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250104-platform_profile-v2-0-b58164718903@gmail.com>
 <20250104-platform_profile-v2-3-b58164718903@gmail.com> <3bqedlhubucaniyrjkig3cbegfxec5pzrv7vpbpnbphuu6h6od@dymxlla3itdl>
In-Reply-To: <3bqedlhubucaniyrjkig3cbegfxec5pzrv7vpbpnbphuu6h6od@dymxlla3itdl>
From: Hridesh MG <hridesh699@gmail.com>
Date: Sat, 4 Jan 2025 23:49:52 +0530
Message-ID: <CALiyAokph3JiReKsod3CZuxyVMqqmXqQ1t2rsH2wUx=hKaZm0Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] platform/x86: acer-wmi: simplify platform profile cycling
To: Kurt Borja <kuurtb@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Armin Wolf <W_Armin@gmx.de>, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>, 
	SungHwan Jung <onenowy@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 4, 2025 at 11:23=E2=80=AFPM Kurt Borja <kuurtb@gmail.com> wrote=
:
>
> On Sat, Jan 04, 2025 at 08:59:22PM +0530, Hridesh MG wrote:
> > Make use of platform_profile_cycle() to simplify the logic used for
> > cycling through the different platform profiles. Also remove the
> > handling for AC power as the hardware will accept the different profile=
s
> > regardless of whether or not AC is plugged in.
> >
> > Link: https://lore.kernel.org/platform-driver-x86/20e3ac66-b040-49a9-ab=
00-0adcfdaed2ff@gmx.de/
> > Signed-off-by: Hridesh MG <hridesh699@gmail.com>
> > ---
> >  drivers/platform/x86/acer-wmi.c | 87 +++++++++++----------------------=
--------
> >  1 file changed, 23 insertions(+), 64 deletions(-)
> >
> > diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/ace=
r-wmi.c
> > index f6c47deb4c452fc193f22c479c730aecb1e69e44..9c73f78eb302323299e03bf=
9dbeb2c68bb422938 100644
> > --- a/drivers/platform/x86/acer-wmi.c
> > +++ b/drivers/platform/x86/acer-wmi.c
> > @@ -34,6 +34,7 @@
> >  #include <linux/unaligned.h>
> >  #include <linux/bitfield.h>
> >  #include <linux/bitops.h>
> > +#include "linux/bitmap.h"
> >
> >  MODULE_AUTHOR("Carlos Corbacho");
> >  MODULE_DESCRIPTION("Acer Laptop WMI Extras Driver");
> > @@ -1975,9 +1976,6 @@ acer_predator_v4_platform_profile_set(struct plat=
form_profile_handler *pprof,
> >       if (err)
> >               return err;
> >
> > -     if (tp !=3D ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO)
> > -             last_non_turbo_profile =3D tp;
> > -
>
> I think this should be kept. If the user changes profile manually this
> may not reflect the actual last_non_turbo_profile.
I thought that the purpose of last_non_turbo_profile was for
acer_thermal_profile_change() to store the profile just before
toggling turbo so that the system can return to it later on (as
mentioned in the comments). I don't see a valid use case for this
variable outside of that specific context, which is why I decided to
remove its update during manual profile changes.

Thanks,
Hridesh MG
