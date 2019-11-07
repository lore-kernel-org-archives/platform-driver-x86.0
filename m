From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2 2/3] platform/x86: asus_wmi: Support fan boost mode on FX505DY/FX705DY
Date: Thu, 7 Nov 2019 19:15:28 +0200
Message-ID: <CAHp75VfNu_G7zzaCV9JF+Ua9otSTftJgtgr9N4qhQNR0o+QHtA@mail.gmail.com>
References: <20191104213417.18036-1-leonmaxx@gmail.com> <20191104213828.18278-1-leonmaxx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191104213828.18278-1-leonmaxx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Leonid Maksymchuk <leonmaxx@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, Chris Chiu <chiu@endlessm.com>, Yurii Pavlovskyi <yurii.pavlovskyi@gmail.com>, Kristian Klausen <kristian@klausen.dk>, Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Corentin Chary <corentin.chary@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Nov 4, 2019 at 11:38 PM Leonid Maksymchuk <leonmaxx@gmail.com> wrote:
> On ASUS FX505DY/FX705DY laptops fan boost mode is same as in other
> TUF laptop models but have different ACPI device ID and different key
> code.

> +       if (err == 0 &&
> +                       (result & ASUS_WMI_DSTS_PRESENCE_BIT) &&
> +                       (result & ASUS_FAN_BOOST_MODES_MASK)) {
> +               asus->fan_boost_mode_available = 1;
> +               asus->fan_boost_mode_mask = result & ASUS_FAN_BOOST_MODES_MASK;
> +               return 0;
>         }
>
> -       if ((result & ASUS_WMI_DSTS_PRESENCE_BIT) &&
> +       err = asus_wmi_get_devstate(asus, ASUS_WMI_DEVID_FAN_BOOST_MODE_2,
> +                                   &result);
> +
> +       if (err == 0 &&
> +                       (result & ASUS_WMI_DSTS_PRESENCE_BIT) &&
>                         (result & ASUS_FAN_BOOST_MODES_MASK)) {
> -               asus->fan_boost_mode_available = true;
> +               asus->fan_boost_mode_available = 2;
>                 asus->fan_boost_mode_mask = result & ASUS_FAN_BOOST_MODES_MASK;
>         }

The above differs only in one value to give and one value to set, I
suppose you may introduce an additional helper to it

> +       if (err == -ENODEV)
> +               return 0;

This should be explained or even separated to another patch. It
changes behaviour of the original code, why?

> +       u32 dev_id = asus->fan_boost_mode_available == 1 ?
> +                       ASUS_WMI_DEVID_FAN_BOOST_MODE :
> +                       ASUS_WMI_DEVID_FAN_BOOST_MODE_2;

I would prefer to see
 if (...)
  call with mode
else
  call with mode_2

below.

> -       err = asus_wmi_set_devstate(ASUS_WMI_DEVID_FAN_BOOST_MODE, value,
> -                                   &retval);
> +       err = asus_wmi_set_devstate(dev_id, value, &retval);

-- 
With Best Regards,
Andy Shevchenko
