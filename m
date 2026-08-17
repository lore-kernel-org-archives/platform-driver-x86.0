Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15BA399340
	for <platform-driver-x86@vger.kernel.org>; Mon, 17 Aug 2026 23:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787008643; cv=pass; b=Tj9d8x8d8JpNhce2P3+J52o4iAqzOjns+gyRio6HegvV6HTNLqcwJ+LL6BeupZjmxwnnSLMw/g3slD8U1OnwQKD1EyWWt6fT8+0O+zol39J6kLOZuJZ6WcgEQuG2w7ayqH/N3uTVLjElxY+BfdpAwR8rKCoB0lXcA0J+j5AmNNw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787008643; c=relaxed/simple;
	bh=CMuD4qRHmQ2N1KeKmx8j4bM2PcQh54IxfOsEnHEsg3c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ai6tcB8/z7AJdmIMfxLV1L3GRKKmwwl1JZdK5cqokebrJ8NzkUeIA7UNJCpuvmDwfSbvc1PA3C0STTke1FG2S9mHiK/aTV2VD/sWPNbMbOiS1EG9i1iUA5uNnALPjX6krjGJ3DV8xNs09BZdJ7t1xsEkPS3mI24FB3Ii/8dlEgs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QvQvSdEj; arc=pass smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QvQvSdEj"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38e347638adso4877565a91.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 17 Aug 2026 16:17:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787008641; cv=none;
        d=google.com; s=arc-20260327;
        b=IcRTed925hW0SF9QXpDmg2YL6hESY+DvKedKefXoUFDhNQWFdjuCAxqqK1742zwKln
         MSIoEGJDecoK8ekaUMqaCkmyoQMxxQJKZXZ4z0QLDimKrUt4e4P2pZNLriKwQdqkgEUd
         xXOKufOKJ2I+ne9yMJZKogFAq6xu0ngjpArYCtKgXBbvXo51CWsAHDmcvGRbTcal+LP+
         hgvXVz9eO7slcFJQxsue/Fd6RzbWT5Ru/Hp7M6ot8APHpemTCYGgZq4rKULErpzIMC8O
         Qqcjfr5pqiHHpo7bGoCpBXxsPUHt8yYjp1LoX14YvwNAfR4ZD1o9ruLEQ4AOn1ICyl50
         AwcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jwb4bGmns1DgTjKvt9yb4t3/SINyhHOrdLipmLl8v5c=;
        fh=fogH89sEYgAsfxcq8icSNsC46C6/zex8SpZ8LYzQCNA=;
        b=d9HOetXOplR2hyFxOKc0lwF69E+5Xp0OKHpKx4ROH7Cnjlb1/XnoDT0ukykQnhLfc+
         yyrW/UsKcLAZNKYP+xLo0nX1U2SXLG2ecMryWVtl1aFI0rgMWd06A2wkjZB616pU0aiP
         dSQJ1yaalEZ6CyrPDTxJUaCwctGO3VKNg5KcEG0/yQ/aUBeRsDnyPtPY8gAXje8/9Py0
         vcx3CAgtRwbb9hGtv2k55xraZpJ96WK2KLFZH3vrCeclo8/f4X7DW8p/MjYH7/71+7pU
         xTUsiNpOXAo1ErVP0eP77fQXMDQ/l6Zz7DgqRsgtwIisYdVLCDpYpEU3tvymuKZfdnaw
         yGUg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787008641; x=1787613441; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jwb4bGmns1DgTjKvt9yb4t3/SINyhHOrdLipmLl8v5c=;
        b=QvQvSdEjPhRFrnMZcgtX7Dy0S10jak1Ina9ZOMaSI/NY5FtWUIV+rVRnA6MSKzRne8
         cnK2+oQWnZdtHBWNgV6znKA8+IOkp3n/6pYJeZGStuTVWG76/OnautLCzJumC24azzl/
         9WNkuS54DllG0VBOOhn+ZRwh0BzNEVj1f2hKTnpsffo0HnkIKC071qlFauT2fofZ+iqY
         0Wm/oYq1qgQ9sDMMTw11OeqP8tOHqbR/FOrJJ1AM/JvlddlhvZLSPZOLAo6nFOWvvmK1
         k49r/EwPjBUIzsgILWw3omS72z3RtpD7KicoB4Qw58Fqx1gcC4kOvoW/KMoBI0s6d4aD
         mHxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787008641; x=1787613441;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jwb4bGmns1DgTjKvt9yb4t3/SINyhHOrdLipmLl8v5c=;
        b=T4266BddwZu0hn8MP3IXf4fUSBhigDYHjmcvBw0bay3kMPEZ0JyPjWLVxrqW7+Qr6u
         RGJjY9YeDZz2ijMsCUJ3FVVlH2mjarKfqOOHcmLeAhi5vh0jOzahZ/kwsqtBvoS+st8l
         SjhxxBmq2Yn1Ipm3HDs2ZgYylfGhDnMHiA6FPiln65xFHsD9p7/gzc4F04YtYha/sQ/P
         IbvJtDQXamRSQKYFNsmVDCRsAnR9/YOlIvkCESDLI8o1ssbdCdFB2Y6pgvKaEPs3fsxF
         gq38gXz+263WzF8riYZ7x2YWbn4RRW1l69txaTZsqrSaAe9ZGql57mgYT/CNWMCGbuX3
         zt+g==
