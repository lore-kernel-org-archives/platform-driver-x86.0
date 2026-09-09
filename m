Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 498304AB1B5;
	Wed,  9 Sep 2026 22:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788994152; cv=none; b=H9NLA43d0UwzYS78xrdxYsclApJq7hG9+6JCOfAAR6mZ1kUS1p72tVdHYgPoaPoVF4scID7XaS703fwcn6Eq1RV7XbaKr1OPYwwHwYjShzLG7stUqVG1whq+sYgq7Z3Rr0SJ+PUa6D+fYfEFagc0jn+ceZ7sC48/eq5oRuz7aGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788994152; c=relaxed/simple;
	bh=lXTNpyEVmFgLhMFD7GPusgnk+13fYZM58PpWbtqixOY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NAC/re60pJX0j+9gC2YG0ba0SSXsVteK2WxguE4EM7Tuk0moY2FVF43BnttY1zYxXEygQf4NVFyUPENrg3qyQou+j2oUvaq4sg4XM1PxIolLihbyx4tTvMVXfCb9jN2rcNvm22QnUDdVirMWsYqdPXaWGug8k1swE7BjfIuvG58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=PDyptafi; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="PDyptafi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1788994138; x=1789598938; i=w_armin@gmx.de;
	bh=rePcIOlY6MWWdfOZddYxX7DdqALKMZEqnQTFGR5gHek=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=PDyptafiKjTZ+wg/dOZX6FxMLEmq7YlTYIDEhudwm3JT6UgrQAakk1BxG4VB4det
	 TmPAxSIM46GiQ5dhRxSlGv4IvHplfdMM1gUWKngtA1+kbeETJIBghAuMMUs/h8ZnN
	 +4FulCjAQervQJGQTOokcTdZnpX9vva2GldG5XtjnjxvhzDxc8ESoht6dvSrJb4b3
	 8V9gdB/q/ahI8eZZI9IzBFbCnYH06siTJ/S3pxt4adTViQVn5sTQilS4NAVhNsARx
	 avfG/yMD77ukcyE664g2oRwyuSOF3kXy/MIQHjAOCA72v0QeQVxgIbdJKqCdbH47p
	 jwMYRtYJ3rP6g1SBhQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MBlxW-1wyunO2G44-00BKpO; Thu, 10
 Sep 2026 00:48:58 +0200
Message-ID: <6f14fa17-7206-41d2-b6e4-1711427ba91b@gmx.de>
Date: Thu, 10 Sep 2026 00:48:56 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/6] platform/x86: bitland-mifs-wmi: Add Redmi laptop
 support
To: =?UTF-8?Q?Milo=C5=A1_Vlku?= <vlku.milos.fun@gmail.com>,
 Mingyou Chen <qby140326@gmail.com>
Cc: foxido@foxido.dev, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
 linux-kernel@vger.kernel.org, nika@nikableh.moe,
 platform-driver-x86@vger.kernel.org, i@rsplwe.com, wolf109909@outlook.com,
 rahulbheda131313@gmail.com
References: <20260816100813.300450-1-qby140326@gmail.com>
 <20260816100813.300450-7-qby140326@gmail.com>
 <CAObHBTxSTzGSuN=8a+PQs7Khxv+_JMenf2a4j8me-L0ksDnXXQ@mail.gmail.com>
 <CAObHBTwjvBHX8o_W9S=B2VBzmMyfFrHdvjH7o1y99iwGEa7RhA@mail.gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <CAObHBTwjvBHX8o_W9S=B2VBzmMyfFrHdvjH7o1y99iwGEa7RhA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:YShdecF27naVdK9BY+G7E2zeyEl6X16lf+iQEUE6NFQOP4irUaL
 g3NBfCKPHbt6ItDs44YWwZFxeLeCetVWWGN/gSOsElS4Eo/duKuiit0okvP7G5+i4dyOCvY
 gpXZDoEQ1Ulz/9cIkE1xcaJgtUTipYkVvEsrNsBs+P5HVicL/vutGAgO0NVsRTX7XQ5Inxm
 PPE+/7WwHA8wBgRw8ojSw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:P5JsjJ3BPd4=;nFP/3RKAcF4BTaIiPv0P6m24Wea
 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

Am 06.09.26 um 20:16 schrieb Milo=C5=A1 Vlku:

