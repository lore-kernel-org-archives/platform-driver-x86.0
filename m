From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: Failed IRQ assignment for INT0002 on Braswell
Date: Thu, 23 Nov 2017 23:22:58 +0200
Message-ID: <CAHp75VeySBo1D_HOYjcOwV7cKM4ZeEKoKZez7nDUCLLfJUZqnw@mail.gmail.com>
References: <1902393.IdeYHqtVB8@natalenko.name> <2474990.QanOVckajO@natalenko.name>
 <CAHp75VcfOYmOwsYgH0ri0ZDNSP_5gb0QyttBKUMuBHm1qxhkUw@mail.gmail.com> <1518924.dC7gVaPWNF@natalenko.name>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qk0-f182.google.com ([209.85.220.182]:40274 "EHLO
        mail-qk0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752284AbdKWVW7 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 23 Nov 2017 16:22:59 -0500
In-Reply-To: <1518924.dC7gVaPWNF@natalenko.name>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Oleksandr Natalenko <oleksandr@natalenko.name>
Cc: Hans de Goede <hdegoede@redhat.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Nov 23, 2017 at 11:15 PM, Oleksandr Natalenko
<oleksandr@natalenko.name> wrote:
> On =C4=8Dtvrtek 23. listopadu 2017 22:08:29 CET Andy Shevchenko wrote:
>> On Wed, Nov 22, 2017 at 8:13 PM, Oleksandr Natalenko
>>
>> <oleksandr@natalenko.name> wrote:
>> > Hi, Hans.
>> >
>> > With this patch applied the warning is not emitted anymore with thread=
irqs
>> > enabled, and relevant kthread (irq/9-INT0002) is created.
>> >
>> > Feel free to add Reported-by/Tested-by from me once you do a submissio=
n.
>>
>> First of all, please stop top-posting.
>>
>> Second, we are using patchwork which can automatically add tags based
>> on given in followup emails.
>> So, if you wish to see your tag in the commit message at the end,
>> please, send a reply with
>>
>> Reported-by:
>> Tested-by:
>>
>> tags.
>>
>> Thanks.
>
> Right.
>
> Reported-by: Oleksandr Natalenko <oleksandr@natalenko.name>
> Tested-by: Oleksandr Natalenko <oleksandr@natalenko.name>

Pushed to my review and testing queue, thanks!

--=20
With Best Regards,
Andy Shevchenko
