From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: Add IMS/ZII SCU driver
Date: Tue, 24 Jan 2017 22:18:57 +0200
Message-ID: <CAHp75Vc2fwhq8y5qzrq=J981058L9Mp+8V8dpybFdT8WETMj_A@mail.gmail.com>
References: <20170111212644.9217-1-f.fainelli@gmail.com> <CAHp75VcH9ez0AjybBA8mtJ=nSyTTjXeV6d_P_NBA-mZmxjZ+Ng@mail.gmail.com>
 <bb11c1e9-294c-5302-3eb8-f12ecb969855@gmail.com> <CAHp75Veg_A+1a9-bHDBEAieXy+7wgLRakg1yGKO=PUO_HyVoOg@mail.gmail.com>
 <b9f42c24-9a5f-5486-f097-2b65a3c809ab@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <b9f42c24-9a5f-5486-f097-2b65a3c809ab@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, Chris Healy <cphealy@gmail.com>, Guenter Roeck <linux@roeck-us.net>, Darren Hart <dvhart@infradead.org>, open list <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Jan 24, 2017 at 10:07 PM, Florian Fainelli <f.fainelli@gmail.com> wrote:
> On 01/24/2017 11:39 AM, Andy Shevchenko wrote:

>>>>> +       {                       /* bit 5 */
>>>>> +        .name = "SD6:a:error",
>>>>> +        .gpio = SCU_SD_ERROR_6_GPIO,
>>>>> +        .active_low = 1,
>>>>> +        .default_trigger = "none",
>>>>> +        .default_state = LEDS_GPIO_DEFSTATE_OFF,
>>>>> +       }
>>>>> +};
>>>>
>>>> Hmm... Can you utilize device tree for that?
>>>
>>> Not really an option here
>>
>> Why not?
>
> The platform is several years old, it is currently deployed with a boot
> loader that does not support passing a Device Tree blob pointer in one
> of the special e820 regions, I looked into that before, but I am not
> proficient enough with grub's source code to make that happen nor do I
> think this is going to be worth the trouble for these specific platforms.
>
> Last I worked on x86 and Device Tree on CE4100 (2013 or so) there was
> quite a lot of ad-hoc and not so generic code early FDT/OF
> initialization code that had to be provided which AFAIR would hinder the
> multiplatform capability of the kernel on x86 if there was a second DT
> enabled platform that would show up. I did started that route, and it
> did not look pretty, also, I would have to make *all* drivers used by
> this platform (kempld and friends) to become DT aware, and make sure
> that they do propagate of_node/child of_node correctly, major pain.
>
> Finally, writing a complete Device Tree for this platform is a major
> pain because a lot of the peripherals are being a PCI host bridge and
> some of them are several levels deep (SPI over I2C expander over CPLD
> over...).
>
>>
>>>> Or built-in device properties?
>>>
>>> Not clear what you mean by that, can you expand?
>>
>> include/linux/properties.h (platform data in a form of DT resource provider)

Have you give a look at it?

>>>>> +static void pca_leds_register(struct device *parent,
>>>>> +                             struct scu_data *data)
>>>>> +{
>>>>> +       data->leds_pdev[0] =
>>>>> +               platform_device_register_data(parent, "leds-gpio", 1,
>>>>> +                                             &pca_gpio_led_info1,
>>>>> +                                             sizeof(pca_gpio_led_info1));
>>>>> +       data->leds_pdev[1] =
>>>>> +               platform_device_register_data(parent, "leds-gpio", 2,
>>>>> +                                             &pca_gpio_led_info2,
>>>>> +                                             sizeof(pca_gpio_led_info2));
>>>>> +       data->leds_pdev[2] =
>>>>> +               platform_device_register_data(parent, "leds-gpio", 3,
>>>>> +                                             &pca_gpio_led_info3,
>>>>> +                                             sizeof(pca_gpio_led_info3));
>>>>> +}
>>>>
>>>> It really sounds like MFD to me.
>>>
>>> It's more of a board description of attached peripherals (all of them),
>>> more than a multi-function device, the whole module is by nature, "multi
>>> function" since it has a bunch of different I/Os and on-module peripherals.
>>
>> So, there is neither ACPI, nor DT provider for such resources?
>
> Nope.

See above.

>> We used to have a hell of a time to handle board files for Intel MID
>> platforms under arch/x86/platform/intel-mid (formerly known as
>> mrst.c), so, I don't like the idea of board files.
>
> I understand the pain, but we also have to work with the tools we have,
> and neither DT nor ACPI are such tools at the moment for this platform.

I too understand your point, but what can we do is to do better
approach to this all.

Intel Medfield reminds me of MSIC (which is actually an IP uses SCU
and provides several devices).
Note, that on new SoCs we have just PMIC that basically looks pretty
similar (just in one IP): It's an MFD device that can contain real MFD
devices,

We have in kernel that kind of design:
arch/x86/platform/intel-mid/device_libs/platform_msic*.c (Platform
data for MSIC devices)
drivers/mfd/intel_msic.c (An MFD driver of MSIC devices)
drivers/*/* ... */* (Actual drivers)

That code is quite old. Instead we can do something like

drivers/platform/x86 (It's indeed better place for a such stuff than
drivers/mfd)

that contains MFD driver _with_ builtin device properties instead of
legacy platform data.

_and_

drivers/*/* ... */* (Actual drivers)

that contains actual resource provider agnostic drivers.

How does it sound to you?

P.S. At least if I would write MSIC support right now I would go this way.

-- 
With Best Regards,
Andy Shevchenko
