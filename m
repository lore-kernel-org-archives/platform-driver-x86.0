From: Vadim Pasternak <vadimp@mellanox.com>
Subject: RE: [PATCH v4 8/8] Documentation/ABI: Add documentation mlxreg-io
 sysfs interfaces
Date: Tue, 5 Jun 2018 11:00:38 +0000
Message-ID: <HE1PR0502MB3753C857729A06149F5EE35BA2660@HE1PR0502MB3753.eurprd05.prod.outlook.com>
References: <1527584347-167548-1-git-send-email-vadimp@mellanox.com>
 <1527584347-167548-3-git-send-email-vadimp@mellanox.com>
 <20180605015444.GB47042@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180605015444.GB47042@localhost.localdomain>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "jiri@resnulli.us" <jiri@resnulli.us>, Michael Shych <michaelsh@mellanox.com>, "ivecera@redhat.com" <ivecera@redhat.com>
List-Id: platform-driver-x86.vger.kernel.org



> -----Original Message-----
> From: Darren Hart [mailto:dvhart@infradead.org]
> Sent: Tuesday, June 05, 2018 4:55 AM
> To: Vadim Pasternak <vadimp@mellanox.com>
> Cc: andy.shevchenko@gmail.com; gregkh@linuxfoundation.org; linux-
> kernel@vger.kernel.org; platform-driver-x86@vger.kernel.org; jiri@resnull=
i.us;
> Michael Shych <michaelsh@mellanox.com>; ivecera@redhat.com
> Subject: Re: [PATCH v4 8/8] Documentation/ABI: Add documentation mlxreg-i=
o
> sysfs interfaces
>=20
> On Tue, May 29, 2018 at 08:59:07AM +0000, Vadim Pasternak wrote:
> > Add documentation for mlxreg-io driver sysfs interfaces for user space
> > access to system's power resets control, reset causes monitoring,
> > programmable devices version reading and devices selection control.
> >
> > Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
>=20
> Hi Vadim,
>=20
> You mentioned that these can vary by platform, I presume that means that =
any
> given platform will present a subset of these attributes - but that all p=
ossible
> attributes are documented here. Is that correct?

Hi Darren,

Thank you for review.
These are mostly all attributes, that should be exposed.
I add two extra for the coming version.

Maybe for the future system it could be slightly extended.

Also we have writable attribute for BIOS flash boot selection, which
I am still not sure we want expose.

Thanks,
Vadim.

>=20
> > ---
> > v4:
> >  Comments pointed out by Greg:
> >  Add Documentation/ABI/ entries for the new sysfs files.
> > ---
> >  Documentation/ABI/stable/sysfs-driver-mlxreg-io | 51
> > +++++++++++++++++++++++++
> >  1 file changed, 51 insertions(+)
> >  create mode 100644 Documentation/ABI/stable/sysfs-driver-mlxreg-io
> >
> > diff --git a/Documentation/ABI/stable/sysfs-driver-mlxreg-io
> > b/Documentation/ABI/stable/sysfs-driver-mlxreg-io
> > new file mode 100644
> > index 0000000..fcd659e
> > --- /dev/null
> > +++ b/Documentation/ABI/stable/sysfs-driver-mlxreg-io
> > @@ -0,0 +1,51 @@
> > +What:		/sys/devices/platform/mlxplat/mlxreg-
> io/hwmon/hwmon*/
> > +
> 	cause_aux_pwr_or_ref
> > +							cause_asic_thermal
> > +
> 	cause_hotswap_or_wd
> > +							cause_fw_reset
> > +							cause_long_pb
> > +							cause_main_pwr_fail
> > +							cause_short_pb
> > +							cause_sw_reset
>=20
> These property names do not seem to follow any kind of logical pattern wi=
th
> respect to abbreviation. Starting with "cause_" made me think they were e=
vent
> generators at first... Of course, who wants to be able to generate an asi=
c
> thermal shutdown from sysfs... ;-)
>=20
> The only thing that might make more sense to *me* would be to replace
> "cause" with "reset". Not required. I'll leave it to you, you may have go=
od
> reason for the names chosen.
>=20
> > +Date:		May 2018
> > +KernelVersion:	4.18
> > +Contact:	Vadim Pasternak <vadimpmellanox.com>
> > +Description:	These files show the system reset cause, as following: po=
wer
> > +		auxiliary outage or power refresh, ASIC thermal shutdown,
> > +		hotswap or watchdog, firmware reset, long press power
> button,
> > +		short press power button, software reset. Value 1 in file means
> > +		this is reset cause, 0 - otherwise. Only one of the above
> > +		causes could be 1 at the same time, representing only last
> > +		reset cause.
> > +
> > +		The files are read only.
> > +
> > +What:		/sys/devices/platform/mlxplat/mlxreg-
> io/hwmon/hwmon*/
> > +							cpld1_version
> > +							cpld2_version
> > +Date:		May 2018
> > +KernelVersion:	4.18
> > +Contact:	Vadim Pasternak <vadimpmellanox.com>
> > +Description:	These files show with which CPLD versions have been burne=
d
> > +		on carrier and switch boards.
> > +
> > +		The files are read only.
> > +
> > +What:		/sys/devices/platform/mlxplat/mlxreg-
> io/hwmon/hwmon*/select_iio
> > +Date:		May 2018
> > +KernelVersion:	4.18
> > +Contact:	Vadim Pasternak <vadimpmellanox.com>
> > +Description:	This file allows iio devices selection.
> > +
> > +		The file is read/write.
> > +
>=20
> Some description is appropriate here for what values it accepts and how i=
t is
> intended to be used.
>=20
> > +What:		/sys/devices/platform/mlxplat/mlxreg-
> io/hwmon/hwmon*/psu1_on
> > +		/sys/devices/platform/mlxplat/mlxreg-
> io/hwmon/hwmon*/psu2_on
> > +		/sys/devices/platform/mlxplat/mlxreg-
> io/hwmon/hwmon*/pwr_cycle
> > +Date:		May 2018
> > +KernelVersion:	4.18
> > +Contact:	Vadim Pasternak <vadimpmellanox.com>
> > +Description:	These files allow assert system's power cycling and PS un=
its
> > +		on/off switching.
>=20
> This Description is awkward. Consider:
>=20
> These files allow asserting system power cycling and switching power supp=
ly
> units on and off.
>=20
> > +		The files are write only.
>=20
> Please provide usage and resulting behavior.
>=20
> --
> Darren Hart
> VMware Open Source Technology Center
