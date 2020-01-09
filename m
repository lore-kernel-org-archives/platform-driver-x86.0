From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH platform-next v1 2/9] Documentation/ABI: Fix attributes
 for mlxreg-io sysfs interfaces
Date: Thu, 9 Jan 2020 17:14:18 +0200
Message-ID: <CAHp75Veu7PhR0FiufXM2R=dU4vLmeL5sf3kuVi2g=NZSw3L6OA@mail.gmail.com>
References: <20191231102917.24181-1-vadimp@mellanox.com> <20191231102917.24181-3-vadimp@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191231102917.24181-3-vadimp@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vadim Pasternak <vadimp@mellanox.com>
Cc: Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Dec 31, 2019 at 12:29 PM Vadim Pasternak <vadimp@mellanox.com> wrote:
>
> Fix attribute name from "jtag_enable" to "cpld3_version" and
> extend description for "cpld3_version" attribute.
>
> Add missed "cpld4_version" attribute.
>

From this commit message it's still unclear if we have had the ABI
change or Documentation inconsistency.

> Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
> ---
>  Documentation/ABI/stable/sysfs-driver-mlxreg-io | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/ABI/stable/sysfs-driver-mlxreg-io b/Documentation/ABI/stable/sysfs-driver-mlxreg-io
> index 8ca498447aeb..fe30fe505c9b 100644
> --- a/Documentation/ABI/stable/sysfs-driver-mlxreg-io
> +++ b/Documentation/ABI/stable/sysfs-driver-mlxreg-io
> @@ -29,13 +29,13 @@ Description:        This file shows the system fans direction:
>
>                 The files are read only.
>
> -What:          /sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/jtag_enable
> +What:          /sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/cpld3_version
>
>  Date:          November 2018
>  KernelVersion: 5.0
>  Contact:       Vadim Pasternak <vadimpmellanox.com>
>  Description:   These files show with which CPLD versions have been burned
> -               on LED board.
> +               on LED or Gearbox board.
>
>                 The files are read only.
>
> @@ -121,6 +121,16 @@ Description:       These files show the system reset cause, as following: ComEx
>
>                 The files are read only.
>
> +What:          /sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/cpld4_version
> +
> +Date:          November 2018
> +KernelVersion: 5.0
> +Contact:       Vadim Pasternak <vadimpmellanox.com>
> +Description:   These files show with which CPLD versions have been burned
> +               on LED board.
> +
> +               The files are read only.
> +
>  Date:          June 2019
>  KernelVersion: 5.3
>  Contact:       Vadim Pasternak <vadimpmellanox.com>
> --
> 2.11.0
>


-- 
With Best Regards,
Andy Shevchenko
