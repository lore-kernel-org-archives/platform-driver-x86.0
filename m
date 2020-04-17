From: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v1 0/4] support watchdog with longer timeout period
Date: Fri, 17 Apr 2020 16:41:52 +0300
Message-ID: <CAHp75VfZLR0an_bkD0vK6sTQSTcf_xHbAB0i7Qbod02gpV4tzg@mail.gmail.com>
References: <20200416163514.7334-1-michaelsh@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200416163514.7334-1-michaelsh-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: michaelsh-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org
Cc: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Wim Van Sebroeck <wim-Q8PRGTgFL9WUCWQAtAn6Ix2eb7JE58TQ@public.gmane.org>, Andy Shevchenko <andy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Darren Hart <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Platform Driver <platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Vadim Pasternak <vadimp-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Apr 16, 2020 at 7:35 PM <michaelsh-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org> wrote:
>
> From: Michael Shych <michaelsh-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
>
> This patchset adds support of extended new watchdog type 3 of Mellanox
> Ethernet and Infiniband switch systems.
> This type of watchdog can have a timeout period longer than 255 or 32 sec.
> as it was before.
>

Pushed to my review and testing queue, thanks!


> Michael Shych (4):
>   platform_data/mlxreg: support new watchdog type with longer timeout
>     period
>   platform/x86: mlx-platform: support new watchdog type with longer
>     timeout
>   watchdog: mlx-wdt: support new watchdog type with longer timeout
>     period
>   Documentation/watchdog: Add description of new watchdog type 3
>
>  Documentation/watchdog/mlx-wdt.rst   |   9 +++
>  drivers/platform/x86/mlx-platform.c  | 106 +++++++++++++++++++++++++++++++
>  drivers/watchdog/mlx_wdt.c           |  75 +++++++++++++++++++++----
>  include/linux/platform_data/mlxreg.h |   5 +-
>  4 files changed, 183 insertions(+), 12 deletions(-)
>
> --
> 2.11.0
>


-- 
With Best Regards,
Andy Shevchenko
