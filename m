From: Shravan Ramani <sramani@mellanox.com>
Subject: RE: [PATCH v1] platform/mellanox: Add Mellanox TRIO driver
Date: Wed, 13 Nov 2019 05:40:33 +0000
Message-ID: <AM0PR05MB68202BBD8E817EF7E953D866CE760@AM0PR05MB6820.eurprd05.prod.outlook.com>
References: <cover.1573460910.git.sramani@mellanox.com>
 <AM6PR05MB522463C06CB3E7528F18281FA2770@AM6PR05MB5224.eurprd05.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <AM6PR05MB522463C06CB3E7528F18281FA2770@AM6PR05MB5224.eurprd05.prod.outlook.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Vadim Pasternak <vadimp@mellanox.com>, Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>
Cc: Liming Sun <lsun@mellanox.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

Hi Vadim,
TRIO stands for TRansaction I/O and is an internal code name for our PCIe t=
o CHI bus interface.
In Mellanox BlueField SoC, the configuration is as follows: there are 3 TRI=
O blocks where TRIO2 is connected to a Mellanox ConnectX-5  while TRIO0 and=
 TRIO1 can be configured to behave either as a PCIe Root Complex to downstr=
eam ports (8 ports or 16 lanes each) connecting to storage devices, or as a=
n end-point when plugged into an external x86 host (SmartNIC form factor). =
Each TRIO block has a separate ACPI table entry which invokes this driver t=
hereby creating a total of 3 instances.
The purpose of this driver is to be able to read/set the L3 cache profile f=
rom a list of available profiles for transactions coming in to each TRIO bl=
ock and is meant to run on the ARM cores powering the BlueField SoC.

Regards,
Shravan

-----Original Message-----
From: Vadim Pasternak <vadimp@mellanox.com>=20
Sent: Tuesday, November 12, 2019 8:15 PM
To: Shravan Ramani <sramani@mellanox.com>; Andy Shevchenko <andy@infradead.=
org>; Darren Hart <dvhart@infradead.org>
Cc: Liming Sun <lsun@mellanox.com>; Shravan Ramani <sramani@mellanox.com>; =
platform-driver-x86@vger.kernel.org; linux-kernel@vger.kernel.org
Subject: RE: [PATCH v1] platform/mellanox: Add Mellanox TRIO driver



> -----Original Message-----
> From: Shravan Kumar Ramani <sramani@mellanox.com>
> Sent: Monday, November 11, 2019 4:35 PM
> To: Andy Shevchenko <andy@infradead.org>; Darren Hart=20
> <dvhart@infradead.org>; Vadim Pasternak <vadimp@mellanox.com>
> Cc: Liming Sun <lsun@mellanox.com>; Shravan Ramani=20
> <sramani@mellanox.com>; platform-driver-x86@vger.kernel.org; linux-=20
> kernel@vger.kernel.org
> Subject: [PATCH v1] platform/mellanox: Add Mellanox TRIO driver
>=20
> This patch adds support for Mellanox BlueField TRIO PCIe host controller.
> The driver supports multiple TRIO instances and provides a sysfs=20
> interface to allow the user to read/set the L3 cache profile for=20
> transactions going through the TRIO. It also provides an interrupt handle=
r for the TRIO blocks.

Hi Shravan,

Could you, please, explain what TRIO PCIe host controller?
What is TRIO, is it some internal name or it's some standard terminology?
If it's internal, please, explain for what it stands for.

Same for TRIO instances. Are there some host side PCI instances?
What are the purpose of them?

Could you, please, also explain the system configuration?


>=20
> Shravan Kumar Ramani (1):
>   platform/mellanox: Add Mellanox TRIO driver
>=20
>  MAINTAINERS                            |   5 +
>  drivers/platform/mellanox/Kconfig      |   8 +
>  drivers/platform/mellanox/Makefile     |   1 +
>  drivers/platform/mellanox/mlxbf-trio.c | 624
> +++++++++++++++++++++++++++++++++
>  4 files changed, 638 insertions(+)
>  create mode 100644 drivers/platform/mellanox/mlxbf-trio.c
>=20
> --
> 2.1.2
