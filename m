From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH platform-next v2 03/10] Documentation/ABI: Add missed
 attribute for mlxreg-io sysfs interfaces
Date: Mon, 13 Jan 2020 16:12:50 +0200
Message-ID: <CAHp75VdFV5OZ=U8yiuDLsff8+swET8dtikrQo_8N6ZdvhC9Q=g@mail.gmail.com>
References: <20200112121849.7056-1-vadimp@mellanox.com> <20200112121849.7056-4-vadimp@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200112121849.7056-4-vadimp@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vadim Pasternak <vadimp@mellanox.com>
Cc: Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Sun, Jan 12, 2020 at 2:19 PM Vadim Pasternak <vadimp@mellanox.com> wrote:
>
> Add missed "cpld4_version" attribute.
>

Fixes tag?
Also see below.

...

> +What:          /sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/cpld4_version

> +

Can we get some consistency here, i.e. drop blank lines between What
and Date everywhere?
(Separate patch)

> +Date:          November 2018
> +KernelVersion: 5.0
> +Contact:       Vadim Pasternak <vadimpmellanox.com>
> +Description:   These files show with which CPLD versions have been burned
> +               on LED board.
> +
> +               The files are read only.
> +

...following by the starting each section with What keyword.

(Separate patch)

>  Date:          June 2019
>  KernelVersion: 5.3
>  Contact:       Vadim Pasternak <vadimpmellanox.com>


-- 
With Best Regards,
Andy Shevchenko
