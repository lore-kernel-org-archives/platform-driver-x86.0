From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v5 09/14] platform/x86: dell-smbios: Introduce dispatcher
 for SMM calls
Date: Sun, 8 Oct 2017 18:48:44 +0300
Message-ID: <CAHp75VeD+KReTDfBA2mTG=DczbGf74T5Fyo7NNcaVNp0nqdXfA@mail.gmail.com>
References: <cover.1507350554.git.mario.limonciello@dell.com> <f53c8cfd7002ba288a061dacf70ad4161d203419.1507350554.git.mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f193.google.com ([209.85.216.193]:49447 "EHLO
        mail-qt0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753547AbdJHPsq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 8 Oct 2017 11:48:46 -0400
In-Reply-To: <f53c8cfd7002ba288a061dacf70ad4161d203419.1507350554.git.mario.limonciello@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario Limonciello <mario.limonciello@dell.com>
Cc: "dvhart@infradead.org" <dvhart@infradead.org>, LKML <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, mjg59@google.com, Christoph Hellwig <hch@lst.de>, Greg KH <greg@kroah.com>

On Sat, Oct 7, 2017 at 7:59 AM, Mario Limonciello
<mario.limonciello@dell.com> wrote:
> This splits up the dell-smbios driver into two drivers:
> * dell-smbios
> * dell-smbios-smm
>
> dell-smbios can operate with multiple different dispatcher drivers to
> perform SMBIOS operations.
>
> Also modify the interface that dell-laptop and dell-wmi use align to this
> model more closely.  Rather than a single global buffer being allocated
> for all drivers, each driver will allocate and be responsible for it's own
> buffer. The pointer will be passed to the calling function and each
> dispatcher driver will then internally copy it to the proper location to
> perform it's call.

>  config DELL_SMBIOS
>         tristate

> +       depends on DELL_SMBIOS_SMM
> +

If the above dependency is true (which I'm quite sure not) this split
should never happen.

> +config DELL_SMBIOS_SMM
> +       tristate "Dell SMBIOS calling interface (SMM implementation)"
> +       depends on DCDBAS
> +       default DCDBAS
> +       select DELL_SMBIOS
>         ---help---
> +       This provides an implementation for the Dell SMBIOS calling interface
> +       communicated over SMI/SMM.
>
> +       If you have a Dell computer from <=2017 you should say Y or M here.
> +       If you aren't sure and this module doesn't work for your computer
> +       it just won't load.


-- 
With Best Regards,
Andy Shevchenko
