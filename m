From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: Failed IRQ assignment for INT0002 on Braswell
Date: Wed, 22 Nov 2017 11:48:50 +0100
Message-ID: <3c09b28b-6ca5-cd1c-f5c0-f7be73f1c1b4@redhat.com>
References: <1902393.IdeYHqtVB8@natalenko.name>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1902393.IdeYHqtVB8@natalenko.name>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Oleksandr Natalenko <oleksandr@natalenko.name>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Hi,

On 21-11-17 23:35, Oleksandr Natalenko wrote:
> Hi, Hans.
> 
> v4.13 kernel introduced new fancy warning in the dmesg:
> 
> ===
> kernel: acpi INT0002:00: Device [GPED] is in always present list
> kernel: genirq: Flags mismatch irq 9. 00010084 (INT0002) vs. 00002080 (acpi)
> kernel: INT0002 Virtual GPIO INT0002:00: Error requesting IRQ 9: -16
> kernel: INT0002 Virtual GPIO: probe of INT0002:00 failed with error -16
> ===
> 
> Looking at git log, I've found that this driver was indeed introduced in v4.13
> by the following commit:
> 
> ===
> commit 63dada87f7ef7d4a536765c816fbbe7c4b9f3c85
> Author: Hans de Goede <hdegoede@redhat.com>
> Date:   Mon Jun 12 22:55:46 2017 +0200
>           
>      platform/x86: Add driver for ACPI INT0002 Virtual GPIO device
> ===
> 
> I've checked DSDT disassembly for this device, and here is relevant snippet
> [1]. The only thing I currently understand there is that IRQ 9 is hard coded
> (line 64), but I'm not sure where those flags come from.
> 
> The hardware in J3710 CPU on ASRock J3710-ITX motherboard.
> 
> Next, I've found that you also faced this warning and posted some RFC patch
> [2], but unfortunately I do not see what that discussion ended up with.
> 
> It is not that I really need GPIO on this board, but it would be nice to get
> rid of this warning. Could you please point me to a possible fix or a way for
> further investigation?

This should be fixed by:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/kernel/irq?id=382bd4de61827dbaaf5fb4fb7b1f4be4a86505e7

Which is in 4.13, but the trigger-type does not seem to be the problem in
your case, the problem likely is the ONESHOT flag:

#define IRQF_ONESHOT            0x00002000

Which appears to be set in the flags for the acpi irq handler:

 > kernel: genirq: Flags mismatch irq 9. 00010084 (INT0002) vs. 00002080 (acpi)

But that irq is requested here:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/acpi/osl.c#n570

:

	if (request_irq(irq, acpi_irq, IRQF_SHARED, "acpi", acpi_irq)) {
		printk(KERN_ERR PREFIX "SCI (IRQ%d) allocation failed\n", irq);
		...

And IRQF_ONESHOT is not passed, so I do not understand where the 00002000 in the
acpi irq handler flags is coming from ...

Regards,

Hans
