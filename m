From: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: add
 unsafe_leds parameter
Date: Mon, 29 Oct 2018 16:07:12 +0200
Message-ID: <CAHp75VfoogP8N0u7fzW7Xo3moSQxseAtFSu7H-yv6MczFFdakg@mail.gmail.com>
References: <CAGiEHCtu9-chj_wN1wau4aBzvcCR8Bmq1-2OZiHq0yqz3=BUSA@mail.gmail.com>
 <CAHp75Ve+Z5W=6SNx3eB1MrH=wDPTe9bjQGQ3tEGi9wYCXKD0Pg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
In-Reply-To: <CAHp75Ve+Z5W=6SNx3eB1MrH=wDPTe9bjQGQ3tEGi9wYCXKD0Pg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=ibm-acpi-devel>
List-Post: <mailto:ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: milahu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Darren Hart <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Henrique de Moraes Holschuh <ibm-acpi-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>
Cc: ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, Platform Driver <platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

Ah, last but not least, you forgot to include subsystem/driver
maintainers in the Cc list (in my mailbox it's even got directly to a
spam).

On Mon, Oct 29, 2018 at 4:05 PM Andy Shevchenko
<andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
> On Sat, Oct 27, 2018 at 9:15 PM Milan Hauth <milahu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
> Thank you for the patch. I have few comments here.
>
> >
> > move CONFIG_THINKPAD_ACPI_UNSAFE_LEDS compile config
> > to thinkpad_acpi.unsafe_leds module parameter
> >
> > so there is no more need to re-compile
> > to control important LEDs, which is unsafe
>
> First of all, please use normal English writing, i.e. Capitalize
> sentences, use proper punctuation like commas and periods.
> Second, check your mail clients and software, patch is broken and
> can't be applied.
>
> See my further comments below.
>
> >
> > Signed-off-by: Milan Hauth <milahu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >
> > ---
> >
> > usage
> >
> > echo 'options thinkpad_acpi unsafe_leds=Y' \
> > | sudo tee /etc/modprobe.d/thinkpad_acpi-unsafe_leds.conf
> >
> > for ((i=0;i<=15;i=i+1)); do echo "$i off" | sudo tee /proc/acpi/ibm/led; done
> >
> > this will only disable power, battery, standby, dock LEDs
> > but will keep wifi, bluetooth, harddrive, AC power LEDs [and maybe more]
>
>
> This has to be a part of Documentation.
>
> > references
> >
> > [SOLVED] ThinkPad LED's control / Laptop Issues / Arch Linux Forums
> > https://bbs.archlinux.org/viewtopic.php?id=177337#p1384354
> >
> > thinkpad-acpi: restrict access to some firmware LEDs
> > commit a4d5effcc73749ee3ebbf578d162905e6fa4e07d
> > date 2009-04-04
>
> This should be part of commit message in a form of plain text and/or
> specific tags (BugLink, Fixes).
>
> > --- a/drivers/platform/x86/thinkpad_acpi.c
> > +++ b/drivers/platform/x86/thinkpad_acpi.c
> > @@ -88,6 +88,27 @@
> >  #include <linux/uaccess.h>
> >  #include <acpi/battery.h>
> >  #include <acpi/video.h>
> > +#include <linux/moduleparam.h>
> > +
> > +/* parameters for module thinkpad_acpi */
> > +
> > +/*
> > + * parameter unsafe_leds
> > + *
> > + * Allow control of important LEDs? (unsafe)
> > + *   N = no [default]
> > + *   Y = yes
> > + *
> > + * docs:
> > + *   Documentation/laptops/thinkpad-acpi.txt
> > + * section 'LED control'
> > + *
> > + * moved from compile config
> > + *   CONFIG_THINKPAD_ACPI_UNSAFE_LEDS
> > + */
> > +static bool unsafe_leds = false;
> > +module_param(unsafe_leds, bool, S_IRUSR | S_IWUSR | S_IRGRP | S_IWGRP);
> > +MODULE_PARM_DESC(unsafe_leds, "Allow control of important LEDs? (unsafe)");
>
> We are not accepting new module parameters without a very strong argument.
> Here I don't see why it can't be a sysfs node which enables this
> behaviour (or disables) at run time.
>
> (Note: if you introduce a sysfs node you need to add a proper ABI
> subsection to Documentation)
>
> >
> >  /* ThinkPad CMOS commands */
> >  #define TP_CMOS_VOLUME_DOWN    0
> > @@ -5754,11 +5775,10 @@ static const char * const tpacpi_led_nam
> >
> >  static inline bool tpacpi_is_led_restricted(const unsigned int led)
> >  {
> > -#ifdef CONFIG_THINKPAD_ACPI_UNSAFE_LEDS
> > -       return false;
> > -#else
> > -       return (1U & (TPACPI_SAFE_LEDS >> led)) == 0;
> > -#endif
>
> > +       if (unsafe_leds)
> > +               return false;
> > +       else
> > +               return (1U & (TPACPI_SAFE_LEDS >> led)) == 0;
>
> return unsafe_leds ? false : ...;
>
> But this, perhaps, will be modified when switching to sysfs.
>
> >  }
> >
> >  static int led_get_status(const unsigned int led)
> > @@ -6048,9 +6068,9 @@ static int __init led_init(struct ibm_in
> >                 }
> >         }
> >
> > -#ifdef CONFIG_THINKPAD_ACPI_UNSAFE_LEDS
> > -       pr_notice("warning: userspace override of important firmware LEDs is
> > enabled\n");
> > -#endif
> > +       if (unsafe_leds)
> > +               pr_notice("warning: userspace override of important firmware LEDs
> > is enabled\n");
> > +
> >         return 0;
> >  }
> >
> >
> > --- a/drivers/platform/x86/Kconfig
> > +++ b/drivers/platform/x86/Kconfig
> > @@ -507,29 +507,6 @@ config THINKPAD_ACPI_DEBUG
> >
> >           If you are not sure, say N here.
> >
> > -config THINKPAD_ACPI_UNSAFE_LEDS
>
> People, who are using this option will be surprised by a changed behaviour.
> So, please leave it and use as enforcement of the _initial_ value.
>
> > -       bool "Allow control of important LEDs (unsafe)"
> > -       depends on THINKPAD_ACPI
> > -       ---help---
> > -         Overriding LED state on ThinkPads can mask important
> > -         firmware alerts (like critical battery condition), or misled
> > -         the user into damaging the hardware (undocking or ejecting
> > -         the bay while buses are still active), etc.
> > -
> > -         LED control on the ThinkPad is write-only (with very few
> > -         exceptions on very ancient models), which makes it
> > -         impossible to know beforehand if important information will
> > -         be lost when one changes LED state.
> > -
> > -         Users that know what they are doing can enable this option
> > -         and the driver will allow control of every LED, including
> > -         the ones on the dock stations.
> > -
> > -         Never enable this option on a distribution kernel.
> > -
> > -         Say N here, unless you are building a kernel for your own
> > -         use, and need to control the important firmware LEDs.
> > -
> >  config THINKPAD_ACPI_VIDEO
> >         bool "Video output control support"
> >         depends on THINKPAD_ACPI
> >
> > --- a/Documentation/laptops/thinkpad-acpi.txt
> > +++ b/Documentation/laptops/thinkpad-acpi.txt
> > @@ -740,8 +740,8 @@ buses are still active), or mask an impo
> >  empty battery, or a broken battery), access to most LEDs is
> >  restricted.
> >
> > -Unrestricted access to all LEDs requires that thinkpad-acpi be
> > -compiled with the CONFIG_THINKPAD_ACPI_UNSAFE_LEDS option enabled.
> > +Unrestricted access to all LEDs requires setting the parameter
> > +thinkpad_acpi.unsafe_leds to Y.
> >  Distributions must never enable this option.  Individual users that
> >  are aware of the consequences are welcome to enabling it.
>
>
>
> --
> With Best Regards,
> Andy Shevchenko



-- 
With Best Regards,
Andy Shevchenko
