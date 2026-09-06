Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64410361940
	for <platform-driver-x86@vger.kernel.org>; Sun,  6 Sep 2026 18:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788718583; cv=pass; b=PPjnBFjL7cDCyYoGkfj+5KttpX0oOv6xG72QfanQ4ZuWtDcB+LwOzZx8TKQJW9sUIO5CKapYspFYizdXZYfi7t2FPl0wQ3Uo0bLM60+dfISiJI/iMJYxMnPEF2IoJJHJcVFVNfyOpYbSzzwYblSeCkk2NkT6YNoNZUZH8s28XBc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788718583; c=relaxed/simple;
	bh=Z9piZ8BI434P3SLmDZ3AR2U8YWD33y94JWrsdMAjuoQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JJF2UH0s9v0vAdmFM3eddIxCuEA0oGwq5X/BfykcXlPaMhNpsD+hoAEZftbHxvs0aNZBvqAimk4WtIV5lKOQQ+ADTrH/O0IYd0dQlzElh9JsRs1/e0ByytNTajBrnTF038Qc6ViLm4YO2LXCYgxXMKlh0S3jzz9nDu29BP7yFIs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qAYwT/Kg; arc=pass smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qAYwT/Kg"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cc1d57602e8so2481955a12.3
        for <platform-driver-x86@vger.kernel.org>; Sun, 06 Sep 2026 11:16:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788718580; cv=none;
        d=google.com; s=arc-20260327;
        b=U5vrIn2vOBlpuCvYoBZm3TbLaPnP7DyRl0Ph5SSCI3/OgvcGXT+tY3Pu7+Kf/Ka+R/
         dud8GOkHXJEvRTjWNuSa4mmSSvh4X+gONFprTpVhSyna3/SClRfsVOxrwX6msJz/eRCC
         oaP5t+JyY0UoLmsLxOV5maGhMKmNjFj6Y0tbJST3eOzjkif4qTBxTKHrmR7MqWrhzx5F
         AM49EFKVli8Ay8nK/Ie6RSCQQ3hpXQ1WDVEfWDwr6K140jal2rx1eKCULT+1upSRBxh7
         /S4CwmZTnTC/ytI/flGUtyJ4Ssu7LQO+BuT9XSTW2M36lAiwA7nrgo3PxlYVGEEt94zV
         QNtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IK8F75eDlAejKBUK8QDvdoapJfbMipPyvNXBhZNaCjs=;
        fh=xRv4RlaYF/rMlPt/s1Kfluxy4OrSmWLGzcTk3o3bZUc=;
        b=WGygN0NaJv2fKYEqNh5ghhCdGlfNyZU6f3C4NdsHm3RF4+24yNuT1eR+tyK0u+WEY8
         NesNohPYkxp5M7oQ5urZ/AGugYKpuu0G0+zkDzu7bDGrxE40rLt4fJxqxTwPHH7DFX5t
         HU1gUYBsKN+brpsE2CHD5ToBnh17+pyonkfupRhGmkcCtGIz78v6SClwvKjJxseree+z
         VOednw4unSCvUIKr8Y3n1PHEBjvm1zApafGICHPICyqlLvzwFO0d/70aM4+EBZCEM1cY
         E/JPIV1FwXfKJvUdhJnpXA2AbTZojWtzzfYnSmL4qJ5Aj3XUnRW6v1o2AU/BewxJrqos
         tyHg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788718580; x=1789323380; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IK8F75eDlAejKBUK8QDvdoapJfbMipPyvNXBhZNaCjs=;
        b=qAYwT/KgHwf9YpcIRg2A5xVeVdsxKOGK1NNCn2RpYk0T1rEdv8zejJWK8pdKJ9uXOf
         Oqxm7KxQvV7PrPgj6WXN+yLcoSjJKXWIiIVuerdLAptEql3a6YZObsqk2pD/+pAdoZMJ
         IVMyNhEn+h1oOdhMfxMuBGa+Jj5ifCPKwtE4aS+1f7CTCnTcDGj1WjjEzmSvSEzZldRr
         3CHYKyIb7QPcHY50LXRrnMCrzoy8Xa9g7llF5k+2uzBUTo1YrCD46/2aeD3SX0Z0p4HL
         Kf6WHh3DWH2C9KdLRUyhR+3Bpnt5Fyfg/nahhJqK2YiY6aEO+qfkfMPY30bRKSy/i6cv
         M0YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788718580; x=1789323380;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IK8F75eDlAejKBUK8QDvdoapJfbMipPyvNXBhZNaCjs=;
        b=IQe7VT28laOPAZ56Q0w5ngYi3uL2IipV3cYLrCzNn5RpbKMmbRO4zqDq6Pw+FkGMze
         vsAyR9NQPaopapcpnY/JCevO38ae2oWmHkZn27Ck1YcQ0w8jp8AMBbQtgi7FIzDQTebb
         soExVSZOIoAjU71bYEpJ0L1yDpfrkdEgePP8E9AhyI7JGkVZyKt0HZYVeEMfWFj/jZJi
         Re2knh8wN3m2eZXUVhcxsxwVjBfFgyKM3/r12o43E709b/MtjViJahz29SyN6wzoS7mZ
         Wt9/+ImAQk1eEqPoiserw5DFyGn+XcebxmlnYHz3UqYSGrX7HUlNwJb/6p+4E3TkwTJG
         6yKA==
