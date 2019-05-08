From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v3 08/11] platform/x86: asus-wmi: Enhance detection of
 thermal data
Date: Wed, 8 May 2019 16:58:47 +0300
Message-ID: <CAHp75VdE7MBjyLj=9bS6oc5jc8+BC_hftWUJgZGG02iDd=saiQ@mail.gmail.com>
References: <7acd57fe-604a-a96a-4ca2-a25bc88d6405@gmail.com> <7595c4f0-3dbb-2fe5-4daf-4b9a266f67d7@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <7595c4f0-3dbb-2fe5-4daf-4b9a266f67d7@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yurii Pavlovskyi <yurii.pavlovskyi@gmail.com>
Cc: Corentin Chary <corentin.chary@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Daniel Drake <drake@endlessm.com>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Apr 19, 2019 at 1:12 PM Yurii Pavlovskyi
<yurii.pavlovskyi@gmail.com> wrote:
>
> The obviously wrong value 1 for temperature device ID in this driver is
> returned by at least some devices, including TUF Gaming series laptops,
> instead of 0 as expected previously. Observable effect is that a
> temp1_input in hwmon reads temperature near absolute zero.
>
> * Consider 0.1 K an erroneous value in addition to 0 K.
> * Refactor detection of thermal input availability to a separate function.


> +static int asus_hwmon_check_thermal_available(struct asus_wmi *asus)
> +{
> +       u32 value = ASUS_WMI_UNSUPPORTED_METHOD;
> +       int err;
> +
> +       asus->asus_hwmon_thermal_available = false;

> +       err = asus_wmi_get_devstate(asus, ASUS_WMI_DEVID_THERMAL_CTRL, &value);

> +

The blank line probably should go before a call, but definitely not here.

> +       if (err < 0) {

This needs comment why -ENODEV considered as non-fatal.
> +               if (err == -ENODEV)
> +                       return 0;

> +
> +               return err;
> +       }

> +
> +       /*
> +        * If the temperature value in deci-Kelvin is near the absolute
> +        * zero temperature, something is clearly wrong.
> +        */
> +       if (!value || value == 1)
> +               return 0;
> +
> +       asus->asus_hwmon_thermal_available = true;
> +       return 0;
> +}

>         if (attr == &dev_attr_pwm1.attr)
>                 dev_id = ASUS_WMI_DEVID_FAN_CTRL;

> -       else if (attr == &dev_attr_temp1_input.attr)
> -               dev_id = ASUS_WMI_DEVID_THERMAL_CTRL;

I don't see how this change affects the user output or driver
behaviour. Why is it done?

> -               if (value == ASUS_WMI_UNSUPPORTED_METHOD || value & 0xFFF80000
> +               if (value == ASUS_WMI_UNSUPPORTED_METHOD || (value & 0xFFF80000)

Seems like a bug fix and thus should be a separate commit predecessing
the series.

> -       } else if (dev_id == ASUS_WMI_DEVID_THERMAL_CTRL) {

> +       } else if (attr == &dev_attr_temp1_input.attr) {

So, I don't see why you change this line.

> +               pr_warn("Could not check if thermal available: %d\n", status);

> +       pr_info("Thermal available: %d\n", asus->asus_hwmon_thermal_available);

dev_*() ?

-- 
With Best Regards,
Andy Shevchenko
