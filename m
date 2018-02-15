From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: ThinkPad Yoga 370 thinkpad_acpi unhandled events
Date: Thu, 15 Feb 2018 16:42:51 +0200
Message-ID: <CAHp75VdbmP_a37-7qkacx=k21XzCjki=qFC0_eWk=L952u0Pbw@mail.gmail.com>
References: <PqonyRG1_zESPTDspqzZ2qO65lHbv5E1z8Ekcgrzh0TtbBmlm69BnfUqZIEuSbF-d1z0VeXHPMRRCQenBEMNP2L8NyTqvIui1FwdHnJ6RAc=@protonmail.ch>
 <ei0r_oTyOQrFrZKDqLMWzJHdipDsPEu8zxZxhnNuNa6L7TMRdZzu43Ldx0mcuOiRI2Ud-Lx746lfMG-9YpGR7vcp1HrsuroruKEWzhrr3dg=@protonmail.ch>
 <FA1DB435B97D5A4192BAE54A4EA542A99ABEF68F@CNMAILEX04.lenovo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qk0-f193.google.com ([209.85.220.193]:38523 "EHLO
        mail-qk0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1033002AbeBOOmw (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 15 Feb 2018 09:42:52 -0500
Received: by mail-qk0-f193.google.com with SMTP id s198so15039719qke.5
        for <platform-driver-x86@vger.kernel.org>; Thu, 15 Feb 2018 06:42:52 -0800 (PST)
In-Reply-To: <FA1DB435B97D5A4192BAE54A4EA542A99ABEF68F@CNMAILEX04.lenovo.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Peter FP1 Zhang <zhangfp1@lenovo.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, Darren Hart <dvhart@infradead.org>
Cc: Jordan Glover <Golden_Miller83@protonmail.ch>, Christian Kellner <ckellner@redhat.com>, "ibm-acpi-devel@lists.sourceforge.net" <ibm-acpi-devel@lists.sourceforge.net>, "bberg@redhat.com" <bberg@redhat.com>

+Cc: PDx86 ML, Darren

(Luckily entire discussion is kept in this mail)

On Thu, Feb 1, 2018 at 4:07 AM, Peter FP1 Zhang <zhangfp1@lenovo.com> wrote=
:
> Dear all,
>
> I was told by our BIOS/Thermal team that the two events are designed for =
Windows OS, for Linux we can just ignore them directly.
>
> Thanks,
>
> Peter Zhang \ =E5=BC=A0=E7=A6=8F=E5=B9=B3,  PMP
> ThinkPad & ThinkStation Linux Solutions
> Tel: (+86) 181-1611-8005 | Lenovo Shanghai
>
> Linux for Those Who Do - http://www.lenovo.com/linux
>
>
> -----Original Message-----
> From: Peter FP1 Zhang
> Sent: Wednesday, January 31, 2018 10:48 AM
> To: 'Jordan Glover'; 'Christian Kellner'; ibm-acpi-devel@lists.sourceforg=
e.net
> Cc: bberg@redhat.com; andy.shevchenko@gmail.com
> Subject: RE: ThinkPad Yoga 370 thinkpad_acpi unhandled events
>
> Hello Jordan,
>
> Appreciate your report. I ever discussed this topic with Chris half a yea=
r ago. The two events are both about thermal control.
>
> Hello Chris and upstream team,
>
> Would you mind telling me what info is needed to enable the two events?
>
> 0x60F0  HK_THERMAL_TRANSFORMATION_CHANGED,  ASL method is GTMS
> 0x6032  HK_DYNAMIC_THERMAL_CONTROL_SET_COMMAND_COMPLIETION,  ASL method i=
s DYTC
>
> Thanks,
>
> Peter Zhang \ =E5=BC=A0=E7=A6=8F=E5=B9=B3,  PMP
> ThinkPad & ThinkStation Linux Solutions
> Tel: (+86) 181-1611-8005 | Lenovo Shanghai
>
> Linux for Those Who Do - http://www.lenovo.com/linux
>
> -----Original Message-----
> From: Jordan Glover [mailto:Golden_Miller83@protonmail.ch]
> Sent: Wednesday, January 31, 2018 1:54 AM
> To: ibm-acpi-devel@lists.sourceforge.net
> Cc: Peter FP1 Zhang; bberg@redhat.com; andy.shevchenko@gmail.com
> Subject: ThinkPad Yoga 370 thinkpad_acpi unhandled events
>
>
> Hello
>
> I noticed some messages about thinkpad_acpi events in my system logs.
> My hardware is Lenovo ThinkPad Yoga 370, model 20JJS0HD00 2in1 laptop/tab=
let.
> I tested this with kernel 4.15.rc8 with https://patchwork.kernel.org/patc=
h/10057867/ patch added.
>
> 1. Happens at boot:
>
> thinkpad_acpi: ThinkPad ACPI Extras v0.25
> thinkpad_acpi: http://ibm-acpi.sf.net/
> thinkpad_acpi: ThinkPad BIOS R0HET41W (1.21 ), EC unknown
> thinkpad_acpi: Lenovo ThinkPad Yoga 370, model 20JJS0HD00
> thinkpad_acpi: radio switch found; radios are enabled
> thinkpad_acpi: Unknown/reserved multi mode value 0x0000 for type 4, pleas=
e report this to ibm-acpi-devel@lists.sourceforge.net
> ...
> thinkpad_acpi: unknown possible thermal alarm or keyboard event received
> thinkpad_acpi: unhandled HKEY event 0x60f0
> thinkpad_acpi: please report the conditions when this event happened to i=
bm-acpi-devel@lists.sourceforge.net
>
>
>
> 2. Happens after 2in1 mode switch and back:
>
>  thinkpad_acpi: unknown possible thermal alarm or keyboard event received
>  thinkpad_acpi: unhandled HKEY event 0x6032
>  thinkpad_acpi: please report the conditions when this event happened to =
ibm-acpi-devel@lists.sourceforge.net
>  thinkpad_acpi: unknown possible thermal alarm or keyboard event received
>  thinkpad_acpi: unhandled HKEY event 0x60f0
>  thinkpad_acpi: please report the conditions when this event happened to =
ibm-acpi-devel@lists.sourceforge.net
>  thinkpad_acpi: unknown possible thermal alarm or keyboard event received
>  thinkpad_acpi: unhandled HKEY event 0x60f0
>  thinkpad_acpi: please report the conditions when this event happened to =
ibm-acpi-devel@lists.sourceforge.net
>  thinkpad_acpi: unknown possible thermal alarm or keyboard event received
>  thinkpad_acpi: unhandled HKEY event 0x60f0
>  thinkpad_acpi: please report the conditions when this event happened to =
ibm-acpi-devel@lists.sourceforge.net
>
>  I attached output of:
>  acpidump
>  dmidecode
>  dmesg |grep thinkpad_acpi
>
>
>  Jordan



--=20
With Best Regards,
Andy Shevchenko
