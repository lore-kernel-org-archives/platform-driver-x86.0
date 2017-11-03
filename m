From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2 4/4] platform/x86: topstar-laptop: add optional WLAN
 LED workaround
Date: Fri, 3 Nov 2017 14:50:52 +0200
Message-ID: <CAHp75VdN2PDDKsAM8qp1ssZB+K_zgwvJBKK7UEVvsSHV_cK73g@mail.gmail.com>
References: <cover.1509229280.git.gdouezangrard@gmail.com> <4bfdea8bba83cd8f7fcdfdeee283f24574e4866d.1509229280.git.gdouezangrard@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qk0-f170.google.com ([209.85.220.170]:43132 "EHLO
        mail-qk0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751676AbdKCMux (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 3 Nov 2017 08:50:53 -0400
In-Reply-To: <4bfdea8bba83cd8f7fcdfdeee283f24574e4866d.1509229280.git.gdouezangrard@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?Q?Guillaume_Dou=C3=A9zan=2DGrard?= <gdouezangrard@gmail.com>
Cc: Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Sun, Oct 29, 2017 at 1:53 AM, Guillaume Dou=C3=A9zan-Grard
<gdouezangrard@gmail.com> wrote:
> Topstar U931 laptops provide an LED synced with the WLAN adapter
> hard-blocking state. Unfortunately, some models seem to be defective,
> making impossible to hard-block the adapter with the WLAN switch and
> thus the LED is useless.
>
> An ACPI method is available to programmatically control this switch and
> it indirectly allows to control the LED.
>
> This commit registers the LED within the corresponding subsystem, making
> possible for instance to use an rfkill-based trigger to synchronize the
> LED with the soft-blocking state.
>
> This feature is disabled by default and can be enabled with the
> `led_workaround` module parameter.

>  #include <linux/platform_device.h>
>  #include <linux/input.h>
>  #include <linux/input/sparse-keymap.h>
> +#include <linux/leds.h>

Yep, exact place, esp. after moving platform_device to the right place.

> +static bool led_workaround;
> +module_param_named(led_workaround, led_workaround, bool, 0444);
> +MODULE_PARM_DESC(led_workaround,
> +               "Enables software-based WLAN LED control on systems with =
defective hardware switch");

So, this is most problematic piece in the series.

We are not encouraging module parameters. Why do we need one? Can't be
detected automatically (perhaps based on DMI strings)?

--=20
With Best Regards,
Andy Shevchenko
