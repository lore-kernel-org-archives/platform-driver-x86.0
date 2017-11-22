From: Oleksandr Natalenko <oleksandr@natalenko.name>
Subject: Re: Failed IRQ assignment for INT0002 on Braswell
Date: Wed, 22 Nov 2017 13:48:16 +0100
Message-ID: <2100487.obXIbN4R9M@natalenko.name>
References: <1902393.IdeYHqtVB8@natalenko.name> <3c09b28b-6ca5-cd1c-f5c0-f7be73f1c1b4@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from vulcan.natalenko.name ([104.207.131.136]:17790 "EHLO
        vulcan.natalenko.name" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751216AbdKVMsS (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 22 Nov 2017 07:48:18 -0500
In-Reply-To: <3c09b28b-6ca5-cd1c-f5c0-f7be73f1c1b4@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Hi, Hans.

On st=C5=99eda 22. listopadu 2017 11:48:50 CET Hans de Goede wrote:
> /* snip */
> This should be fixed by:
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/ke
> rnel/irq?id=3D382bd4de61827dbaaf5fb4fb7b1f4be4a86505e7
>=20
> Which is in 4.13, but the trigger-type does not seem to be the problem in
> your case, the problem likely is the ONESHOT flag:
>=20
> #define IRQF_ONESHOT            0x00002000
>=20
> Which appears to be set in the flags for the acpi irq handler:
>  > kernel: genirq: Flags mismatch irq 9. 00010084 (INT0002) vs. 00002080
>  > (acpi)
> But that irq is requested here:
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/d=
riv
> ers/acpi/osl.c#n570
>=20
>=20
>=20
> 	if (request_irq(irq, acpi_irq, IRQF_SHARED, "acpi", acpi_irq)) {
> 		printk(KERN_ERR PREFIX "SCI (IRQ%d) allocation failed\n", irq);
> 		...
>=20
> And IRQF_ONESHOT is not passed, so I do not understand where the 00002000=
 in
> the acpi irq handler flags is coming from ...

Well, looks like I know where this flag comes from. I boot this machine wit=
h=20
"threadirqs", and IRQF_ONESHOT description says:

=3D=3D=3D
 52  * IRQF_ONESHOT - Interrupt is not reenabled after the hardirq handler=
=20
finished.
 53  *                Used by threaded interrupts which need to keep the
 54  *                irq line disabled until the threaded handler has been=
=20
run.
=3D=3D=3D

If I boot the machine without "threadirqs", looks like the device is set up=
=20
okay. The only message I get in the kernel log is:

=3D=3D=3D
kernel: acpi INT0002:00: Device [GPED] is in always present list
=3D=3D=3D

Grepping for IRQ 9:

=3D=3D=3D
kernel: ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
kernel: ACPI: IRQ9 used by override.
=3D=3D=3D

and 9th interrupt shows this device:

=3D=3D=3D
   9:          0          0          0          0   IO-APIC    9-fasteoi  =
=20
acpi, INT0002
=3D=3D=3D

Any idea why "threadirqs" makes this fail?

Thanks.

Regards,
  Oleksandr
