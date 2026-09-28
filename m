Received: from mail-oo2-f37.google.com (mail-oo2-f37.google.com [74.125.231.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 109614E36CB
	for <platform-driver-x86@vger.kernel.org>; Mon, 28 Sep 2026 16:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.165
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790613710; cv=pass; b=AmV8ImOWo+90B1FRG7O/FEziEYjXcvAS3DilMs0MkBSe0ZaYug56kgipQdD7h2/PjDyKkuMy3ECUpE6x3bCCXYh0iewuHuDhGx7eGvUdAA/fMnSJWWPj1fEXl2SEAp3xEvXMkh3n9AVbVZ2GF0Q7xt3q5cCchEuuL7PEr3JscE4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790613710; c=relaxed/simple;
	bh=HMGta/9y2kVomkBwivOISjitrO6M5NurwTxaJW33p+4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i48Cq/p8uziZNTcPKTMlz8Iegu1OC3hoqYpzNKYyphmzcuORuFf6SQZ2udyB0/UW/ClmEwIWpqGFuDzObV6adTm3uk6KP5ZxIWURKIW4PMg8dcJmGJIgVLyIRr8fGM2f7RQA0Tkwgd1yqqe1PgPcqrfY+CdT8AmUDKUaaCJPums=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=miget.com; spf=pass smtp.mailfrom=miget.com; dkim=pass (1024-bit key) header.d=miget.com header.i=@miget.com header.b=Wlw3gFRm; arc=pass smtp.client-ip=74.125.231.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=miget.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=miget.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=miget.com header.i=@miget.com header.b="Wlw3gFRm"
Received: by mail-oo2-f37.google.com with SMTP id 46e09a7af769-805bf8c2661so2387855a34.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 28 Sep 2026 09:41:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790613708; cv=none;
        d=google.com; s=arc-20260327;
        b=lDNlRkK0QgRvLAAdoc9p/gb16KDLwLSTlAKI3kFXbu7Jty1GEeN45jqrNFj9NmYa9A
         42ClPVUZq56U/2OgyE5AvhKxYN0WYaotGTA6LO4o6m8ltr368QALeeaHPv7LY2G/uzvO
         nuqlRWmBgRidnulFX76WnT+oEH2cZxJB25RPc+XbozOyOVhwg7m9T4/WUyU4E2QXjDKz
         F487CCdHCBLx//AYWJlQSe82bcGmJzRgpBTpJuDPdAprWnid0Pd7mbI9yqcxB8O9tBnM
         lh40uGhHSd3vsr+C7lXJ/JE3dpDfQBfbownRhPXw/UTavX8QPeW/MLt0iKTMbzrJf3q0
         LUFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XdfbKBI+HbjVpn1PjoO2luA75YA/zhlGyquWYdSVZmo=;
        fh=yONRW7tq0rhp5TDACmz1ldTZNJDq4volZNav7u+q6PI=;
        b=K7RjyrIm7aUDIWg/e6Wq7lV3yHh4Ie0HN2W43Z+h6ea649+nayONOYmKP3h//QY4PH
         NJLCQ/WaxYdwrBKUTs1jAovPjbNqGmVipKXChbW7xm1sMJ/stU4dvcHDU/EltSKizU02
         slnOGRB5qMlRi+a/8sjJyBykvOEZ/tctRktnPhlf50VGpWrcpoQuh+WMITaMLfqqwLVu
         07/cG5gQm3ghTSUV5ziPAFpE9+rjgH3Iqq3t9re8Jg0JQI1jt/iteFQTchj1CJ4MtRK6
         SSA2UhG9pzY3R+UGOHEvf+flNQeGhonWJHYxT2BQOkRCGPV+v39oYCbgkUBZKwmYxgIg
         uoZg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=miget.com; s=google; t=1790613708; x=1791218508; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XdfbKBI+HbjVpn1PjoO2luA75YA/zhlGyquWYdSVZmo=;
        b=Wlw3gFRmCVyDkAB3D7GR0Xcnl3fjJPRh57sm6AIfNDpmzy5QsnYdr3thmYznwFEmyq
         wiRn5KKzUZnq3FEJCL7tM/2ma5DVanssZ+s4SxtypdFSn13TO2nKtmIwStWFj4jKtX4X
         f7iWM4djOjU3cV5IhA01i3bIGn0CQoJXb+8yU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790613708; x=1791218508;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XdfbKBI+HbjVpn1PjoO2luA75YA/zhlGyquWYdSVZmo=;
        b=yvpCEHUxp6Zocugpz1fnx1EBT7QgxdICByVPSrMhI05QC2R+3g+UvzkuKRW/ujUDvA
         fdHchggiWDjs/Wkh6eylp9tXVIPwU5O+y2CFAJSQlWi3j78uoar9a/vacCxZBdrEU17c
         F+s8sSgciHR7i1x7R18BMzH8QNiWaszpGAxJT6lQ54oxSxckNKDMD1xjr3Xdz2xwcIx7
         uf8CLpg9MElXqkudU5bc8k0oFXxHP4lfNUhvmuCElVy8M5LGeouJQfBmctOnLG7F2mMd
         +BuGADnKLQstg6cQROxO2ge5OaLPX42r9ytrlHdzjSbQcFcSKvsc3MMdaxyY3FpbehKA
         cxGA==
X-Forwarded-Encrypted: i=1; AKwUvBwF4kuQFbkg0W/3le9uSFcVcmptoBNbYPG80FGSSeKazxKjFdrQKbUQGn7hxXDGPLYrOzICnKYNmMBVYQaVTecuIFxw@vger.kernel.org
X-Gm-Message-State: AFuF++kCZhbd+njkGGfr1KUjLSdOKSuUVQiVgW2o2lYWgbbdQZZBhfiX
	LwLwCNsEX14rts8lCO2Wo8uvtL4+cQ1mJ4Zj8PG6NIJB8Mzx+BlWYhYPXWd64RltmgETWp1lQQl
	Cqf0nph9kMwkTWEEjoHvXnP2hkOp5YHtLh/kvt9impQ==
X-Gm-Gg: AYBFou2GRp+xOXBvu4DUUTluRpH3ZdEVK3DzQsfwyi8iHERVRfQl5SUP+y6RcSHCqeG
	GIiUIZT56D8F1MzjZH8gIDWAyPiJZpa5NAIEQnL02KoUzDxn1tTxt9bzPGZVPQ9vsYfTmPm/pig
	l2OU3e3xYBcFV+Q/5xkl5zF7tFIsUzA7yepqJHBGomJ4/XAos5YsNteJfughtkz5KBTNka0hFNd
	g4IaBzLjx5GeS4Fze4NjOKdj3jekRrz/kpVmCk1KiwjQRWWnglF88pUbAoZ7ZxDFh8VrUUZQNow
	4LQQ24NhDunkyABjlI5Zcg8rkHPaFJ/CrFigkIvlS4llxci7diPen00Dgec2HuLoGaxrkjU7Zt/
	d3Tv15fR/6u3Z
X-Received: by 2002:a05:6808:15a0:b0:4b9:a8ac:484 with SMTP id
 5614622812f47-4d72df6c037mr16835143b6e.34.1790613707676; Mon, 28 Sep 2026
 09:41:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928153902.139956-1-chris@miget.com> <5430348c-8ff3-c31a-927f-321b2cf94883@linux.intel.com>
In-Reply-To: <5430348c-8ff3-c31a-927f-321b2cf94883@linux.intel.com>
From: Chris Taraszka <chris@miget.com>
Date: Mon, 28 Sep 2026 18:41:35 +0200
X-Gm-Features: AclHuK9Le5um9RrKeE7PL3MNCJWbt9afEtaPysuTWTiCdLapVvPmpmsRxS9Nm3w
Message-ID: <CAAcRvKNrRMb44p-v0-wiWQx8QiToYyKCoCzXvVku-o0RGTxEgQ@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: bitland-mifs-wmi: Add Xiaomi Book Pro 14
 platform profile values
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: TuteMthCD <matias.civadda2342001@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	Armin Wolf <W_Armin@gmx.de>, Mingyou Chen <qby140326@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks, makes sense.

Matias, one thing I ran into when trying your generic part on the
Xiaomi Book Pro 14: its values are sparse (0x02, 0x03, 0x04, 0x09,
0x0a) and 0x02 and 0x0a both mean low-power. With a profile array
indexed by the firmware value, the unused slots read back as
PLATFORM_PROFILE_LOW_POWER (0), and the reverse lookup for low-power
finds index 0, which this firmware ignores.

So I'd suggest {value, profile} pairs for the shared part. I have that
as a standalone patch on pdx86/for-next, with only the profile table
in the quirk struct, so your response layout and AC check handling
would go on top in your TM2107 patch. If that works for you I'll send
it as v2 together with the Xiaomi entry, and you can base your v3 on
it. If you'd rather own the generic patch, that's fine too, I'll
rebase the Xiaomi part on yours.

On Mon, Sep 28, 2026 at 5:49=E2=80=AFPM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Mon, 28 Sep 2026, Chris Taraszka wrote:
>
> > The Xiaomi Book Pro 14 firmware (BIOS XMAPT4B0P0909) implements
> > SystemPerMode with its own values. Its WMAA SET handler only acts on
> > 0x02-0x0a and silently ignores 0 and 1, and GET returns one of 0x02,
> > 0x03, 0x04, 0x09 or 0x0a. With the generic values:
> >
> >  - balanced (0) and balanced-performance (1) are no-ops,
> >  - performance (3) selects the firmware's balanced mode,
> >  - reading the profile fails with -EINVAL whenever the firmware is in
> >    0x04, 0x09 or 0x0a, which it often is after boot. The failed read al=
so
> >    makes bitland_mifs_wmi_suspend() abort system suspend.
> >
> > The values were identified from the WMAA method in the firmware's SSDT
> > and by setting each one through WMAA on AC and reading the resulting
> > sustained package power limit from intel-rapl-mmio:
> >
> >   0x02  18 W  (quiet)
> >   0x03  37 W  (balanced)
> >   0x09  45 W
> >   0x04  58 W  (performance)
> >   0x0a  18 W
> >
> > Map low-power, balanced, balanced-performance and performance to 0x02,
> > 0x03, 0x09 and 0x04 on this model. The driver never sets 0x0a, which is
> > only reached through the firmware's own mode cycling, so report it as
> > low-power.
> >
> > Cc: Armin Wolf <W_Armin@gmx.de>
> > Cc: Mingyou Chen <qby140326@gmail.com>
> > Signed-off-by: Chris Taraszka <chris@miget.com>
> > ---
> >
> > Notes:
> >     Tested on the Xiaomi Book Pro 14 on AC with bitland-mifs-wmi from p=
dx86
> >     for-next plus this patch, loaded on v7.3-rc5: all four profiles app=
ly
> >     through power-profiles-daemon and the firmware mode and PL1 follow
> >     (0x03/37 W, 0x02/25 W, 0x04/56 W). The same mapping on v7.3-rc4/rc5
> >     without the for-next changes was also tested on battery and across
> >     s2idle suspend/resume, with the profile restored on resume.
> >
> >     This explains the -EINVAL behind my earlier "platform/x86:
> >     bitland-mifs-wmi: Don't abort suspend when platform profile access
> >     fails" (sent 2026-09-11): the profile read failed because of the un=
known
> >     mode values. That patch is still useful as a safety net.
> >
> >     Note that on for-next each profile change still reports -ENOMSG eve=
n
> >     though the firmware applies it: this firmware's SET handlers leave =
the
> >     function id in the response at 0, which 23cc56f6dea6 ("platform/x86=
:
> >     bitland-mifs-wmi: Detect failed function calls") rejects. I'll send=
 a
> >     separate fix for that.
> >
> >  drivers/platform/x86/bitland-mifs-wmi.c | 56 +++++++++++++++++++++++--
> >  1 file changed, 52 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform=
/x86/bitland-mifs-wmi.c
> > index dd1648b7de77..4a8e5b4e7853 100644
> > --- a/drivers/platform/x86/bitland-mifs-wmi.c
> > +++ b/drivers/platform/x86/bitland-mifs-wmi.c
> > @@ -14,6 +14,7 @@
> >  #include <linux/dev_printk.h>
> >  #include <linux/device.h>
> >  #include <linux/device/devres.h>
> > +#include <linux/dmi.h>
> >  #include <linux/err.h>
> >  #include <linux/hwmon.h>
> >  #include <linux/init.h>
> > @@ -79,6 +80,29 @@ enum bitland_mifs_power_profile {
> >       WMI_PP_FULL_SPEED       =3D 3,
> >  };
> >
> > +/*
> > + * The Xiaomi Book Pro 14 firmware uses its own SystemPerMode values a=
nd
> > + * ignores the ones above. Sustained package power limits (PL1) measur=
ed
> > + * on AC are noted next to each mode.
> > + */
> > +enum bitland_mifs_xiaomi_power_profile {
> > +     WMI_PP_XIAOMI_QUIET             =3D 0x02, /* 18 W */
> > +     WMI_PP_XIAOMI_BALANCED          =3D 0x03, /* 37 W */
> > +     WMI_PP_XIAOMI_PERFORMANCE       =3D 0x04, /* 58 W */
> > +     WMI_PP_XIAOMI_SMART             =3D 0x09, /* 45 W */
> > +     WMI_PP_XIAOMI_QUIET_ALT         =3D 0x0a, /* 18 W */
> > +};
> > +
> > +static const struct dmi_system_id bitland_mifs_xiaomi_pp_dmi_table[] =
=3D {
> > +     {
> > +             .matches =3D {
> > +                     DMI_MATCH(DMI_SYS_VENDOR, "XIAOMI"),
> > +                     DMI_MATCH(DMI_PRODUCT_NAME, "Xiaomi Book Pro 14")=
,
> > +             },
> > +     },
> > +     { }
> > +};
> > +
> >  enum bitland_mifs_event_id {
> >       WMI_EVENT_RESERVED_1            =3D 1,
> >       WMI_EVENT_RESERVED_2            =3D 2,
> > @@ -161,6 +185,7 @@ struct bitland_mifs_wmi_data {
> >       struct device *hwmon_dev;
> >       struct device *pp_dev;
> >       enum platform_profile_option saved_profile;
> > +     bool xiaomi_pp;
> >  };
> >
> >  static int bitland_mifs_wmi_call(struct bitland_mifs_wmi_data *data,
> > @@ -213,6 +238,27 @@ static int laptop_profile_get(struct device *dev,
> >       if (ret)
> >               return ret;
> >
> > +     if (data->xiaomi_pp) {
> > +             switch (result.data[0]) {
> > +             case WMI_PP_XIAOMI_QUIET:
> > +             case WMI_PP_XIAOMI_QUIET_ALT:
> > +                     *profile =3D PLATFORM_PROFILE_LOW_POWER;
> > +                     break;
> > +             case WMI_PP_XIAOMI_BALANCED:
> > +                     *profile =3D PLATFORM_PROFILE_BALANCED;
> > +                     break;
> > +             case WMI_PP_XIAOMI_SMART:
> > +                     *profile =3D PLATFORM_PROFILE_BALANCED_PERFORMANC=
E;
> > +                     break;
> > +             case WMI_PP_XIAOMI_PERFORMANCE:
> > +                     *profile =3D PLATFORM_PROFILE_PERFORMANCE;
> > +                     break;
> > +             default:
> > +                     return -EINVAL;
> > +             }
> > +             return 0;
> > +     }
> > +
> >       switch (result.data[0]) {
> >       case WMI_PP_BALANCED:
> >               *profile =3D PLATFORM_PROFILE_BALANCED;
> > @@ -272,22 +318,22 @@ static int laptop_profile_set(struct device *dev,
> >
> >       switch (profile) {
> >       case PLATFORM_PROFILE_LOW_POWER:
> > -             val =3D WMI_PP_QUIET;
> > +             val =3D data->xiaomi_pp ? WMI_PP_XIAOMI_QUIET : WMI_PP_QU=
IET;
> >               break;
> >       case PLATFORM_PROFILE_BALANCED:
> > -             val =3D WMI_PP_BALANCED;
> > +             val =3D data->xiaomi_pp ? WMI_PP_XIAOMI_BALANCED : WMI_PP=
_BALANCED;
> >               break;
> >       case PLATFORM_PROFILE_BALANCED_PERFORMANCE:
> >               ret =3D bitland_check_performance_capability(data);
> >               if (ret)
> >                       return ret;
> > -             val =3D WMI_PP_PERFORMANCE;
> > +             val =3D data->xiaomi_pp ? WMI_PP_XIAOMI_SMART : WMI_PP_PE=
RFORMANCE;
> >               break;
> >       case PLATFORM_PROFILE_PERFORMANCE:
> >               ret =3D bitland_check_performance_capability(data);
> >               if (ret)
> >                       return ret;
> > -             val =3D WMI_PP_FULL_SPEED;
> > +             val =3D data->xiaomi_pp ? WMI_PP_XIAOMI_PERFORMANCE : WMI=
_PP_FULL_SPEED;
>
>
> Hi,
>
> Thanks for the patch but I won't accept device specific conditionals like
> this done in the code. For a better approach, please see:
>
> bitland-mifs-wmi: Fix TM2107 profile handling
>
> You two could try to coordinate such that transition into the generic
> approach is not worked by both independently.
>
> It might be best to extract the generalization part to own patch and both
> then base their respective device specific patches adding new things on
> top of that.
>
> --
>  i.
>
