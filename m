From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v7] platform:x86: add Intel P-Unit mailbox IPC driver
Date: Wed, 14 Oct 2015 22:16:06 -0700
Message-ID: <20151015051606.GD2592@malice.jf.intel.com>
References: <1444380548-17366-1-git-send-email-qipeng.zha@intel.com>
 <1444397622.8361.544.camel@intel.com>
 <C6287702A945AC47BE5DB5DFD4B5C6DD01981358@SHSMSX104.ccr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:59346 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752813AbbJOFQH (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 15 Oct 2015 01:16:07 -0400
Content-Disposition: inline
In-Reply-To: <C6287702A945AC47BE5DB5DFD4B5C6DD01981358@SHSMSX104.ccr.corp.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "Zha, Qipeng" <qipeng.zha@intel.com>
Cc: "Shevchenko, Andriy" <andriy.shevchenko@intel.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "Westerberg, Mika" <mika.westerberg@intel.com>

On Sat, Oct 10, 2015 at 03:07:53AM +0000, Zha, Qipeng wrote:
>=20
> >Everything is quite okay, except this BAR thingy.
>=20
> >Can you provide a DSDT excerpt for the device to see what is there?
>=20
> >I can't find such device (by ACPI id) in the tables of the accessibl=
e hardware in our lab.
>=20
> Please check below acpi device definition from BIOS.
> Punit device is created in pmc driver, since BIOS finally reject to c=
reate a separate device for Punit.
>=20

Qipeng, sorry for the delay. I've been under a rather absurd load. I'd =
like to
close on this so we can get this into -next ASAP. Thank you for posting=
 the
DSDT.

Help us parse what this means so we're all seeing the same thing. I see=
 a total
of 3 memory addresses and the following IO base address. Unfortunately,=
 the
comments don't map directly to the driver code, so I need to piece this
together.

The code in question from the driver is:

#define MAILBOX_REGISTER_SPACE 0x10

+static int intel_punit_get_bars(struct platform_device *pdev)
+{
+       struct resource *res0, *res1;
+       void __iomem *addr;
+       int size;
+
+       res0 =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
+       if (!res0) {
+               dev_err(&pdev->dev, "Failed to get iomem resource\n");
+               return -ENXIO;
+       }
+       size =3D resource_size(res0);
+       if (!devm_request_mem_region(&pdev->dev, res0->start,
+                                    size, pdev->name)) {
+               dev_err(&pdev->dev, "Failed to request iomem resouce\n"=
);
+               return -EBUSY;
+       }
+
+       res1 =3D platform_get_resource(pdev, IORESOURCE_MEM, 1);
+       if (!res1) {
+               dev_err(&pdev->dev, "Failed to get iomem resource1\n");
+               return -ENXIO;
+       }
+       size =3D resource_size(res1);
+       if (!devm_request_mem_region(&pdev->dev, res1->start,
+                                    size, pdev->name)) {
+               dev_err(&pdev->dev, "Failed to request iomem resouce1\n=
");
+               return -EBUSY;
+       }
+
+       addr =3D ioremap_nocache(res0->start,
+                              resource_size(res0) + resource_size(res1=
));
+       if (!addr) {
+               dev_err(&pdev->dev, "Failed to ioremap ipc base\n");
+               return  -ENOMEM;
+       }
+       punit_ipcdev->base[BIOS_IPC] =3D addr;
+       addr +=3D MAILBOX_REGISTER_SPACE;
+       punit_ipcdev->base[GTDRIVER_IPC] =3D addr;
+       addr +=3D MAILBOX_REGISTER_SPACE;
+       punit_ipcdev->base[ISPDRIVER_IPC] =3D addr;
+
+       return 0;
+}


>   Scope (\_SB) {
>     Device(IPC1)
>     {
>       =E2=80=A6
>       Name (RBUF, ResourceTemplate ()
>       {
>         Memory32Fixed (ReadWrite, 0x00000000, 0x00001000, BAR0)    //=
 IPC1 Bar

size: 0x1000
IPC1 BAR, I presume this maps to res0 in the driver?

Then the start of this 4096 byte region is assigned by:

punit_ipcdev->base[BIOS_IPC] =3D addr;

And everything else assigned by intel_punit_get_bards is contained with=
in this
addr since MAILBOX_REGISTER_SPACE is only 0x10.

Do I have that correct?

>      //   Memory32Fixed (ReadWrite, 0x00000000, 0x00001000, BAR1)  //=
 SSRAM
>         Memory32Fixed (ReadWrite, 0x00000000, 0x00001000, MDAT)    //=
 PUnit BIOS mailbox Data

size: 0x1000
And this would be res1 in the driver?

>         Memory32Fixed (ReadWrite, 0x00000000, 0x00001000, MINF)    //=
 PUnit BIOS mailbox Interface and GTD/ISPD mailbox

size: 0x1000

This seems odd, especially with the comments in the DSD. A more natural=
 mapping would have been each of the Memory32Fixed macros mapping to th=
e BIOS_IPC, GTDRIVER_IPC, and ISPDRIVER_IPC BARs in the driver. This wo=
uld indeed be the case if MAILBOX_REGISTER_SPACE was 0x1000 instead of =
0x10. Also, if that were the case, then those BARs should be set by usi=
ng the mapped addr for the 3 separate resources - which is what Andy wa=
s getting at.

Qipeng, I assume I misinterpretted something above. Can you point out w=
here I've got this wrong and how the driver is doing the only thing it =
can given the resources provided by the DSDT?

Thanks,


>         IO (Decode16, 0x400, 0x480, 0x4, 0x80)                     //=
 ACPI IO Base address
>         Interrupt (ResourceConsumer, Level, ActiveLow, Exclusive, , ,=
 ) {40}  // IPC1 IRQ =20
>       })
>=20
>       =E2=80=A6
>     }
>   }//end scope

--=20
Darren Hart
Intel Open Source Technology Center
