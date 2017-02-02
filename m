From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH] platform/x86: silead depends on I2C being built-in
Date: Thu, 2 Feb 2017 16:10:00 +0100
Message-ID: <3f7dc6b8-7447-f067-b771-8a306800ede3@redhat.com>
References: <20170202142744.3418986-1-arnd@arndb.de>
 <859e4199-8c8d-c1a8-6898-5ed4fe4572e4@redhat.com>
 <CAHp75VfgGOGhO-U_dMWGvnChUqXnuxwC-xKSMNs-FJeyBzOoDw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:54978 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751445AbdBBPKD (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 2 Feb 2017 10:10:03 -0500
In-Reply-To: <CAHp75VfgGOGhO-U_dMWGvnChUqXnuxwC-xKSMNs-FJeyBzOoDw@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi,

On 02-02-17 16:01, Andy Shevchenko wrote:
> On Thu, Feb 2, 2017 at 4:45 PM, Hans de Goede <hdegoede@redhat.com> wrote:
>> Hi,
>>
>> On 02-02-17 15:25, Arnd Bergmann wrote:
>>>
>>> The new driver cannot be a loadable module, so if I2C is loadable, we get
>>> this
>>> link error:
>>>
>>> drivers/platform/built-in.o: In function `silead_ts_dmi_init':
>>> silead_dmi.c:(.init.text+0x2ef): undefined reference to `i2c_bus_type'
>>>
>>> This makes the Kconfig dependency stricter to require I2C=y.
>>>
>>> Fixes: 9eeda3897a85 ("platform/x86: add support for devices with Silead
>>> touchscreens")
>>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>>
>>
>> Thank you.
>>
>> Acked-by: Hans de Goede <hdegoede@redhat.com>
>
> I'm a bit confused now:
>
> http://www.spinics.net/lists/platform-driver-x86/msg10408.html
>
> Please, clarify.

The depends on INPUT is not entirely wrong, the module does not
need it, but without the SILEAD driver being build the silead_dmi
code is of no use. Since multiple people already reported this
I thought it would be best to just go ahead with Arnd's version.

Regards,

Hans


>
>>
>> Regards.
>>
>> Hans
>>
>>
>>
>>> ---
>>>  drivers/platform/x86/Kconfig | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
>>> index dd4952ac8797..a7fe9b9f975d 100644
>>> --- a/drivers/platform/x86/Kconfig
>>> +++ b/drivers/platform/x86/Kconfig
>>> @@ -1079,7 +1079,7 @@ config INTEL_TURBO_MAX_3
>>>
>>>  config SILEAD_DMI
>>>         bool "Tablets with Silead touchscreens"
>>> -       depends on ACPI && DMI && I2C && INPUT
>>> +       depends on ACPI && DMI && I2C=y && INPUT
>>>         ---help---
>>>           Certain ACPI based tablets with Silead touchscreens do not have
>>>           enough data in ACPI tables for the touchscreen driver to handle
>>>
>>
>
>
>
