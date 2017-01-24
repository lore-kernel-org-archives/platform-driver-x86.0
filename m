From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: Add IMS/ZII SCU driver
Date: Tue, 24 Jan 2017 21:39:28 +0200
Message-ID: <CAHp75Veg_A+1a9-bHDBEAieXy+7wgLRakg1yGKO=PUO_HyVoOg@mail.gmail.com>
References: <20170111212644.9217-1-f.fainelli@gmail.com> <CAHp75VcH9ez0AjybBA8mtJ=nSyTTjXeV6d_P_NBA-mZmxjZ+Ng@mail.gmail.com>
 <bb11c1e9-294c-5302-3eb8-f12ecb969855@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f193.google.com ([209.85.216.193]:36280 "EHLO
        mail-qt0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750710AbdAXTja (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 24 Jan 2017 14:39:30 -0500
In-Reply-To: <bb11c1e9-294c-5302-3eb8-f12ecb969855@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, Chris Healy <cphealy@gmail.com>, Guenter Roeck <linux@roeck-us.net>, Darren Hart <dvhart@infradead.org>, open list <linux-kernel@vger.kernel.org>

On Sat, Jan 14, 2017 at 1:15 AM, Florian Fainelli <f.fainelli@gmail.com> wrote:
> On 01/13/2017 08:38 AM, Andy Shevchenko wrote:
>> On Wed, Jan 11, 2017 at 11:26 PM, Florian Fainelli <f.fainelli@gmail.com> wrote:
>>> This patch adds support for the IMS (now Zodiac Inflight Innovations)
>>> SCU Generation 1/2/3 platform driver. This driver registers all the
>>> on-module peripherals: Ethernet switches (Broadcom or Marvell), I2C to
>>> GPIO expanders, Kontrom CPLD/I2C master, and more.

>> I'm going to review this later, though few of comments.

Sorry, it takes a bit longer. Below my answers.

>> Does it sound like MFD driver + individual drivers?
>
> My understanding of a valid MFD candidate driver is that is partitions a
> shared resource space into individual resources that can all be managed
> by their respective driver. The KemPLD driver is already a MFD driver,
> here, this is more of a superset of all of that and an aggregate
> x86-based module that has a number of on-board peripherals.

So, what is common here to make mandatory to keep all those in one module then?

>>> +       bool eeprom_accessible;
>>> +       bool eeprom_valid;
>>
>> unsigned int flag1:1;
>> unsigned int flag2:1;
>>
>> ?
>
> Are you concerned with storage, or what motivates the preference for
> bitfields vs. bools?

Just matter of style. Up to you.

>>> +       {                       /* bit 5 */
>>> +        .name = "SD6:a:error",
>>> +        .gpio = SCU_SD_ERROR_6_GPIO,
>>> +        .active_low = 1,
>>> +        .default_trigger = "none",
>>> +        .default_state = LEDS_GPIO_DEFSTATE_OFF,
>>> +       }
>>> +};
>>
>> Hmm... Can you utilize device tree for that?
>
> Not really an option here

Why not?

>> Or built-in device properties?
>
> Not clear what you mean by that, can you expand?

include/linux/properties.h (platform data in a form of DT resource provider)

>>> +static void pca_leds_register(struct device *parent,
>>> +                             struct scu_data *data)
>>> +{
>>> +       data->leds_pdev[0] =
>>> +               platform_device_register_data(parent, "leds-gpio", 1,
>>> +                                             &pca_gpio_led_info1,
>>> +                                             sizeof(pca_gpio_led_info1));
>>> +       data->leds_pdev[1] =
>>> +               platform_device_register_data(parent, "leds-gpio", 2,
>>> +                                             &pca_gpio_led_info2,
>>> +                                             sizeof(pca_gpio_led_info2));
>>> +       data->leds_pdev[2] =
>>> +               platform_device_register_data(parent, "leds-gpio", 3,
>>> +                                             &pca_gpio_led_info3,
>>> +                                             sizeof(pca_gpio_led_info3));
>>> +}
>>
>> It really sounds like MFD to me.
>
> It's more of a board description of attached peripherals (all of them),
> more than a multi-function device, the whole module is by nature, "multi
> function" since it has a bunch of different I/Os and on-module peripherals.

So, there is neither ACPI, nor DT provider for such resources?
We used to have a hell of a time to handle board files for Intel MID
platforms under arch/x86/platform/intel-mid (formerly known as
mrst.c), so, I don't like the idea of board files.

-- 
With Best Regards,
Andy Shevchenko
