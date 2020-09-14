From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 2/3] mfd: intel_pmt: Add Alder Lake (ADL) support
Date: Mon, 14 Sep 2020 15:01:15 +0200
Message-ID: <8b88768f-9ddd-0e14-b788-98eb791c6aa3@redhat.com>
References: <20200911194549.12780-1-david.e.box@linux.intel.com>
 <20200911194549.12780-3-david.e.box@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200911194549.12780-3-david.e.box@linux.intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "David E. Box" <david.e.box@linux.intel.com>, lee.jones@linaro.org, dvhart@infradead.org, andy@infradead.org, alexander.h.duyck@linux.intel.com
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Hi,

On 9/11/20 9:45 PM, David E. Box wrote:
> Add PMT support for Alder Lake (ADL). Use same quirks as Tiger Lake since
> the design is the same, meaning no support for Watcher or Crashlog.
> 
> Signed-off-by: David E. Box <david.e.box@linux.intel.com>

Looks good to me:

Acked-by: Hans de Goede <hdegoede@redhat.com>

Lee, I expect you will pick this-one up (and the next also) ?

Regards,

Hans



> ---
>   drivers/mfd/intel_pmt.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/mfd/intel_pmt.c b/drivers/mfd/intel_pmt.c
> index 8f9970ab3026..1b57a970a9d7 100644
> --- a/drivers/mfd/intel_pmt.c
> +++ b/drivers/mfd/intel_pmt.c
> @@ -202,9 +202,11 @@ static void pmt_pci_remove(struct pci_dev *pdev)
>   	pm_runtime_get_sync(&pdev->dev);
>   }
>   
> +#define PCI_DEVICE_ID_INTEL_PMT_ADL	0x467d
>   #define PCI_DEVICE_ID_INTEL_PMT_OOBMSM	0x09a7
>   #define PCI_DEVICE_ID_INTEL_PMT_TGL	0x9a0d
>   static const struct pci_device_id pmt_pci_ids[] = {
> +	{ PCI_DEVICE_DATA(INTEL, PMT_ADL, &tgl_info) },
>   	{ PCI_DEVICE_DATA(INTEL, PMT_OOBMSM, &pmt_info) },
>   	{ PCI_DEVICE_DATA(INTEL, PMT_TGL, &tgl_info) },
>   	{ }
> 
