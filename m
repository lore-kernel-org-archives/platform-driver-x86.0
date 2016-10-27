From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [patch v1 2/2] drivers/platform/x86: add mlxcpld-hotplug driver
 registration to mlx-platform driver
Date: Thu, 27 Oct 2016 17:03:39 +0300
Message-ID: <1477577019.5295.30.camel@linux.intel.com>
References: <1477576770-102060-1-git-send-email-vadimp@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1477576770-102060-1-git-send-email-vadimp@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: vadimp@mellanox.com, dvhart@infradead.org, fengguang.wu@intel.com
Cc: davem@davemloft.net, geert@linux-m68k.org, akpm@linux-foundation.org, kvalo@codeaurora.org, gregkh@linuxfoundation.org, mchehab@kernel.org, linux@roeck-us.net, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, jiri@resnulli.us
List-Id: platform-driver-x86.vger.kernel.org

On Thu, 2016-10-27 at 13:59 +0000, vadimp@mellanox.com wrote:
> From: Vadim Pasternak <vadimp@mellanox.com>

Care to fix that ^^^ ? (Hint: it shouldn't be there if author and
submitter is the same guy)


> Add calls for mlxcpld-hotplug platform driver
> registration/unregistration
> and add platform hotplug data configurations.

Would you provide more information what is done, where it is described
in the specs and how user can utilize the change?

> --- a/drivers/platform/x86/mlx-platform.c
> +++ b/drivers/platform/x86/mlx-platform.c
> @@ -37,8 +37,9 @@
>  #include <linux/i2c.h>
>  #include <linux/i2c-mux.h>
>  #include <linux/module.h>

> -#include <linux/platform_device.h>

This...

>  #include <linux/platform_data/i2c-mux-reg.h>
> +#include <linux/platform_data/mlxcpld-hotplug.h>


> +#include <linux/platform_device.h>

...and this doesn't belong to the patch.


-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