X-Forwarded-Encrypted: i=1; AHgh+Rq1F+6kRC9wVwORF+Yb6wQXw5UZvxwTRvb3Ksg+fbB4KfJJR0pCeoyQbtHU6om6xJDymrMJ5mKHwF+aH05oSq3p7ldq@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0Zt3jF88IA7c4ij5uVetZgKjNHEGVncshNmajlQ2dZRYh10hl
	2Ek+m06U4XZ3FOps9uDYAmm1JTgoJEFEhlRA1XLGiMXBNGrjlHlhG6zdWqqhqEavHOlEm47tjdx
	Dffr9XQXNZDToPta+tL1WI270hsGjxVI=
X-Gm-Gg: AR+sD12ZU+6xrZE+RWOstsCVZ2B24S4l8RX+pr2fWzGngnnyOY8LOEtVjgE807D2ASu
	B14p2jHCC7t5xycIZqENGJDrUi1T70aQ7NrHJusJ6o0T438B8hzb5bS2HxCjLN1Sx6EwvH/PvM9
	Gd1vbbvYRkYe/bleoGGZ3pYnr7O0nk4Lbp5dAwdA3PYd8KlJh6EfIKBl8GJvuZKUqcc9mPxwKho
	uHwQdLiXNnFO7YkrojeDDPlK8PyStlGMaGJnJ1PrlIaep1DGST4/whIG86wa3OqCX4jHos1bqhK
	7aZofSVl362a4rnRnsvopB3rGTzrFd0HUBRHlXM9xY4HFyw4V4mCmkuVPMk=
X-Received: by 2002:a17:90b:2891:b0:38f:dec8:f7e9 with SMTP id
 98e67ed59e1d1-3933b8744c2mr29085624a91.12.1787008640754; Mon, 17 Aug 2026
 16:17:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260816100813.300450-1-qby140326@gmail.com> <20260816100813.300450-7-qby140326@gmail.com>
In-Reply-To: <20260816100813.300450-7-qby140326@gmail.com>
From: =?UTF-8?Q?Milo=C5=A1_Vlku?= <vlku.milos.fun@gmail.com>
Date: Tue, 18 Aug 2026 01:17:08 +0200
X-Gm-Features: AcwNN1UqwwaUM0pm_2VdXMcBmkymIGuDqbgfTO-W4gQ3bGxYjq2NMp5o_2r9078
Message-ID: <CAObHBTxSTzGSuN=8a+PQs7Khxv+_JMenf2a4j8me-L0ksDnXXQ@mail.gmail.com>
Subject: Re: [PATCH v5 6/6] platform/x86: bitland-mifs-wmi: Add Redmi laptop support
To: Mingyou Chen <qby140326@gmail.com>
Cc: W_Armin@gmx.de, foxido@foxido.dev, hansg@kernel.org, 
	ilpo.jarvinen@linux.intel.com, linux-kernel@vger.kernel.org, 
	nika@nikableh.moe, platform-driver-x86@vger.kernel.org, i@rsplwe.com, 
	wolf109909@outlook.com, rahulbheda131313@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> +    {
> +        /* Redmi Book series */
> +        .matches =3D {
> +            DMI_MATCH(DMI_SYS_VENDOR, "Redmi"),
> +        },
> +        .driver_data =3D (void *)&redmi_book_ops,
> +    },
> +    {
> +        /* Xiaomi Book series */
> +        .matches =3D {
> +            DMI_MATCH(DMI_SYS_VENDOR, "TIMI"),
> +        },
> +        .driver_data =3D (void *)&redmi_book_ops,
> +    },

