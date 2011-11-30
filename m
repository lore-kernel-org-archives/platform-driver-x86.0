From: John Hughes <john@calvaedi.com>
Subject: Re: drivers/platform/x86/sony-laptop.c: fix scancodes
Date: Wed, 30 Nov 2011 22:50:15 +0100
Message-ID: <4ED6A517.4050908@calvaedi.com>
References: <20111130125545.GA5815@elgon.mountain>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from oceanic.CalvaEDI.COM ([89.202.194.168]:55653 "EHLO
	oceanic.CalvaEDI.COM" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751032Ab1K3VtO (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 30 Nov 2011 16:49:14 -0500
In-Reply-To: <20111130125545.GA5815@elgon.mountain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: John Hughes <john@Calva.COM>, platform-driver-x86@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Mattia Dongili <malattia@linux.it>

On 11/30/2011 01:55 PM, Dan Carpenter wrote:
> Hi John,
>
> Commit 04840b50f395 "drivers/platform/x86/sony-laptop.c: fix scancode=
s"
> introduces a gcc warning:
>
> drivers/platform/x86/sony-laptop.c:395:14: warning:
> 	=E2=80=98scancode=E2=80=99 may be used uninitialized in this functio=
n [-Wuninitialized]
>   =20

Ok, my code was broken, but so was the original - the jogdial device=20
isn't supposed to send scancodes for it's events:

         jog_dev->name =3D "Sony Vaio Jogdial";
         jog_dev->id.bustype =3D BUS_ISA;
         jog_dev->id.vendor =3D PCI_VENDOR_ID_SONY;
         key_dev->dev.parent =3D&acpi_device->dev;

         input_set_capability(jog_dev, EV_KEY, BTN_MIDDLE);
         input_set_capability(jog_dev, EV_REL, REL_WHEEL);

Note,  no EV_MSC, MSC_SCAN here.

Whoops, anoher bug!  Look there, it's setting key_dev->dev.parent=20
instead of jog_dev.dev_parent!

I'll post a new patch when I've finished testing it.
