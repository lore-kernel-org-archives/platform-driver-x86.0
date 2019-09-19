From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v4 1/1] platform/x86/intel_cht_int33fe: Split code to USB
 Micro-B and Type-C variants
Date: Thu, 19 Sep 2019 09:27:14 +0300
Message-ID: <CAHp75Ve1mifO9iJJUo=zdFYi3X20ye=w1p0Z+-GmjQEpnmiS4Q@mail.gmail.com>
References: <20190918225337.9860-1-jekhor@gmail.com> <20190918225337.9860-2-jekhor@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190918225337.9860-2-jekhor@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yauhen Kharuzhy <jekhor@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andy Shevchenko <andy@infradead.org>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Sep 19, 2019 at 1:53 AM Yauhen Kharuzhy <jekhor@gmail.com> wrote:
>

You so fast with new versions that I had no chance to comment on.
Finally here mine.

> Existing intel_cht_int33fe ACPI pseudo-device driver assumes that
> hardware has Type-C connector and register related devices described as
> I2C connections in the _CRS resource.
>
> There is at least one hardware (Lenovo Yoga Book YB1-91L/F) with Micro-B
> USB connector exists. It has INT33FE device in the DSDT table but
> there are only two I2C connection described: PMIC and BQ27452 battery
> fuel gauge.
>
> Splitting existing INT33FE driver allow to maintain code for USB Micro-B
> (AB) connector variant separately and make it simpler.

I didn't get what (AB) means in this context?
Did you mean "(or AB)"?

> Split driver to intel_cht_int33fe_common.c and
> intel_cht_int33fe_{typeb,typec}.c. Compile all this sources to one .ko
> module to make user experience easier.

You forgot to replace typeb here.

> -       ---help---
> +       help

This is unneeded churn



> +         CONFIG_BATTERY_BQ27XXX=m and CONFIG_BATTERY_BQ27XXX_I2C=m for Micro-B
> +         device and CONFIG_TYPEC_FUSB302=m and CONFIG_BATTERY_MAX17042=m

First s/and/or/.

> +         for Type-C device.

> + * 1. The Whiskey Cove pmic, which is also described by the INT34D3 ACPI device

pmic -> PMIC

> +       if (IS_ERR(data->battery_fg)) {
> +               int err = PTR_ERR(data->battery_fg);
> +
> +               if (err != -EPROBE_DEFER)
> +                       dev_err(dev,
> +                               "Failed to register battery fuel gauge: %d\n",
> +                               err);
> +               return err;
> +       }
> +
> +       return 0;

I would rather replace this altogether by return PTR_ERR_OR_ZERO()
like it's done in the other function in the original driver.

-- 
With Best Regards,
Andy Shevchenko