Neither entry matches my machine. I have a Redmi Book Pro 14 2024, and
it reports:

  DMI_SYS_VENDOR   XIAOMI
  DMI_BOARD_NAME   TM2307
  DMI_PRODUCT_NAME Redmi Book Pro 14 2024

Since DMI_MATCH() is a substring test, neither "Redmi" nor "TIMI"
matches "XIAOMI", so dmi_first_match() returns NULL and data->ops stays
at &bitland_ops. The series has no effect on this model.

A board-name match would cover it:

    {
        /* Redmi Book Pro 14 2024 */
        .matches =3D {
            DMI_MATCH(DMI_BOARD_NAME, "TM2307"),
        },
        .driver_data =3D (void *)&redmi_book_ops,
    },

I don't know how widely the "XIAOMI" vendor string is used across the
range, so matching DMI_SYS_VENDOR "XIAOMI" may cover more machines at
once if that encoding applies to all of them.

Thanks,
Milos

On Sun, Aug 16, 2026 at 12:08=E2=80=AFPM Mingyou Chen <qby140326@gmail.com>=
 wrote:
>
> Redmi laptops (Redmi Book and Redmi G series) use the same MIFS WMI
> interface but encode the performance mode values of
> WMI_FN_SYSTEM_PER_MODE differently, as reverse engineered from the
> Windows GCommandCenter application:
>
>   0 =3D performance, 1 =3D balanced, 2 =3D quiet, 4 =3D full speed
>
> Add "Redmi Book" and "Redmi G" ops entries selected via DMI:
> - Redmi G (board TM2135/TM2137): the full-speed mode is available
> - Redmi Book/Xiaomi Book: no full-speed mode
> - The performance modes only require AC power (any source); the
>   barrel-jack requirement is Bitland-specific
>
> The GCommandCenter application further showed that:
> - the CPU power sensor (WMI_FN_CPU_POWER) is only available on Redmi
>   machines, gate the hwmon power channel on the ops table
> - the refresh-rate-toggle quirk in the CPU fan speed event is
>   Redmi-specific, gate it on the ops table instead of applying it
>   unconditionally
>
> Also add Redmi support for Fn lock and touchpad lock control
> (WMI_FN_FN_LOCK / WMI_FN_TP_LOCK sysfs attributes), keyboard type
> detection (hide the RGB kb_mode attribute on white-only backlit
> keyboards) and hotkeys (airplane mode -> KEY_RFKILL, ignore the
> lock-state and keyboard mode indicator events).
>
> The sysfs attribute group is now registered in probe (instead of via
> dev_groups) so that the is_visible callback can access the probe
> populated driver data.
>
> Signed-off-by: Mingyou Chen <qby140326@gmail.com>
> ---
>  drivers/platform/x86/bitland-mifs-wmi.c | 336 ++++++++++++++++++++++--
>  1 file changed, 318 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x=
86/bitland-mifs-wmi.c
> index 17792d8b7c29..1eb9f92740e0 100644
> --- a/drivers/platform/x86/bitland-mifs-wmi.c
> +++ b/drivers/platform/x86/bitland-mifs-wmi.c
> @@ -14,6 +14,7 @@
>  #include <linux/dev_printk.h>
>  #include <linux/device.h>
>  #include <linux/device/devres.h>
> +#include <linux/dmi.h>
>  #include <linux/err.h>
>  #include <linux/hwmon.h>
>  #include <linux/init.h>
> @@ -71,6 +72,11 @@ enum bitland_system_ac_mode {
>         WMI_SYSTEM_AC_CIRCULARHOLE      =3D 2,
>  };
>
> +enum bitland_kbd_type {
> +       WMI_KBD_TYPE_WHITE              =3D 0,
> +       WMI_KBD_TYPE_RGB                =3D 1,
> +};
> +
>  enum bitland_mifs_power_profile {
>         WMI_PP_BALANCED         =3D 0,
>         WMI_PP_PERFORMANCE      =3D 1,
> @@ -97,7 +103,15 @@ static const struct bitland_profile_mode_map bitland_=
mode_map =3D {
>         .full_speed     =3D WMI_PP_FULL_SPEED,
>  };
>
> +static const struct bitland_profile_mode_map redmi_mode_map =3D {
> +       .balanced       =3D 1,
> +       .performance    =3D 0,
> +       .quiet          =3D 2,
> +       .full_speed     =3D 4,
> +};
> +
>  static int bitland_pp_check_capability(struct bitland_mifs_wmi_data *dat=
a);
> +static int redmi_pp_check_capability(struct bitland_mifs_wmi_data *data)=
;
>
>  /*
>   * Machine-specific operations. The MIFS WMI interface is shared by
> @@ -109,6 +123,8 @@ struct bitland_mifs_ops {
>         const struct bitland_profile_mode_map *mode_map;
>         int (*check_performance_capability)(struct bitland_mifs_wmi_data =
*data);
>         bool has_full_speed;
> +       bool has_cpu_power;
> +       bool quirk_refresh_rate_toggle;
>  };
>
>  static const struct bitland_mifs_ops bitland_ops =3D {
> @@ -118,6 +134,54 @@ static const struct bitland_mifs_ops bitland_ops =3D=
 {
>         .has_full_speed =3D true,
>  };
>
> +static const struct bitland_mifs_ops redmi_book_ops =3D {
> +       .name =3D "Redmi Book",
> +       .mode_map =3D &redmi_mode_map,
> +       .check_performance_capability =3D redmi_pp_check_capability,
> +       .has_cpu_power =3D true,
> +       .quirk_refresh_rate_toggle =3D true,
> +};
> +
> +static const struct bitland_mifs_ops redmi_g_ops =3D {
> +       .name =3D "Redmi G",
> +       .mode_map =3D &redmi_mode_map,
> +       .check_performance_capability =3D redmi_pp_check_capability,
> +       .has_full_speed =3D true,
> +       .has_cpu_power =3D true,
> +       .quirk_refresh_rate_toggle =3D true,
> +};
> +
> +static const struct dmi_system_id bitland_mifs_dmi_table[] =3D {
> +       {
> +               /* Redmi G */
> +               .matches =3D {
> +                       DMI_MATCH(DMI_BOARD_NAME, "TM2135"),
> +               },
> +               .driver_data =3D (void *)&redmi_g_ops,
> +       },
> +       {
> +               .matches =3D {
> +                       DMI_MATCH(DMI_BOARD_NAME, "TM2137"),
> +               },
> +               .driver_data =3D (void *)&redmi_g_ops,
> +       },
> +       {
> +               /* Redmi Book series */
> +               .matches =3D {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "Redmi"),
> +               },
> +               .driver_data =3D (void *)&redmi_book_ops,
> +       },
> +       {
> +               /* Xiaomi Book series */
> +               .matches =3D {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "TIMI"),
> +               },
> +               .driver_data =3D (void *)&redmi_book_ops,
> +       },
> +       {}
> +};
> +
>  enum bitland_mifs_event_id {
>         WMI_EVENT_RESERVED_1            =3D 1,
>         WMI_EVENT_RESERVED_2            =3D 2,
> @@ -203,6 +267,8 @@ struct bitland_mifs_wmi_data {
>         struct input_dev *input_dev;
>         struct device *hwmon_dev;
>         struct device *pp_dev;
> +       enum bitland_wmi_device_type dev_type;
> +       u8 kbd_type;
>         const struct bitland_mifs_ops *ops;
>         enum platform_profile_option saved_profile;
>  };
> @@ -255,8 +321,10 @@ static int laptop_profile_get(struct device *dev,
>         else if (mode =3D=3D map->balanced)
>                 *profile =3D PLATFORM_PROFILE_BALANCED;
>         else if (mode =3D=3D map->performance)
> -               *profile =3D PLATFORM_PROFILE_BALANCED_PERFORMANCE;
> -       else if (mode =3D=3D map->full_speed)
> +               *profile =3D data->ops->has_full_speed ?
> +                          PLATFORM_PROFILE_BALANCED_PERFORMANCE :
> +                          PLATFORM_PROFILE_PERFORMANCE;
> +       else if (data->ops->has_full_speed && mode =3D=3D map->full_speed=
)
>                 *profile =3D PLATFORM_PROFILE_PERFORMANCE;
>         else
>                 return -EINVAL;
> @@ -273,10 +341,11 @@ static int bitland_pp_check_capability(struct bitla=
nd_mifs_wmi_data *data)
>         struct bitland_mifs_output output;
>         int ret;
>
> -       /* Full-speed/performance mode requires DC power (not USB-C) */
> +       /* The performance modes require AC power */
>         if (!power_supply_is_system_supplied())
>                 return -EOPNOTSUPP;
>
> +       /* Additionally require the barrel-jack power supply (not USB-C) =
*/
>         ret =3D bitland_mifs_wmi_call(data, &input, &output);
>         if (ret)
>                 return ret;
> @@ -287,6 +356,15 @@ static int bitland_pp_check_capability(struct bitlan=
d_mifs_wmi_data *data)
>         return 0;
>  }
>
> +static int redmi_pp_check_capability(struct bitland_mifs_wmi_data *data)
> +{
> +       /* The performance modes require AC power (any source) */
> +       if (!power_supply_is_system_supplied())
> +               return -EOPNOTSUPP;
> +
> +       return 0;
> +}
> +
>  static int laptop_profile_set(struct device *dev,
>                               enum platform_profile_option profile)
>  {
> @@ -309,6 +387,8 @@ static int laptop_profile_set(struct device *dev,
>                 mode =3D map->balanced;
>                 break;
>         case PLATFORM_PROFILE_BALANCED_PERFORMANCE:
> +               if (!data->ops->has_full_speed)
> +                       return -EOPNOTSUPP;
>                 ret =3D data->ops->check_performance_capability(data);
>                 if (ret)
>                         return ret;
> @@ -318,7 +398,7 @@ static int laptop_profile_set(struct device *dev,
>                 ret =3D data->ops->check_performance_capability(data);
>                 if (ret)
>                         return ret;
> -               mode =3D map->full_speed;
> +               mode =3D data->ops->has_full_speed ? map->full_speed : ma=
p->performance;
>                 break;
>         default:
>                 return -EOPNOTSUPP;
> @@ -335,10 +415,10 @@ static int platform_profile_probe(void *drvdata, un=
signed long *choices)
>
>         set_bit(PLATFORM_PROFILE_LOW_POWER, choices);
>         set_bit(PLATFORM_PROFILE_BALANCED, choices);
> -       set_bit(PLATFORM_PROFILE_BALANCED_PERFORMANCE, choices);
> +       set_bit(PLATFORM_PROFILE_PERFORMANCE, choices);
>
>         if (data->ops->has_full_speed)
> -               set_bit(PLATFORM_PROFILE_PERFORMANCE, choices);
> +               set_bit(PLATFORM_PROFILE_BALANCED_PERFORMANCE, choices);
>
>         return 0;
>  }
> @@ -418,6 +498,13 @@ static int laptop_hwmon_read(struct device *dev, enu=
m hwmon_sensor_types type,
>                 default:
>                         return -EINVAL;
>                 }
> +       case hwmon_power:
> +               /* WMI_FN_CPU_POWER returns the CPU power draw in watts *=
/
> +               input.function =3D WMI_FN_CPU_POWER;
> +               ret =3D bitland_mifs_wmi_call(data, &input, &res);
> +               if (!ret)
> +                       *val =3D res.data[0] * MICROWATT_PER_WATT;
> +               return ret;
>         default:
>                 return -EINVAL;
>         }
> @@ -444,6 +531,15 @@ static const struct hwmon_channel_info *laptop_hwmon=
_info[] =3D {
>         NULL
>  };
>
> +static const struct hwmon_channel_info *laptop_hwmon_info_power[] =3D {
> +       HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT),
> +       HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT | HWMON_F_LABEL,
> +                          HWMON_F_INPUT | HWMON_F_LABEL,
> +                          HWMON_F_INPUT | HWMON_F_LABEL),
> +       HWMON_CHANNEL_INFO(power, HWMON_P_INPUT),
> +       NULL
> +};
> +
>  static const struct hwmon_ops laptop_hwmon_ops =3D {
>         .visible =3D 0444,
>         .read =3D laptop_hwmon_read,
> @@ -455,6 +551,11 @@ static const struct hwmon_chip_info laptop_chip_info=
 =3D {
>         .info =3D laptop_hwmon_info,
>  };
>
> +static const struct hwmon_chip_info laptop_chip_info_power =3D {
> +       .ops =3D &laptop_hwmon_ops,
> +       .info =3D laptop_hwmon_info_power,
> +};
> +
>  static int laptop_kbd_led_set(struct led_classdev *led_cdev,
>                               enum led_brightness value)
>  {
> @@ -498,6 +599,96 @@ static const char *const gpu_mode_strings[] =3D {
>         "uma",
>  };
>
> +static ssize_t fn_lock_show(struct device *dev, struct device_attribute =
*attr,
> +                           char *buf)
> +{
> +       struct bitland_mifs_wmi_data *data =3D dev_get_drvdata(dev);
> +       struct bitland_mifs_input input =3D {
> +               .reserved1 =3D 0,
> +               .operation =3D WMI_METHOD_GET,
> +               .reserved2 =3D 0,
> +               .function =3D WMI_FN_FN_LOCK,
> +       };
> +       struct bitland_mifs_output res;
> +       int ret;
> +
> +       ret =3D bitland_mifs_wmi_call(data, &input, &res);
> +       if (ret)
> +               return ret;
> +
> +       return sysfs_emit(buf, "%u\n", res.data[0]);
> +}
> +
> +static ssize_t fn_lock_store(struct device *dev, struct device_attribute=
 *attr,
> +                            const char *buf, size_t count)
> +{
> +       struct bitland_mifs_wmi_data *data =3D dev_get_drvdata(dev);
> +       struct bitland_mifs_input input =3D {
> +               .reserved1 =3D 0,
> +               .operation =3D WMI_METHOD_SET,
> +               .reserved2 =3D 0,
> +               .function =3D WMI_FN_FN_LOCK,
> +       };
> +       bool val;
> +       int ret;
> +
> +       if (kstrtobool(buf, &val))
> +               return -EINVAL;
> +
> +       input.payload[0] =3D val;
> +
> +       ret =3D bitland_mifs_wmi_call(data, &input, NULL);
> +       if (ret)
> +               return ret;
> +
> +       return count;
> +}
> +
> +static ssize_t touchpad_lock_show(struct device *dev, struct device_attr=
ibute *attr,
> +                                 char *buf)
> +{
> +       struct bitland_mifs_wmi_data *data =3D dev_get_drvdata(dev);
> +       struct bitland_mifs_input input =3D {
> +               .reserved1 =3D 0,
> +               .operation =3D WMI_METHOD_GET,
> +               .reserved2 =3D 0,
> +               .function =3D WMI_FN_TP_LOCK,
> +       };
> +       struct bitland_mifs_output res;
> +       int ret;
> +
> +       ret =3D bitland_mifs_wmi_call(data, &input, &res);
> +       if (ret)
> +               return ret;
> +
> +       return sysfs_emit(buf, "%u\n", res.data[0]);
> +}
> +
> +static ssize_t touchpad_lock_store(struct device *dev, struct device_att=
ribute *attr,
> +                                  const char *buf, size_t count)
> +{
> +       struct bitland_mifs_wmi_data *data =3D dev_get_drvdata(dev);
> +       struct bitland_mifs_input input =3D {
> +               .reserved1 =3D 0,
> +               .operation =3D WMI_METHOD_SET,
> +               .reserved2 =3D 0,
> +               .function =3D WMI_FN_TP_LOCK,
> +       };
> +       bool val;
> +       int ret;
> +
> +       if (kstrtobool(buf, &val))
> +               return -EINVAL;
> +
> +       input.payload[0] =3D val;
> +
> +       ret =3D bitland_mifs_wmi_call(data, &input, NULL);
> +       if (ret)
> +               return ret;
> +
> +       return count;
> +}
> +
>  /* GPU Mode: 0:Hybrid, 1:Discrete, 2:UMA */
>  static ssize_t gpu_mode_show(struct device *dev, struct device_attribute=
 *attr,
>                              char *buf)
> @@ -637,17 +828,46 @@ static ssize_t fan_boost_store(struct device *dev,
>         return count;
>  }
>
> -static const DEVICE_ATTR_RW(gpu_mode);
> -static const DEVICE_ATTR_RW(kb_mode);
> -static const DEVICE_ATTR_WO(fan_boost);
> +static DEVICE_ATTR_RW(gpu_mode);
> +static DEVICE_ATTR_RW(kb_mode);
> +static DEVICE_ATTR_WO(fan_boost);
> +static DEVICE_ATTR_RW(fn_lock);
> +static DEVICE_ATTR_RW(touchpad_lock);
>
> -static const struct attribute *const laptop_attrs[] =3D {
> +static struct attribute *laptop_attrs[] =3D {
>         &dev_attr_gpu_mode.attr,
>         &dev_attr_kb_mode.attr,
>         &dev_attr_fan_boost.attr,
> +       &dev_attr_fn_lock.attr,
> +       &dev_attr_touchpad_lock.attr,
>         NULL,
>  };
> -ATTRIBUTE_GROUPS(laptop);
> +
> +static umode_t laptop_attr_is_visible(struct kobject *kobj,
> +                                     struct attribute *attr, int idx)
> +{
> +       struct device *dev =3D kobj_to_dev(kobj);
> +       struct bitland_mifs_wmi_data *data =3D dev_get_drvdata(dev);
> +
> +       /* The sysfs attributes are only supported on the control device =
*/
> +       if (data->dev_type !=3D BITLAND_WMI_CONTROL)
> +               return 0;
> +
> +       /*
> +        * White-only backlit keyboards (e.g. Redmi Book series) do not
> +        * support the RGB backlight modes.
> +        */
> +       if (attr =3D=3D &dev_attr_kb_mode.attr &&
> +           data->kbd_type =3D=3D WMI_KBD_TYPE_WHITE)
> +               return 0;
> +
> +       return attr->mode;
> +}
> +
> +static const struct attribute_group laptop_group =3D {
> +       .attrs =3D laptop_attrs,
> +       .is_visible =3D laptop_attr_is_visible,
> +};
>
>  static const struct key_entry bitland_mifs_wmi_keymap[] =3D {
>         { KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_OPEN_APP, 1, 0), { KEY_PROG1 }=
 },
> @@ -699,6 +919,34 @@ static const struct key_entry bitland_mifs_wmi_keyma=
p[] =3D {
>         { KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_FNLOCK_STATE, 0, 0), {} },
>         { KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_FNLOCK_STATE, 1, 0), {} },
>
> +       /* Airplane mode toggle (Redmi) */
> +       { KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_AIRPLANE_MODE, 0, 0), { KEY_RF=
KILL } },
> +       { KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_AIRPLANE_MODE, 1, 0), { KEY_RF=
KILL } },
> +
> +       /*
> +        * Touchpad state change (Redmi Fn+F7). The EC performs the actua=
l
> +        * toggle itself; userspace can control the state via the
> +        * touchpad_lock sysfs attribute.
> +        */
> +       { KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_TOUCHPAD_STATE, 0, 0), {} }=
,
> +       { KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_TOUCHPAD_STATE, 1, 0), {} }=
,
> +
> +       /* Keyboard backlight mode change */
> +       { KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_KBD_MODE, 0, 0), {} },
> +       { KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_KBD_MODE, 1, 0), {} },
> +
> +       /* Lock-state indicator events */
> +       { KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_CAPSLOCK_STATE, 0, 0), {} }=
,
> +       { KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_CAPSLOCK_STATE, 1, 0), {} }=
,
> +       { KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_NUMLOCK_STATE, 0, 0), {} },
> +       { KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_NUMLOCK_STATE, 1, 0), {} },
> +       { KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_SCROLLLOCK_STATE, 0, 0), {}=
 },