> Hi,
>
> Following up on this - my Aug 18 report still applies: my board
> (XIAOMI / TM2307 / "Redmi Book Pro 14 2024") doesn't match either
> DMI_SYS_VENDOR "Redmi" or "TIMI", so it falls through to the generic
> bitland_ops table instead of redmi_book_ops, which means
> bitland_pp_check_capability() (barrel-jack/DC required) runs instead
> of redmi_pp_check_capability() (any AC source), and performance mode
> stays blocked on my USB-C-only machine.
>
> Proposed fix is still just adding a DMI_BOARD_NAME "TM2307" match (or
> possibly broadening to DMI_SYS_VENDOR "XIAOMI" if that covers the
> wider lineup) to bitland_mifs_dmi_table.
>
> Armin - since you mentioned your buffer-format series (Sep 5) should
> be the new base for outstanding patches, should this DMI fix be
> rebased on top of that, or is it independent enough to land
> separately?
>
> Thanks,
> Milos

I think that rebasing is the safest choice here.

Thanks,
Armin Wolf

>
> On Tue, Aug 18, 2026 at 1:17=E2=80=AFAM Milo=C5=A1 Vlku <vlku.milos.fun@=
gmail.com> wrote:
>>> +    {
>>> +        /* Redmi Book series */
>>> +        .matches =3D {
>>> +            DMI_MATCH(DMI_SYS_VENDOR, "Redmi"),
>>> +        },
>>> +        .driver_data =3D (void *)&redmi_book_ops,
>>> +    },
>>> +    {
>>> +        /* Xiaomi Book series */
>>> +        .matches =3D {
>>> +            DMI_MATCH(DMI_SYS_VENDOR, "TIMI"),
>>> +        },
>>> +        .driver_data =3D (void *)&redmi_book_ops,
>>> +    },
>> Neither entry matches my machine. I have a Redmi Book Pro 14 2024, and
>> it reports:
>>
>>    DMI_SYS_VENDOR   XIAOMI
>>    DMI_BOARD_NAME   TM2307
>>    DMI_PRODUCT_NAME Redmi Book Pro 14 2024
>>
>> Since DMI_MATCH() is a substring test, neither "Redmi" nor "TIMI"
>> matches "XIAOMI", so dmi_first_match() returns NULL and data->ops stays
>> at &bitland_ops. The series has no effect on this model.
>>
>> A board-name match would cover it:
>>
>>      {
>>          /* Redmi Book Pro 14 2024 */
>>          .matches =3D {
>>              DMI_MATCH(DMI_BOARD_NAME, "TM2307"),
>>          },
>>          .driver_data =3D (void *)&redmi_book_ops,
>>      },
>>
>> I don't know how widely the "XIAOMI" vendor string is used across the
>> range, so matching DMI_SYS_VENDOR "XIAOMI" may cover more machines at
>> once if that encoding applies to all of them.
>>
>> Thanks,
>> Milos
>>
>> On Sun, Aug 16, 2026 at 12:08=E2=80=AFPM Mingyou Chen <qby140326@gmail.=
com> wrote:
>>> Redmi laptops (Redmi Book and Redmi G series) use the same MIFS WMI
>>> interface but encode the performance mode values of
>>> WMI_FN_SYSTEM_PER_MODE differently, as reverse engineered from the
>>> Windows GCommandCenter application:
>>>
>>>    0 =3D performance, 1 =3D balanced, 2 =3D quiet, 4 =3D full speed
>>>
>>> Add "Redmi Book" and "Redmi G" ops entries selected via DMI:
>>> - Redmi G (board TM2135/TM2137): the full-speed mode is available
>>> - Redmi Book/Xiaomi Book: no full-speed mode
>>> - The performance modes only require AC power (any source); the
>>>    barrel-jack requirement is Bitland-specific
>>>
>>> The GCommandCenter application further showed that:
>>> - the CPU power sensor (WMI_FN_CPU_POWER) is only available on Redmi
>>>    machines, gate the hwmon power channel on the ops table
>>> - the refresh-rate-toggle quirk in the CPU fan speed event is
>>>    Redmi-specific, gate it on the ops table instead of applying it
>>>    unconditionally
>>>
>>> Also add Redmi support for Fn lock and touchpad lock control
>>> (WMI_FN_FN_LOCK / WMI_FN_TP_LOCK sysfs attributes), keyboard type
>>> detection (hide the RGB kb_mode attribute on white-only backlit
>>> keyboards) and hotkeys (airplane mode -> KEY_RFKILL, ignore the
>>> lock-state and keyboard mode indicator events).
>>>
>>> The sysfs attribute group is now registered in probe (instead of via
>>> dev_groups) so that the is_visible callback can access the probe
>>> populated driver data.
>>>
>>> Signed-off-by: Mingyou Chen <qby140326@gmail.com>
>>> ---
>>>   drivers/platform/x86/bitland-mifs-wmi.c | 336 ++++++++++++++++++++++=
=2D-
>>>   1 file changed, 318 insertions(+), 18 deletions(-)
>>>
>>> diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platfor=
m/x86/bitland-mifs-wmi.c
>>> index 17792d8b7c29..1eb9f92740e0 100644
>>> --- a/drivers/platform/x86/bitland-mifs-wmi.c
>>> +++ b/drivers/platform/x86/bitland-mifs-wmi.c
>>> @@ -14,6 +14,7 @@
>>>   #include <linux/dev_printk.h>
>>>   #include <linux/device.h>
>>>   #include <linux/device/devres.h>
>>> +#include <linux/dmi.h>
>>>   #include <linux/err.h>
>>>   #include <linux/hwmon.h>
>>>   #include <linux/init.h>
>>> @@ -71,6 +72,11 @@ enum bitland_system_ac_mode {
>>>          WMI_SYSTEM_AC_CIRCULARHOLE      =3D 2,
>>>   };
>>>
>>> +enum bitland_kbd_type {
>>> +       WMI_KBD_TYPE_WHITE              =3D 0,
>>> +       WMI_KBD_TYPE_RGB                =3D 1,
>>> +};
>>> +
>>>   enum bitland_mifs_power_profile {
>>>          WMI_PP_BALANCED         =3D 0,
>>>          WMI_PP_PERFORMANCE      =3D 1,
>>> @@ -97,7 +103,15 @@ static const struct bitland_profile_mode_map bitla=
nd_mode_map =3D {
>>>          .full_speed     =3D WMI_PP_FULL_SPEED,
>>>   };
>>>
>>> +static const struct bitland_profile_mode_map redmi_mode_map =3D {
>>> +       .balanced       =3D 1,
>>> +       .performance    =3D 0,
>>> +       .quiet          =3D 2,
>>> +       .full_speed     =3D 4,
>>> +};
>>> +
>>>   static int bitland_pp_check_capability(struct bitland_mifs_wmi_data =
*data);
>>> +static int redmi_pp_check_capability(struct bitland_mifs_wmi_data *da=
ta);
>>>
>>>   /*
>>>    * Machine-specific operations. The MIFS WMI interface is shared by
>>> @@ -109,6 +123,8 @@ struct bitland_mifs_ops {
>>>          const struct bitland_profile_mode_map *mode_map;
>>>          int (*check_performance_capability)(struct bitland_mifs_wmi_d=
ata *data);
>>>          bool has_full_speed;
>>> +       bool has_cpu_power;
>>> +       bool quirk_refresh_rate_toggle;
>>>   };
>>>
>>>   static const struct bitland_mifs_ops bitland_ops =3D {
>>> @@ -118,6 +134,54 @@ static const struct bitland_mifs_ops bitland_ops =
=3D {
>>>          .has_full_speed =3D true,
>>>   };
>>>
>>> +static const struct bitland_mifs_ops redmi_book_ops =3D {
>>> +       .name =3D "Redmi Book",
>>> +       .mode_map =3D &redmi_mode_map,
>>> +       .check_performance_capability =3D redmi_pp_check_capability,
>>> +       .has_cpu_power =3D true,
>>> +       .quirk_refresh_rate_toggle =3D true,
>>> +};
>>> +
>>> +static const struct bitland_mifs_ops redmi_g_ops =3D {
>>> +       .name =3D "Redmi G",
>>> +       .mode_map =3D &redmi_mode_map,
>>> +       .check_performance_capability =3D redmi_pp_check_capability,
>>> +       .has_full_speed =3D true,
>>> +       .has_cpu_power =3D true,
>>> +       .quirk_refresh_rate_toggle =3D true,
>>> +};
>>> +
>>> +static const struct dmi_system_id bitland_mifs_dmi_table[] =3D {
>>> +       {
>>> +               /* Redmi G */
>>> +               .matches =3D {
>>> +                       DMI_MATCH(DMI_BOARD_NAME, "TM2135"),
>>> +               },
>>> +               .driver_data =3D (void *)&redmi_g_ops,
>>> +       },
>>> +       {
>>> +               .matches =3D {
>>> +                       DMI_MATCH(DMI_BOARD_NAME, "TM2137"),
>>> +               },
>>> +               .driver_data =3D (void *)&redmi_g_ops,
>>> +       },
>>> +       {
>>> +               /* Redmi Book series */
>>> +               .matches =3D {
>>> +                       DMI_MATCH(DMI_SYS_VENDOR, "Redmi"),
>>> +               },
>>> +               .driver_data =3D (void *)&redmi_book_ops,
>>> +       },
>>> +       {
>>> +               /* Xiaomi Book series */
>>> +               .matches =3D {
>>> +                       DMI_MATCH(DMI_SYS_VENDOR, "TIMI"),
>>> +               },
>>> +               .driver_data =3D (void *)&redmi_book_ops,
>>> +       },
>>> +       {}
>>> +};
>>> +
>>>   enum bitland_mifs_event_id {
>>>          WMI_EVENT_RESERVED_1            =3D 1,
>>>          WMI_EVENT_RESERVED_2            =3D 2,
>>> @@ -203,6 +267,8 @@ struct bitland_mifs_wmi_data {
>>>          struct input_dev *input_dev;
>>>          struct device *hwmon_dev;
>>>          struct device *pp_dev;
>>> +       enum bitland_wmi_device_type dev_type;
>>> +       u8 kbd_type;
>>>          const struct bitland_mifs_ops *ops;
>>>          enum platform_profile_option saved_profile;
>>>   };
>>> @@ -255,8 +321,10 @@ static int laptop_profile_get(struct device *dev,
>>>          else if (mode =3D=3D map->balanced)
>>>                  *profile =3D PLATFORM_PROFILE_BALANCED;
>>>          else if (mode =3D=3D map->performance)
>>> -               *profile =3D PLATFORM_PROFILE_BALANCED_PERFORMANCE;
>>> -       else if (mode =3D=3D map->full_speed)
>>> +               *profile =3D data->ops->has_full_speed ?
>>> +                          PLATFORM_PROFILE_BALANCED_PERFORMANCE :
>>> +                          PLATFORM_PROFILE_PERFORMANCE;
>>> +       else if (data->ops->has_full_speed && mode =3D=3D map->full_sp=
eed)
>>>                  *profile =3D PLATFORM_PROFILE_PERFORMANCE;
>>>          else
>>>                  return -EINVAL;
>>> @@ -273,10 +341,11 @@ static int bitland_pp_check_capability(struct bi=
tland_mifs_wmi_data *data)
>>>          struct bitland_mifs_output output;
>>>          int ret;
>>>
>>> -       /* Full-speed/performance mode requires DC power (not USB-C) *=
/
>>> +       /* The performance modes require AC power */
>>>          if (!power_supply_is_system_supplied())
>>>                  return -EOPNOTSUPP;
>>>
>>> +       /* Additionally require the barrel-jack power supply (not USB-=
C) */
>>>          ret =3D bitland_mifs_wmi_call(data, &input, &output);
>>>          if (ret)
>>>                  return ret;
>>> @@ -287,6 +356,15 @@ static int bitland_pp_check_capability(struct bit=
land_mifs_wmi_data *data)
>>>          return 0;
>>>   }
>>>
>>> +static int redmi_pp_check_capability(struct bitland_mifs_wmi_data *da=
ta)
>>> +{
>>> +       /* The performance modes require AC power (any source) */
>>> +       if (!power_supply_is_system_supplied())
>>> +               return -EOPNOTSUPP;
>>> +
>>> +       return 0;
>>> +}
>>> +
>>>   static int laptop_profile_set(struct device *dev,
>>>                                enum platform_profile_option profile)
>>>   {
>>> @@ -309,6 +387,8 @@ static int laptop_profile_set(struct device *dev,
>>>                  mode =3D map->balanced;
>>>                  break;
>>>          case PLATFORM_PROFILE_BALANCED_PERFORMANCE:
>>> +               if (!data->ops->has_full_speed)
>>> +                       return -EOPNOTSUPP;
>>>                  ret =3D data->ops->check_performance_capability(data)=
;
>>>                  if (ret)
>>>                          return ret;
>>> @@ -318,7 +398,7 @@ static int laptop_profile_set(struct device *dev,
>>>                  ret =3D data->ops->check_performance_capability(data)=
;
>>>                  if (ret)
>>>                          return ret;
>>> -               mode =3D map->full_speed;
>>> +               mode =3D data->ops->has_full_speed ? map->full_speed :=
 map->performance;
>>>                  break;
>>>          default:
>>>                  return -EOPNOTSUPP;
>>> @@ -335,10 +415,10 @@ static int platform_profile_probe(void *drvdata,=
 unsigned long *choices)
>>>
>>>          set_bit(PLATFORM_PROFILE_LOW_POWER, choices);
>>>          set_bit(PLATFORM_PROFILE_BALANCED, choices);
>>> -       set_bit(PLATFORM_PROFILE_BALANCED_PERFORMANCE, choices);
>>> +       set_bit(PLATFORM_PROFILE_PERFORMANCE, choices);
>>>
>>>          if (data->ops->has_full_speed)
>>> -               set_bit(PLATFORM_PROFILE_PERFORMANCE, choices);
>>> +               set_bit(PLATFORM_PROFILE_BALANCED_PERFORMANCE, choices=
);
>>>
>>>          return 0;
>>>   }
>>> @@ -418,6 +498,13 @@ static int laptop_hwmon_read(struct device *dev, =
enum hwmon_sensor_types type,
>>>                  default:
>>>                          return -EINVAL;
>>>                  }
>>> +       case hwmon_power:
>>> +               /* WMI_FN_CPU_POWER returns the CPU power draw in watt=
s */
>>> +               input.function =3D WMI_FN_CPU_POWER;
>>> +               ret =3D bitland_mifs_wmi_call(data, &input, &res);
>>> +               if (!ret)
>>> +                       *val =3D res.data[0] * MICROWATT_PER_WATT;
>>> +               return ret;
>>>          default:
>>>                  return -EINVAL;
>>>          }
>>> @@ -444,6 +531,15 @@ static const struct hwmon_channel_info *laptop_hw=
mon_info[] =3D {
>>>          NULL
>>>   };
>>>
>>> +static const struct hwmon_channel_info *laptop_hwmon_info_power[] =3D=
 {
>>> +       HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT),
>>> +       HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT | HWMON_F_LABEL,
>>> +                          HWMON_F_INPUT | HWMON_F_LABEL,
>>> +                          HWMON_F_INPUT | HWMON_F_LABEL),
>>> +       HWMON_CHANNEL_INFO(power, HWMON_P_INPUT),
>>> +       NULL
>>> +};
>>> +
>>>   static const struct hwmon_ops laptop_hwmon_ops =3D {
>>>          .visible =3D 0444,
>>>          .read =3D laptop_hwmon_read,
>>> @@ -455,6 +551,11 @@ static const struct hwmon_chip_info laptop_chip_i=
nfo =3D {
>>>          .info =3D laptop_hwmon_info,
>>>   };
>>>
>>> +static const struct hwmon_chip_info laptop_chip_info_power =3D {
>>> +       .ops =3D &laptop_hwmon_ops,
>>> +       .info =3D laptop_hwmon_info_power,
>>> +};
>>> +
>>>   static int laptop_kbd_led_set(struct led_classdev *led_cdev,
>>>                                enum led_brightness value)
>>>   {
>>> @@ -498,6 +599,96 @@ static const char *const gpu_mode_strings[] =3D {
>>>          "uma",
>>>   };
>>>
>>> +static ssize_t fn_lock_show(struct device *dev, struct device_attribu=
te *attr,
>>> +                           char *buf)
>>> +{
>>> +       struct bitland_mifs_wmi_data *data =3D dev_get_drvdata(dev);
>>> +       struct bitland_mifs_input input =3D {
>>> +               .reserved1 =3D 0,
>>> +               .operation =3D WMI_METHOD_GET,
>>> +               .reserved2 =3D 0,
>>> +               .function =3D WMI_FN_FN_LOCK,
>>> +       };
>>> +       struct bitland_mifs_output res;
>>> +       int ret;
>>> +
>>> +       ret =3D bitland_mifs_wmi_call(data, &input, &res);
>>> +       if (ret)
>>> +               return ret;
>>> +
>>> +       return sysfs_emit(buf, "%u\n", res.data[0]);
>>> +}
>>> +
>>> +static ssize_t fn_lock_store(struct device *dev, struct device_attrib=
ute *attr,
>>> +                            const char *buf, size_t count)
>>> +{
>>> +       struct bitland_mifs_wmi_data *data =3D dev_get_drvdata(dev);
>>> +       struct bitland_mifs_input input =3D {
>>> +               .reserved1 =3D 0,
>>> +               .operation =3D WMI_METHOD_SET,
>>> +               .reserved2 =3D 0,
>>> +               .function =3D WMI_FN_FN_LOCK,
>>> +       };
>>> +       bool val;
>>> +       int ret;
>>> +
>>> +       if (kstrtobool(buf, &val))
>>> +               return -EINVAL;
>>> +
>>> +       input.payload[0] =3D val;
>>> +
>>> +       ret =3D bitland_mifs_wmi_call(data, &input, NULL);
>>> +       if (ret)
>>> +               return ret;
>>> +
>>> +       return count;
>>> +}
>>> +
>>> +static ssize_t touchpad_lock_show(struct device *dev, struct device_a=
ttribute *attr,
>>> +                                 char *buf)
>>> +{
>>> +       struct bitland_mifs_wmi_data *data =3D dev_get_drvdata(dev);
>>> +       struct bitland_mifs_input input =3D {
>>> +               .reserved1 =3D 0,
>>> +               .operation =3D WMI_METHOD_GET,
>>> +               .reserved2 =3D 0,
>>> +               .function =3D WMI_FN_TP_LOCK,
>>> +       };
>>> +       struct bitland_mifs_output res;
>>> +       int ret;
>>> +
>>> +       ret =3D bitland_mifs_wmi_call(data, &input, &res);
>>> +       if (ret)
>>> +               return ret;
>>> +
>>> +       return sysfs_emit(buf, "%u\n", res.data[0]);
>>> +}
>>> +
>>> +static ssize_t touchpad_lock_store(struct device *dev, struct device_=
attribute *attr,
>>> +                                  const char *buf, size_t count)
>>> +{
>>> +       struct bitland_mifs_wmi_data *data =3D dev_get_drvdata(dev);
>>> +       struct bitland_mifs_input input =3D {
>>> +               .reserved1 =3D 0,
>>> +               .operation =3D WMI_METHOD_SET,
>>> +               .reserved2 =3D 0,
>>> +               .function =3D WMI_FN_TP_LOCK,
>>> +       };
>>> +       bool val;
>>> +       int ret;
>>> +
>>> +       if (kstrtobool(buf, &val))
>>> +               return -EINVAL;
>>> +
>>> +       input.payload[0] =3D val;
>>> +
>>> +       ret =3D bitland_mifs_wmi_call(data, &input, NULL);
>>> +       if (ret)
>>> +               return ret;
>>> +
>>> +       return count;
>>> +}
>>> +
>>>   /* GPU Mode: 0:Hybrid, 1:Discrete, 2:UMA */
>>>   static ssize_t gpu_mode_show(struct device *dev, struct device_attri=
bute *attr,
>>>                               char *buf)
>>> @@ -637,17 +828,46 @@ static ssize_t fan_boost_store(struct device *de=
v,
>>>          return count;
>>>   }
>>>
>>> -static const DEVICE_ATTR_RW(gpu_mode);
>>> -static const DEVICE_ATTR_RW(kb_mode);
>>> -static const DEVICE_ATTR_WO(fan_boost);
>>> +static DEVICE_ATTR_RW(gpu_mode);
>>> +static DEVICE_ATTR_RW(kb_mode);
>>> +static DEVICE_ATTR_WO(fan_boost);
>>> +static DEVICE_ATTR_RW(fn_lock);
>>> +static DEVICE_ATTR_RW(touchpad_lock);
>>>
>>> -static const struct attribute *const laptop_attrs[] =3D {
>>> +static struct attribute *laptop_attrs[] =3D {
>>>          &dev_attr_gpu_mode.attr,
>>>          &dev_attr_kb_mode.attr,
>>>          &dev_attr_fan_boost.attr,
>>> +       &dev_attr_fn_lock.attr,
>>> +       &dev_attr_touchpad_lock.attr,
>>>          NULL,
>>>   };
>>> -ATTRIBUTE_GROUPS(laptop);
>>> +
>>> +static umode_t laptop_attr_is_visible(struct kobject *kobj,
>>> +                                     struct attribute *attr, int idx)
>>> +{
>>> +       struct device *dev =3D kobj_to_dev(kobj);
>>> +       struct bitland_mifs_wmi_data *data =3D dev_get_drvdata(dev);
>>> +
>>> +       /* The sysfs attributes are only supported on the control devi=
ce */
>>> +       if (data->dev_type !=3D BITLAND_WMI_CONTROL)
>>> +               return 0;
>>> +
>>> +       /*
>>> +        * White-only backlit keyboards (e.g. Redmi Book series) do no=
t
>>> +        * support the RGB backlight modes.
>>> +        */
>>> +       if (attr =3D=3D &dev_attr_kb_mode.attr &&
>>> +           data->kbd_type =3D=3D WMI_KBD_TYPE_WHITE)
>>> +               return 0;
>>> +
>>> +       return attr->mode;
>>> +}
>>> +
>>> +static const struct attribute_group laptop_group =3D {
>>> +       .attrs =3D laptop_attrs,
>>> +       .is_visible =3D laptop_attr_is_visible,
>>> +};
>>>
>>>   static const struct key_entry bitland_mifs_wmi_keymap[] =3D {
>>>          { KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_OPEN_APP, 1, 0), { KEY_PRO=
G1 } },
>>> @@ -699,6 +919,34 @@ static const struct key_entry bitland_mifs_wmi_ke=
ymap[] =3D {
>>>          { KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_FNLOCK_STATE, 0, 0), {}=
 },
>>>          { KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_FNLOCK_STATE, 1, 0), {}=
 },
>>>
>>> +       /* Airplane mode toggle (Redmi) */
>>> +       { KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_AIRPLANE_MODE, 0, 0), { KEY=
_RFKILL } },
>>> +       { KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_AIRPLANE_MODE, 1, 0), { KEY=
_RFKILL } },
>>> +
>>> +       /*
>>> +        * Touchpad state change (Redmi Fn+F7). The EC performs the ac=
tual
>>> +        * toggle itself; userspace can control the state via the
>>> +        * touchpad_lock sysfs attribute.
>>> +        */
>>> +       { KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_TOUCHPAD_STATE, 0, 0), {=
} },
>>> +       { KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_TOUCHPAD_STATE, 1, 0), {=
} },
>>> +
>>> +       /* Keyboard backlight mode change */
>>> +       { KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_KBD_MODE, 0, 0), {} },
>>> +       { KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_KBD_MODE, 1, 0), {} },
>>> +
>>> +       /* Lock-state indicator events */
>>> +       { KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_CAPSLOCK_STATE, 0, 0), {=
} },
>>> +       { KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_CAPSLOCK_STATE, 1, 0), {=
} },
>>> +       { KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_NUMLOCK_STATE, 0, 0), {}=
 },
