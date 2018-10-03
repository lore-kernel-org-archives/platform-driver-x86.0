From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] firmware: dcdbas: include linux/io.h
Date: Wed, 3 Oct 2018 14:20:01 +0300
Message-ID: <CAHp75VfJCZM8Ho3DLB1-xkhJJ=i+BACuvUY-6W-GuFa=iyZzcw@mail.gmail.com>
References: <20181002211651.2804717-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181002211651.2804717-1-arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Stuart Hayes <stuart.w.hayes@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Oct 3, 2018 at 12:17 AM Arnd Bergmann <arnd@arndb.de> wrote:
>
> memremap() is declared in linux/io.h, not in asm/io.h, so we should
> include that header to avoid build errors:
>
> drivers/platform/x86/dcdbas.c: In function 'dcdbas_check_wsmt':
> drivers/platform/x86/dcdbas.c:572:15: error: implicit declaration of function 'memremap'; did you mean 'ioremap'? [-Werror=implicit-function-declaration]
>   eps_buffer = memremap(eps->smm_comm_buff_addr, remap_size, MEMREMAP_WB);
>                ^~~~~~~~
>                ioremap
> drivers/platform/x86/dcdbas.c:572:61: error: 'MEMREMAP_WB' undeclared (first use in this function)
>   eps_buffer = memremap(eps->smm_comm_buff_addr, remap_size, MEMREMAP_WB);
>                                                              ^~~~~~~~~~~
> drivers/platform/x86/dcdbas.c:572:61: note: each undeclared identifier is reported only once for each function it appears in
> drivers/platform/x86/dcdbas.c: In function 'dcdbas_exit':
> drivers/platform/x86/dcdbas.c:748:3: error: implicit declaration of function 'memunmap'; did you mean 'vm_munmap'? [-Werror=implicit-function-declaration]
>

Pushed to for-next, sorry for inconveniences and thanks for the quick fix!

> Fixes: 12c956c4f32e ("firmware: dcdbas: Add support for WSMT ACPI table")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/platform/x86/dcdbas.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/dcdbas.c b/drivers/platform/x86/dcdbas.c
> index ae28e48ff7dc..daa7e3574568 100644
> --- a/drivers/platform/x86/dcdbas.c
> +++ b/drivers/platform/x86/dcdbas.c
> @@ -37,7 +37,7 @@
>  #include <linux/string.h>
>  #include <linux/types.h>
>  #include <linux/mutex.h>
> -#include <asm/io.h>
> +#include <linux/io.h>
>
>  #include "dcdbas.h"
>
> --
> 2.18.0
>


-- 
With Best Regards,
Andy Shevchenko
