From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 1/3] mfd: intel_pmt: Add OOBMSM device ID
Date: Mon, 14 Sep 2020 15:01:05 +0200
Message-ID: <3e68c73f-4984-26d1-f15e-695c4c41dcf3@redhat.com>
References: <20200911194549.12780-1-david.e.box@linux.intel.com>
 <20200911194549.12780-2-david.e.box@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200911194549.12780-2-david.e.box@linux.intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "David E. Box" <david.e.box@linux.intel.com>, lee.jones@linaro.org, dvhart@infradead.org, andy@infradead.org, alexander.h.duyck@linux.intel.com
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Hi,

On 9/11/20 9:45 PM, David E. Box wrote:
> Add Out of Band Management Services Module device ID to Intel PMT driver.
> 
> Signed-off-by: Alexander Duyck <alexander.h.duyck@linux.intel.com>
> Signed-off-by: David E. Box <david.e.box@linux.intel.com>

Looks good to me:

Acked-by: Hans de Goede <hdegoede@redhat.com>

Lee, I expect you will pick this-one up (and the next also) ?

Regards,

Hans

> ---
>   drivers/mfd/intel_pmt.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/mfd/intel_pmt.c b/drivers/mfd/intel_pmt.c
> index 0e572b105101..8f9970ab3026 100644
> --- a/drivers/mfd/intel_pmt.c
> +++ b/drivers/mfd/intel_pmt.c
> @@ -55,6 +55,8 @@ struct pmt_platform_info {
>   	unsigned long quirks;
>   };
>   
> +static const struct pmt_platform_info pmt_info;
> +
>   static const struct pmt_platform_info tgl_info = {
>   	.quirks = PMT_QUIRK_NO_WATCHER | PMT_QUIRK_NO_CRASHLOG |
>   		  PMT_QUIRK_TABLE_SHIFT,
> @@ -200,8 +202,10 @@ static void pmt_pci_remove(struct pci_dev *pdev)
>   	pm_runtime_get_sync(&pdev->dev);
>   }
>   
> +#define PCI_DEVICE_ID_INTEL_PMT_OOBMSM	0x09a7
>   #define PCI_DEVICE_ID_INTEL_PMT_TGL	0x9a0d
>   static const struct pci_device_id pmt_pci_ids[] = {
> +	{ PCI_DEVICE_DATA(INTEL, PMT_OOBMSM, &pmt_info) },
>   	{ PCI_DEVICE_DATA(INTEL, PMT_TGL, &tgl_info) },
>   	{ }
>   };
> 
