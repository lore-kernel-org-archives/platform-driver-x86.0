From: Chris Chiu <chiu@endlessm.com>
Subject: Re: [PATCH v2 1/2] platform/x86: asus-wmi: Call led hw_changed API on
 kbd brightness change
Date: Thu, 14 Jun 2018 14:58:13 +0800
Message-ID: <CAB4CAwdKJiuEiV1CtoyYTZTatRt73BQbRX5kyEtpqNj8STj5-w@mail.gmail.com>
References: <20180611071838.47945-1-chiu@endlessm.com> <CAHp75VdfUO9rS-=nn+Ffe8bMEbCO-0xe8QBVqsJAZVFTMYkNxg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75VdfUO9rS-=nn+Ffe8bMEbCO-0xe8QBVqsJAZVFTMYkNxg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Corentin Chary <corentin.chary@gmail.com>, Darren Hart <dvhart@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, Hans de Goede <hdegoede@redhat.com>, Linux Upstreaming Team <linux@endlessm.com>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Jun 13, 2018 at 8:49 PM, Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Mon, Jun 11, 2018 at 10:18 AM, Chris Chiu <chiu@endlessm.com> wrote:
>> Make asus-wmi notify on hotkey kbd brightness changes, listen for
>> brightness events and update the brightness directly in the driver.
>
>> For this purpose, bound check on brightness in kbd_led_set must be
>> based on the same data type to prevent illegal value been set.
>
>> @@ -497,9 +498,9 @@ static void kbd_led_set(struct led_classdev *led_cdev,
>>
>>         asus = container_of(led_cdev, struct asus_wmi, kbd_led);
>>
>> -       if (value > asus->kbd_led.max_brightness)
>> +       if ((int)value > (int)asus->kbd_led.max_brightness)
>>                 value = asus->kbd_led.max_brightness;
>> -       else if (value < 0)
>> +       else if ((int)value < 0)
>>                 value = 0;
>
> I didn't quite understand this part of the problem.
> Does it exist in the current code? Can it be split to a separate change?
>
> Can we avoid those ugly castings?
>

I'd like to remove the ugly castings but there's a concern I may need some
advices. I don't know whether if the bound check logic ever verified before.
Maybe the value passed via sysfs is already correctly bounded?

When the kbd_led_wk comes to -1, `if (value > asus->kbd_led.max_brightness)`
returns true and `if (value < 0)` return false which confused me. It
should relate
to the 2nd argument type is enum led_brightness which I consider it as integer.
The unexpected return value cause the KBD_BRTDWN cyclic, 3->2->0->-1
(3 again in kbd_led_set)->2->1. After applying the casting on both operands
`if ((int)value > (int)asus->kbd_led.max_brightness)`, the other
unexpected false
returned by `if (value < 0)` makes each KBD_BRTDOWN to be 3 -> 2 -> 1 -> 0 ->
-1 -> -2 -> -3 ->..... That's what the ugly casting for. I used to
tend to do boundary
limit before calling kbd_led_set as follows

kbd_led_set(&asus->kbd_led, MIN(asus->kbd_led_wk + 1,
asus->kbd_led.max_brightness);
and
kbd_led_set(&asus->kbd_led, MAX(asus->kbd_led_wk - 1, 0));

If so, the boundary limit logic would be totally redundant but I think
it may be still
useful to check the value passed from sysfs? Any suggestion which one would
be better?

Chris

> --
> With Best Regards,
> Andy Shevchenko