X-Forwarded-Encrypted: i=1; AKwUvBy5bWhBV+/T4GMMcS30B/vy06HP7HqBKnKd6jeZ6v+E6zi7rr/G4sHbmcaaiq/HtTU55doPek72qsGDMSMKmLwEpGZd@vger.kernel.org
X-Gm-Message-State: AFuF++kgCyJaDq0d07w3mYeVpuTb9nAtqWX/m53Kykxmz9qUhbPArFj8
	LdE+UZmZCCmHNgBszAb/W0IMAHYD8Rb18G3c7QRFA/rv97hy3ghRGtLosL3YBlORatVzglsQ4iB
	XL26P3mmJesy5o3vfuIv6qSjI/cVST5I=
X-Gm-Gg: AYBFou2g0SlW+2D7SqKA2Ugddt/WQdeGZgen5zJpvkzlmLVGJMak/3/PAxNtEqSMotD
	YAZeupwAK4PJsHNVq4KQoUwsbyuPIkYvbe++nDWhbKYGNmBJJtu9/l9/30LFSh6f6E+6rBzHk61
	PuR1G3NihZAwlwwK5URbggSeFv8xxWJfNA7YlL/xStnC0HHtfHirhStTCoI4hOcmEgg9spq15Gg
	g31KuCnI0mf9/UxTGdL9JwmX0JQWjnkIauGj5Xl0l+M3UblyAXo8B0T9izO4n0cG7HHas+MvLkW
	si++oH4p92pLA095c5hYvkRlrRfY/GPZ9HQ9OIKcgw7lnky73f8OtRJwPy2VBQLAWQTcOq+AkgL
	kElqgPkf7Dcpjxll1Eq5M38gzFgg=
X-Received: by 2002:a05:6a20:568e:b0:3c4:4272:b400 with SMTP id
 adf61e73a8af0-3da39fd2525mr28836704637.18.1788718580326; Sun, 06 Sep 2026
 11:16:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260816100813.300450-1-qby140326@gmail.com> <20260816100813.300450-7-qby140326@gmail.com>
 <CAObHBTxSTzGSuN=8a+PQs7Khxv+_JMenf2a4j8me-L0ksDnXXQ@mail.gmail.com>
In-Reply-To: <CAObHBTxSTzGSuN=8a+PQs7Khxv+_JMenf2a4j8me-L0ksDnXXQ@mail.gmail.com>
From: =?UTF-8?Q?Milo=C5=A1_Vlku?= <vlku.milos.fun@gmail.com>
Date: Sun, 6 Sep 2026 20:16:08 +0200
X-Gm-Features: AcwNN1XPxTK-00TBHt9nJ5mTIbwJDGbqPCGh3cAkBsFGT_Z8yXwQwre_UQgh_uk
Message-ID: <CAObHBTwjvBHX8o_W9S=B2VBzmMyfFrHdvjH7o1y99iwGEa7RhA@mail.gmail.com>
Subject: Re: [PATCH v5 6/6] platform/x86: bitland-mifs-wmi: Add Redmi laptop support
To: Mingyou Chen <qby140326@gmail.com>
Cc: W_Armin@gmx.de, foxido@foxido.dev, hansg@kernel.org, 
	ilpo.jarvinen@linux.intel.com, linux-kernel@vger.kernel.org, 
	nika@nikableh.moe, platform-driver-x86@vger.kernel.org, i@rsplwe.com, 
	wolf109909@outlook.com, rahulbheda131313@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Following up on this - my Aug 18 report still applies: my board
(XIAOMI / TM2307 / "Redmi Book Pro 14 2024") doesn't match either
DMI_SYS_VENDOR "Redmi" or "TIMI", so it falls through to the generic
bitland_ops table instead of redmi_book_ops, which means
bitland_pp_check_capability() (barrel-jack/DC required) runs instead
of redmi_pp_check_capability() (any AC source), and performance mode
stays blocked on my USB-C-only machine.

Proposed fix is still just adding a DMI_BOARD_NAME "TM2307" match (or
possibly broadening to DMI_SYS_VENDOR "XIAOMI" if that covers the
wider lineup) to bitland_mifs_dmi_table.

Armin - since you mentioned your buffer-format series (Sep 5) should
be the new base for outstanding patches, should this DMI fix be
rebased on top of that, or is it independent enough to land
separately?

