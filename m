From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v1 2/2] platform/x86: intel_pmc_ipc: Use regmap calls for
 GCR updates
Date: Fri, 26 Jan 2018 18:18:28 +0200
Message-ID: <CAHp75VeEXwD8mwrnmWhPmKbMxdCuyXCRags9t6xM7MBeUoQ+Og@mail.gmail.com>
References: <fc6780c09de2218908db79fe5d77919710155a74.1516913386.git.sathyanarayanan.kuppuswamy@linux.intel.com>
 <a849fe8950935fbe078731b0d475ffbc9eb1d365.1516913386.git.sathyanarayanan.kuppuswamy@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <a849fe8950935fbe078731b0d475ffbc9eb1d365.1516913386.git.sathyanarayanan.kuppuswamy@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Zha Qipeng <qipeng.zha@intel.com>, "Krogerus, Heikki" <heikki.krogerus@linux.intel.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Sathyanarayanan Kuppuswamy Natarajan <sathyaosid@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Jan 26, 2018 at 12:53 AM,
<sathyanarayanan.kuppuswamy@linux.intel.com> wrote:
> From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
>
> This patch adds support for regmap based implementation for GCR
> read/write/update APIs.
>

Thanks. On the first glance this one looks okay.

> Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
> ---
>  drivers/platform/x86/Kconfig         |   1 +
>  drivers/platform/x86/intel_pmc_ipc.c | 124 +++++++++++++----------------------
>  2 files changed, 46 insertions(+), 79 deletions(-)
>
> This patch was originally part of "SCU/PMC/PUNIT IPC driver clean up" series. But I have
> split them into two sets because we need more thorough review on generic IPC driver
> design patches (second set).
>
> https://www.spinics.net/lists/linux-watchdog/msg12796.html
>
> Changes since previous set version (v8):
>  * Removed gcr_mem_base variable.
>
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 2c745e8..ac618fd 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -1087,6 +1087,7 @@ config PVPANIC
>  config INTEL_PMC_IPC
>         tristate "Intel PMC IPC Driver"
>         depends on ACPI
> +       select REGMAP_MMIO
>         ---help---
>         This driver provides support for PMC control on some Intel platforms.
>         The PMC is an ARC processor which defines IPC commands for communication
> diff --git a/drivers/platform/x86/intel_pmc_ipc.c b/drivers/platform/x86/intel_pmc_ipc.c
> index fadf721..650144a 100644
> --- a/drivers/platform/x86/intel_pmc_ipc.c
> +++ b/drivers/platform/x86/intel_pmc_ipc.c
> @@ -35,6 +35,7 @@
>  #include <linux/acpi.h>
>  #include <linux/io-64-nonatomic-lo-hi.h>
>  #include <linux/spinlock.h>
> +#include <linux/regmap.h>
>
>  #include <asm/intel_pmc_ipc.h>
>
> @@ -125,9 +126,7 @@ static struct intel_pmc_ipc_dev {
>         struct completion cmd_complete;
>
>         /* gcr */
> -       void __iomem *gcr_mem_base;
> -       bool has_gcr_regs;
> -       spinlock_t gcr_lock;
> +       struct regmap *gcr_regs;
>  } ipcdev;
>
>  static char *ipc_err_sources[] = {
> @@ -149,6 +148,15 @@ static char *ipc_err_sources[] = {
>                 "Unsigned kernel",
>  };
>
> +static struct regmap_config gcr_regmap_config = {
> +       .name = "intel_pmc_gcr",
> +       .reg_bits = 32,
> +       .reg_stride = 4,
> +       .val_bits = 32,
> +       .fast_io = true,
> +       .max_register = PLAT_RESOURCE_GCR_SIZE,
> +};
> +
>  /* Prevent concurrent calls to the PMC */
>  static DEFINE_MUTEX(ipclock);
>
> @@ -182,21 +190,6 @@ static inline u32 ipc_data_readl(u32 offset)
>         return readl(ipcdev.ipc_base + IPC_READ_BUFFER + offset);
>  }
>
> -static inline u64 gcr_data_readq(u32 offset)
> -{
> -       return readq(ipcdev.gcr_mem_base + offset);
> -}
> -
> -static inline int is_gcr_valid(u32 offset)
> -{
> -       if (!ipcdev.has_gcr_regs)
> -               return -EACCES;
> -
> -       if (offset > PLAT_RESOURCE_GCR_SIZE)
> -               return -EINVAL;
> -
> -       return 0;
> -}
>
>  /**
>   * intel_pmc_gcr_read() - Read PMC GCR register
> @@ -209,21 +202,12 @@ static inline int is_gcr_valid(u32 offset)
>   */
>  int intel_pmc_gcr_read(u32 offset, u32 *data)
>  {
> -       int ret;
> -
> -       spin_lock(&ipcdev.gcr_lock);
> -
> -       ret = is_gcr_valid(offset);
> -       if (ret < 0) {
> -               spin_unlock(&ipcdev.gcr_lock);
> -               return ret;
> -       }
> -
> -       *data = readl(ipcdev.gcr_mem_base + offset);
> +       struct intel_pmc_ipc_dev *pmc = &ipcdev;
>
> -       spin_unlock(&ipcdev.gcr_lock);
> +       if (!pmc->gcr_regs)
> +               return -EACCES;
>
> -       return 0;
> +       return regmap_read(pmc->gcr_regs, offset, data);
>  }
>  EXPORT_SYMBOL_GPL(intel_pmc_gcr_read);
>
> @@ -239,21 +223,12 @@ EXPORT_SYMBOL_GPL(intel_pmc_gcr_read);
>   */
>  int intel_pmc_gcr_write(u32 offset, u32 data)
>  {
> -       int ret;
> -
> -       spin_lock(&ipcdev.gcr_lock);
> -
> -       ret = is_gcr_valid(offset);
> -       if (ret < 0) {
> -               spin_unlock(&ipcdev.gcr_lock);
> -               return ret;
> -       }
> -
> -       writel(data, ipcdev.gcr_mem_base + offset);
> +       struct intel_pmc_ipc_dev *pmc = &ipcdev;
>
> -       spin_unlock(&ipcdev.gcr_lock);
> +       if (!pmc->gcr_regs)
> +               return -EACCES;
>
> -       return 0;
> +       return regmap_write(pmc->gcr_regs, offset, data);
>  }
>  EXPORT_SYMBOL_GPL(intel_pmc_gcr_write);
>
> @@ -270,33 +245,12 @@ EXPORT_SYMBOL_GPL(intel_pmc_gcr_write);
>   */
>  int intel_pmc_gcr_update(u32 offset, u32 mask, u32 val)
>  {
> -       u32 new_val;
> -       int ret = 0;
> -
> -       spin_lock(&ipcdev.gcr_lock);
> -
> -       ret = is_gcr_valid(offset);
> -       if (ret < 0)
> -               goto gcr_ipc_unlock;
> -
> -       new_val = readl(ipcdev.gcr_mem_base + offset);
> -
> -       new_val &= ~mask;
> -       new_val |= val & mask;
> -
> -       writel(new_val, ipcdev.gcr_mem_base + offset);
> -
> -       new_val = readl(ipcdev.gcr_mem_base + offset);
> +       struct intel_pmc_ipc_dev *pmc = &ipcdev;
>
> -       /* check whether the bit update is successful */
> -       if ((new_val & mask) != (val & mask)) {
> -               ret = -EIO;
> -               goto gcr_ipc_unlock;
> -       }
> +       if (!pmc->gcr_regs)
> +               return -EACCES;
>
> -gcr_ipc_unlock:
> -       spin_unlock(&ipcdev.gcr_lock);
> -       return ret;
> +       return regmap_update_bits(pmc->gcr_regs, offset, mask, val);
>  }
>  EXPORT_SYMBOL_GPL(intel_pmc_gcr_update);
>
> @@ -475,8 +429,6 @@ static int ipc_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>
>         pmc->irq_mode = IPC_TRIGGER_MODE_IRQ;
>
> -       spin_lock_init(&ipcdev.gcr_lock);
> -
>         ret = pcim_enable_device(pdev);
>         if (ret)
>                 return ret;
> @@ -759,7 +711,6 @@ static int ipc_plat_get_res(struct platform_device *pdev)
>                 return PTR_ERR(addr);
>
>         ipcdev.ipc_base = addr;
> -       ipcdev.gcr_mem_base = addr + PLAT_RESOURCE_GCR_OFFSET;
>
>         return 0;
>  }
> @@ -772,17 +723,26 @@ static int ipc_plat_get_res(struct platform_device *pdev)
>   */
>  int intel_pmc_s0ix_counter_read(u64 *data)
>  {
> +       struct intel_pmc_ipc_dev *pmc = &ipcdev;
>         u64 deep, shlw;
> +       int ret;
>
> -       if (!ipcdev.has_gcr_regs)
> +       if (!pmc->gcr_regs)
>                 return -EACCES;
>
> -       deep = gcr_data_readq(PMC_GCR_TELEM_DEEP_S0IX_REG);
> -       shlw = gcr_data_readq(PMC_GCR_TELEM_SHLW_S0IX_REG);
> +       ret = regmap_bulk_read(pmc->gcr_regs, PMC_GCR_TELEM_DEEP_S0IX_REG,
> +                              &deep, 2);
> +       if (ret)
> +               return ret;
> +
> +       ret = regmap_bulk_read(pmc->gcr_regs, PMC_GCR_TELEM_SHLW_S0IX_REG,
> +                              &shlw, 2);
> +       if (ret)
> +               return ret;
>
>         *data = S0IX_RESIDENCY_IN_USECS(deep, shlw);
>
> -       return 0;
> +       return ret;
>  }
>  EXPORT_SYMBOL_GPL(intel_pmc_s0ix_counter_read);
>
> @@ -801,7 +761,6 @@ static int ipc_plat_probe(struct platform_device *pdev)
>         ipcdev.dev = &pdev->dev;
>         ipcdev.irq_mode = IPC_TRIGGER_MODE_IRQ;
>         init_completion(&ipcdev.cmd_complete);
> -       spin_lock_init(&ipcdev.gcr_lock);
>
>         ipcdev.irq = platform_get_irq(pdev, 0);
>         if (ipcdev.irq < 0) {
> @@ -815,6 +774,15 @@ static int ipc_plat_probe(struct platform_device *pdev)
>                 return ret;
>         }
>
> +       /* GCR base address is at ipc_base + PLAT_RESOURCE_GCR_OFFSET */
> +       ipcdev.gcr_regs = devm_regmap_init_mmio_clk(ipcdev.dev, NULL,
> +                               ipcdev.ipc_base + PLAT_RESOURCE_GCR_OFFSET,
> +                               &gcr_regmap_config);
> +       if (IS_ERR(ipcdev.gcr_regs)) {
> +               dev_err(ipcdev.dev, "gcr_regs regmap init failed\n");
> +               return PTR_ERR(ipcdev.gcr_regs);
> +       }
> +
>         ret = ipc_create_pmc_devices(pdev);
>         if (ret) {
>                 dev_err(&pdev->dev, "Failed to create PMC devices\n");
> @@ -836,8 +804,6 @@ static int ipc_plat_probe(struct platform_device *pdev)
>                 return ret;
>         }
>
> -       ipcdev.has_gcr_regs = true;
> -
>         return 0;
>  }
>
> --
> 2.7.4
>



-- 
With Best Regards,
Andy Shevchenko
