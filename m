From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] Documentation/ABI: Correct mlxreg-io KernelVersion for 5.0
Date: Tue, 15 Jan 2019 07:58:49 +0200
Message-ID: <CAHp75Vf+ThbNZ10EB9Sx4tmm_sHJ5zqNF6mTB45tzJQOcD_68w@mail.gmail.com>
References: <a15008d9dcde1653c22393e64eb83a07d4750caa.1547353746.git.dvhart@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <a15008d9dcde1653c22393e64eb83a07d4750caa.1547353746.git.dvhart@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Darren Hart (VMware)" <dvhart@infradead.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Vadim Pasternak <vadimp@mellanox.com>
List-Id: platform-driver-x86.vger.kernel.org

On Sun, Jan 13, 2019 at 6:32 AM Darren Hart (VMware)
<dvhart@infradead.org> wrote:
>
> The mlxreg-io for the merge window assumed 4.21 as the next kernel
> version. Replace 4.21 with 5.0.
>

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Darren Hart (VMware) <dvhart@infradead.org>
> ---
>  Documentation/ABI/stable/sysfs-driver-mlxreg-io | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/ABI/stable/sysfs-driver-mlxreg-io b/Documentation/ABI/stable/sysfs-driver-mlxreg-io
> index 9b642669cb16..169fe08a649b 100644
> --- a/Documentation/ABI/stable/sysfs-driver-mlxreg-io
> +++ b/Documentation/ABI/stable/sysfs-driver-mlxreg-io
> @@ -24,7 +24,7 @@ What:         /sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/
>                                                         cpld3_version
>
>  Date:          November 2018
> -KernelVersion: 4.21
> +KernelVersion: 5.0
>  Contact:       Vadim Pasternak <vadimpmellanox.com>
>  Description:   These files show with which CPLD versions have been burned
>                 on LED board.
> @@ -35,7 +35,7 @@ What:         /sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/
>                                                         jtag_enable
>
>  Date:          November 2018
> -KernelVersion: 4.21
> +KernelVersion: 5.0
>  Contact:       Vadim Pasternak <vadimpmellanox.com>
>  Description:   These files enable and disable the access to the JTAG domain.
>                 By default access to the JTAG domain is disabled.
> @@ -105,7 +105,7 @@ What:               /sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/
>                                                 reset_voltmon_upgrade_fail
>
>  Date:          November 2018
> -KernelVersion: 4.21
> +KernelVersion: 5.0
>  Contact:       Vadim Pasternak <vadimpmellanox.com>
>  Description:   These files show the system reset cause, as following: ComEx
>                 power fail, reset from ComEx, system platform reset, reset
> --
> 2.17.2
>
>
> --
> Darren Hart
> VMware Open Source Technology Center



-- 
With Best Regards,
Andy Shevchenko
