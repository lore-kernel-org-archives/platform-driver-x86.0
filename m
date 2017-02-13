From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: intel_pmc_ipc: Add APL PMC PCI Id
Date: Tue, 14 Feb 2017 00:28:14 +0200
Message-ID: <CAHp75Vde9R3y944SpK7SdpBJCR35VWeeaxQ6bNJcNLjwrS935Q@mail.gmail.com>
References: <1486982507-6891-1-git-send-email-rajneesh.bhardwaj@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1486982507-6891-1-git-send-email-rajneesh.bhardwaj@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, "dvhart@infradead.org" <dvhart@infradead.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Zha Qipeng <qipeng.zha@intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Feb 13, 2017 at 12:41 PM, Rajneesh Bhardwaj
<rajneesh.bhardwaj@intel.com> wrote:
> This patch adds the PCI Device id for Power Management Controller on Intel
> Apollo Lake platforms.
>
> Intel PMC IPC Driver loads as a platform driver on Apollo Lake platforms
> since Intel BIOS hides the PCI Configuration space for 0:13:1 and
> re-enumerates it as ACPI device (INT34D2). The correct PCI Device ID should
> be added if some platform firmware choses to enumerate the device via PCI
> space.

Thanks, applied to testing.

>
> Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
> ---
>  drivers/platform/x86/intel_pmc_ipc.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/platform/x86/intel_pmc_ipc.c b/drivers/platform/x86/intel_pmc_ipc.c
> index 0bf51d5..ff665b9 100644
> --- a/drivers/platform/x86/intel_pmc_ipc.c
> +++ b/drivers/platform/x86/intel_pmc_ipc.c
> @@ -389,6 +389,7 @@ static void ipc_pci_remove(struct pci_dev *pdev)
>  static const struct pci_device_id ipc_pci_ids[] = {
>         {PCI_VDEVICE(INTEL, 0x0a94), 0},
>         {PCI_VDEVICE(INTEL, 0x1a94), 0},
> +       {PCI_VDEVICE(INTEL, 0x5a94), 0},
>         { 0,}
>  };
>  MODULE_DEVICE_TABLE(pci, ipc_pci_ids);
> --
> 1.9.1
>



-- 
With Best Regards,
Andy Shevchenko
