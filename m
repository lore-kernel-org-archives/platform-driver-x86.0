From: <Mario.Limonciello@dell.com>
Subject: RE: [PATCH v4 09/14] platform/x86: dell-smbios: Introduce dispatcher
 for SMM calls
Date: Thu, 5 Oct 2017 15:04:47 +0000
Message-ID: <b2bc391409724010b96170f9d206f622@ausx13mpc120.AMER.DELL.COM>
References: <cover.1507156392.git.mario.limonciello@dell.com>
 <151b8e5bb0be0a9ef88282581d441a4211465ae7.1507156392.git.mario.limonciello@dell.com>
 <20171005015752.GD25018@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from esa1.dell-outbound.iphmx.com ([68.232.153.90]:57735 "EHLO
        esa1.dell-outbound.iphmx.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751094AbdJEPEt (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 5 Oct 2017 11:04:49 -0400
In-Reply-To: <20171005015752.GD25018@fury>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org
Cc: andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, luto@kernel.org, quasisec@google.com, pali.rohar@gmail.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de, greg@kroah.com

> -----Original Message-----
> From: Darren Hart [mailto:dvhart@infradead.org]
> Sent: Wednesday, October 4, 2017 8:58 PM
> To: Limonciello, Mario <Mario_Limonciello@Dell.com>
> Cc: Andy Shevchenko <andy.shevchenko@gmail.com>; LKML <linux-
> kernel@vger.kernel.org>; platform-driver-x86@vger.kernel.org; Andy Lutomi=
rski
> <luto@kernel.org>; quasisec@google.com; pali.rohar@gmail.com;
> rjw@rjwysocki.net; mjg59@google.com; hch@lst.de; Greg KH
> <greg@kroah.com>
> Subject: Re: [PATCH v4 09/14] platform/x86: dell-smbios: Introduce dispat=
cher for
> SMM calls
>=20
> On Wed, Oct 04, 2017 at 05:48:35PM -0500, Mario Limonciello wrote:
> > This splits up the dell-smbios driver into two drivers:
> > * dell-smbios
> > * dell-smbios-smm
> >
> > dell-smbios can operate with multiple different dispatcher drivers to
> > perform SMBIOS operations.
> >
> > Also modify the interface that dell-laptop and dell-wmi use align to th=
is
> > model more closely.  Rather than a single global buffer being allocated
> > for all drivers, each driver will allocate and be responsible for it's =
own
> > buffer. The pointer will be passed to the calling function and each
> > dispatcher driver will then internally copy it to the proper location t=
o
> > perform it's call.
> >
> > Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
> > ---
> >  MAINTAINERS                            |   6 ++
> >  drivers/platform/x86/Kconfig           |  17 ++-
> >  drivers/platform/x86/Makefile          |   1 +
> >  drivers/platform/x86/dell-laptop.c     | 191 ++++++++++++++++---------=
--------
> >  drivers/platform/x86/dell-smbios-smm.c | 136 +++++++++++++++++++++++
> >  drivers/platform/x86/dell-smbios-smm.h |  22 ++++
> >  drivers/platform/x86/dell-smbios.c     | 120 +++++++++++++--------
> >  drivers/platform/x86/dell-smbios.h     |  13 ++-
> >  drivers/platform/x86/dell-wmi.c        |   8 +-
> >  9 files changed, 361 insertions(+), 153 deletions(-)
> >  create mode 100644 drivers/platform/x86/dell-smbios-smm.c
> >  create mode 100644 drivers/platform/x86/dell-smbios-smm.h
> >
> ...
>=20
> > +config DELL_SMBIOS_SMM
> > +       tristate "Dell SMBIOS calling interface (SMM implementation)"
> > +       depends on DCDBAS
> > +       default DCDBAS
> > +       select DELL_SMBIOS
> > +       ---help---
> > +       This provides an implementation for the Dell SMBIOS calling int=
erface
> > +       communicated over ACPI-WMI.
>=20
> Not over ACPI-WMI... over SMM.... right?

Yep, copy paste error.

>=20
>=20
>=20
> > diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/=
dell-
> laptop.c
> > index f42159fd2031..c648bbfcc394 100644
> > --- a/drivers/platform/x86/dell-laptop.c
> > +++ b/drivers/platform/x86/dell-laptop.c
> > @@ -85,6 +85,7 @@ static struct platform_driver platform_driver =3D {
> >  	}
> >  };
> >
> > +static struct calling_interface_buffer *buffer;
> >  static struct platform_device *platform_device;
> >  static struct backlight_device *dell_backlight_device;
> >  static struct rfkill *wifi_rfkill;
> > @@ -405,7 +406,6 @@ static const struct dmi_system_id dell_quirks[]
> __initconst =3D {
> >
> >  static int dell_rfkill_set(void *data, bool blocked)
> >  {
> > -	struct calling_interface_buffer *buffer;
> >  	int disable =3D blocked ? 1 : 0;
> >  	unsigned long radio =3D (unsigned long)data;
> >  	int hwswitch_bit =3D (unsigned long)data - 1;
> > @@ -413,19 +413,21 @@ static int dell_rfkill_set(void *data, bool block=
ed)
> >  	int status;
> >  	int ret;
> >
> > -	buffer =3D dell_smbios_get_buffer();
> > -
> > -	dell_smbios_send_request(17, 11);
> > +	memset(buffer, 0, sizeof(struct calling_interface_buffer));
> > +	buffer->class =3D 17;
> > +	buffer->select =3D 11;
>=20
> Please move these three lines into a function, it's used far far too
> often to be open coded. The dell_smbios_send_request is a reasonable
> wrapper which you could just define here as well. This would minimize
> the change to the driver.
>=20
OK I'll clean this up and make some functions.
