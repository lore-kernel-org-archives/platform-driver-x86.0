From: Vadim Pasternak <vadimp@mellanox.com>
Subject: RE: [PATCH v1] platform/mellanox: Add Mellanox TRIO driver
Date: Wed, 13 Nov 2019 07:05:13 +0000
Message-ID: <AM6PR05MB5224957FCA67040E9C60DF17A2760@AM6PR05MB5224.eurprd05.prod.outlook.com>
References: <cover.1573460910.git.sramani@mellanox.com>
 <AM6PR05MB522463C06CB3E7528F18281FA2770@AM6PR05MB5224.eurprd05.prod.outlook.com>
 <AM0PR05MB68202BBD8E817EF7E953D866CE760@AM0PR05MB6820.eurprd05.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <AM0PR05MB68202BBD8E817EF7E953D866CE760@AM0PR05MB6820.eurprd05.prod.outlook.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Shravan Ramani <sramani@mellanox.com>, Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>
Cc: Liming Sun <lsun@mellanox.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org



> -----Original Message-----
> From: Shravan Ramani
> Sent: Wednesday, November 13, 2019 7:41 AM
> To: Vadim Pasternak <vadimp@mellanox.com>; Andy Shevchenko
> <andy@infradead.org>; Darren Hart <dvhart@infradead.org>
> Cc: Liming Sun <lsun@mellanox.com>; platform-driver-x86@vger.kernel.org;
> linux-kernel@vger.kernel.org
> Subject: RE: [PATCH v1] platform/mellanox: Add Mellanox TRIO driver
>=20
> Hi Vadim,
> TRIO stands for TRansaction I/O and is an internal code name for our PCIe=
 to
> CHI bus interface.
> In Mellanox BlueField SoC, the configuration is as follows: there are 3 T=
RIO
> blocks where TRIO2 is connected to a Mellanox ConnectX-5  while TRIO0 and
> TRIO1 can be configured to behave either as a PCIe Root Complex to
> downstream ports (8 ports or 16 lanes each) connecting to storage devices=
, or
> as an end-point when plugged into an external x86 host (SmartNIC form fac=
tor).
> Each TRIO block has a separate ACPI table entry which invokes this driver
> thereby creating a total of 3 instances.
> The purpose of this driver is to be able to read/set the L3 cache profile=
 from a
> list of available profiles for transactions coming in to each TRIO block =
and is
> meant to run on the ARM cores powering the BlueField SoC.

OK.
It was necessary to have such sort of explanation in the description.

I am also not sure you choose correct location for this driver.
Why it should be in drivers/platform/mellanox/ and not in for example
drivers/acpi/?

Regarding the patch content.
(1)
Please, follow naming convention which we have in folder:
drivers/platform/mellanox/, like in module mlxbf-tmfifo.c
mlxbf_trio
MLXBF_TRIO
for all routine names, defines, types.
(2)
Fix includes order ("io" before "irq").
(3)
Don't use magic numbers like '3'.
(4)
Why in 'probe' routine failure of symlink creation treated as
warning?=20
(5)
Remove stuff like
'dev_warn(dev, "%s: failed to find reg resource 0\n", __func__);'
'dev_warn(dev, "Error probing trio\n");'
(6)
I suggest to make all the above comments and send the updated
patch for internal review to myself cced to linux-internal@mellanox.com,
before sending it to linux-internal@mellanox.com.

Thanks,
Vadim.

>=20
> Regards,
> Shravan
>=20
> -----Original Message-----
> From: Vadim Pasternak <vadimp@mellanox.com>
> Sent: Tuesday, November 12, 2019 8:15 PM
> To: Shravan Ramani <sramani@mellanox.com>; Andy Shevchenko
> <andy@infradead.org>; Darren Hart <dvhart@infradead.org>
> Cc: Liming Sun <lsun@mellanox.com>; Shravan Ramani
> <sramani@mellanox.com>; platform-driver-x86@vger.kernel.org; linux-
> kernel@vger.kernel.org
> Subject: RE: [PATCH v1] platform/mellanox: Add Mellanox TRIO driver
>=20
>=20
>=20
> > -----Original Message-----
> > From: Shravan Kumar Ramani <sramani@mellanox.com>
> > Sent: Monday, November 11, 2019 4:35 PM
> > To: Andy Shevchenko <andy@infradead.org>; Darren Hart
> > <dvhart@infradead.org>; Vadim Pasternak <vadimp@mellanox.com>
> > Cc: Liming Sun <lsun@mellanox.com>; Shravan Ramani
> > <sramani@mellanox.com>; platform-driver-x86@vger.kernel.org; linux-
> > kernel@vger.kernel.org
> > Subject: [PATCH v1] platform/mellanox: Add Mellanox TRIO driver
> >
> > This patch adds support for Mellanox BlueField TRIO PCIe host controlle=
r.
> > The driver supports multiple TRIO instances and provides a sysfs
> > interface to allow the user to read/set the L3 cache profile for
> > transactions going through the TRIO. It also provides an interrupt hand=
ler for
> the TRIO blocks.
>=20
> Hi Shravan,
>=20
> Could you, please, explain what TRIO PCIe host controller?
> What is TRIO, is it some internal name or it's some standard terminology?
> If it's internal, please, explain for what it stands for.
>=20
> Same for TRIO instances. Are there some host side PCI instances?
> What are the purpose of them?
>=20
> Could you, please, also explain the system configuration?
>=20
>=20
> >
> > Shravan Kumar Ramani (1):
> >   platform/mellanox: Add Mellanox TRIO driver
> >
> >  MAINTAINERS                            |   5 +
> >  drivers/platform/mellanox/Kconfig      |   8 +
> >  drivers/platform/mellanox/Makefile     |   1 +
> >  drivers/platform/mellanox/mlxbf-trio.c | 624
> > +++++++++++++++++++++++++++++++++
> >  4 files changed, 638 insertions(+)
> >  create mode 100644 drivers/platform/mellanox/mlxbf-trio.c
> >
> > --
> > 2.1.2