>>> +       { KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_NUMLOCK_STATE, 1, 0), {}=
 },
>>> +       { KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_SCROLLLOCK_STATE, 0, 0),=
 {} },
>>> +       { KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_SCROLLLOCK_STATE, 1, 0),=
 {} },
>>> +
>>> +       /* Win key lock (Redmi gaming mode) */
>>> +       { KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_WIN_KEY_LOCK, 0, 0), {} =
},
>>> +       { KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_WIN_KEY_LOCK, 1, 0), {} =
},
>>> +
>>>          /* Fn+`/1/2/3/4 */
>>>          { KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_FN_F, 1, 0), { KEY_F13 } }=
,
>>>          { KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_FN_0, 1, 0), { KEY_F14 } }=
,
>>> @@ -744,6 +992,36 @@ static int bitland_notifier_callback(struct notif=
ier_block *nb,
>>>          return NOTIFY_OK;
>>>   }
>>>
>>> +static int bitland_detect_kbd_type(struct bitland_mifs_wmi_data *data=
)
>>> +{
>>> +       struct bitland_mifs_input input =3D {
>>> +               .reserved1 =3D 0,
>>> +               .operation =3D WMI_METHOD_GET,
>>> +               .reserved2 =3D 0,
>>> +               .function =3D WMI_FN_KBD_TYPE,
>>> +       };
>>> +       struct bitland_mifs_output res;
>>> +       int ret;
>>> +
>>> +       ret =3D bitland_mifs_wmi_call(data, &input, &res);
>>> +       if (ret)
>>> +               return ret;
>>> +
>>> +       data->kbd_type =3D res.data[0];
>>> +       return 0;
>>> +}
>>> +
>>> +static void bitland_detect_ops(struct bitland_mifs_wmi_data *data)
>>> +{
>>> +       const struct dmi_system_id *id;
>>> +
>>> +       id =3D dmi_first_match(bitland_mifs_dmi_table);
>>> +       if (id)
>>> +               data->ops =3D id->driver_data;
>>> +
>>> +       dev_dbg(&data->wdev->dev, "Detected machine ops: %s\n", data->=
ops->name);
>>> +}
>>> +
>>>   static int bitland_mifs_wmi_probe(struct wmi_device *wdev, const voi=
d *context)
>>>   {
>>>          struct bitland_mifs_wmi_data *drv_data;
>>> @@ -761,6 +1039,9 @@ static int bitland_mifs_wmi_probe(struct wmi_devi=
ce *wdev, const void *context)
>>>                  return -ENOMEM;
>>>
>>>          drv_data->wdev =3D wdev;
>>> +       drv_data->dev_type =3D dev_type;
>>> +       /* Default to RGB so the RGB attributes stay visible if detect=
ion fails */
>>> +       drv_data->kbd_type =3D WMI_KBD_TYPE_RGB;
>>>          drv_data->ops =3D &bitland_ops;
>>>
>>>          ret =3D devm_mutex_init(&wdev->dev, &drv_data->lock);
>>> @@ -769,6 +1050,8 @@ static int bitland_mifs_wmi_probe(struct wmi_devi=
ce *wdev, const void *context)
>>>
>>>          dev_set_drvdata(&wdev->dev, drv_data);
>>>
>>> +       bitland_detect_ops(drv_data);
>>> +
>>>          if (dev_type =3D=3D BITLAND_WMI_EVENT) {
>>>                  /* Register input device for hotkeys */
>>>                  drv_data->input_dev =3D devm_input_allocate_device(&w=
dev->dev);
>>> @@ -794,12 +1077,28 @@ static int bitland_mifs_wmi_probe(struct wmi_de=
vice *wdev, const void *context)
>>>          if (IS_ERR(drv_data->pp_dev))
>>>                  return PTR_ERR(drv_data->pp_dev);
>>>
>>> +       /* Detect the keyboard type */
>>> +       ret =3D bitland_detect_kbd_type(drv_data);
>>> +       if (ret)
>>> +               dev_dbg(&wdev->dev, "Failed to detect keyboard type, a=
ssuming RGB: %d\n", ret);
>>> +
>>> +       ret =3D devm_device_add_group(&wdev->dev, &laptop_group);
>>> +       if (ret)
>>> +               return ret;
>>> +
>>>          /* Register hwmon */
>>> -       drv_data->hwmon_dev =3D devm_hwmon_device_register_with_info(&=
wdev->dev,
>>> -                                                                  "bi=
tland_mifs",
>>> -                                                                  drv=
_data,
>>> -                                                                  &la=
ptop_chip_info,
>>> -                                                                  NUL=
L);
>>> +       if (drv_data->ops->has_cpu_power)
>>> +               drv_data->hwmon_dev =3D devm_hwmon_device_register_wit=
h_info(&wdev->dev,
>>> +                                                                     =
     "bitland_mifs",
>>> +                                                                     =
     drv_data,
>>> +                                                                     =
     &laptop_chip_info_power,
>>> +                                                                     =
     NULL);
>>> +       else
>>> +               drv_data->hwmon_dev =3D devm_hwmon_device_register_wit=
h_info(&wdev->dev,
>>> +                                                                     =
     "bitland_mifs",
>>> +                                                                     =
     drv_data,
>>> +                                                                     =
     &laptop_chip_info,
>>> +                                                                     =
     NULL);
>>>          if (IS_ERR(drv_data->hwmon_dev))
>>>                  return PTR_ERR(drv_data->hwmon_dev);
>>>
>>> @@ -851,6 +1150,7 @@ static void bitland_mifs_wmi_report_key(struct wm=
i_device *wdev, u32 payload)
>>>   static void bitland_mifs_wmi_notify(struct wmi_device *wdev,
>>>                                      const struct wmi_buffer *buffer)
>>>   {
>>> +       struct bitland_mifs_wmi_data *data =3D dev_get_drvdata(&wdev->=
dev);
>>>          const struct bitland_mifs_event *event =3D buffer->data;
>>>          struct bitland_fan_notify_data fan_data;
>>>          u32 payload;
>>> @@ -885,7 +1185,8 @@ static void bitland_mifs_wmi_notify(struct wmi_de=
vice *wdev,
>>>          case WMI_EVENT_CPU_FAN_SPEED:
>>>          case WMI_EVENT_GPU_FAN_SPEED:
>>>                  /* Redmi refresh rate toggle quirk */
>>> -               if (event->event_id =3D=3D WMI_EVENT_CPU_FAN_SPEED &&
>>> +               if (data->ops->quirk_refresh_rate_toggle &&
>>> +                   event->event_id =3D=3D WMI_EVENT_CPU_FAN_SPEED &&
>>>                      event->value_low =3D=3D 0 && event->value_high =
=3D=3D 0) {
>>>                          payload =3D BI_HOTKEY_CODE(WMI_EVENT_REFRESH_=
RATE, 0, 0);
>>>                          bitland_mifs_wmi_report_key(wdev, payload);
>>> @@ -923,7 +1224,6 @@ static struct wmi_driver bitland_mifs_wmi_driver =
=3D {
>>>          .no_singleton =3D true,
>>>          .driver =3D {
>>>                  .name =3D DRV_NAME,
>>> -               .dev_groups =3D laptop_groups,
>>>                  .pm =3D pm_sleep_ptr(&bitland_mifs_wmi_pm_ops),
>>>          },
>>>          .id_table =3D bitland_mifs_wmi_id_table,
>>> --
>>> 2.55.0
>>>
