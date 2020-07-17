From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH V4 1/3] PCI: Add defines for Designated Vendor-Specific
 Extended Capability
Date: Fri, 17 Jul 2020 23:11:16 +0300
Message-ID: <CAHp75Vd3-Mc0=K+pDzpeB9MeHLFCni_4PbmsFTaXXzFMSmVgbg@mail.gmail.com>
References: <20200714062323.19990-1-david.e.box@linux.intel.com> <20200717190620.29821-2-david.e.box@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <20200717190620.29821-2-david.e.box@linux.intel.com>
Sender: linux-pci-owner@vger.kernel.org
To: "David E. Box" <david.e.box@linux.intel.com>
Cc: Lee Jones <lee.jones@linaro.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Bjorn Helgaas <bhelgaas@google.com>, Alexander Duyck <alexander.h.duyck@linux.intel.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, linux-pci <linux-pci@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Jul 17, 2020 at 10:05 PM David E. Box
<david.e.box@linux.intel.com> wrote:
>
> Add PCIe Designated Vendor-Specific Extended Capability (DVSEC) and defines
> for the header offsets. Defined in PCIe r5.0, sec 7.9.6.
>

FWIW,
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> Acked-by: Bjorn Helgaas <bhelgaas@google.com>
> ---
>  include/uapi/linux/pci_regs.h | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/include/uapi/linux/pci_regs.h b/include/uapi/linux/pci_regs.h
> index f9701410d3b5..beafeee39e44 100644
> --- a/include/uapi/linux/pci_regs.h
> +++ b/include/uapi/linux/pci_regs.h
> @@ -720,6 +720,7 @@
>  #define PCI_EXT_CAP_ID_DPC     0x1D    /* Downstream Port Containment */
>  #define PCI_EXT_CAP_ID_L1SS    0x1E    /* L1 PM Substates */
>  #define PCI_EXT_CAP_ID_PTM     0x1F    /* Precision Time Measurement */
> +#define PCI_EXT_CAP_ID_DVSEC   0x23    /* Designated Vendor-Specific */
>  #define PCI_EXT_CAP_ID_DLF     0x25    /* Data Link Feature */
>  #define PCI_EXT_CAP_ID_PL_16GT 0x26    /* Physical Layer 16.0 GT/s */
>  #define PCI_EXT_CAP_ID_MAX     PCI_EXT_CAP_ID_PL_16GT
> @@ -1062,6 +1063,10 @@
>  #define  PCI_L1SS_CTL1_LTR_L12_TH_SCALE        0xe0000000  /* LTR_L1.2_THRESHOLD_Scale */
>  #define PCI_L1SS_CTL2          0x0c    /* Control 2 Register */
>
> +/* Designated Vendor-Specific (DVSEC, PCI_EXT_CAP_ID_DVSEC) */
> +#define PCI_DVSEC_HEADER1              0x4 /* Designated Vendor-Specific Header1 */
> +#define PCI_DVSEC_HEADER2              0x8 /* Designated Vendor-Specific Header2 */
> +
>  /* Data Link Feature */
>  #define PCI_DLF_CAP            0x04    /* Capabilities Register */
>  #define  PCI_DLF_EXCHANGE_ENABLE       0x80000000  /* Data Link Feature Exchange Enable */
> --
> 2.20.1
>


-- 
With Best Regards,
Andy Shevchenko
