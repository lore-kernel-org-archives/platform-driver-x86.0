From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2] platform/x86: intel_int0002_vgpio: Only bind to the
 INT0002 dev when using s2idle
Date: Thu, 16 Apr 2020 11:00:15 +0200
Message-ID: <6e85613c-e129-831a-bbe8-9f0c4f9fadad@redhat.com>
References: <20200414131953.131533-1-hdegoede@redhat.com>
 <4380034.KJPSqyn9gG@kreacher>
 <a9c4b315-2784-fe59-1236-3e3bf391fd4c@redhat.com>
 <15138701.54mejVaKjr@kreacher>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <15138701.54mejVaKjr@kreacher>
Content-Language: en-US
Sender: stable-owner@vger.kernel.org
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Maxim Mikityanskiy <maxtram95@gmail.com>, "5 . 3+" <stable@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

Hi,

On 4/15/20 11:34 PM, Rafael J. Wysocki wrote:
> On Wednesday, April 15, 2020 11:48:20 AM CEST Hans de Goede wrote:
>> Hi,
>>
>> On 4/15/20 11:45 AM, Rafael J. Wysocki wrote:
>>> On Tuesday, April 14, 2020 3:19:53 PM CEST Hans de Goede wrote:
>>>> Commit 871f1f2bcb01 ("platform/x86: intel_int0002_vgpio: Only implement
>>>> irq_set_wake on Bay Trail") stopped passing irq_set_wake requests on to
>>>> the parents IRQ because this was breaking suspend (causing immediate
>>>> wakeups) on an Asus E202SA.
>>>>
>>>> This workaround for this issue is mostly fine, on most Cherry Trail
>>>> devices where we need the INT0002 device for wakeups by e.g. USB kbds,
>>>> the parent IRQ is shared with the ACPI SCI and that is marked as wakeup
>>>> anyways.
>>>>
>>>> But not on all devices, specifically on a Medion Akoya E1239T there is
>>>> no SCI at all, and because the irq_set_wake request is not passed on to
>>>> the parent IRQ, wake up by the builtin USB kbd does not work here.
>>>>
>>>> So the workaround for the Asus E202SA immediate wake problem is causing
>>>> problems elsewhere; and in hindsight it is not the correct fix,
>>>> the Asus E202SA uses Airmont CPU cores, but this does not mean it is a
>>>> Cherry Trail based device, Brasswell uses Airmont CPU cores too and this
>>>> actually is a Braswell device.
>>>>
>>>> Most (all?) Braswell devices use classic S3 mode suspend rather then
>>>> s2idle suspend and in this case directly dealing with PME events as
>>>> the INT0002 driver does likely is not the best idea, so that this is
>>>> causing issues is not surprising.
>>>>
>>>> Replace the workaround of not passing irq_set_wake requests on to the
>>>> parents IRQ, by not binding to the INT0002 device when s2idle is not used.
>>>> This fixes USB kbd wakeups not working on some Cherry Trail devices,
>>>> while still avoiding mucking with the wakeup flags on the Asus E202SA
>>>> (and other Brasswell devices).
>>>>
>>>> Cc: Maxim Mikityanskiy <maxtram95@gmail.com>
>>>> Cc: 5.3+ <stable@vger.kernel.org> # 5.3+
>>>> Fixes: 871f1f2bcb01 ("platform/x86: intel_int0002_vgpio: Only implement irq_set_wake on Bay Trail")
>>>> Tested-by: Maxim Mikityanskiy <maxtram95@gmail.com>
>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>>> ---
>>>> Changes in v2:
>>>> - Rebase on top of 5.7-rc1
>>>> ---
>>>>    drivers/platform/x86/intel_int0002_vgpio.c | 18 +++++-------------
>>>>    1 file changed, 5 insertions(+), 13 deletions(-)
>>>>
>>>> diff --git a/drivers/platform/x86/intel_int0002_vgpio.c b/drivers/platform/x86/intel_int0002_vgpio.c
>>>> index 289c6655d425..30806046b664 100644
>>>> --- a/drivers/platform/x86/intel_int0002_vgpio.c
>>>> +++ b/drivers/platform/x86/intel_int0002_vgpio.c
>>>> @@ -143,21 +143,9 @@ static struct irq_chip int0002_byt_irqchip = {
>>>>    	.irq_set_wake		= int0002_irq_set_wake,
>>>>    };
>>>>    
>>>> -static struct irq_chip int0002_cht_irqchip = {
>>>> -	.name			= DRV_NAME,
>>>> -	.irq_ack		= int0002_irq_ack,
>>>> -	.irq_mask		= int0002_irq_mask,
>>>> -	.irq_unmask		= int0002_irq_unmask,
>>>> -	/*
>>>> -	 * No set_wake, on CHT the IRQ is typically shared with the ACPI SCI
>>>> -	 * and we don't want to mess with the ACPI SCI irq settings.
>>>> -	 */
>>>> -	.flags			= IRQCHIP_SKIP_SET_WAKE,
>>>> -};
>>>> -
>>>>    static const struct x86_cpu_id int0002_cpu_ids[] = {
>>>>    	X86_MATCH_INTEL_FAM6_MODEL(ATOM_SILVERMONT,	&int0002_byt_irqchip),
>>>> -	X86_MATCH_INTEL_FAM6_MODEL(ATOM_AIRMONT,	&int0002_cht_irqchip),
>>>> +	X86_MATCH_INTEL_FAM6_MODEL(ATOM_AIRMONT,	&int0002_byt_irqchip),
>>>>    	{}
>>>>    };
>>>>    
>>>> @@ -181,6 +169,10 @@ static int int0002_probe(struct platform_device *pdev)
>>>>    	if (!cpu_id)
>>>>    		return -ENODEV;
>>>>    
>>>> +	/* We only need to directly deal with PMEs when using s2idle */
>>>> +	if (!pm_suspend_default_s2idle())
>>>> +		return -ENODEV;
>>>> +
>>>
>>> What if the system supports s2idle which is not the default suspend option
>>> and then it is selected by user space (overriding the default)?
>>
>> This driver only binds (the cpuid check still visible above) on Bay Trail
>> and Cherry Trail/Brasswell systems. AFAIK those never support both modes,
>> the laptop variants of these SoCs always use S3 and the tablet versions
>> always use s2idle.
> 
> But this means that at least the laptop variants can use s2idle if users choose
> that option.

I was under the impression that the laptop variants only supported S3,
butyou are right they support both.

Still I believe that the intent of this patch is right as is. The
laptop variants are much more like standard X86 devices then the
tablet devices.

E.g. they use standard HDA for audio instead of ASoC, the always use
the ACPI ac and battery drivers instead of needing native PMIC drivers,
etc.  Basically the tablet variants are a lot more like SoCs from other
(ARM) vendors, so they need some special handling.  I consider the
(undocumented, lifted from android-x86) INT0002 / special manual poking
of PMC GPE registers to also be part of the tablet variant special
sauce.

My intent of the pm_suspend_default_s2idle() check really is to
check for the tablet variant. As Maxim's regression on the laptop
(aka normal x86 machine) variant has shown doing the manual
poking there seems to be a bad idea.

So I guess I need to rewrite this patch to better match my original
intent. Does anyone have any ideas how to check it we are dealing
with the tablet variant ?  One option would be to see if s2idle
is supported, while S3 is not supported. Rafael any idea how to
neatly check for those conditions ?   Anyone else an idea to
more directly check if we are running on a tablet v

> Switching over from S3 to s2idle and back needs to be supported.

Ack, but even for the laptop variant s2idle path I believe that
letting the INT0002 driver bind and poke PMC GPE registers
directly is a bad idea.

Regards,

Hans
