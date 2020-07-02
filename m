From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: not loading brightness_init
 when _BCL invalid
Date: Thu, 2 Jul 2020 13:59:31 +0300
Message-ID: <CAHp75Veqp_saX+VsijpLrihKMHiVH1W4o-3CYXNooOCu=YKtjA@mail.gmail.com>
References: <20200702085520.16901-1-aaron.ma@canonical.com>
 <CAHp75VeCHW=GMgyHRswsTrZ7b3TEnFh15F-5fyHcUsqXzoFS_g@mail.gmail.com> <2ecf4032-267c-32c8-361f-2396730aaa65@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2ecf4032-267c-32c8-361f-2396730aaa65@canonical.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Aaron Ma <aaron.ma@canonical.com>
Cc: mapengyu@gmail.com, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Thinkpad-acpi devel ML <ibm-acpi-devel@lists.sourceforge.net>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Jul 2, 2020 at 1:51 PM Aaron Ma <aaron.ma@canonical.com> wrote:
> On 7/2/20 5:30 PM, Andy Shevchenko wrote:
> > On Thu, Jul 2, 2020 at 11:55 AM Aaron Ma <aaron.ma@canonical.com> wrote:
> >>
> >> When _BCL invalid, disable thinkpad_acpi backlight brightness control.
> >>
> >> brightness_enable is already checked at the beginning,
> >
> >> Always print notice when enabled brightness control.
> >
> > Why?
> >
>
> Default brightness_enable = 2, so this message will always be printed as before
> Actually no change here.
>
> > ...
> >
> >> +       pr_notice("thinkpad_acpi native brightness control enabled\n");
> >
> > 'notice' level is quite high, why do we spam users with this?
> >
>
> Like above.
>
> Another reason is  most thinkpads are using native gpu driver to control
> brightness, notice when thinkpad_acpi brightness is enabled.

So, based on the above, please elaborate and explain all this in the
commit message of new version, thanks!

-- 
With Best Regards,
Andy Shevchenko
