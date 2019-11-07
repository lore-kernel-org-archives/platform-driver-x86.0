From: Leonid Maksymchuk <leonmaxx@gmail.com>
Subject: Re: [PATCH v2 2/3] platform/x86: asus_wmi: Support fan boost mode on FX505DY/FX705DY
Date: Thu, 7 Nov 2019 20:31:04 +0200
Message-ID: <CAPW-Pu17tMrUA7oSf8V7S1y2+3JYO2buq3yY+FO8dZUu6uqMxA@mail.gmail.com>
References: <20191104213417.18036-1-leonmaxx@gmail.com> <20191104213828.18278-1-leonmaxx@gmail.com>
 <CAHp75VfNu_G7zzaCV9JF+Ua9otSTftJgtgr9N4qhQNR0o+QHtA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75VfNu_G7zzaCV9JF+Ua9otSTftJgtgr9N4qhQNR0o+QHtA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, Chris Chiu <chiu@endlessm.com>, Yurii Pavlovskyi <yurii.pavlovskyi@gmail.com>, Kristian Klausen <kristian@klausen.dk>, Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Corentin Chary <corentin.chary@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

Thanks for review, I will do suggested changes.

> > +       if (err == 0 &&
> > +                       (result & ASUS_WMI_DSTS_PRESENCE_BIT) &&
> > +                       (result & ASUS_FAN_BOOST_MODES_MASK)) {
> > +               asus->fan_boost_mode_available = 1;
> > +               asus->fan_boost_mode_mask = result & ASUS_FAN_BOOST_MODES_MASK;
> > +               return 0;
> >         }
> >
> > -       if ((result & ASUS_WMI_DSTS_PRESENCE_BIT) &&
> > +       err = asus_wmi_get_devstate(asus, ASUS_WMI_DEVID_FAN_BOOST_MODE_2,
> > +                                   &result);
> > +
> > +       if (err == 0 &&
> > +                       (result & ASUS_WMI_DSTS_PRESENCE_BIT) &&
> >                         (result & ASUS_FAN_BOOST_MODES_MASK)) {
> > -               asus->fan_boost_mode_available = true;
> > +               asus->fan_boost_mode_available = 2;
> >                 asus->fan_boost_mode_mask = result & ASUS_FAN_BOOST_MODES_MASK;
> >         }
>
> The above differs only in one value to give and one value to set, I
> suppose you may introduce an additional helper to it

Maybe it's better to add additional argument with index to
fan_boost_mode_check_present and
call it twice?

> > +       if (err == -ENODEV)
> > +               return 0;
>
> This should be explained or even separated to another patch. It
> changes behaviour of the original code, why?
>

Original code also have this check to continue module initialization
when fan_boost_mode device
is not present. It's return value is checked in asus_wmi_add()
function and it'll fail module probing.
