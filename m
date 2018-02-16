From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: eeepc-wmi loaded on Asus desktop board
Date: Fri, 16 Feb 2018 18:44:53 +0200
Message-ID: <CAHp75Vc7NO=N_Wb4w9gdip3Pa4zUQw1nipt9iPvK-5_GtcP6Rg@mail.gmail.com>
References: <63d05833-a0ba-7fff-4514-5234d43a82fe@molgen.mpg.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f178.google.com ([209.85.216.178]:33576 "EHLO
        mail-qt0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750897AbeBPQoz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 16 Feb 2018 11:44:55 -0500
In-Reply-To: <63d05833-a0ba-7fff-4514-5234d43a82fe@molgen.mpg.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Paul Menzel <pmenzel+linux-platform-driver-x86@molgen.mpg.de>
Cc: Corentin Chary <corentin.chary@gmail.com>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

+Cc: Darren.

On Fri, Feb 16, 2018 at 12:42 AM, Paul Menzel
<pmenzel+linux-platform-driver-x86@molgen.mpg.de> wrote:
> Dear Linux folks,
>
>
> Debugging an ACPI suspend problem on the desktop board Asus F285-M PRO with
> Linux 4.14, I noticed, the module *eeepc_wmi* is loaded, and an input device
> is created.
>
> ```
> Feb 15 18:49:01 asusf2a85mpro kernel: calling  eeepc_wmi_init+0x0/0x1000
> [eeepc_wmi] @ 285
> Feb 15 18:49:01 asusf2a85mpro kernel: asus_wmi: Initialization: 0x0
> Feb 15 18:49:01 asusf2a85mpro kernel: asus_wmi: BIOS WMI version: 0.9
> Feb 15 18:49:01 asusf2a85mpro kernel: asus_wmi: SFUN value: 0x0
> Feb 15 18:49:01 asusf2a85mpro kernel: input: Eee PC WMI hotkeys as
> /devices/platform/eeepc-wmi/input/input7
> Feb 15 18:49:01 asusf2a85mpro kernel: asus_wmi: Number of fans: 1
> Feb 15 18:49:01 asusf2a85mpro kernel: initcall eeepc_wmi_init+0x0/0x1000
> [eeepc_wmi] returned 0 after 12130 usecs
> ```
>
> Please find the full log attached.
>
> Is that expected, or should the module not load at all on desktop boards?
>
>
>
> Kind regards,
>
> Paul



-- 
With Best Regards,
Andy Shevchenko
