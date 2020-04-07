From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH] platform/x86: intel_int0002_vgpio: Only bind to the
 INT0002 dev when using s2idle
Date: Wed, 8 Apr 2020 00:23:53 +0200
Message-ID: <cfd3171a-94fb-7382-28e1-a236cb6759cc@redhat.com>
References: <20200407213058.62870-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20200407213058.62870-1-hdegoede@redhat.com>
Content-Language: en-US
Sender: stable-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, "Rafael J . Wysocki" <rjw@rjwysocki.net>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Maxim Mikityanskiy <maxtram95@gmail.com>, "5 . 3+" <stable@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

Hi all,

I just realized that I should have added a cover letter to this
patch to discuss how to merge it.

Rafael has already queued up the
"[PATCH v3 2/2] platform/x86: intel_int0002_vgpio: Use acpi_register_wakeup_handler()"
in his tree. Looking at both patches the parts of the file the
touch are different enough that that should not be a problem though.

So I guess this can go through platform/x86 as usual, or
(assuming everyone is ok with the change itself) alternatively
Rafael can take it to make sure there will be no conflicts?

Regards,

Hans


On 07-04-2020 23:30, Hans de Goede wrote:
> Commit 871f1f2bcb01 ("platform/x86: intel_int0002_vgpio: Only implement
> irq_set_wake on Bay Trail") stopped passing irq_set_wake requests on to
> the parents IRQ because this was breaking suspend (causing immediate
> wakeups) on an Asus E202SA.
> 
> This workaround for this issue is mostly fine, on most Cherry Trail
> devices where we need the INT0002 device for wakeups by e.g. USB kbds,
> the parent IRQ is shared with the ACPI SCI and that is marked as wakeup
> anyways.
> 
> But not on all devices, specifically on a Medion Akoya E1239T there is
> no SCI at all, and because the irq_set_wake request is not passed on to
> the parent IRQ, wake up by the builtin USB kbd does not work here.
> 
> So the workaround for the Asus E202SA immediate wake problem is causing
> problems elsewhere; and in hindsight it is not the correct fix,
> the Asus E202SA uses Airmont CPU cores, but this does not mean it is a
> Cherry Trail based device, Brasswell uses Airmont CPU cores too and this
> actually is a Braswell device.
> 
> Most (all?) Braswell devices use classic S3 mode suspend rather then
> s2idle suspend and in this case directly dealing with PME events as
> the INT0002 driver does likely is not the best idea, so that this is
> causing issues is not surprising.
> 
> Replace the workaround of not passing irq_set_wake requests on to the
> parents IRQ, by not binding to the INT0002 device when s2idle is not used.
> This fixes USB kbd wakeups not working on some Cherry Trail devices,
> while still avoiding mucking with the wakeup flags on the Asus E202SA
> (and other Brasswell devices).
> 
> Cc: Maxim Mikityanskiy <maxtram95@gmail.com>
> Cc: 5.3+ <stable@vger.kernel.org> # 5.3+
> Fixes: 871f1f2bcb01 ("platform/x86: intel_int0002_vgpio: Only implement irq_set_wake on Bay Trail")
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>   drivers/platform/x86/intel_int0002_vgpio.c | 18 +++++-------------
>   1 file changed, 5 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel_int0002_vgpio.c b/drivers/platform/x86/intel_int0002_vgpio.c
> index 55f088f535e2..e8bec72d3823 100644
> --- a/drivers/platform/x86/intel_int0002_vgpio.c
> +++ b/drivers/platform/x86/intel_int0002_vgpio.c
> @@ -143,21 +143,9 @@ static struct irq_chip int0002_byt_irqchip = {
>   	.irq_set_wake		= int0002_irq_set_wake,
>   };
>   
> -static struct irq_chip int0002_cht_irqchip = {
> -	.name			= DRV_NAME,
> -	.irq_ack		= int0002_irq_ack,
> -	.irq_mask		= int0002_irq_mask,
> -	.irq_unmask		= int0002_irq_unmask,
> -	/*
> -	 * No set_wake, on CHT the IRQ is typically shared with the ACPI SCI
> -	 * and we don't want to mess with the ACPI SCI irq settings.
> -	 */
> -	.flags			= IRQCHIP_SKIP_SET_WAKE,
> -};
> -
>   static const struct x86_cpu_id int0002_cpu_ids[] = {
>   	INTEL_CPU_FAM6(ATOM_SILVERMONT, int0002_byt_irqchip),	/* Valleyview, Bay Trail  */
> -	INTEL_CPU_FAM6(ATOM_AIRMONT, int0002_cht_irqchip),	/* Braswell, Cherry Trail */
> +	INTEL_CPU_FAM6(ATOM_AIRMONT, int0002_byt_irqchip),	/* Braswell, Cherry Trail */
>   	{}
>   };
>   
> @@ -181,6 +169,10 @@ static int int0002_probe(struct platform_device *pdev)
>   	if (!cpu_id)
>   		return -ENODEV;
>   
> +	/* We only need to directly deal with PMEs when using s2idle */
> +	if (!pm_suspend_default_s2idle())
> +		return -ENODEV;
> +
>   	irq = platform_get_irq(pdev, 0);
>   	if (irq < 0)
>   		return irq;
> 
