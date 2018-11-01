From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH V5 2/8] misc/pvpanic: Remove one extra semicolon
Date: Thu, 1 Nov 2018 15:38:24 +0200
Message-ID: <CAHp75VdTzFJ9ggQ+eMn-bAfbtXC4w69R+7UjYvWom6ALV9NfPA@mail.gmail.com>
References: <1541085002-42993-1-git-send-email-peng.hao2@zte.com.cn>
 <1541085002-42993-2-git-send-email-peng.hao2@zte.com.cn> <20181101113355.z6l3l33buhcpukl4@lakrids.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181101113355.z6l3l33buhcpukl4@lakrids.cambridge.arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: peng.hao2@zte.com.cn, Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, hutao@cn.fujitsu.com, Linux Documentation List <linux-doc@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Nov 1, 2018 at 1:34 PM Mark Rutland <mark.rutland@arm.com> wrote:
>
> On Thu, Nov 01, 2018 at 11:09:56PM +0800, Peng Hao wrote:
> > There is an extra semicolon in pvpanic_device_ids, remove it.
>
> This is a comma, not a semicolon.
>
> How about:
>
>   Since there should be nothing after the sentinel entry in an
>   acpi_device_id list, it doesn't make sense for it to have a trailing
>   comma.
>
>   This patch removes the redundant comma.
>
> ... with that commit message (and the title fixed to say 'comma' rather
> than 'semicolon':

Agree on this, but...

>
> Acked-by: Mark Rutland <mark.rutland@arm.com>
>
> Either that, or simply drop this patch entirely.

...point was to gather style changes here, like moving linux/acpi.h.

And definitely the style changes should go last in the series.
If you decide to leave this patch, it would be 8/8.

>
> Thanks,
> Mark.
>
> >
> > Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
> > ---
> >  drivers/misc/pvpanic.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/misc/pvpanic.c b/drivers/misc/pvpanic.c
> > index fd86dab..059005c 100644
> > --- a/drivers/misc/pvpanic.c
> > +++ b/drivers/misc/pvpanic.c
> > @@ -35,7 +35,7 @@
> >
> >  static const struct acpi_device_id pvpanic_device_ids[] = {
> >       { "QEMU0001", 0 },
> > -     { "", 0 },
> > +     { "", 0 }
> >  };
> >  MODULE_DEVICE_TABLE(acpi, pvpanic_device_ids);
> >
> > --
> > 1.8.3.1
> >



-- 
With Best Regards,
Andy Shevchenko
