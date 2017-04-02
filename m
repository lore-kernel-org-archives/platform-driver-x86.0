From: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 1/5] platform/x86: intel_pmc_ipc: fix gcr offset
Date: Sun, 2 Apr 2017 17:11:08 +0300
Message-ID: <CAHp75Vf3bq7cGUmi2Oi_TkvkCTzJ1QDmKUoTXmJgkgbxUE+UfA@mail.gmail.com>
References: <20170331133728.GA23725@rajaneesh-OptiPlex-9010> <e537ff68732d86418982349624fd6de741bccc9b.1491002056.git.sathyanarayanan.kuppuswamy@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <e537ff68732d86418982349624fd6de741bccc9b.1491002056.git.sathyanarayanan.kuppuswamy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: Andy Shevchenko <andy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Zha Qipeng <qipeng.zha-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org" <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, sathyaosid-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, David Box <david.e.box-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Rajneesh Bhardwaj <rajneesh.bhardwaj-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Platform Driver <platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: platform-driver-x86.vger.kernel.org

On Sat, Apr 1, 2017 at 2:27 AM, Kuppuswamy Sathyanarayanan
<sathyanarayanan.kuppuswamy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org> wrote:
> According to Broxton APL PMC spec, gcr mem region starts
> at offset 0x1000 from ipc mem base address. In this driver,
> PLAT_RESOURCE_GCR_OFFSET macro defines the offset of GCR
> memory region from IPC mem region. So we should use 0x1000(4K)
> as GCR offset. But currently this driver uses 0x1008 as GCT
> offset.This patch fixes this issue.


So, if I apply this one independently, would it fix an existin issue?

>
> Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> ---
>  drivers/platform/x86/intel_pmc_ipc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> Changes since v3:
>  * Updated the commit history
>
> diff --git a/drivers/platform/x86/intel_pmc_ipc.c b/drivers/platform/x86/intel_pmc_ipc.c
> index 0651d47..0a33592 100644
> --- a/drivers/platform/x86/intel_pmc_ipc.c
> +++ b/drivers/platform/x86/intel_pmc_ipc.c
> @@ -82,7 +82,7 @@
>  /* exported resources from IFWI */
>  #define PLAT_RESOURCE_IPC_INDEX                0
>  #define PLAT_RESOURCE_IPC_SIZE         0x1000
> -#define PLAT_RESOURCE_GCR_OFFSET       0x1008
> +#define PLAT_RESOURCE_GCR_OFFSET       0x1000
>  #define PLAT_RESOURCE_GCR_SIZE         0x1000
>  #define PLAT_RESOURCE_BIOS_DATA_INDEX  1
>  #define PLAT_RESOURCE_BIOS_IFACE_INDEX 2
> --
> 2.7.4
>



-- 
With Best Regards,
Andy Shevchenko
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