Thanks,
Milos

On Tue, Aug 18, 2026 at 1:17=E2=80=AFAM Milo=C5=A1 Vlku <vlku.milos.fun@gma=
il.com> wrote:
>
> > +    {
> > +        /* Redmi Book series */
> > +        .matches =3D {
> > +            DMI_MATCH(DMI_SYS_VENDOR, "Redmi"),
> > +        },
> > +        .driver_data =3D (void *)&redmi_book_ops,
> > +    },
> > +    {
> > +        /* Xiaomi Book series */
> > +        .matches =3D {
> > +            DMI_MATCH(DMI_SYS_VENDOR, "TIMI"),
> > +        },
> > +        .driver_data =3D (void *)&redmi_book_ops,
> > +    },
>
> Neither entry matches my machine. I have a Redmi Book Pro 14 2024, and
> it reports:
>
>   DMI_SYS_VENDOR   XIAOMI
>   DMI_BOARD_NAME   TM2307
>   DMI_PRODUCT_NAME Redmi Book Pro 14 2024
>
> Since DMI_MATCH() is a substring test, neither "Redmi" nor "TIMI"
> matches "XIAOMI", so dmi_first_match() returns NULL and data->ops stays
> at &bitland_ops. The series has no effect on this model.
>
> A board-name match would cover it:
>
>     {
>         /* Redmi Book Pro 14 2024 */
>         .matches =3D {
>             DMI_MATCH(DMI_BOARD_NAME, "TM2307"),
>         },
>         .driver_data =3D (void *)&redmi_book_ops,
>     },
>
> I don't know how widely the "XIAOMI" vendor string is used across the
> range, so matching DMI_SYS_VENDOR "XIAOMI" may cover more machines at
> once if that encoding applies to all of them.
>
> Thanks,
> Milos
>
> On Sun, Aug 16, 2026 at 12:08=E2=80=AFPM Mingyou Chen <qby140326@gmail.co=
m> wrote:
> >
> > Redmi laptops (Redmi Book and Redmi G series) use the same MIFS WMI
> > interface but encode the performance mode values of
> > WMI_FN_SYSTEM_PER_MODE differently, as reverse engineered from the
> > Windows GCommandCenter application:
> >
> >   0 =3D performance, 1 =3D balanced, 2 =3D quiet, 4 =3D full speed
> >
> > Add "Redmi Book" and "Redmi G" ops entries selected via DMI:
> > - Redmi G (board TM2135/TM2137): the full-speed mode is available
> > - Redmi Book/Xiaomi Book: no full-speed mode
> > - The performance modes only require AC power (any source); the
> >   barrel-jack requirement is Bitland-specific
> >
> > The GCommandCenter application further showed that:
> > - the CPU power sensor (WMI_FN_CPU_POWER) is only available on Redmi
> >   machines, gate the hwmon power channel on the ops table
> > - the refresh-rate-toggle quirk in the CPU fan speed event is
> >   Redmi-specific, gate it on the ops table instead of applying it
> >   unconditionally
> >
> > Also add Redmi support for Fn lock and touchpad lock control
> > (WMI_FN_FN_LOCK / WMI_FN_TP_LOCK sysfs attributes), keyboard type
> > detection (hide the RGB kb_mode attribute on white-only backlit
> > keyboards) and hotkeys (airplane mode -> KEY_RFKILL, ignore the
> > lock-state and keyboard mode indicator events).
> >
> > The sysfs attribute group is now registered in probe (instead of via
> > dev_groups) so that the is_visible callback can access the probe
> > populated driver data.
> >
> > Signed-off-by: Mingyou Chen <qby140326@gmail.com>
> > ---
> >  drivers/platform/x86/bitland-mifs-wmi.c | 336 ++++++++++++++++++++++--
> >  1 file changed, 318 insertions(+), 18 deletions(-)
> >
> > diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform=
/x86/bitland-mifs-wmi.c
> > index 17792d8b7c29..1eb9f92740e0 100644
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
> > @@ -71,6 +72,11 @@ enum bitland_system_ac_mode {
> >         WMI_SYSTEM_AC_CIRCULARHOLE      =3D 2,
> >  };
> >
> > +enum bitland_kbd_type {
> > +       WMI_KBD_TYPE_WHITE              =3D 0,
> > +       WMI_KBD_TYPE_RGB                =3D 1,
> > +};
> > +
> >  enum bitland_mifs_power_profile {
> >         WMI_PP_BALANCED         =3D 0,
> >         WMI_PP_PERFORMANCE      =3D 1,
> > @@ -97,7 +103,15 @@ static const struct bitland_profile_mode_map bitlan=
d_mode_map =3D {
> >         .full_speed     =3D WMI_PP_FULL_SPEED,
> >  };
> >
> > +static const struct bitland_profile_mode_map redmi_mode_map =3D {
> > +       .balanced       =3D 1,
> > +       .performance    =3D 0,
> > +       .quiet          =3D 2,
> > +       .full_speed     =3D 4,
> > +};
> > +
> >  static int bitland_pp_check_capability(struct bitland_mifs_wmi_data *d=
ata);
> > +static int redmi_pp_check_capability(struct bitland_mifs_wmi_data *dat=
a);
> >
> >  /*
> >   * Machine-specific operations. The MIFS WMI interface is shared by
> > @@ -109,6 +123,8 @@ struct bitland_mifs_ops {
> >         const struct bitland_profile_mode_map *mode_map;
> >         int (*check_performance_capability)(struct bitland_mifs_wmi_dat=
a *data);
> >         bool has_full_speed;
> > +       bool has_cpu_power;
> > +       bool quirk_refresh_rate_toggle;
> >  };
> >
> >  static const struct bitland_mifs_ops bitland_ops =3D {
> > @@ -118,6 +134,54 @@ static const struct bitland_mifs_ops bitland_ops =
=3D {
> >         .has_full_speed =3D true,
> >  };
> >
> > +static const struct bitland_mifs_ops redmi_book_ops =3D {
> > +       .name =3D "Redmi Book",
> > +       .mode_map =3D &redmi_mode_map,
> > +       .check_performance_capability =3D redmi_pp_check_capability,
> > +       .has_cpu_power =3D true,
> > +       .quirk_refresh_rate_toggle =3D true,
> > +};
> > +
> > +static const struct bitland_mifs_ops redmi_g_ops =3D {
> > +       .name =3D "Redmi G",
> > +       .mode_map =3D &redmi_mode_map,
> > +       .check_performance_capability =3D redmi_pp_check_capability,
> > +       .has_full_speed =3D true,
> > +       .has_cpu_power =3D true,
> > +       .quirk_refresh_rate_toggle =3D true,
> > +};
> > +
> > +static const struct dmi_system_id bitland_mifs_dmi_table[] =3D {
> > +       {
> > +               /* Redmi G */
> > +               .matches =3D {
> > +                       DMI_MATCH(DMI_BOARD_NAME, "TM2135"),
> > +               },
> > +               .driver_data =3D (void *)&redmi_g_ops,
> > +       },
> > +       {
> > +               .matches =3D {
> > +                       DMI_MATCH(DMI_BOARD_NAME, "TM2137"),
> > +               },
> > +               .driver_data =3D (void *)&redmi_g_ops,
> > +       },
> > +       {
> > +               /* Redmi Book series */
> > +               .matches =3D {
> > +                       DMI_MATCH(DMI_SYS_VENDOR, "Redmi"),
> > +               },
> > +               .driver_data =3D (void *)&redmi_book_ops,
> > +       },
> > +       {
> > +               /* Xiaomi Book series */
> > +               .matches =3D {
> > +                       DMI_MATCH(DMI_SYS_VENDOR, "TIMI"),
> > +               },
> > +               .driver_data =3D (void *)&redmi_book_ops,
> > +       },
> > +       {}
> > +};
> > +
> >  enum bitland_mifs_event_id {
> >         WMI_EVENT_RESERVED_1            =3D 1,
> >         WMI_EVENT_RESERVED_2            =3D 2,
> > @@ -203,6 +267,8 @@ struct bitland_mifs_wmi_data {
> >         struct input_dev *input_dev;
> >         struct device *hwmon_dev;
> >         struct device *pp_dev;
> > +       enum bitland_wmi_device_type dev_type;
> > +       u8 kbd_type;
> >         const struct bitland_mifs_ops *ops;
> >         enum platform_profile_option saved_profile;
> >  };
> > @@ -255,8 +321,10 @@ static int laptop_profile_get(struct device *dev,
> >         else if (mode =3D=3D map->balanced)
> >                 *profile =3D PLATFORM_PROFILE_BALANCED;
> >         else if (mode =3D=3D map->performance)
> > -               *profile =3D PLATFORM_PROFILE_BALANCED_PERFORMANCE;
> > -       else if (mode =3D=3D map->full_speed)
> > +               *profile =3D data->ops->has_full_speed ?
> > +                          PLATFORM_PROFILE_BALANCED_PERFORMANCE :
> > +                          PLATFORM_PROFILE_PERFORMANCE;
> > +       else if (data->ops->has_full_speed && mode =3D=3D map->full_spe=
ed)
> >                 *profile =3D PLATFORM_PROFILE_PERFORMANCE;
> >         else
> >                 return -EINVAL;
> > @@ -273,10 +341,11 @@ static int bitland_pp_check_capability(struct bit=
land_mifs_wmi_data *data)
> >         struct bitland_mifs_output output;
> >         int ret;
> >
> > -       /* Full-speed/performance mode requires DC power (not USB-C) */
> > +       /* The performance modes require AC power */
> >         if (!power_supply_is_system_supplied())
> >                 return -EOPNOTSUPP;
> >
> > +       /* Additionally require the barrel-jack power supply (not USB-C=
) */
> >         ret =3D bitland_mifs_wmi_call(data, &input, &output);
> >         if (ret)
> >                 return ret;
> > @@ -287,6 +356,15 @@ static int bitland_pp_check_capability(struct bitl=
and_mifs_wmi_data *data)
> >         return 0;
> >  }
> >
> > +static int redmi_pp_check_capability(struct bitland_mifs_wmi_data *dat=
a)
> > +{
> > +       /* The performance modes require AC power (any source) */
> > +       if (!power_supply_is_system_supplied())
> > +               return -EOPNOTSUPP;
> > +
> > +       return 0;
> > +}
> > +
> >  static int laptop_profile_set(struct device *dev,
> >                               enum platform_profile_option profile)
> >  {
> > @@ -309,6 +387,8 @@ static int laptop_profile_set(struct device *dev,
> >                 mode =3D map->balanced;
> >                 break;
> >         case PLATFORM_PROFILE_BALANCED_PERFORMANCE:
> > +               if (!data->ops->has_full_speed)
> > +                       return -EOPNOTSUPP;
> >                 ret =3D data->ops->check_performance_capability(data);
> >                 if (ret)
> >                         return ret;
> > @@ -318,7 +398,7 @@ static int laptop_profile_set(struct device *dev,
> >                 ret =3D data->ops->check_performance_capability(data);
> >                 if (ret)
> >                         return ret;
> > -               mode =3D map->full_speed;
> > +               mode =3D data->ops->has_full_speed ? map->full_speed : =
map->performance;
> >                 break;
> >         default:
> >                 return -EOPNOTSUPP;
> > @@ -335,10 +415,10 @@ static int platform_profile_probe(void *drvdata, =
unsigned long *choices)
> >
> >         set_bit(PLATFORM_PROFILE_LOW_POWER, choices);
> >         set_bit(PLATFORM_PROFILE_BALANCED, choices);
> > -       set_bit(PLATFORM_PROFILE_BALANCED_PERFORMANCE, choices);
> > +       set_bit(PLATFORM_PROFILE_PERFORMANCE, choices);
> >
> >         if (data->ops->has_full_speed)
> > -               set_bit(PLATFORM_PROFILE_PERFORMANCE, choices);
> > +               set_bit(PLATFORM_PROFILE_BALANCED_PERFORMANCE, choices)=
;
> >
> >         return 0;
> >  }
> > @@ -418,6 +498,13 @@ static int laptop_hwmon_read(struct device *dev, e=
num hwmon_sensor_types type,
> >                 default:
> >                         return -EINVAL;
> >                 }
> > +       case hwmon_power:
> > +               /* WMI_FN_CPU_POWER returns the CPU power draw in watts=
 */
> > +               input.function =3D WMI_FN_CPU_POWER;
> > +               ret =3D bitland_mifs_wmi_call(data, &input, &res);
> > +               if (!ret)
> > +                       *val =3D res.data[0] * MICROWATT_PER_WATT;
> > +               return ret;
> >         default:
> >                 return -EINVAL;
> >         }
> > @@ -444,6 +531,15 @@ static const struct hwmon_channel_info *laptop_hwm=
on_info[] =3D {
> >         NULL
> >  };
> >
> > +static const struct hwmon_channel_info *laptop_hwmon_info_power[] =3D =
{
> > +       HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT),
> > +       HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT | HWMON_F_LABEL,
> > +                          HWMON_F_INPUT | HWMON_F_LABEL,
> > +                          HWMON_F_INPUT | HWMON_F_LABEL),
> > +       HWMON_CHANNEL_INFO(power, HWMON_P_INPUT),
> > +       NULL
> > +};
> > +
> >  static const struct hwmon_ops laptop_hwmon_ops =3D {
> >         .visible =3D 0444,
> >         .read =3D laptop_hwmon_read,
> > @@ -455,6 +551,11 @@ static const struct hwmon_chip_info laptop_chip_in=
fo =3D {
> >         .info =3D laptop_hwmon_info,
> >  };
> >
> > +static const struct hwmon_chip_info laptop_chip_info_power =3D {
> > +       .ops =3D &laptop_hwmon_ops,
> > +       .info =3D laptop_hwmon_info_power,
> > +};
> > +
> >  static int laptop_kbd_led_set(struct led_classdev *led_cdev,
> >                               enum led_brightness value)
> >  {
> > @@ -498,6 +599,96 @@ static const char *const gpu_mode_strings[] =3D {
> >         "uma",
> >  };
> >
> > +static ssize_t fn_lock_show(struct device *dev, struct device_attribut=
e *attr,
> > +                           char *buf)
> > +{
> > +       struct bitland_mifs_wmi_data *data =3D dev_get_drvdata(dev);
> > +       struct bitland_mifs_input input =3D {
> > +               .reserved1 =3D 0,
> > +               .operation =3D WMI_METHOD_GET,
> > +               .reserved2 =3D 0,
> > +               .function =3D WMI_FN_FN_LOCK,
> > +       };
> > +       struct bitland_mifs_output res;
> > +       int ret;
> > +
> > +       ret =3D bitland_mifs_wmi_call(data, &input, &res);
> > +       if (ret)
> > +               return ret;
> > +
> > +       return sysfs_emit(buf, "%u\n", res.data[0]);
> > +}
> > +
> > +static ssize_t fn_lock_store(struct device *dev, struct device_attribu=
te *attr,
> > +                            const char *buf, size_t count)
> > +{
> > +       struct bitland_mifs_wmi_data *data =3D dev_get_drvdata(dev);
> > +       struct bitland_mifs_input input =3D {
> > +               .reserved1 =3D 0,
> > +               .operation =3D WMI_METHOD_SET,
> > +               .reserved2 =3D 0,
> > +               .function =3D WMI_FN_FN_LOCK,
> > +       };
> > +       bool val;
> > +       int ret;
> > +
> > +       if (kstrtobool(buf, &val))
> > +               return -EINVAL;
> > +
> > +       input.payload[0] =3D val;
> > +
> > +       ret =3D bitland_mifs_wmi_call(data, &input, NULL);
> > +       if (ret)
> > +               return ret;
> > +
> > +       return count;
> > +}
> > +
> > +static ssize_t touchpad_lock_show(struct device *dev, struct device_at=
tribute *attr,
> > +                                 char *buf)
> > +{
> > +       struct bitland_mifs_wmi_data *data =3D dev_get_drvdata(dev);
> > +       struct bitland_mifs_input input =3D {
> > +               .reserved1 =3D 0,
> > +               .operation =3D WMI_METHOD_GET,
> > +               .reserved2 =3D 0,
> > +               .function =3D WMI_FN_TP_LOCK,
> > +       };
> > +       struct bitland_mifs_output res;
> > +       int ret;
> > +
> > +       ret =3D bitland_mifs_wmi_call(data, &input, &res);
> > +       if (ret)
> > +               return ret;
> > +
> > +       return sysfs_emit(buf, "%u\n", res.data[0]);
> > +}
> > +
> > +static ssize_t touchpad_lock_store(struct device *dev, struct device_a=
ttribute *attr,
> > +                                  const char *buf, size_t count)
> > +{
> > +       struct bitland_mifs_wmi_data *data =3D dev_get_drvdata(dev);
> > +       struct bitland_mifs_input input =3D {
> > +               .reserved1 =3D 0,
> > +               .operation =3D WMI_METHOD_SET,
> > +               .reserved2 =3D 0,
> > +               .function =3D WMI_FN_TP_LOCK,
> > +       };
> > +       bool val;
> > +       int ret;
> > +
> > +       if (kstrtobool(buf, &val))
> > +               return -EINVAL;
> > +
> > +       input.payload[0] =3D val;
> > +
> > +       ret =3D bitland_mifs_wmi_call(data, &input, NULL);
> > +       if (ret)
> > +               return ret;
> > +
> > +       return count;
> > +}
> > +
> >  /* GPU Mode: 0:Hybrid, 1:Discrete, 2:UMA */
> >  static ssize_t gpu_mode_show(struct device *dev, struct device_attribu=
te *attr,
> >                              char *buf)
> > @@ -637,17 +828,46 @@ static ssize_t fan_boost_store(struct device *dev=
,
> >         return count;
> >  }
> >
> > -static const DEVICE_ATTR_RW(gpu_mode);
> > -static const DEVICE_ATTR_RW(kb_mode);
> > -static const DEVICE_ATTR_WO(fan_boost);
> > +static DEVICE_ATTR_RW(gpu_mode);
> > +static DEVICE_ATTR_RW(kb_mode);
> > +static DEVICE_ATTR_WO(fan_boost);
> > +static DEVICE_ATTR_RW(fn_lock);
> > +static DEVICE_ATTR_RW(touchpad_lock);
> >
> > -static const struct attribute *const laptop_attrs[] =3D {
> > +static struct attribute *laptop_attrs[] =3D {
> >         &dev_attr_gpu_mode.attr,
> >         &dev_attr_kb_mode.attr,
> >         &dev_attr_fan_boost.attr,
> > +       &dev_attr_fn_lock.attr,
> > +       &dev_attr_touchpad_lock.attr,
> >         NULL,
> >  };
> > -ATTRIBUTE_GROUPS(laptop);
> > +
> > +static umode_t laptop_attr_is_visible(struct kobject *kobj,
> > +                                     struct attribute *attr, int idx)
> > +{
> > +       struct device *dev =3D kobj_to_dev(kobj);
> > +       struct bitland_mifs_wmi_data *data =3D dev_get_drvdata(dev);
> > +
> > +       /* The sysfs attributes are only supported on the control devic=
e */
> > +       if (data->dev_type !=3D BITLAND_WMI_CONTROL)
> > +               return 0;
> > +
> > +       /*
> > +        * White-only backlit keyboards (e.g. Redmi Book series) do not
> > +        * support the RGB backlight modes.
> > +        */
> > +       if (attr =3D=3D &dev_attr_kb_mode.attr &&
> > +           data->kbd_type =3D=3D WMI_KBD_TYPE_WHITE)
> > +               return 0;
> > +
> > +       return attr->mode;
> > +}
> > +
> > +static const struct attribute_group laptop_group =3D {
> > +       .attrs =3D laptop_attrs,
> > +       .is_visible =3D laptop_attr_is_visible,
> > +};
> >
> >  static const struct key_entry bitland_mifs_wmi_keymap[] =3D {
> >         { KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_OPEN_APP, 1, 0), { KEY_PROG1=
 } },
> > @@ -699,6 +919,34 @@ static const struct key_entry bitland_mifs_wmi_key=
map[] =3D {
> >         { KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_FNLOCK_STATE, 0, 0), {} }=
,
> >         { KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_FNLOCK_STATE, 1, 0), {} }=
,
> >
> > +       /* Airplane mode toggle (Redmi) */
> > +       { KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_AIRPLANE_MODE, 0, 0), { KEY_=
RFKILL } },
> > +       { KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_AIRPLANE_MODE, 1, 0), { KEY_=
RFKILL } },
> > +
> > +       /*
> > +        * Touchpad state change (Redmi Fn+F7). The EC performs the act=
ual
> > +        * toggle itself; userspace can control the state via the
> > +        * touchpad_lock sysfs attribute.
> > +        */
> > +       { KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_TOUCHPAD_STATE, 0, 0), {}=
 },
