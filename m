From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH v4 0/4] support watchdog with longer timeout period
Date: Tue, 5 May 2020 09:09:03 -0700
Message-ID: <ac2c580c-7cc0-8091-f3bc-fce175478e50@roeck-us.net>
References: <20200504141427.17685-1-michaelsh@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200504141427.17685-1-michaelsh-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Content-Language: en-US
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: michaelsh-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org, wim-Q8PRGTgFL9WUCWQAtAn6Ix2eb7JE58TQ@public.gmane.org, andy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org
Cc: linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, vadimp-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org
List-Id: platform-driver-x86.vger.kernel.org

On 5/4/20 7:14 AM, michaelsh-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org wrote:
> From: Michael Shych <michaelsh-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
> 
> This patchset adds support of extended new watchdog type 3 of Mellanox
> Ethernet and Infiniband switch systems.
> This type of watchdog can have a timeout period longer than 255 or 32 sec.
> as it was before.
> 
> Michael Shych (4):
>   platform_data/mlxreg: support new watchdog type with longer timeout
>     period
>   platform/x86: mlx-platform: support new watchdog type with longer
>     timeout
>   watchdog: mlx-wdt: support new watchdog type with longer timeout
>     period
>   docs: watchdog: mlx-wdt: Add description of new watchdog type 3
> 
>  Documentation/watchdog/mlx-wdt.rst   |  10 ++++
>  drivers/platform/x86/mlx-platform.c  | 106 ++++++++++++++++++++++++++++++
>  drivers/watchdog/mlx_wdt.c           |  73 ++++++++++++++++++++----
>  include/linux/platform_data/mlxreg.h |   5 +-
>  4 files changed, 182 insertions(+), 12 deletions(-)
> 
Guess the big question is now which branch to use to take this series.
Thoughts, anyone ?

Guenter
