From: sathyanarayanan kuppuswamy
        <sathyanarayanan.kuppuswamy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [RFC v3 3/7] platform/x86: intel_pmc_ipc: Use regmap calls for
 GCR updates
Date: Tue, 3 Oct 2017 18:16:32 -0700
Message-ID: <5ba5b3d9-b55a-5834-04e5-b4b9a356dca7@linux.intel.com>
References: <cover.1504588701.git.sathyanarayanan.kuppuswamy@linux.intel.com>
 <5286489131571f149c6b75a8367ceb93cfe6e6be.1504588701.git.sathyanarayanan.kuppuswamy@linux.intel.com>
 <CAHp75VdGEf_e6mopQmFG5+Dv3X1f5TwV8cHn2CjA39USqN1JBw@mail.gmail.com>
Reply-To: sathyanarayanan.kuppuswamy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAHp75VdGEf_e6mopQmFG5+Dv3X1f5TwV8cHn2CjA39USqN1JBw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, "x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Ingo Molnar <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Zha Qipeng <qipeng.zha-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "H. Peter Anvin" <hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org>, "dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org" <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Andy Shevchenko <andy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Souvik Kumar Chakravarty <souvik.k.chakravarty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, linux-rtc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Platform Driver <platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sathyanarayanan Kuppuswamy Natarajan <sathyaosid-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

Hi Andy,


On 10/01/2017 07:48 AM, Andy Shevchenko wrote:
> On Tue, Sep 5, 2017 at 8:37 AM,
> <sathyanarayanan.kuppuswamy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org> wrote:
>> From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
>>
>> Currently, update_no_reboot_bit() function implemented in this driver
>> uses mutex_lock to protect its register updates. But this function is
>> called with in atomic context in iTCO_wdt_start() and iTCO_wdt_stop()
>> functions in iTCO_wdt.c driver, which in turn causes "sleeping into
>> atomic context" issue. This patch fixes this issue by refactoring the
>> current GCR read/write/update functions with regmap APIs.
> Since it sounds as candidate for stable,
Yes.
> can we have split it to just
> as less as possible intrusive fix + moving to regmap as a separate
> change?
If we have to split it into two patches then,

Patch #1 will fix the "sleep in atomic context issue" by replacing 
mutex_lock() with spin_lock()
in GCR read/write APIs to protect the GCR memory updates.
Patch #2 will remove GCR read/write/update APIs and replace it with 
regmap APIs. But along with this
change we will also remove the spin_lock() added in previous patch 
because regmap calls are already
protected by its own locking mechanism.

Since Patch #2 will clean up what we do in Patch #1, Do we need to split 
it into two patches?