> > +       { KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_TOUCHPAD_STATE, 1, 0), {}=
 },
> > +
> > +       /* Keyboard backlight mode change */
> > +       { KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_KBD_MODE, 0, 0), {} },
> > +       { KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_KBD_MODE, 1, 0), {} },
> > +
> > +       /* Lock-state indicator events */
> > +       { KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_CAPSLOCK_STATE, 0, 0), {}=
 },
> > +       { KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_CAPSLOCK_STATE, 1, 0), {}=
 },
> > +       { KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_NUMLOCK_STATE, 0, 0), {} =
},
> > +       { KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_NUMLOCK_STATE, 1, 0), {} =
},
> > +       { KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_SCROLLLOCK_STATE, 0, 0), =
{} },
> > +       { KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_SCROLLLOCK_STATE, 1, 0), =
{} },
> > +
> > +       /* Win key lock (Redmi gaming mode) */
> > +       { KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_WIN_KEY_LOCK, 0, 0), {} }=
,
> > +       { KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_WIN_KEY_LOCK, 1, 0), {} }=
,
> > +
> >         /* Fn+`/1/2/3/4 */
> >         { KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_FN_F, 1, 0), { KEY_F13 } },
> >         { KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_FN_0, 1, 0), { KEY_F14 } },
> > @@ -744,6 +992,36 @@ static int bitland_notifier_callback(struct notifi=
er_block *nb,
> >         return NOTIFY_OK;
> >  }
> >
> > +static int bitland_detect_kbd_type(struct bitland_mifs_wmi_data *data)
> > +{
> > +       struct bitland_mifs_input input =3D {
> > +               .reserved1 =3D 0,
> > +               .operation =3D WMI_METHOD_GET,
> > +               .reserved2 =3D 0,
> > +               .function =3D WMI_FN_KBD_TYPE,
> > +       };
> > +       struct bitland_mifs_output res;
> > +       int ret;
> > +
> > +       ret =3D bitland_mifs_wmi_call(data, &input, &res);
> > +       if (ret)
> > +               return ret;
> > +
> > +       data->kbd_type =3D res.data[0];
> > +       return 0;
> > +}
> > +
> > +static void bitland_detect_ops(struct bitland_mifs_wmi_data *data)
> > +{
> > +       const struct dmi_system_id *id;
> > +
> > +       id =3D dmi_first_match(bitland_mifs_dmi_table);
> > +       if (id)
> > +               data->ops =3D id->driver_data;
> > +
> > +       dev_dbg(&data->wdev->dev, "Detected machine ops: %s\n", data->o=
ps->name);
> > +}
> > +
> >  static int bitland_mifs_wmi_probe(struct wmi_device *wdev, const void =
*context)
> >  {
> >         struct bitland_mifs_wmi_data *drv_data;
> > @@ -761,6 +1039,9 @@ static int bitland_mifs_wmi_probe(struct wmi_devic=
e *wdev, const void *context)
> >                 return -ENOMEM;
> >
> >         drv_data->wdev =3D wdev;
> > +       drv_data->dev_type =3D dev_type;
> > +       /* Default to RGB so the RGB attributes stay visible if detecti=
on fails */
> > +       drv_data->kbd_type =3D WMI_KBD_TYPE_RGB;
> >         drv_data->ops =3D &bitland_ops;
> >
> >         ret =3D devm_mutex_init(&wdev->dev, &drv_data->lock);
> > @@ -769,6 +1050,8 @@ static int bitland_mifs_wmi_probe(struct wmi_devic=
e *wdev, const void *context)
> >
> >         dev_set_drvdata(&wdev->dev, drv_data);
> >
> > +       bitland_detect_ops(drv_data);
> > +
> >         if (dev_type =3D=3D BITLAND_WMI_EVENT) {
> >                 /* Register input device for hotkeys */
> >                 drv_data->input_dev =3D devm_input_allocate_device(&wde=
v->dev);
> > @@ -794,12 +1077,28 @@ static int bitland_mifs_wmi_probe(struct wmi_dev=
ice *wdev, const void *context)
> >         if (IS_ERR(drv_data->pp_dev))
> >                 return PTR_ERR(drv_data->pp_dev);
> >
> > +       /* Detect the keyboard type */
> > +       ret =3D bitland_detect_kbd_type(drv_data);
> > +       if (ret)
> > +               dev_dbg(&wdev->dev, "Failed to detect keyboard type, as=
suming RGB: %d\n", ret);
> > +
> > +       ret =3D devm_device_add_group(&wdev->dev, &laptop_group);
> > +       if (ret)
> > +               return ret;
> > +
> >         /* Register hwmon */
> > -       drv_data->hwmon_dev =3D devm_hwmon_device_register_with_info(&w=
dev->dev,
> > -                                                                  "bit=
land_mifs",
> > -                                                                  drv_=
data,
> > -                                                                  &lap=
top_chip_info,
> > -                                                                  NULL=
);
> > +       if (drv_data->ops->has_cpu_power)
> > +               drv_data->hwmon_dev =3D devm_hwmon_device_register_with=
_info(&wdev->dev,
> > +                                                                      =
    "bitland_mifs",
> > +                                                                      =
    drv_data,
> > +                                                                      =
    &laptop_chip_info_power,
> > +                                                                      =
    NULL);
> > +       else
> > +               drv_data->hwmon_dev =3D devm_hwmon_device_register_with=
_info(&wdev->dev,
> > +                                                                      =
    "bitland_mifs",
> > +                                                                      =
    drv_data,
> > +                                                                      =
    &laptop_chip_info,
> > +                                                                      =
    NULL);
> >         if (IS_ERR(drv_data->hwmon_dev))
> >                 return PTR_ERR(drv_data->hwmon_dev);
> >
> > @@ -851,6 +1150,7 @@ static void bitland_mifs_wmi_report_key(struct wmi=
_device *wdev, u32 payload)
> >  static void bitland_mifs_wmi_notify(struct wmi_device *wdev,
> >                                     const struct wmi_buffer *buffer)
> >  {
> > +       struct bitland_mifs_wmi_data *data =3D dev_get_drvdata(&wdev->d=
ev);
> >         const struct bitland_mifs_event *event =3D buffer->data;
> >         struct bitland_fan_notify_data fan_data;
> >         u32 payload;
> > @@ -885,7 +1185,8 @@ static void bitland_mifs_wmi_notify(struct wmi_dev=
ice *wdev,
> >         case WMI_EVENT_CPU_FAN_SPEED:
> >         case WMI_EVENT_GPU_FAN_SPEED:
> >                 /* Redmi refresh rate toggle quirk */
> > -               if (event->event_id =3D=3D WMI_EVENT_CPU_FAN_SPEED &&
> > +               if (data->ops->quirk_refresh_rate_toggle &&
> > +                   event->event_id =3D=3D WMI_EVENT_CPU_FAN_SPEED &&
> >                     event->value_low =3D=3D 0 && event->value_high =3D=
=3D 0) {
> >                         payload =3D BI_HOTKEY_CODE(WMI_EVENT_REFRESH_RA=
TE, 0, 0);
> >                         bitland_mifs_wmi_report_key(wdev, payload);
> > @@ -923,7 +1224,6 @@ static struct wmi_driver bitland_mifs_wmi_driver =
=3D {
> >         .no_singleton =3D true,
> >         .driver =3D {
> >                 .name =3D DRV_NAME,
> > -               .dev_groups =3D laptop_groups,
> >                 .pm =3D pm_sleep_ptr(&bitland_mifs_wmi_pm_ops),
> >         },
> >         .id_table =3D bitland_mifs_wmi_id_table,
> > --
> > 2.55.0
> >
