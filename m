From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH][V2] intel-hid: add a DMI quirk to support Wacom
 MobileStudio Pro
Date: Thu, 14 Dec 2017 11:09:49 +0200
Message-ID: <CAHp75Ve7KD1Ha0n3X=ktNjOzLjniKvCxzygSqZK24=jFVJLC=Q@mail.gmail.com>
References: <1512618023-30209-1-git-send-email-alex.hung@canonical.com>
 <20171209000423.GD14187@fury> <CANRwn3SpSfwpJk7OitXv6aLK4ES=AbHkmj7iyQsUP_dbZqbJTA@mail.gmail.com>
 <20171212005118.GF27831@fury> <CAHp75VeDarmDs1tALkv4tiO_NMa7uhC26bF_Yc0Bv98KpK_nHw@mail.gmail.com>
 <20171212160012.GI27831@fury> <CAHp75VcRdjJef3VmBkF-pVu+bn=ho2aX26u=u2EXukT7mkpwWw@mail.gmail.com>
 <CAJ=jqua=D9RXPq8u8OcBno2iULo0iE3AQe+4hM+pjEa=5BHWbA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qk0-f177.google.com ([209.85.220.177]:38946 "EHLO
        mail-qk0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750795AbdLNJJu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 14 Dec 2017 04:09:50 -0500
Received: by mail-qk0-f177.google.com with SMTP id u184so5378109qkd.6
        for <platform-driver-x86@vger.kernel.org>; Thu, 14 Dec 2017 01:09:50 -0800 (PST)
In-Reply-To: <CAJ=jqua=D9RXPq8u8OcBno2iULo0iE3AQe+4hM+pjEa=5BHWbA@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Alex Hung <alex.hung@canonical.com>
Cc: Darren Hart <dvhart@infradead.org>, Jason Gerecke <killertofu@gmail.com>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Jason Gerecke <jason.gerecke@wacom.com>

On Thu, Dec 14, 2017 at 9:25 AM, Alex Hung <alex.hung@canonical.com> wrote:
> On Wed, Dec 13, 2017 at 12:13 AM, Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
>> On Tue, Dec 12, 2017 at 6:00 PM, Darren Hart <dvhart@infradead.org> wrote:
>>> On Tue, Dec 12, 2017 at 10:02:36AM +0200, Andy Shevchenko wrote:
>>
>>>> Just in case you didn't promote it yet, could you move inclusion to be
>>>> more ordered alphabetically? (After linux/acpi.h I suppose)
>>>
>>> I had done that initially, but realized the entire list is in no apparent order
>>> and it wasn't just moving the one line he added. So it'll need to be a cleanup
>>> patch since all the test builds have run already.
>>
>> Ah, fair enough.
>
> Do you mean the includes listed alphabetically such as below?

Yes.

> I can
> send a patch to clean it up.

As a standalone change it would not be required, but if you are going
to send some behaviour changing or bigger clean up series, feel free
to add.

> #include <linux/acpi.h>
> #include <acpi/acpi_bus.h>
> #include <linux/dmi.h>
> #include <linux/init.h>
> #include <linux/input.h>
> #include <linux/input/sparse-keymap.h>
> #include <linux/kernel.h>
> #include <linux/module.h>
> #include <linux/platform_device.h>
> #include <linux/suspend.h>

-- 
With Best Regards,
Andy Shevchenko
