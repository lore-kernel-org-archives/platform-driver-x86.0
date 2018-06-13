From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2 1/2] platform/x86: asus-wmi: Call led hw_changed API on
 kbd brightness change
Date: Wed, 13 Jun 2018 15:49:54 +0300
Message-ID: <CAHp75VdfUO9rS-=nn+Ffe8bMEbCO-0xe8QBVqsJAZVFTMYkNxg@mail.gmail.com>
References: <20180611071838.47945-1-chiu@endlessm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180611071838.47945-1-chiu@endlessm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chris Chiu <chiu@endlessm.com>
Cc: Corentin Chary <corentin.chary@gmail.com>, Darren Hart <dvhart@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, Hans de Goede <hdegoede@redhat.com>, Linux Upstreaming Team <linux@endlessm.com>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Jun 11, 2018 at 10:18 AM, Chris Chiu <chiu@endlessm.com> wrote:
> Make asus-wmi notify on hotkey kbd brightness changes, listen for
> brightness events and update the brightness directly in the driver.

> For this purpose, bound check on brightness in kbd_led_set must be
> based on the same data type to prevent illegal value been set.

> @@ -497,9 +498,9 @@ static void kbd_led_set(struct led_classdev *led_cdev,
>
>         asus = container_of(led_cdev, struct asus_wmi, kbd_led);
>
> -       if (value > asus->kbd_led.max_brightness)
> +       if ((int)value > (int)asus->kbd_led.max_brightness)
>                 value = asus->kbd_led.max_brightness;
> -       else if (value < 0)
> +       else if ((int)value < 0)
>                 value = 0;

I didn't quite understand this part of the problem.
Does it exist in the current code? Can it be split to a separate change?

Can we avoid those ugly castings?

-- 
With Best Regards,
Andy Shevchenko
