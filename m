From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: Failed IRQ assignment for INT0002 on Braswell
Date: Wed, 22 Nov 2017 16:50:33 +0100
Message-ID: <d8587e5f-79e6-22cc-570c-fa9934d09f1d@redhat.com>
References: <1902393.IdeYHqtVB8@natalenko.name>
 <3c09b28b-6ca5-cd1c-f5c0-f7be73f1c1b4@redhat.com>
 <2100487.obXIbN4R9M@natalenko.name>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------1D46B7FCF91E222573407C03"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:40110 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751781AbdKVPuf (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 22 Nov 2017 10:50:35 -0500
In-Reply-To: <2100487.obXIbN4R9M@natalenko.name>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Oleksandr Natalenko <oleksandr@natalenko.name>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

This is a multi-part message in MIME format.
--------------1D46B7FCF91E222573407C03
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 22-11-17 13:48, Oleksandr Natalenko wrote:
> Hi, Hans.
> 
> On středa 22. listopadu 2017 11:48:50 CET Hans de Goede wrote:
>> /* snip */
>> This should be fixed by:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/ke
>> rnel/irq?id=382bd4de61827dbaaf5fb4fb7b1f4be4a86505e7
>>
>> Which is in 4.13, but the trigger-type does not seem to be the problem in
>> your case, the problem likely is the ONESHOT flag:
>>
>> #define IRQF_ONESHOT            0x00002000
>>
>> Which appears to be set in the flags for the acpi irq handler:
>>   > kernel: genirq: Flags mismatch irq 9. 00010084 (INT0002) vs. 00002080
>>   > (acpi)
>> But that irq is requested here:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/driv
>> ers/acpi/osl.c#n570
>>
>>
>>
>> 	if (request_irq(irq, acpi_irq, IRQF_SHARED, "acpi", acpi_irq)) {
>> 		printk(KERN_ERR PREFIX "SCI (IRQ%d) allocation failed\n", irq);
>> 		...
>>
>> And IRQF_ONESHOT is not passed, so I do not understand where the 00002000 in
>> the acpi irq handler flags is coming from ...
> 
> Well, looks like I know where this flag comes from. I boot this machine with
> "threadirqs", and IRQF_ONESHOT description says:
> 
> ===
>   52  * IRQF_ONESHOT - Interrupt is not reenabled after the hardirq handler
> finished.
>   53  *                Used by threaded interrupts which need to keep the
>   54  *                irq line disabled until the threaded handler has been
> run.
> ===
> 
> If I boot the machine without "threadirqs", looks like the device is set up
> okay. The only message I get in the kernel log is:
> 
> ===
> kernel: acpi INT0002:00: Device [GPED] is in always present list
> ===
> 
> Grepping for IRQ 9:
> 
> ===
> kernel: ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
> kernel: ACPI: IRQ9 used by override.
> ===
> 
> and 9th interrupt shows this device:
> 
> ===
>     9:          0          0          0          0   IO-APIC    9-fasteoi
> acpi, INT0002
> ===
> 
> Any idea why "threadirqs" makes this fail?

Yes, I think this is caused by the int0002 vgpio driver unnecessarily
passing the IRQF_NO_THREAD flag, attached is a patch which should fix this,
can you give this a try ?

Regards,

Hans

--------------1D46B7FCF91E222573407C03
Content-Type: text/x-patch;
 name="0001-platform-x86-intel_int0002_vgpio-Remove-IRQF_NO_THRE.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-platform-x86-intel_int0002_vgpio-Remove-IRQF_NO_THRE.pa";
 filename*1="tch"

From a68410ecefc73b538f8123c59bd6d2aade4600ba Mon Sep 17 00:00:00 2001
From: Hans de Goede <hdegoede@redhat.com>
Date: Wed, 22 Nov 2017 16:36:05 +0100
Subject: [PATCH v2] platform/x86: intel_int0002_vgpio: Remove IRQF_NO_THREAD
 irq flag

Remove the IRQF_NO_THREAD irq flag, there is no need for it and it breaks
irq-sharing with the "acpi" irq when passing "threadirqs" on the kernel
cmdline, as the acpi/osl.c code does not pass IRQF_NO_THREAD.

Reported-by: Oleksandr Natalenko <oleksandr@natalenko.name>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/intel_int0002_vgpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel_int0002_vgpio.c b/drivers/platform/x86/intel_int0002_vgpio.c
index f7b67e898abc..a473dc51b18d 100644
--- a/drivers/platform/x86/intel_int0002_vgpio.c
+++ b/drivers/platform/x86/intel_int0002_vgpio.c
@@ -180,7 +180,7 @@ static int int0002_probe(struct platform_device *pdev)
 	 * to gpiochip_set_chained_irqchip, because the irq is shared.
 	 */
 	ret = devm_request_irq(dev, irq, int0002_irq,
-			       IRQF_SHARED | IRQF_NO_THREAD, "INT0002", chip);
+			       IRQF_SHARED, "INT0002", chip);
 	if (ret) {
 		dev_err(dev, "Error requesting IRQ %d: %d\n", irq, ret);
 		return ret;
-- 
2.14.3


--------------1D46B7FCF91E222573407C03--
