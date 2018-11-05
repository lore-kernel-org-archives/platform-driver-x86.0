From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH V7 5/9] misc/pvpanic: add support to get pvpanic device
 info by FDT
Date: Mon, 5 Nov 2018 15:05:03 +0200
Message-ID: <CAHp75VfZfBox+DVNU=JWLkD0ETHPca5tUfuh0srnEAU8M+q0Zg@mail.gmail.com>
References: <1541414431-84128-1-git-send-email-peng.hao2@zte.com.cn>
 <1541414431-84128-5-git-send-email-peng.hao2@zte.com.cn> <CAHp75VfP4d0fK9NDbAcHqy4aqTiMGTKBX5VQ36QbSyhRzrpOSQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75VfP4d0fK9NDbAcHqy4aqTiMGTKBX5VQ36QbSyhRzrpOSQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: peng.hao2@zte.com.cn
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, hutao@cn.fujitsu.com, Linux Documentation List <linux-doc@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Nov 5, 2018 at 2:58 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Mon, Nov 5, 2018 at 4:31 AM Peng Hao <peng.hao2@zte.com.cn> wrote:
> >
> > By default, when ACPI tables and FDT coexist for ARM64,
> > current kernel takes precedence over FDT to get device information.
> > Virt machine in qemu provides both FDT and ACPI table. Increases the
> > way to get information through FDT.
>
> > +#include <linux/acpi.h>
> > +#include <linux/init.h>
> >  #include <linux/kernel.h>
> >  #include <linux/module.h>
> > -#include <linux/init.h>
> > +#include <linux/of.h>
> > +#include <linux/of_address.h>
> > +#include <linux/platform_device.h>
> >  #include <linux/types.h>
> > -#include <linux/acpi.h>
>
> Adding new headers in this change is okay, while shuffling them is
> logically a separate change.

Couple more remarks (regarding ping-pong style in this series):

1. The shuffling part should go after you remove init.h: no need to
shuffle the stuff you eventually remove.
2. When you introduce global variable for base, put it directly to the
place where it would be after your ifdef patch.


-- 
With Best Regards,
Andy Shevchenko
