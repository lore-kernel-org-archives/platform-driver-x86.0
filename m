From: Chris Chiu <chiu@endlessm.com>
Subject: Re: [PATCH v2 1/2] platform/x86: asus-wmi: Call led hw_changed API on
 kbd brightness change
Date: Wed, 20 Jun 2018 22:40:46 +0800
Message-ID: <CAB4CAwd0TSvMdFpuPqyAMwViA=6NcLvo9=rwkF-Mf=zz5si0RQ@mail.gmail.com>
References: <20180611071838.47945-1-chiu@endlessm.com> <CAHp75VdfUO9rS-=nn+Ffe8bMEbCO-0xe8QBVqsJAZVFTMYkNxg@mail.gmail.com>
 <CAB4CAwdKJiuEiV1CtoyYTZTatRt73BQbRX5kyEtpqNj8STj5-w@mail.gmail.com> <CAD8Lp4596OLxc9sw=DwAZ_nHLEOt686xxatqCmSpV0eEWwigjQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAD8Lp4596OLxc9sw=DwAZ_nHLEOt686xxatqCmSpV0eEWwigjQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Drake <drake@endlessm.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Corentin Chary <corentin.chary@gmail.com>, Darren Hart <dvhart@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, Hans de Goede <hdegoede@redhat.com>, Linux Upstreaming Team <linux@endlessm.com>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Jun 20, 2018 at 12:46 AM, Daniel Drake <drake@endlessm.com> wrote:
> Hi,
>
> On Thu, Jun 14, 2018 at 1:58 AM, Chris Chiu <chiu@endlessm.com> wrote:
>>
>> On Wed, Jun 13, 2018 at 8:49 PM, Andy Shevchenko
>> <andy.shevchenko@gmail.com> wrote:
>> > On Mon, Jun 11, 2018 at 10:18 AM, Chris Chiu <chiu@endlessm.com> wrote:
>> >> Make asus-wmi notify on hotkey kbd brightness changes, listen for
>> >> brightness events and update the brightness directly in the driver.
>> >
>> >> For this purpose, bound check on brightness in kbd_led_set must be
>> >> based on the same data type to prevent illegal value been set.
>> >
>> >> @@ -497,9 +498,9 @@ static void kbd_led_set(struct led_classdev *led_cdev,
>> >>
>> >>         asus = container_of(led_cdev, struct asus_wmi, kbd_led);
>> >>
>> >> -       if (value > asus->kbd_led.max_brightness)
>> >> +       if ((int)value > (int)asus->kbd_led.max_brightness)
>> >>                 value = asus->kbd_led.max_brightness;
>> >> -       else if (value < 0)
>> >> +       else if ((int)value < 0)
>> >>                 value = 0;
>> >
>> > I didn't quite understand this part of the problem.
>> > Does it exist in the current code? Can it be split to a separate change?
>> >
>> > Can we avoid those ugly castings?
>> >
>>
>> I'd like to remove the ugly castings but there's a concern I may need some
>> advices. I don't know whether if the bound check logic ever verified before.
>> Maybe the value passed via sysfs is already correctly bounded?
>
> The casts come from the underlying need to limit the minumum and
> maximum brightness within available bounds, plus difficulties doing
> that when you are dealing with an enum data type.
>
> kbd_led_set is a function pointer (from led_classdev.brightness_set)
> which has this definition:
>
> void (*brightness_set)(struct led_classdev *led_cdev, enum
> led_brightness brightness);
>
> It seems that the compiler has the choice of whether to use a signed
> or unsigned type for enums. According to your tests, and a quick test
> app below, it seems like gcc is using unsigned.
>
>   #include <stdio.h>
>   enum led_brightness { LED_OFF = 0 };
>   int main(void) {
>     enum led_brightness tmp = -1;
>     if (tmp < 0)
>       printf("less than zero\n");
>     else
>       printf("gt zero\n");
>   }
>
> This test app prints "gt zero"
>
> led-class.c:brightness_store() uses kstrtoul() so there is no chance
> of passing a negative value through this codepath, as you suspected.
> But we do need to do something with negative bounds for the code that
> you are adding here.
>
> I suggest doing it like this:
>
> static void __kbd_led_set(struct led_classdev *led_cdev, int value)
> {
>     struct asus_wmi *asus;
>
>     asus = container_of(led_cdev, struct asus_wmi, kbd_led);
>
>     if (value > asus->kbd_led.max_brightness)
>         value = asus->kbd_led.max_brightness;

The `value > asus->kbd_led.max_brightness` will still return false here.
So I would modify as follows in v3.
    int max_level = asus->kbd_led.max_brightness;

    if (value > max_level)
        value = max_level;

I've verified there's no regression on led_classdev call path via sysfs.

>     else if (value < 0)
>         value = 0;
>
>     asus->kbd_led_wk = value;
>     queue_work(asus->led_workqueue, &asus->kbd_led_work);
> }
>
> static void kbd_led_set(struct led_classdev *led_cdev,
>             enum led_brightness value)
> {
>     return __kbd_led_set(led_cdev, value);
> }
>
> Now kbd_led_set can continue being a correctly typed function pointer
> for led_classdev.brightness_set. And from the code you are adding here
> you can call __kbd_led_set directly with signed integer values, and
> rely on correct bounds correction without ugly casts.
>
> Andy, what do you think?
>
> Thanks
> Daniel