> It should include Fixes: tag as well I suppose.
Agree. I will add Fixes tag in next version.
>
>> Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
>> ---
>>   drivers/platform/x86/Kconfig         |   1 +
>>   drivers/platform/x86/intel_pmc_ipc.c | 115 ++++++++++++-----------------------
>>   2 files changed, 40 insertions(+), 76 deletions(-)
>>
>> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
>> index 80b8795..45f4e79 100644
>> --- a/drivers/platform/x86/Kconfig
>> +++ b/drivers/platform/x86/Kconfig
>> @@ -1054,6 +1054,7 @@ config PVPANIC
>>   config INTEL_PMC_IPC
>>          tristate "Intel PMC IPC Driver"
>>          depends on ACPI
>> +       select REGMAP_MMIO
>>          ---help---
>>          This driver provides support for PMC control on some Intel platforms.
>>          The PMC is an ARC processor which defines IPC commands for communication
>> diff --git a/drivers/platform/x86/intel_pmc_ipc.c b/drivers/platform/x86/intel_pmc_ipc.c
>> index 021dcf6..40a25f8 100644
>> --- a/drivers/platform/x86/intel_pmc_ipc.c
>> +++ b/drivers/platform/x86/intel_pmc_ipc.c
>> @@ -31,9 +31,11 @@
>>   #include <linux/atomic.h>
>>   #include <linux/notifier.h>
>>   #include <linux/suspend.h>
>> +#include <linux/spinlock.h>
>>   #include <linux/acpi.h>
>>   #include <linux/io-64-nonatomic-lo-hi.h>
>>   #include <linux/mfd/core.h>
>> +#include <linux/regmap.h>
>>
>>   #include <asm/intel_pmc_ipc.h>
>>
>> @@ -125,7 +127,7 @@ static struct intel_pmc_ipc_dev {
>>
>>          /* gcr */
>>          void __iomem *gcr_mem_base;
>> -       bool has_gcr_regs;
>> +       struct regmap *gcr_regs;
>>
>>          /* Telemetry */
>>          u8 telem_res_inval;
>> @@ -150,6 +152,14 @@ static char *ipc_err_sources[] = {
>>                  "Unsigned kernel",
>>   };
>>
>> +static struct regmap_config gcr_regmap_config = {
>> +        .reg_bits = 32,
>> +        .reg_stride = 4,
>> +        .val_bits = 32,
>> +       .fast_io = true,
>> +       .max_register = PLAT_RESOURCE_GCR_SIZE,
>> +};
>> +
>>   /* Prevent concurrent calls to the PMC */
>>   static DEFINE_MUTEX(ipclock);
>>
>> @@ -183,21 +193,6 @@ static inline u32 ipc_data_readl(u32 offset)
>>          return readl(ipcdev.ipc_base + IPC_READ_BUFFER + offset);
>>   }
>>
>> -static inline u64 gcr_data_readq(u32 offset)
>> -{
>> -       return readq(ipcdev.gcr_mem_base + offset);
>> -}
>> -
>> -static inline int is_gcr_valid(u32 offset)
>> -{
>> -       if (!ipcdev.has_gcr_regs)
>> -               return -EACCES;
>> -
>> -       if (offset > PLAT_RESOURCE_GCR_SIZE)
>> -               return -EINVAL;
>> -
>> -       return 0;
>> -}
>>
>>   /**
>>    * intel_pmc_gcr_read() - Read PMC GCR register
>> @@ -210,21 +205,10 @@ static inline int is_gcr_valid(u32 offset)
>>    */
>>   int intel_pmc_gcr_read(u32 offset, u32 *data)
>>   {
>> -       int ret;
>> -
>> -       mutex_lock(&ipclock);
>> -
>> -       ret = is_gcr_valid(offset);
>> -       if (ret < 0) {
>> -               mutex_unlock(&ipclock);
>> -               return ret;
>> -       }
>> -
>> -       *data = readl(ipcdev.gcr_mem_base + offset);
>> -
>> -       mutex_unlock(&ipclock);
>> +       if (!ipcdev.gcr_regs)
>> +               return -EACCES;
>>
>> -       return 0;
>> +       return regmap_read(ipcdev.gcr_regs, offset, data);
>>   }
>>   EXPORT_SYMBOL_GPL(intel_pmc_gcr_read);
>>
>> @@ -240,21 +224,10 @@ EXPORT_SYMBOL_GPL(intel_pmc_gcr_read);
>>    */
>>   int intel_pmc_gcr_write(u32 offset, u32 data)
>>   {
>> -       int ret;
>> -
>> -       mutex_lock(&ipclock);
>> -
>> -       ret = is_gcr_valid(offset);
>> -       if (ret < 0) {
>> -               mutex_unlock(&ipclock);
>> -               return ret;
>> -       }
>> -
>> -       writel(data, ipcdev.gcr_mem_base + offset);
>> -
>> -       mutex_unlock(&ipclock);
>> +       if (!ipcdev.gcr_regs)
>> +               return -EACCES;
>>
>> -       return 0;
>> +       return regmap_write(ipcdev.gcr_regs, offset, data);
>>   }
>>   EXPORT_SYMBOL_GPL(intel_pmc_gcr_write);
>>
>> @@ -271,33 +244,10 @@ EXPORT_SYMBOL_GPL(intel_pmc_gcr_write);
>>    */
>>   int intel_pmc_gcr_update(u32 offset, u32 mask, u32 val)
>>   {
>> -       u32 new_val;
>> -       int ret = 0;
>> -
>> -       mutex_lock(&ipclock);
>> -
>> -       ret = is_gcr_valid(offset);
>> -       if (ret < 0)
>> -               goto gcr_ipc_unlock;
>> -
>> -       new_val = readl(ipcdev.gcr_mem_base + offset);
>> -
>> -       new_val &= ~mask;
>> -       new_val |= val & mask;
>> -
>> -       writel(new_val, ipcdev.gcr_mem_base + offset);
>> -
>> -       new_val = readl(ipcdev.gcr_mem_base + offset);
>> -
>> -       /* check whether the bit update is successful */
>> -       if ((new_val & mask) != (val & mask)) {
>> -               ret = -EIO;
>> -               goto gcr_ipc_unlock;
>> -       }
>> +       if (!ipcdev.gcr_regs)
>> +               return -EACCES;
>>
>> -gcr_ipc_unlock:
>> -       mutex_unlock(&ipclock);
>> -       return ret;
>> +       return regmap_update_bits(ipcdev.gcr_regs, offset, mask, val);
>>   }
>>   EXPORT_SYMBOL_GPL(intel_pmc_gcr_update);
>>
>> @@ -776,16 +726,24 @@ static int ipc_plat_get_res(struct platform_device *pdev)
>>   int intel_pmc_s0ix_counter_read(u64 *data)
>>   {
>>          u64 deep, shlw;
>> +       int ret;
>>
>> -       if (!ipcdev.has_gcr_regs)
>> +       if (!ipcdev.gcr_regs)
>>                  return -EACCES;
>>
>> -       deep = gcr_data_readq(PMC_GCR_TELEM_DEEP_S0IX_REG);
>> -       shlw = gcr_data_readq(PMC_GCR_TELEM_SHLW_S0IX_REG);
>> +       ret = regmap_bulk_read(ipcdev.gcr_regs, PMC_GCR_TELEM_DEEP_S0IX_REG,
>> +                       &deep, 2);
>> +       if (ret)
>> +               return ret;
>> +
>> +       ret = regmap_bulk_read(ipcdev.gcr_regs, PMC_GCR_TELEM_SHLW_S0IX_REG,
>> +                       &shlw, 2);
>> +       if (ret)
>> +               return ret;
>>
>>          *data = S0IX_RESIDENCY_IN_USECS(deep, shlw);
>>
>> -       return 0;
>> +       return ret;
>>   }
>>   EXPORT_SYMBOL_GPL(intel_pmc_s0ix_counter_read);
>>
>> @@ -817,6 +775,13 @@ static int ipc_plat_probe(struct platform_device *pdev)
>>                  return ret;
>>          }
>>
>> +        ipcdev.gcr_regs = devm_regmap_init_mmio_clk(ipcdev.dev, NULL,
>> +                       ipcdev.gcr_mem_base, &gcr_regmap_config);
>> +        if (IS_ERR(ipcdev.gcr_regs)) {
>> +                dev_err(ipcdev.dev, "gcr_regs regmap init failed\n");
>> +                return PTR_ERR(ipcdev.gcr_regs);;
>> +        }
>> +
>>          ret = ipc_create_pmc_devices(pdev);
>>          if (ret) {
>>                  dev_err(&pdev->dev, "Failed to create pmc devices\n");
>> @@ -836,8 +801,6 @@ static int ipc_plat_probe(struct platform_device *pdev)
>>                  return ret;
>>          }
>>
>> -       ipcdev.has_gcr_regs = true;
>> -
>>          return 0;
>>   }
>>
>> --
>> 2.7.4
>>
>
>

-- 
Sathyanarayanan Kuppuswamy
Linux kernel developer

--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
