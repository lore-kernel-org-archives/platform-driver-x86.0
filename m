From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: ISST: Add new PCI device ids
Date: Fri, 10 Jul 2020 23:36:12 +0300
Message-ID: <CAHp75VdXQW9NdXi6MNZQOJf0xg3yZxSQKaqpw79fSyaNp1L2Uw@mail.gmail.com>
References: <20200624175138.3835436-1-srinivas.pandruvada@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200624175138.3835436-1-srinivas.pandruvada@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Jun 24, 2020 at 8:52 PM Srinivas Pandruvada
<srinivas.pandruvada@linux.intel.com> wrote:
>
> Added new PCI device ids for supporting mailbox and MMIO interface for
> Sapphire Rapids.
>

Pushed to my review and testing queue, thanks!

> Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
> ---
>  drivers/platform/x86/intel_speed_select_if/isst_if_common.h   | 3 +++
>  drivers/platform/x86/intel_speed_select_if/isst_if_mbox_pci.c | 1 +
>  drivers/platform/x86/intel_speed_select_if/isst_if_mmio.c     | 1 +
>  3 files changed, 5 insertions(+)
>
> diff --git a/drivers/platform/x86/intel_speed_select_if/isst_if_common.h b/drivers/platform/x86/intel_speed_select_if/isst_if_common.h
> index 1409a5bb5582..4f6f7f0761fc 100644
> --- a/drivers/platform/x86/intel_speed_select_if/isst_if_common.h
> +++ b/drivers/platform/x86/intel_speed_select_if/isst_if_common.h
> @@ -13,6 +13,9 @@
>  #define INTEL_RAPL_PRIO_DEVID_0        0x3451
>  #define INTEL_CFG_MBOX_DEVID_0 0x3459
>
> +#define INTEL_RAPL_PRIO_DEVID_1 0x3251
> +#define INTEL_CFG_MBOX_DEVID_1  0x3259
> +
>  /*
>   * Validate maximum commands in a single request.
>   * This is enough to handle command to every core in one ioctl, or all
> diff --git a/drivers/platform/x86/intel_speed_select_if/isst_if_mbox_pci.c b/drivers/platform/x86/intel_speed_select_if/isst_if_mbox_pci.c
> index d84e2174cbde..95f01e7a87d5 100644
> --- a/drivers/platform/x86/intel_speed_select_if/isst_if_mbox_pci.c
> +++ b/drivers/platform/x86/intel_speed_select_if/isst_if_mbox_pci.c
> @@ -147,6 +147,7 @@ static long isst_if_mbox_proc_cmd(u8 *cmd_ptr, int *write_only, int resume)
>
>  static const struct pci_device_id isst_if_mbox_ids[] = {
>         { PCI_DEVICE(PCI_VENDOR_ID_INTEL, INTEL_CFG_MBOX_DEVID_0)},
> +       { PCI_DEVICE(PCI_VENDOR_ID_INTEL, INTEL_CFG_MBOX_DEVID_1)},
>         { 0 },
>  };
>  MODULE_DEVICE_TABLE(pci, isst_if_mbox_ids);
> diff --git a/drivers/platform/x86/intel_speed_select_if/isst_if_mmio.c b/drivers/platform/x86/intel_speed_select_if/isst_if_mmio.c
> index 3584859fcc42..aa17fd7817f8 100644
> --- a/drivers/platform/x86/intel_speed_select_if/isst_if_mmio.c
> +++ b/drivers/platform/x86/intel_speed_select_if/isst_if_mmio.c
> @@ -72,6 +72,7 @@ static long isst_if_mmio_rd_wr(u8 *cmd_ptr, int *write_only, int resume)
>
>  static const struct pci_device_id isst_if_ids[] = {
>         { PCI_DEVICE(PCI_VENDOR_ID_INTEL, INTEL_RAPL_PRIO_DEVID_0)},
> +       { PCI_DEVICE(PCI_VENDOR_ID_INTEL, INTEL_RAPL_PRIO_DEVID_1)},
>         { 0 },
>  };
>  MODULE_DEVICE_TABLE(pci, isst_if_ids);
> --
> 2.25.4
>


-- 
With Best Regards,
Andy Shevchenko
