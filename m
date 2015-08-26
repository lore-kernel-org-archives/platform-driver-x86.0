From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH] thinkpad_acpi: Remove side effects from vdbg_printk ->
 no_printk macro
Date: Wed, 26 Aug 2015 11:35:25 -0700
Message-ID: <1440614125.2780.33.camel@perches.com>
References: <1440612818.2780.24.camel@perches.com>
	 <1440613632.3433387.366841089.60E02F29@webmail.messagingengine.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1440613632.3433387.366841089.60E02F29@webmail.messagingengine.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: Darren Hart <dvhart@infradead.org>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, 2015-08-26 at 15:27 -0300, Henrique de Moraes Holschuh wrote:
> On Wed, Aug 26, 2015, at 15:13, Joe Perches wrote:
> > vdbg_printk when not using CONFIG_THINKPAD_ACPI_DEBUG uses
> > no_printk which produces no logging output but always
> > evaluates arguments.
> > 
> > Change the macro to surround the no_printk call with
> > 	do { if (0) no_printk(...); } while (0)
> > to avoid the unnecessary argument evaluations.
> > 
> > $ size drivers/platform/x86/thinkpad_acpi.o*
> >    text       data     bss     dec     hex filename
> >   60918      6184     824   67926   10956
> >   drivers/platform/x86/thinkpad_acpi.o.new
> >   60927      6184     824   67935   1095f
> >   drivers/platform/x86/thinkpad_acpi.o.old
> 
> The code size savings of this change are really small...

yup.  This is just an on-the-way patch to get
all the no_printk uses in a state that can
be converted more simply to a side-effect free
mechanism.

> > --- a/drivers/platform/x86/thinkpad_acpi.c
> > +++ b/drivers/platform/x86/thinkpad_acpi.c
> > @@ -402,7 +402,7 @@ static const char *str_supported(int is_supported);
> >  #else
> >  static inline const char *str_supported(int is_supported) { return ""; }
> >  #define vdbg_printk(a_dbg_level, format, arg...)        \
> > -       no_printk(format, ##arg)
> > +       do { if (0) no_printk(format, ##arg); } while (0)
> >  #endif
> 
> And won't this change disable compile-time checking of 'format ## arg'
> for issues?

No.  The call is still there so the compiler checks
the format/argument matches, but eliminates the
call and any side-effect calls from the object file.
