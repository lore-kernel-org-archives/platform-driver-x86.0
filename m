From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] Remove ambiguous logging for "Unsupported brightness
 interface"
Date: Sun, 7 Feb 2016 12:13:24 -0800
Message-ID: <20160207201324.GH1779@malice.jf.intel.com>
References: <CANpvso5_jzOgRv25isy0x6HJcTgKP4dabSH-_a5fM-uihdAUYw@mail.gmail.com>
 <1453937211.10099.31.camel@perches.com>
 <20160130122045.GA14919@khazad-dum.debian.net>
 <CANpvso5wg_Zz7VSRDeKamx0XCCcjr3y+i2UKNFLe+BZEofEG_A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:43271 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754080AbcBGUN2 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 7 Feb 2016 15:13:28 -0500
Content-Disposition: inline
In-Reply-To: <CANpvso5wg_Zz7VSRDeKamx0XCCcjr3y+i2UKNFLe+BZEofEG_A@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Eric Curtin <ericcurtin17@gmail.com>
Cc: Henrique de Moraes Holschuh <hmh@hmh.eng.br>, Joe Perches <joe@perches.com>, platform-driver-x86@vger.kernel.org, Kernel development list <linux-kernel@vger.kernel.org>, ibm-acpi-devel@lists.sourceforge.net

On Sat, Jan 30, 2016 at 04:55:59PM +0000, Eric Curtin wrote:
> On 30 January 2016 at 12:20, Henrique de Moraes Holschuh <hmh@hmh.eng.br> wrote:
> > On Wed, 27 Jan 2016, Joe Perches wrote:
> >> On Wed, 2016-01-27 at 22:14 +0000, Eric Curtin wrote:
> >> > Message gets logged on machines that are well supported.
> >> >
> >> > Signed-off-by: Eric Curtin <ericcurtin17@gmail.com>
> >> > ---
> >> >  drivers/platform/x86/thinkpad_acpi.c | 1 -
> >> >  1 file changed, 1 deletion(-)
> >> >
> >> > diff --git a/drivers/platform/x86/thinkpad_acpi.c
> >> > b/drivers/platform/x86/thinkpad_acpi.c
> >> > index a268a7a..4eb41aa 100644
> >> > --- a/drivers/platform/x86/thinkpad_acpi.c
> >> > +++ b/drivers/platform/x86/thinkpad_acpi.c
> >> > @@ -6661,7 +6661,6 @@ static void __init
> >> > tpacpi_detect_brightness_capabilities(void)
> >> >                 pr_info("detected a 8-level brightness capable
> >> > ThinkPad\n");
> >> >                 break;
> >> >         default:
> >> > -               pr_info("Unsupported brightness interface\n");
> >> >                 tp_features.bright_unkfw = 1;
> >> >                 bright_maxlvl = b - 1;
> >> >         }
> >>
> >> Perhaps this should be something like this instead:
> >> ---
> >>  drivers/platform/x86/thinkpad_acpi.c | 4 +---
> >>  1 file changed, 1 insertion(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> >> index a268a7a..bd12c71 100644
> >> --- a/drivers/platform/x86/thinkpad_acpi.c
> >> +++ b/drivers/platform/x86/thinkpad_acpi.c
> >> @@ -6653,18 +6653,16 @@ static void __init tpacpi_detect_brightness_capabilities(void)
> >>       switch (b) {
> >>       case 16:
> >>               bright_maxlvl = 15;
> >> -             pr_info("detected a 16-level brightness capable ThinkPad\n");
> >>               break;
> >>       case 8:
> >>       case 0:
> >>               bright_maxlvl = 7;
> >> -             pr_info("detected a 8-level brightness capable ThinkPad\n");
> >>               break;
> >>       default:
> >> -             pr_info("Unsupported brightness interface\n");
> >>               tp_features.bright_unkfw = 1;
> >>               bright_maxlvl = b - 1;
> >>       }
> >> +     pr_info("detected %u brightness levels\n", bright_maxlvl + 1);
> >>  }
> >
> > This can be made pr_debug, since we're touching it...
> >
> > --
> >   "One disk to rule them all, One disk to find them. One disk to bring
> >   them all and in the darkness grind them. In the Land of Redmond
> >   where the shadows lie." -- The Silicon Valley Tarot
> >   Henrique Holschuh
> 
> "Unsupported brightness interface" message gets logged on
>  machines that are well supported.
> 
> Signed-off-by: Eric Curtin <ericcurtin17@gmail.com>
> ---
>  drivers/platform/x86/thinkpad_acpi.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c
> b/drivers/platform/x86/thinkpad_acpi.c
> index a268a7a..e305ab5 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -6653,18 +6653,16 @@ static void __init
> tpacpi_detect_brightness_capabilities(void)
>         switch (b) {
>         case 16:
>                 bright_maxlvl = 15;
> -               pr_info("detected a 16-level brightness capable ThinkPad\n");
>                 break;
>         case 8:
>         case 0:
>                 bright_maxlvl = 7;
> -               pr_info("detected a 8-level brightness capable ThinkPad\n");
>                 break;
>         default:
> -               pr_info("Unsupported brightness interface\n");
>                 tp_features.bright_unkfw = 1;
>                 bright_maxlvl = b - 1;
>         }
> +       pr_debug("detected %u brightness levels\n", bright_maxlvl + 1);

This patch is malformed, has whitespace issues, and doesn't apply. Please apply
all patches before sending them to the list.

Given it's trivial, I made the change manually and have queued this up to the
testing branch.

Thanks,

-- 
Darren Hart
Intel Open Source Technology Center
