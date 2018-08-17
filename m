From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: fix intel_punit_ipc.c build errors
Date: Fri, 17 Aug 2018 14:00:02 +0300
Message-ID: <CAHp75Vch70rk+zZ2wv=qjPzEDhAnqRBwBuDEU3x40=+fVZhF1g@mail.gmail.com>
References: <aee82dc5-cc0f-0698-04a8-a5857fce9791@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <aee82dc5-cc0f-0698-04a8-a5857fce9791@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd.bergmann@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Zha Qipeng <qipeng.zha@intel.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Aug 15, 2018 at 7:12 PM, Randy Dunlap <rdunlap@infradead.org> wrote:
> From: Randy Dunlap <rdunlap@infradead.org>
>
> Fix build errors by #including <linux/io.h>.
>
> ../drivers/platform/x86/intel_punit_ipc.c: In function 'ipc_read_status':
> ../drivers/platform/x86/intel_punit_ipc.c:55:2: error: implicit declaration of function 'readl' [-Werror=implicit-function-declaration]
>   return readl(ipcdev->base[type][BASE_IFACE]);
> ../drivers/platform/x86/intel_punit_ipc.c: In function 'ipc_write_cmd':
> ../drivers/platform/x86/intel_punit_ipc.c:60:2: error: implicit declaration of function 'writel' [-Werror=implicit-function-declaration]
>   writel(cmd, ipcdev->base[type][BASE_IFACE]);
>

Thanks, pushed to our for-next queue, with Fixes tag appended.

> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Zha Qipeng <qipeng.zha@intel.com>
> Cc: platform-driver-x86@vger.kernel.org
> ---
> Found in linux-next but applies to current mainline also.
>
>  drivers/platform/x86/intel_punit_ipc.c |    1 +
>  1 file changed, 1 insertion(+)
>
> --- linux-next-20180815.orig/drivers/platform/x86/intel_punit_ipc.c
> +++ linux-next-20180815/drivers/platform/x86/intel_punit_ipc.c
> @@ -18,6 +18,7 @@
>  #include <linux/bitops.h>
>  #include <linux/device.h>
>  #include <linux/interrupt.h>
> +#include <linux/io.h>
>  #include <linux/platform_device.h>
>  #include <asm/intel_punit_ipc.h>
>
>
>



-- 
With Best Regards,
Andy Shevchenko
