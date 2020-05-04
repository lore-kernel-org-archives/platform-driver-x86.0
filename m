From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH v3 0/4] support watchdog with longer timeout period
Date: Mon, 4 May 2020 06:39:45 -0700
Message-ID: <20200504133945.GA86470@roeck-us.net>
References: <20200503053424.31943-1-michaelsh@mellanox.com>
 <CAHp75Vff-xe06L1xOc9jMii+kEPJZzmiPBFPVMkeD46v0QW+hw@mail.gmail.com>
 <AM6PR05MB6168FA74FF9554A3E33601D1D9A90@AM6PR05MB6168.eurprd05.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <AM6PR05MB6168FA74FF9554A3E33601D1D9A90-jHMdEEEsG3MP6j+F601k99qRiQSDpxhJvxpqHgZTriW3zl9H0oFU5g@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Shych <michaelsh-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Cc: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Wim Van Sebroeck <wim-Q8PRGTgFL9WUCWQAtAn6Ix2eb7JE58TQ@public.gmane.org>, Andy Shevchenko <andy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Darren Hart <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, "linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Platform Driver <platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Vadim Pasternak <vadimp-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

On Sun, May 03, 2020 at 04:13:54PM +0000, Michael Shych wrote:
> 
> 
> > -----Original Message-----
> > From: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > Sent: Sunday, May 3, 2020 7:11 PM
> > To: Michael Shych <michaelsh-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
> > Cc: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>; Wim Van Sebroeck <wim@linux-
> > watchdog.org>; Andy Shevchenko <andy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>; Darren Hart
> > <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>; linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Platform Driver
> > <platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>; Vadim Pasternak
> > <vadimp-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
> > Subject: Re: [PATCH v3 0/4] support watchdog with longer timeout period
> > 
> > On Sun, May 3, 2020 at 8:34 AM <michaelsh-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org> wrote:
> > >
> > > From: Michael Shych <michaelsh-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
> > >
> > > This patchset adds support of extended new watchdog type 3 of Mellanox
> > > Ethernet and Infiniband switch systems.
> > > This type of watchdog can have a timeout period longer than 255 or 32 sec.
> > > as it was before.
> > >
> > 
> > If you ignore my tags, why are you bothering about changes at all?
> 
> Sorry that I missed it.
> Should I resend this patchset?
> If yes, as still v3 or new one v4?
> 
If you resend as v3 but make changes, how do you expect the maintainers
to know which v3 is the correct one ?

Guenter

> > 
> > > Michael Shych (4):
> > >   platform_data/mlxreg: support new watchdog type with longer timeout
> > >     period
> > >   platform/x86: mlx-platform: support new watchdog type with longer
> > >     timeout
> > >   watchdog: mlx-wdt: support new watchdog type with longer timeout
> > >     period
> > >   docs: watchdog: mlx-wdt: Add description of new watchdog type 3
> > >
> > >  Documentation/watchdog/mlx-wdt.rst   |  10 ++++
> > >  drivers/platform/x86/mlx-platform.c  | 106
> > ++++++++++++++++++++++++++++++
> > >  drivers/watchdog/mlx_wdt.c           |  73 ++++++++++++++++++++----
> > >  include/linux/platform_data/mlxreg.h |   5 +-
> > >  4 files changed, 182 insertions(+), 12 deletions(-)
> > >
> > > --
> > > 2.11.0
> > >
> > 
> > 
> > --
> > With Best Regards,
> > Andy Shevchenko
