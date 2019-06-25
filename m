From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v1] platform/x86: intel_int0002_vgpio: Get rid of custom
 ICPU() macro
Date: Tue, 25 Jun 2019 22:31:12 +0200
Message-ID: <bebb9c22-186d-8bd1-a12d-c97f22f2487a@redhat.com>
References: <20190619145050.13876-1-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190619145050.13876-1-andriy.shevchenko@linux.intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Hi,

On 19-06-19 16:50, Andy Shevchenko wrote:
> Replace custom grown macro with generic INTEL_CPU_FAM6() one.
> 
> No functional change intended.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans

> ---
>   drivers/platform/x86/intel_int0002_vgpio.c | 22 +++++++---------------
>   1 file changed, 7 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel_int0002_vgpio.c b/drivers/platform/x86/intel_int0002_vgpio.c
> index 1694a9aec77c..d9542c661ddc 100644
> --- a/drivers/platform/x86/intel_int0002_vgpio.c
> +++ b/drivers/platform/x86/intel_int0002_vgpio.c
> @@ -51,17 +51,6 @@
>   #define GPE0A_STS_PORT			0x420
>   #define GPE0A_EN_PORT			0x428
>   
> -#define BAYTRAIL			0x01
> -#define CHERRYTRAIL			0x02
> -
> -#define ICPU(model, data) { X86_VENDOR_INTEL, 6, model, X86_FEATURE_ANY, data }
> -
> -static const struct x86_cpu_id int0002_cpu_ids[] = {
> -	ICPU(INTEL_FAM6_ATOM_SILVERMONT, BAYTRAIL), /* Valleyview, Bay Trail  */
> -	ICPU(INTEL_FAM6_ATOM_AIRMONT, CHERRYTRAIL), /* Braswell, Cherry Trail */
> -	{}
> -};
> -
>   /*
>    * As this is not a real GPIO at all, but just a hack to model an event in
>    * ACPI the get / set functions are dummy functions.
> @@ -157,6 +146,12 @@ static struct irq_chip int0002_cht_irqchip = {
>   	 */
>   };
>   
> +static const struct x86_cpu_id int0002_cpu_ids[] = {
> +	INTEL_CPU_FAM6(ATOM_SILVERMONT, int0002_byt_irqchip),	/* Valleyview, Bay Trail  */
> +	INTEL_CPU_FAM6(ATOM_AIRMONT, int0002_cht_irqchip),	/* Braswell, Cherry Trail */
> +	{}
> +};
> +
>   static int int0002_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
> @@ -210,10 +205,7 @@ static int int0002_probe(struct platform_device *pdev)
>   		return ret;
>   	}
>   
> -	if (cpu_id->driver_data == BAYTRAIL)
> -		irq_chip = &int0002_byt_irqchip;
> -	else
> -		irq_chip = &int0002_cht_irqchip;
> +	irq_chip = (struct irq_chip *)cpu_id->driver_data;
>   
>   	ret = gpiochip_irqchip_add(chip, irq_chip, 0, handle_edge_irq,
>   				   IRQ_TYPE_NONE);
> 
