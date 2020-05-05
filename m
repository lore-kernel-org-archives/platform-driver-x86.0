From: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 0/4] support watchdog with longer timeout period
Date: Tue, 5 May 2020 19:14:15 +0300
Message-ID: <CAHp75VdN6PfCCmRB_FssTRCoXms7JTt_af59pMqZNgV4ygz_8w@mail.gmail.com>
References: <20200504141427.17685-1-michaelsh@mellanox.com> <ac2c580c-7cc0-8091-f3bc-fce175478e50@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <ac2c580c-7cc0-8091-f3bc-fce175478e50-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: michaelsh-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org, Wim Van Sebroeck <wim-Q8PRGTgFL9WUCWQAtAn6Ix2eb7JE58TQ@public.gmane.org>, Andy Shevchenko <andy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Darren Hart <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Platform Driver <platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Vadim Pasternak <vadimp-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, May 5, 2020 at 7:09 PM Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org> wrote:
> On 5/4/20 7:14 AM, michaelsh-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org wrote:
> > From: Michael Shych <michaelsh-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>

> > Michael Shych (4):
> >   platform_data/mlxreg: support new watchdog type with longer timeout
> >     period
> >   platform/x86: mlx-platform: support new watchdog type with longer
> >     timeout
> >   watchdog: mlx-wdt: support new watchdog type with longer timeout
> >     period
> >   docs: watchdog: mlx-wdt: Add description of new watchdog type 3
> >
> >  Documentation/watchdog/mlx-wdt.rst   |  10 ++++
> >  drivers/platform/x86/mlx-platform.c  | 106 ++++++++++++++++++++++++++++++
> >  drivers/watchdog/mlx_wdt.c           |  73 ++++++++++++++++++++----
> >  include/linux/platform_data/mlxreg.h |   5 +-

> Guess the big question is now which branch to use to take this series.
> Thoughts, anyone ?

count(watchdog) = 8
count(platform) = 6

Thoughts?

-- 
With Best Regards,
Andy Shevchenko
