From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: Failed IRQ assignment for INT0002 on Braswell
Date: Thu, 23 Nov 2017 23:08:29 +0200
Message-ID: <CAHp75VcfOYmOwsYgH0ri0ZDNSP_5gb0QyttBKUMuBHm1qxhkUw@mail.gmail.com>
References: <1902393.IdeYHqtVB8@natalenko.name> <2100487.obXIbN4R9M@natalenko.name>
 <d8587e5f-79e6-22cc-570c-fa9934d09f1d@redhat.com> <2474990.QanOVckajO@natalenko.name>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f175.google.com ([209.85.216.175]:34731 "EHLO
        mail-qt0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753357AbdKWVIa (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 23 Nov 2017 16:08:30 -0500
In-Reply-To: <2474990.QanOVckajO@natalenko.name>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Oleksandr Natalenko <oleksandr@natalenko.name>
Cc: Hans de Goede <hdegoede@redhat.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Nov 22, 2017 at 8:13 PM, Oleksandr Natalenko
<oleksandr@natalenko.name> wrote:
>
> Hi, Hans.
>
> With this patch applied the warning is not emitted anymore with threadirqs
> enabled, and relevant kthread (irq/9-INT0002) is created.
>
> Feel free to add Reported-by/Tested-by from me once you do a submission.

First of all, please stop top-posting.

Second, we are using patchwork which can automatically add tags based
on given in followup emails.
So, if you wish to see your tag in the commit message at the end,
please, send a reply with

Reported-by:
Tested-by:

tags.

Thanks.

-- 
With Best Regards,
Andy Shevchenko
