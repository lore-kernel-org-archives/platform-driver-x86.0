From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH V3 1/3] PCI: Add defines for Designated Vendor-Specific
 Capability
Date: Wed, 15 Jul 2020 19:55:11 -0700
Message-ID: <3f490460-62f8-8b49-0735-ad29653bfbc0@infradead.org>
References: <20200508021844.6911-1-david.e.box@linux.intel.com>
 <20200714062323.19990-2-david.e.box@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <20200714062323.19990-2-david.e.box@linux.intel.com>
Content-Language: en-US
Sender: linux-pci-owner@vger.kernel.org
To: "David E. Box" <david.e.box@linux.intel.com>, lee.jones@linaro.org, dvhart@infradead.org, andy@infradead.org, bhelgaas@google.com, alexander.h.duyck@linux.intel.com
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-pci@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On 7/13/20 11:23 PM, David E. Box wrote:
> Add PCIe DVSEC extended capability ID and defines for the header offsets.
> Defined in PCIe r5.0, sec 7.9.6.
> 
> Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> Acked-by: Bjorn Helgaas <bhelgaas@google.com>
> ---
>  include/uapi/linux/pci_regs.h | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/include/uapi/linux/pci_regs.h b/include/uapi/linux/pci_regs.h
> index f9701410d3b5..09daa9f07b6b 100644
> --- a/include/uapi/linux/pci_regs.h
> +++ b/include/uapi/linux/pci_regs.h
> @@ -720,6 +720,7 @@
> +#define PCI_EXT_CAP_ID_DVSEC	0x23	/* Designated Vendor-Specific */
> @@ -1062,6 +1063,10 @@
> +/* Designated Vendor-Specific (DVSEC, PCI_EXT_CAP_ID_DVSEC) */
> +#define PCI_DVSEC_HEADER1		0x4 /* Vendor-Specific Header1 */
> +#define PCI_DVSEC_HEADER2		0x8 /* Vendor-Specific Header2 */

Just a little comment: It would make more sense to me to
s/DVSEC/DVSPEC/g.

But then I don't have the PCIe documentation.

-- 
~Randy
