From: Henrique de Moraes Holschuh <hmh-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>
Subject: Re: [PATCH 1/1] thinkpad_acpi: Add support for
 status (external cover) LED
Date: Tue, 7 Feb 2017 23:01:32 -0200
Message-ID: <20170208010132.GB7028@khazad-dum.debian.net>
References: <20170119172132.36029-1-agoode@google.com>
	<CAOf41Nka4UNk_XUegEXAOHE-Xf0eOs71fuZgBKr0PHEL9sGyag@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAOf41Nka4UNk_XUegEXAOHE-Xf0eOs71fuZgBKr0PHEL9sGyag-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
	<mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=ibm-acpi-devel>
List-Post: <mailto:ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
	<mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: Adam Goode <agoode-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: Darren Hart <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Henrique de Moraes Holschuh <ibm-acpi-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
List-Id: platform-driver-x86.vger.kernel.org

Hello Adam,

I apologise for the delay on answering you.

On Tue, 31 Jan 2017, Adam Goode wrote:
> On Thu, Jan 19, 2017 at 12:21 PM, Adam Goode <agoode-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org> wrote:
> > This allows the control of the red status LED, which is the dot of the "i"
> > in the word "ThinkPad" on the outside cover of newer models.
> >
> > In the manual, both this LED and the power LED are referred to as
> > the "system-status indicators" without distinction between the two, so
> > I chose "status" as the LED name.

I seem to recall this LED had an ACPI interface that was specific for
it, and allowed it to on/off/sine-wave?

> > Signed-off-by: Adam Goode <agoode-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
> >
> > diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/
> > thinkpad_acpi.c
> > index cacb43fb1df7..6577bf8e5635 100644
> > --- a/drivers/platform/x86/thinkpad_acpi.c
> > +++ b/drivers/platform/x86/thinkpad_acpi.c
> > @@ -5611,11 +5611,11 @@ static const char * const
> > tpacpi_led_names[TPACPI_LED_NUMLEDS] = {
> >         "tpacpi::standby",
> >         "tpacpi::dock_status1",
> >         "tpacpi::dock_status2",
> > -       "tpacpi::unknown_led2",
> > +       "tpacpi::status",
> >         "tpacpi::unknown_led3",
> >         "tpacpi::thinkvantage",
> >  };
> > -#define TPACPI_SAFE_LEDS       0x1081U
> > +#define TPACPI_SAFE_LEDS       0x1481U

What happens on older Lenovo models (x00, x10, x20 series?)?  I think
the T410 already had it...

Also, please add code to not export it to userspace (as a led class) on
IBM.

-- 
  Henrique Holschuh

------------------------------------------------------------------------------
Check out the vibrant tech community on one of the world's most
engaging tech sites, SlashDot.org! http://sdm.link/slashdot
