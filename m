From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2 3/3] platform/x86: asus_wmi: Set default fan boost mode
 to normal
Date: Wed, 6 Nov 2019 09:03:17 +0200
Message-ID: <CAHp75VfgTAa8TgTYn99gr_F4mmVuJZgEu=JcDE+bOnAO-pqqxA@mail.gmail.com>
References: <20191104213417.18036-1-leonmaxx@gmail.com> <20191104213907.18413-1-leonmaxx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191104213907.18413-1-leonmaxx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Leonid Maksymchuk <leonmaxx@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, Chris Chiu <chiu@endlessm.com>, Yurii Pavlovskyi <yurii.pavlovskyi@gmail.com>, Kristian Klausen <kristian@klausen.dk>, Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Corentin Chary <corentin.chary@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Nov 4, 2019 at 11:39 PM Leonid Maksymchuk <leonmaxx@gmail.com> wrote:
>
> Set default fan boost mode to normal for multiple reasons:
>
> 1) existing code assumes that laptop started in normal mode and that is
>    not always correct.
> 2) FX705DY/FX505DY starts in silent mode and under heavy CPU load it
>    overheats and drops CPU frequency to 399MHz [1]. Setting fan mode to
>    normal avoids overheating.
>
> [1] Link: https://bugzilla.kernel.org/show_bug.cgi?id=203733
>
> Signed-off-by: Leonid Maksymchuk <leonmaxx@gmail.com>

> +static int fan_boost_mode_set_default(struct asus_wmi *asus)
> +{
> +       int result = 0;
> +
> +       if (asus->fan_boost_mode_available) {
> +               asus->fan_boost_mode = ASUS_FAN_BOOST_MODE_NORMAL;
> +               result = fan_boost_mode_write(asus);
> +       }
> +
> +       return result;
> +}

This can be refactored

if (!foo)
  return 0;
...
return bar(asus);

-- 
With Best Regards,
Andy Shevchenko
