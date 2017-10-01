From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] thinkpad_acpi: Implement tablet mode resolving using GMMS method
Date: Sun, 1 Oct 2017 16:06:03 +0300
Message-ID: <CAHp75VcYD76Huyxx=8dtQ9-8-OFWUu7JpGO0gP_17HNCD6FUpw@mail.gmail.com>
References: <20170915132049.32317-1-bberg@redhat.com> <1505750434.9395.0.camel@redhat.com>
 <CAHp75Vdif1F=OSqDL-0FbwjDkTK541cBXdzOmWeNyPm65VDdyQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f175.google.com ([209.85.216.175]:56671 "EHLO
        mail-qt0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751004AbdJANGF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 1 Oct 2017 09:06:05 -0400
In-Reply-To: <CAHp75Vdif1F=OSqDL-0FbwjDkTK541cBXdzOmWeNyPm65VDdyQ@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Lyude Paul <lyude@redhat.com>
Cc: Benjamin Berg <bberg@redhat.com>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, ibm-acpi-devel@lists.sourceforge.net, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Peter FP1 Zhang <zhangfp1@lenovo.com>

On Sun, Oct 1, 2017 at 12:31 PM, Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Mon, Sep 18, 2017 at 7:00 PM, Lyude Paul <lyude@redhat.com> wrote:
>> Reviewed-by: Lyude Paul <lyude@redhat.com>
>>
>> On Fri, 2017-09-15 at 15:20 +0200, Benjamin Berg wrote:
>>> Many thinkpad laptops and convertibles provide the GMMS method to
>>> resolve how far the laptop has been opened and whether it has been
>>> converted into tablet mode. This allows reporting a more precise tablet
>>> mode state to userspace.
>>>
>>> The current implementation only reports a summarized tablet mode state
>>> which is triggered as soon as the input devices become unusable as they
>>> are folded away from the display.
>>>
>>> This will work on all models where the CMMD method was used previously and
>>> it may also work in other cases.
>>>
>>> Thanks to Peter Zhang of Lenovo for providing information on how to use the
>>> GMMS method to query the tablet mode.
>
> I dunno why this one didn't appear in our patchwork database.
> I'll go to apply manually soon.
> Sorry for the delay.

Okay, now pushed to my testing queue.

-- 
With Best Regards,
Andy Shevchenko
