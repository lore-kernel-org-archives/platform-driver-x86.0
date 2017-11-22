From: Oleksandr Natalenko <oleksandr@natalenko.name>
Subject: Re: Failed IRQ assignment for INT0002 on Braswell
Date: Wed, 22 Nov 2017 19:13:47 +0100
Message-ID: <2474990.QanOVckajO@natalenko.name>
References: <1902393.IdeYHqtVB8@natalenko.name> <2100487.obXIbN4R9M@natalenko.name> <d8587e5f-79e6-22cc-570c-fa9934d09f1d@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d8587e5f-79e6-22cc-570c-fa9934d09f1d@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Hi, Hans.

With this patch applied the warning is not emitted anymore with threadirqs=
=20
enabled, and relevant kthread (irq/9-INT0002) is created.

=46eel free to add Reported-by/Tested-by from me once you do a submission.

Thanks.

Regards,
  Oleksandr

On st=C5=99eda 22. listopadu 2017 16:50:33 CET Hans de Goede wrote:
> Hi,
>=20
> On 22-11-17 13:48, Oleksandr Natalenko wrote:
> > Hi, Hans.
> >=20
> > On st=C5=99eda 22. listopadu 2017 11:48:50 CET Hans de Goede wrote:
> >> /* snip */
> >> This should be fixed by:
> >>=20
> >> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/com=
mit
> >> /ke rnel/irq?id=3D382bd4de61827dbaaf5fb4fb7b1f4be4a86505e7
> >>=20
> >> Which is in 4.13, but the trigger-type does not seem to be the problem=
 in
> >> your case, the problem likely is the ONESHOT flag:
> >>=20
> >> #define IRQF_ONESHOT            0x00002000
> >>=20
> >> Which appears to be set in the flags for the acpi irq handler:
> >>   > kernel: genirq: Flags mismatch irq 9. 00010084 (INT0002) vs. 00002=
080
> >>   > (acpi)
> >>=20
> >> But that irq is requested here:
> >>=20
> >> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tre=
e/d
> >> riv ers/acpi/osl.c#n570
> >>=20
> >> 	if (request_irq(irq, acpi_irq, IRQF_SHARED, "acpi", acpi_irq)) {
> >> =09
> >> 		printk(KERN_ERR PREFIX "SCI (IRQ%d) allocation failed\n", irq);
> >> 		...
> >>=20
> >> And IRQF_ONESHOT is not passed, so I do not understand where the 00002=
000
> >> in the acpi irq handler flags is coming from ...
> >=20
> > Well, looks like I know where this flag comes from. I boot this machine
> > with "threadirqs", and IRQF_ONESHOT description says:
> >=20
> > =3D=3D=3D
> >=20
> >   52  * IRQF_ONESHOT - Interrupt is not reenabled after the hardirq
> >   handler
> >=20
> > finished.
> >=20
> >   53  *                Used by threaded interrupts which need to keep t=
he
> >   54  *                irq line disabled until the threaded handler has
> >   been
> >=20
> > run.
> > =3D=3D=3D
> >=20
> > If I boot the machine without "threadirqs", looks like the device is set
> > up
> > okay. The only message I get in the kernel log is:
> >=20
> > =3D=3D=3D
> > kernel: acpi INT0002:00: Device [GPED] is in always present list
> > =3D=3D=3D
> >=20
> > Grepping for IRQ 9:
> >=20
> > =3D=3D=3D
> > kernel: ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
> > kernel: ACPI: IRQ9 used by override.
> > =3D=3D=3D
> >=20
> > and 9th interrupt shows this device:
> >=20
> > =3D=3D=3D
> >=20
> >     9:          0          0          0          0   IO-APIC    9-faste=
oi
> >=20
> > acpi, INT0002
> > =3D=3D=3D
> >=20
> > Any idea why "threadirqs" makes this fail?
>=20
> Yes, I think this is caused by the int0002 vgpio driver unnecessarily
> passing the IRQF_NO_THREAD flag, attached is a patch which should fix thi=
s,
> can you give this a try ?
>=20
> Regards,
>=20
> Hans
