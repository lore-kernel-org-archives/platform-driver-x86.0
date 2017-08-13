From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 0/4] platform/x86: Fix check for method instance number
Date: Sun, 13 Aug 2017 15:54:26 +0300
Message-ID: <CAHp75Ve-umOB8U2HZ7iVf-0HfQX=A3-7KanEa0AY=iEhWpFuaA@mail.gmail.com>
References: <1502523858-25716-1-git-send-email-pali.rohar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f195.google.com ([209.85.216.195]:35323 "EHLO
        mail-qt0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750911AbdHMMy2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 13 Aug 2017 08:54:28 -0400
In-Reply-To: <1502523858-25716-1-git-send-email-pali.rohar@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>
Cc: Corentin Chary <corentin.chary@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Sat, Aug 12, 2017 at 10:44 AM, Pali Roh=C3=A1r <pali.rohar@gmail.com> wr=
ote:
> This patch series fixes remaining mxm-wmi and asus-wmi drivers to evaluat=
e
> WMI methods with correct and available instance number. Now all WMI drive=
rs
> should call WMI functions with correct instance number and last patch fix=
es
> WMI check for invalid instances. Patch for paeq-wmi is optional as machin=
e
> has 10 instances but instance number is ignored at all. But for consisten=
cy
> with other drivers first instance would be used (instead of second).
>

I pushed first 3 to testing, which seems to me right thing to do, and
left the last one to be ACK by Darren and/or others (I'm not familiar
so far with that code).
Thanks!

> Pali Roh=C3=A1r (4):
>   platform/x86: mxm-wmi: Evaluate wmi method with instance number 0x0
>   platform/x86: asus-wmi: Evaluate wmi method with instance number 0x0
>   platform/x86: peaq-wmi: Evaluate wmi method with instance number 0x0
>   platform/x86: wmi: Fix check for method instance number
>
>  drivers/platform/x86/asus-wmi.c |    4 ++--
>  drivers/platform/x86/mxm-wmi.c  |    4 ++--
>  drivers/platform/x86/peaq-wmi.c |    2 +-
>  drivers/platform/x86/wmi.c      |    6 +++---
>  4 files changed, 8 insertions(+), 8 deletions(-)
>
> --
> 1.7.9.5
>



--=20
With Best Regards,
Andy Shevchenko