> +       { KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_SCROLLLOCK_STATE, 1, 0), {}=
 },
> +
> +       /* Win key lock (Redmi gaming mode) */
> +       { KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_WIN_KEY_LOCK, 0, 0), {} },
> +       { KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_WIN_KEY_LOCK, 1, 0), {} },
> +
>         /* Fn+`/1/2/3/4 */
>         { KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_FN_F, 1, 0), { KEY_F13 } },
>         { KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_FN_0, 1, 0), { KEY_F14 } },
> @@ -744,6 +992,36 @@ static int bitland_notifier_callback(struct notifier=
_block *nb,
>         return NOTIFY_OK;
>  }
>
> +static int bitland_detect_kbd_type(struct bitland_mifs_wmi_data *data)
> +{
> +       struct bitland_mifs_input input =3D {
> +               .reserved1 =3D 0,
> +               .operation =3D WMI_METHOD_GET,
> +               .reserved2 =3D 0,
> +               .function =3D WMI_FN_KBD_TYPE,
> +       };
> +       struct bitland_mifs_output res;
> +       int ret;
> +
> +       ret =3D bitland_mifs_wmi_call(data, &input, &res);
> +       if (ret)
> +               return ret;
> +
> +       data->kbd_type =3D res.data[0];
> +       return 0;
> +}
> +
> +static void bitland_detect_ops(struct bitland_mifs_wmi_data *data)
> +{
> +       const struct dmi_system_id *id;
> +
> +       id =3D dmi_first_match(bitland_mifs_dmi_table);
> +       if (id)
> +               data->ops =3D id->driver_data;
> +
> +       dev_dbg(&data->wdev->dev, "Detected machine ops: %s\n", data->ops=
->name);
> +}
> +
>  static int bitland_mifs_wmi_probe(struct wmi_device *wdev, const void *c=
ontext)
>  {
>         struct bitland_mifs_wmi_data *drv_data;
> @@ -761,6 +1039,9 @@ static int bitland_mifs_wmi_probe(struct wmi_device =
*wdev, const void *context)
>                 return -ENOMEM;
>
>         drv_data->wdev =3D wdev;
> +       drv_data->dev_type =3D dev_type;
> +       /* Default to RGB so the RGB attributes stay visible if detection=
 fails */
> +       drv_data->kbd_type =3D WMI_KBD_TYPE_RGB;
>         drv_data->ops =3D &bitland_ops;
>
>         ret =3D devm_mutex_init(&wdev->dev, &drv_data->lock);
> @@ -769,6 +1050,8 @@ static int bitland_mifs_wmi_probe(struct wmi_device =
*wdev, const void *context)
>
>         dev_set_drvdata(&wdev->dev, drv_data);
>
> +       bitland_detect_ops(drv_data);
> +
>         if (dev_type =3D=3D BITLAND_WMI_EVENT) {
>                 /* Register input device for hotkeys */
>                 drv_data->input_dev =3D devm_input_allocate_device(&wdev-=
>dev);
> @@ -794,12 +1077,28 @@ static int bitland_mifs_wmi_probe(struct wmi_devic=
e *wdev, const void *context)
>         if (IS_ERR(drv_data->pp_dev))
>                 return PTR_ERR(drv_data->pp_dev);
>
> +       /* Detect the keyboard type */
> +       ret =3D bitland_detect_kbd_type(drv_data);
> +       if (ret)
> +               dev_dbg(&wdev->dev, "Failed to detect keyboard type, assu=
ming RGB: %d\n", ret);
> +
> +       ret =3D devm_device_add_group(&wdev->dev, &laptop_group);
> +       if (ret)
> +               return ret;
> +
>         /* Register hwmon */
> -       drv_data->hwmon_dev =3D devm_hwmon_device_register_with_info(&wde=
v->dev,
> -                                                                  "bitla=
nd_mifs",
> -                                                                  drv_da=
ta,
> -                                                                  &lapto=
p_chip_info,
> -                                                                  NULL);
> +       if (drv_data->ops->has_cpu_power)
> +               drv_data->hwmon_dev =3D devm_hwmon_device_register_with_i=
nfo(&wdev->dev,
> +                                                                        =
  "bitland_mifs",
> +                                                                        =
  drv_data,
> +                                                                        =
  &laptop_chip_info_power,
> +                                                                        =
  NULL);
> +       else
> +               drv_data->hwmon_dev =3D devm_hwmon_device_register_with_i=
nfo(&wdev->dev,
> +                                                                        =
  "bitland_mifs",
> +                                                                        =
  drv_data,
> +                                                                        =
  &laptop_chip_info,
> +                                                                        =
  NULL);
>         if (IS_ERR(drv_data->hwmon_dev))
>                 return PTR_ERR(drv_data->hwmon_dev);
>
> @@ -851,6 +1150,7 @@ static void bitland_mifs_wmi_report_key(struct wmi_d=
evice *wdev, u32 payload)
>  static void bitland_mifs_wmi_notify(struct wmi_device *wdev,
>                                     const struct wmi_buffer *buffer)
>  {
> +       struct bitland_mifs_wmi_data *data =3D dev_get_drvdata(&wdev->dev=
);
>         const struct bitland_mifs_event *event =3D buffer->data;
>         struct bitland_fan_notify_data fan_data;
>         u32 payload;
> @@ -885,7 +1185,8 @@ static void bitland_mifs_wmi_notify(struct wmi_devic=
e *wdev,
>         case WMI_EVENT_CPU_FAN_SPEED:
>         case WMI_EVENT_GPU_FAN_SPEED:
>                 /* Redmi refresh rate toggle quirk */
> -               if (event->event_id =3D=3D WMI_EVENT_CPU_FAN_SPEED &&
> +               if (data->ops->quirk_refresh_rate_toggle &&
> +                   event->event_id =3D=3D WMI_EVENT_CPU_FAN_SPEED &&
>                     event->value_low =3D=3D 0 && event->value_high =3D=3D=
 0) {
>                         payload =3D BI_HOTKEY_CODE(WMI_EVENT_REFRESH_RATE=
, 0, 0);
>                         bitland_mifs_wmi_report_key(wdev, payload);
> @@ -923,7 +1224,6 @@ static struct wmi_driver bitland_mifs_wmi_driver =3D=
 {
>         .no_singleton =3D true,
>         .driver =3D {
>                 .name =3D DRV_NAME,
> -               .dev_groups =3D laptop_groups,
>                 .pm =3D pm_sleep_ptr(&bitland_mifs_wmi_pm_ops),
>         },
>         .id_table =3D bitland_mifs_wmi_id_table,
> --
> 2.55.0
>
