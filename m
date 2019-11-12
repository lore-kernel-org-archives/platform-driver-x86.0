From: Vadim Pasternak <vadimp@mellanox.com>
Subject: RE: [PATCH v1] platform/mellanox: Add Mellanox TRIO driver
Date: Tue, 12 Nov 2019 14:44:32 +0000
Message-ID: <AM6PR05MB522463C06CB3E7528F18281FA2770@AM6PR05MB5224.eurprd05.prod.outlook.com>
References: <cover.1573460910.git.sramani@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1573460910.git.sramani@mellanox.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>
Cc: Liming Sun <lsun@mellanox.com>, Shravan Ramani <sramani@mellanox.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org



> -----Original Message-----
> From: Shravan Kumar Ramani <sramani@mellanox.com>
> Sent: Monday, November 11, 2019 4:35 PM
> To: Andy Shevchenko <andy@infradead.org>; Darren Hart
> <dvhart@infradead.org>; Vadim Pasternak <vadimp@mellanox.com>
> Cc: Liming Sun <lsun@mellanox.com>; Shravan Ramani
> <sramani@mellanox.com>; platform-driver-x86@vger.kernel.org; linux-
> kernel@vger.kernel.org
> Subject: [PATCH v1] platform/mellanox: Add Mellanox TRIO driver
>=20
> This patch adds support for Mellanox BlueField TRIO PCIe host controller.
> The driver supports multiple TRIO instances and provides a sysfs interfac=
e to
> allow the user to read/set the L3 cache profile for transactions going th=
rough
> the TRIO. It also provides an interrupt handler for the TRIO blocks.

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
