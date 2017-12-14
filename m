From: Alex Hung <alex.hung@canonical.com>
Subject: Re: [PATCH][V2] intel-hid: add a DMI quirk to support Wacom
 MobileStudio Pro
Date: Thu, 14 Dec 2017 15:25:20 +0800
Message-ID: <CAJ=jqua=D9RXPq8u8OcBno2iULo0iE3AQe+4hM+pjEa=5BHWbA@mail.gmail.com>
References: <1512618023-30209-1-git-send-email-alex.hung@canonical.com>
 <20171209000423.GD14187@fury> <CANRwn3SpSfwpJk7OitXv6aLK4ES=AbHkmj7iyQsUP_dbZqbJTA@mail.gmail.com>
 <20171212005118.GF27831@fury> <CAHp75VeDarmDs1tALkv4tiO_NMa7uhC26bF_Yc0Bv98KpK_nHw@mail.gmail.com>
 <20171212160012.GI27831@fury> <CAHp75VcRdjJef3VmBkF-pVu+bn=ho2aX26u=u2EXukT7mkpwWw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:53097 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750737AbdLNH1E (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 14 Dec 2017 02:27:04 -0500
Received: from mail-qk0-f199.google.com ([209.85.220.199])
        by youngberry.canonical.com with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
        (Exim 4.76)
        (envelope-from <alex.hung@canonical.com>)
        id 1ePNtS-0004js-3R
        for platform-driver-x86@vger.kernel.org; Thu, 14 Dec 2017 07:25:22 +0000
Received: by mail-qk0-f199.google.com with SMTP id y20so2849127qka.16
        for <platform-driver-x86@vger.kernel.org>; Wed, 13 Dec 2017 23:25:22 -0800 (PST)
In-Reply-To: <CAHp75VcRdjJef3VmBkF-pVu+bn=ho2aX26u=u2EXukT7mkpwWw@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Jason Gerecke <killertofu@gmail.com>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Jason Gerecke <jason.gerecke@wacom.com>

On Wed, Dec 13, 2017 at 12:13 AM, Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Tue, Dec 12, 2017 at 6:00 PM, Darren Hart <dvhart@infradead.org> wrote:
>> On Tue, Dec 12, 2017 at 10:02:36AM +0200, Andy Shevchenko wrote:
>
>>> Just in case you didn't promote it yet, could you move inclusion to be
>>> more ordered alphabetically? (After linux/acpi.h I suppose)
>>
>> I had done that initially, but realized the entire list is in no apparent order
>> and it wasn't just moving the one line he added. So it'll need to be a cleanup
>> patch since all the test builds have run already.
>
> Ah, fair enough.

Do you mean the includes listed alphabetically such as below? I can
send a patch to clean it up.

#include <linux/acpi.h>
#include <acpi/acpi_bus.h>
#include <linux/dmi.h>
#include <linux/init.h>
#include <linux/input.h>
#include <linux/input/sparse-keymap.h>
#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/platform_device.h>
#include <linux/suspend.h>


>
> --
> With Best Regards,
> Andy Shevchenko



-- 
Cheers,
Alex Hung
