From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH v4 4/4] docs: watchdog: mlx-wdt: Add description of new
 watchdog type 3
Date: Tue, 5 May 2020 09:08:00 -0700
Message-ID: <e85001c3-052e-e0e1-4653-4594d3570b94@roeck-us.net>
References: <20200504141427.17685-1-michaelsh@mellanox.com>
 <20200504141427.17685-5-michaelsh@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200504141427.17685-5-michaelsh-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Content-Language: en-US
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: michaelsh-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org, wim-Q8PRGTgFL9WUCWQAtAn6Ix2eb7JE58TQ@public.gmane.org, andy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org
Cc: linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, vadimp-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org
List-Id: platform-driver-x86.vger.kernel.org

On 5/4/20 7:14 AM, michaelsh-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org wrote:
> From: Michael Shych <michaelsh-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
> 
> Add documentation with details of new type of Mellanox watchdog driver.
> 
> Signed-off-by: Michael Shych <michaelsh-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
> Reviewed-by: Vadim Pasternak <vadimp-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>

Acked-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>

> ---
> v1-v2:
> Add explanation about device registers order
> ---
> v2-v3:
> Remove note about cpu_to_le16 and vice versa conversion
> ---
>  Documentation/watchdog/mlx-wdt.rst | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/watchdog/mlx-wdt.rst b/Documentation/watchdog/mlx-wdt.rst
> index bf5bafac47f0..35e690dea9db 100644
> --- a/Documentation/watchdog/mlx-wdt.rst
> +++ b/Documentation/watchdog/mlx-wdt.rst
> @@ -24,10 +24,19 @@ Type 2:
>    Maximum timeout is 255 sec.
>    Get time-left is supported.
>  
> +Type 3:
> +  Same as Type 2 with extended maximum timeout period.
> +  Maximum timeout is 65535 sec.
> +
>  Type 1 HW watchdog implementation exist in old systems and
>  all new systems have type 2 HW watchdog.
>  Two types of HW implementation have also different register map.
>  
> +Type 3 HW watchdog implementation can exist on all Mellanox systems
> +with new programmer logic device.
> +It's differentiated by WD capability bit.
> +Old systems still have only one main watchdog.
> +
>  Mellanox system can have 2 watchdogs: main and auxiliary.
>  Main and auxiliary watchdog devices can be enabled together
>  on the same system.
> @@ -54,3 +63,4 @@ The driver checks during initialization if the previous system reset
>  was done by the watchdog. If yes, it makes a notification about this event.
>  
>  Access to HW registers is performed through a generic regmap interface.
> +Programmable logic device registers have little-endian order.
> 
