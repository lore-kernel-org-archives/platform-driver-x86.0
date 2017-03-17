From: sathyanarayanan kuppuswamy
        <sathyanarayanan.kuppuswamy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH v2 3/4] watchdog: iTCO_wdt: Fix PMC GCR memory mapping
 failure
Date: Fri, 17 Mar 2017 10:15:37 -0700
Message-ID: <0fdde9c6-a3c9-2d08-a6f2-0337ad4691f3@linux.intel.com>
References: <b89221c652d06c3c07fdf2ec32fd4fc8930c64df.1489710235.git.sathyanarayanan.kuppuswamy@linux.intel.com>
 <2c41b3b6344f9cb455ac57e1e41aa229adb2867d.1489710235.git.sathyanarayanan.kuppuswamy@linux.intel.com>
 <20170317114313.GE24582@rajaneesh-OptiPlex-9010>
Reply-To: sathyanarayanan.kuppuswamy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170317114313.GE24582@rajaneesh-OptiPlex-9010>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rajneesh Bhardwaj <rajneesh.bhardwaj-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: andy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, qipeng.zha-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, david.e.box-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org
List-Id: platform-driver-x86.vger.kernel.org

Hi Rajneesh,


On 03/17/2017 04:43 AM, Rajneesh Bhardwaj wrote:
> On Thu, Mar 16, 2017 at 05:41:35PM -0700, Kuppuswamy Sathyanarayanan wrote:
>> Currently, iTCO watchdog driver uses memory map to access
>> PMC_CFG GCR register. But the entire GCR address space is
>> already mapped in intel_scu_ipc driver. So remapping the
> intel_pmc_ipc driver.
Will fix it in next series.
>
>> GCR register in this driver causes the mem request failure in
>> iTCO_wdt probe function. This patch fixes this issue by
>> using PMC GCR read/write API's to access PMC_CFG register.
>>
>> Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
>> ---
>>   drivers/watchdog/iTCO_wdt.c | 31 +++++++------------------------
>>   1 file changed, 7 insertions(+), 24 deletions(-)
>>
>> diff --git a/drivers/watchdog/iTCO_wdt.c b/drivers/watchdog/iTCO_wdt.c
>> index 3d0abc0..31abfc5 100644
>> --- a/drivers/watchdog/iTCO_wdt.c
>> +++ b/drivers/watchdog/iTCO_wdt.c
>> @@ -68,6 +68,8 @@
>>   #include <linux/io.h>			/* For inb/outb/... */
>>   #include <linux/platform_data/itco_wdt.h>
>>   
>> +#include <asm/intel_pmc_ipc.h>
>> +
>>   #include "iTCO_vendor.h"
>>   
>>   /* Address definitions for the TCO */
>> @@ -94,12 +96,6 @@ struct iTCO_wdt_private {
>>   	unsigned int iTCO_version;
>>   	struct resource *tco_res;
>>   	struct resource *smi_res;
>> -	/*
>> -	 * NO_REBOOT flag is Memory-Mapped GCS register bit 5 (TCO version 2),
>> -	 * or memory-mapped PMC register bit 4 (TCO version 3).
>> -	 */
> Better to retain this comment elsewhere.
no_reboot_bit() function might be better place for this comment.
>
>> -	struct resource *gcs_pmc_res;
>> -	unsigned long __iomem *gcs_pmc;
>>   	/* the lock for io operations */
>>   	spinlock_t io_lock;
>>   	/* the PCI-device */
>> @@ -176,9 +172,9 @@ static void iTCO_wdt_set_NO_REBOOT_bit(struct iTCO_wdt_private *p)
>>   
>>   	/* Set the NO_REBOOT bit: this disables reboots */
>>   	if (p->iTCO_version >= 2) {
>> -		val32 = readl(p->gcs_pmc);
>> +		val32 = intel_pmc_gcr_read(PMC_GCR_PMC_CFG_REG);
> better to have protection and error handling, discussed in v2, 2/4.
>
> compiled and tested this on APL and i see iTCO_WDT driver loads fine. Since
> it impacts core WDT functionality, need to be thoroughly tested on various
> platforms.
I have tested it in Joule and it works fine. it would be nice if some 
one can verify it in non-atom platforms.
>
>> -- 
>> 2.7.4
>>

-- 
Sathyanarayanan Kuppuswamy
Android kernel developer

--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
